/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.techaspect.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.techaspect.entity.Vendor;

/**
 * The VendorDao class contains the database operations
 * related code.
 * 
 * This class belongs to Vendor Module. 
 * 
 * @author  Kishan Kumar
 */

public class VendorDao extends Dao {
	private static VendorDao vdao;
	private static final Logger LOGGER = Logger.getLogger(VendorDao.class);
	
	private VendorDao() {
	}
	
	public static VendorDao getInstance() {
		if(vdao == null) {
			vdao = new VendorDao();
		}
		return vdao;
	}
	/**
     * Searches for a existing Vendor Record in the Table.
     * 
     * Searching is done on the basis of Email Address & Password.
     *
     * @param   vendor
     *          A Vendor object containing data.
     *
     * @return  boolean
     * 		    true if matching record found otherwise false.
     */
	public boolean selectVendorByEmailAndPassword(Vendor vendor) {
		boolean status = false;
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql = "SELECT * FROM vendor_information WHERE ven_email = ? AND ven_password= ?";
			
			stmt = openPreparedStatement(con,sql);
			
			stmt.setString(1, vendor.getVenEmail());
			stmt.setString(2, vendor.getVenPassword());
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				status = true;
				String lname = rs.getString(3);
				if(lname == null) {
					lname = "";
				}
				vendor.setVenId(rs.getInt(1));
				vendor.setVenFname(rs.getString(2));
				vendor.setVenLname(lname);
				vendor.setVenDob(rs.getString(4));
				
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closeResultSet(rs);
			closePreparedStatement(stmt);
			closeConnection(con);
		}
		
		return status;
	}
	
	/**
     * Searches for a existing Vendor Record in the Table in case of a cookie.
     * 
     * Searching is done on the basis of vendor id.
     *
     * @param   vendor
     *          A Vendor object containing data.
     *
     * @param   accessToken
     *          A string containing access_token from cookie.
     *          
     * @return  boolean
     * 		    true if matching record found otherwise false.
     */
	public boolean selectVendorByVenId(Vendor vendor, String accessToken) {
		boolean status = false;
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			
			String sql = "SELECT * from vendor_information WHERE ven_id = ?";
			stmt = openPreparedStatement(con,sql);
			
			stmt.setInt(1, vendor.getVenId());
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				String lname = rs.getString(3);
				String email = rs.getString(5);
				String pwd = rs.getString(6);
				if(lname == null) {
					lname = "";
				}
				StringBuilder sum = new StringBuilder("");
				for(int i = 0; i < email.split("@")[0].length(); i++) {
					char c = email.charAt(i);
					sum.append((int)c + 2 + "");
				}
				for(int i = 0; i < pwd.length(); i++) {
					char c = pwd.charAt(i);
					sum.append((int)c - 1 + ""); 
				}
				if(accessToken.equals(sum.toString())){
					vendor.setVenId(rs.getInt(1));
					vendor.setVenFname(rs.getString(2));
					vendor.setVenLname(lname);
					vendor.setVenDob(rs.getString(4));
					vendor.setVenEmail(rs.getString(5));
					vendor.setVenPassword(rs.getString(6));
					status = true;
				}
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closeResultSet(rs);
			closePreparedStatement(stmt);
			closeConnection(con);
		}
		
		return status;
	}
	
}