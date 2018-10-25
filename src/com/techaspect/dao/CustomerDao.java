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

import com.techaspect.entity.Customer;

/**
 * The CustomerDao class contains the database operations
 * related code.
 * 
 * This class belongs to Customer Module. 
 * 
 * @author  Kishan Kumar
 */

public class CustomerDao extends Dao {
	private static final Logger LOGGER = Logger.getLogger(CustomerDao.class);
	private static CustomerDao cdao;
	
	private CustomerDao() {
	}
	
	public static CustomerDao getInstance() {
		if(cdao == null) {
			cdao = new CustomerDao();
		}
		return cdao;
	}
	/**
     * Inserts a new Customer Record in the Table.
     *
     * @param   customer
     *          A Customer object containing data.
     *
     * @return  boolean
     * 			true if record successfully inserted otherwise false.
     */
	public boolean insertCustomer(Customer customer) {
		boolean status = false;
		
		Connection con = null;
		PreparedStatement stmt = null;

		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql = "INSERT INTO customer_information(cust_fname, cust_lname, cust_dob, cust_email, cust_password) VALUES(?, ?, ?, ?, ?)";
			stmt = openPreparedStatement(con,sql);
			stmt.setString(1, customer.getcustFname());
			stmt.setString(2, customer.getcustLname());
			stmt.setString(3, customer.getcustDob());
			stmt.setString(4, customer.getcustEmail());
			stmt.setString(5, customer.getcustPassword());
			int rows = stmt.executeUpdate();
			if(rows != 0) {
				status = true;
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closeStatement(stmt);
			closeConnection(con);
		}
		
		return status;
	}
	
	/**
     * Searches for a existing Customer Record in the Table.
     * 
     * Searching is done on the basis of Email Address & Password.
     *
     * @param   customer
     *          A Customer object containing data.
     *
     * @return  boolean
     * 		    true if matching record found otherwise false.
     */
	public boolean selectCustomerByEmailAndPassword(Customer customer) {
		boolean status = false;
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql = "SELECT * FROM customer_information WHERE cust_email = ? AND cust_password = ?";
			stmt = openPreparedStatement(con,sql);
			
			stmt.setString(1, customer.getcustEmail());
			stmt.setString(2, customer.getcustPassword());
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				status = true;
				String lname = rs.getString(3);
				if(lname == null) {
					lname = "";
				}
				customer.setcustId(rs.getInt(1));
				customer.setcustFname(rs.getString(2));
				customer.setcustLname(lname);
				customer.setcustDob(rs.getString(4));
				customer.setcustGender(rs.getString(5));
				customer.setcustContact(rs.getString(7));
				
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
     * Searches for a existing Customer Record in the Table in case of a cookie.
     * 
     * Searching is done on the basis of customer id.
     *
     * @param   customer
     *          A Customer object containing data.
     *
     * @param   accessToken
     *          A string containing access_token from cookie.
     *          
     * @return  boolean
     * 		    true if matching record found otherwise false.
     */
	public boolean selectCustomerByCustId(Customer customer, String accessToken) {
		boolean status = false;
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql = "SELECT * from customer_information WHERE cust_id = ?";
			stmt = openPreparedStatement(con,sql);
			
			stmt.setInt(1, customer.getcustId());
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				String lname = rs.getString(3);
				String email = rs.getString(6);
				String pwd = rs.getString(8);
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
					customer.setcustId(rs.getInt(1));
					customer.setcustFname(rs.getString(2));
					customer.setcustLname(lname);
					customer.setcustDob(rs.getString(4));
					customer.setcustGender(rs.getString(5));
					customer.setcustEmail(rs.getString(6));
					customer.setcustContact(rs.getString(7));
					customer.setcustPassword(rs.getString(8));
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
	/**
     * Searches for address details of a customer.
     *
     * @param   customer
     *          A Customer object containing data.
     *
     * @return  boolean
     * 			true if record found otherwise false.
     */
	public Boolean selectCustomerAddressDetails(Customer c) {
		Boolean status = false;
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql = "SELECT * FROM address_information WHERE cust_id = ?;";
			stmt = openPreparedStatement(con,sql);
			
			stmt.setInt(1, c.getcustId());
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				
				c.setAddress(rs.getString(3));
				c.setCity(rs.getString(4));
				c.setCountry(rs.getString(5));
				c.setState(rs.getString(6));
				c.setZip(rs.getString(7));
				status = true;
				return status;
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
     * Changes password of existing customer.
     *
     * @param   customer
     *          A Customer object containing data.
     *
     * @param   pwd
     * 			Represents old password
     * 
     * @param   newPwd
     * 			Represents new password
     * 
     * @return  boolean
     * 			true if record found otherwise false.
     */
	public boolean changePassword(Customer customer, String pwd, String newPwd) {
		int cid = customer.getcustId();
		boolean status = false;
		
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			
			String sql = "UPDATE customer_information SET cust_password = ? WHERE cust_password = ? AND cust_id = ?;";			
			stmt = openPreparedStatement(con,sql);

			stmt.setString(1, newPwd);
			stmt.setString(2, pwd);
			stmt.setInt(3, cid);
			int rows = stmt.executeUpdate();
			if(rows != 0) {
				status = true;
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closePreparedStatement(stmt);
			closeConnection(con);
		}
		
		return status;

	}
	
	/**
     * Inserts a new Address Record in the Table or Updates the existing record in the table.
     *
     * @param   customer
     *          A Customer object containing data.
     *
     * @param   operation
     * 			To determine whether to insert address information or to update address information if already exists.
     * 
     * @return  boolean
     * 			true if record successfully inserted otherwise false.
     */
	public Boolean insertAddress(Customer customer, int operation) {
		String sql;
		String sql1;
		Connection con = null;
		PreparedStatement stmt = null;
		PreparedStatement stmt1 = null;
		Boolean status = false;
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			if(operation == 0) {
				sql = "INSERT INTO address_information(cust_id, add_address, add_city, add_zip, add_state, add_country) VALUES(?,?,?,?,?,?);";
				sql1 = "UPDATE customer_information SET cust_fname = ?, cust_lname = ?, cust_gender = ?, cust_contact = ? WHERE cust_id = ?;";
			}
			else {
				sql = "UPDATE address_information SET cust_id = ?, add_address = ?, add_city = ?, add_zip = ?, add_state = ?, add_country = ? WHERE cust_id = "+customer.getcustId();
				sql1 = "UPDATE customer_information SET cust_fname = ?, cust_lname = ?, cust_gender = ?, cust_contact = ? WHERE cust_id = ?;";
			}
			stmt = openPreparedStatement(con,sql);
			stmt1 = openPreparedStatement(con,sql1);
			stmt.setInt(1, customer.getcustId());
			stmt.setString(2, customer.getAddress());
			stmt.setString(3, customer.getCity());
			stmt.setString(4, customer.getZip());
			stmt.setString(5, customer.getState());
			stmt.setString(6, customer.getCountry());
			
			stmt1.setString(1, customer.getcustFname());
			stmt1.setString(2, customer.getcustLname());
			stmt1.setString(3, customer.getcustGender());
			stmt1.setString(4, customer.getcustContact());
			stmt1.setInt(5, customer.getcustId());
			
			int rows = stmt.executeUpdate();
			int rows1 = stmt1.executeUpdate();
			if(rows != 0 && rows1 != 0) {
				return true;
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closePreparedStatement(stmt);
			closePreparedStatement(stmt1);
			closeConnection(con);
		}
		
		return status;

	}

}