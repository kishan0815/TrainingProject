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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;


import com.techaspect.entity.Products;

/**
 * The ProductDao class contains the database operations
 * related code.
 * 
 * This class belongs to Product Module. 
 * 
 * @author  Kishan Kumar
 */

public class ProductDao extends Dao {
	private static ProductDao pdao;
	private static final Logger LOGGER = Logger.getLogger(CustomerDao.class);
	
	private ProductDao() {
	}
	
	public static ProductDao getInstance() {
		if(pdao == null) {
			pdao = new ProductDao();
		}
		return pdao;
	}
	/**
     * Inserts a new Product Record in the Table.
     *
     * @param   product
     *          A Product object containing data.
     *
     * @return  boolean
     * 			true if record successfully inserted otherwise false.
     */
	public boolean insertProduct(Products product) {
		boolean status = false;
		PreparedStatement stmt = null;
		PreparedStatement stmt1 = null;
		PreparedStatement stmt2 = null;
		PreparedStatement stmt3 = null;
		
		try(Connection con = getDataSource().getConnection()) {
			String sql = "INSERT INTO product_information(ven_id, prod_name, prod_price, prod_quantity, prod_category, prod_sub_category, prod_desc,prod_img1, prod_img2, prod_img3, prod_img4, prod_img5) VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";
			stmt = openPreparedStatement(con,sql);			
			sql = "SELECT prod_id FROM product_information WHERE ven_id = ? AND prod_name= ? AND prod_price = ?;";
			stmt1 = openPreparedStatement(con,sql);
			sql = "INSERT INTO product_description(pro_id, descp_1_title," + 
					" descp_1_content," + 
					" descp_2_title," + 
					" descp_2_content," + 
					" descp_3_title," +  
					" descp_3_content," + 
					" descp_4_title," + 
					" descp_4_content," + 
					" descp_5_title," + 
					" descp_5_content," + 
					" descp_6_title," + 
					" descp_6_content," + 
					" descp_7_title," + 
					" descp_7_content," + 
					" descp_8_title," + 
					" descp_8_content," + 
					" descp_9_title," + 
					" descp_9_content," + 
					" descp_10_title," + 
					" descp_10_content) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
			stmt2 = openPreparedStatement(con,sql);
			sql = "INSERT INTO product_specification(pro_id," + 
					" spec_in_the_box," + 
					" spec_model_number," + 
					" spec_model_name," + 
					" spec_color," + 
					" spec_browse_type," + 
					" spec_sim_type," + 
					" spec_touch_screen," + 
					" spec_display_size," + 
					" spec_resolution," + 
					" spec_resolution_type," + 
					" spec_display_type," + 
					" spec_display_colors," + 
					" spec_operating_system," + 
					" spec_processor_type," + 
					" spec_processor_core," + 
					" spec_primary_clockspeed," + 
					" spec_secondary_clockspeed," + 
					" spec_operating_frequency," + 
					" spec_internal_storage," + 
					" spec_ram," + 
					" spec_expandable_storage," + 
					" spec_supported_memorycardtype," + 
					" spec_calllog_memory," + 
					" spec_primarycamera_available," + 
					" spec_primarycamera," + 
					" spec_primarycamera_features," + 
					" spec_secondarycamera_available," + 
					" spec_secondarycamera," + 
					" spec_secondarycamera_features," + 
					" spec_flash," + 
					" spec_hdrecording," + 
					" spec_full_hdrecording," + 
					" spec_video_recording," + 
					" spec_videorecording_resolution," + 
					" spec_frame_rate," + 
					" spec_phonebook," + 
					" spec_network_type," + 
					" spec_supported_networks," + 
					" spec_internet_connectivity," + 
					" spec_3g," + 
					" spec_gprs," + 
					" spec_preinstalled_browser," + 
					" spec_bluetooth_support," + 
					" spec_bluetooth_version," + 
					" spec_wifi," + 
					" spec_wifi_version," + 
					" spec_nfc," + 
					" spec_usb_connectivity," + 
					" spec_audio_jack," + 
					" spec_smart_phone," + 
					" spec_sim_size," + 
					" spec_removable_battery," + 
					" spec_sms," + 
					" spec_sensors," + 
					" spec_other_features," + 
					" spec_important_apps," + 
					" spec_audio_formats," + 
					" sped_video_formats," + 
					" spec_battery_capacity," + 
					" spec_battery_type," + 
					" spec_width," + 
					" spec_height," + 
					" spec_depth," + 
					" spec_weight," + 
					" spec_warranty_summary) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
			stmt3 = openPreparedStatement(con,sql); 
			stmt.setInt(1, product.getVenId());
			stmt.setString(2, product.getProdName());
			stmt.setString(3, product.getProdPrice());
			stmt.setString(4, product.getProdQuantity());
			stmt.setString(5, product.getProdCategory());
			stmt.setString(6, product.getProdSubCategory());
			stmt.setString(7, product.getProdDesc());
			stmt.setString(8, product.getProdImg1());
			stmt.setString(9, product.getProdImg2());
			stmt.setString(10, product.getProdImg3());
			stmt.setString(11, product.getProdImg4());
			stmt.setString(12, product.getProdImg5());
			int rows = stmt.executeUpdate();
			if(rows != 0) {
				stmt1.setInt(1, product.getVenId());
				stmt1.setString(2, product.getProdName());
				stmt1.setString(3, product.getProdPrice());
				ResultSet rs = stmt1.executeQuery();
				if(rs.next()) {
					product.setProdId(rs.getInt(1));
					stmt2.setInt(1, product.getProdId());
					stmt2.setString(2, product.getDescp1Title());
					stmt2.setString(3, product.getDescp1Content());
					stmt2.setString(4, product.getDescp2Title());
					stmt2.setString(5, product.getDescp2Content());
					stmt2.setString(6, product.getDescp3Title());
					stmt2.setString(7, product.getDescp3Content());
					stmt2.setString(8, product.getDescp4Title());
					stmt2.setString(9, product.getDescp4Content());
					stmt2.setString(10, product.getDescp5Title());
					stmt2.setString(11, product.getDescp5Content());
					stmt2.setString(12, product.getDescp6Title());
					stmt2.setString(13, product.getDescp6Content());
					stmt2.setString(14, product.getDescp7Title());
					stmt2.setString(15, product.getDescp7Content());
					stmt2.setString(16, product.getDescp8Title());
					stmt2.setString(17, product.getDescp8Content());
					stmt2.setString(18, product.getDescp9Title());
					stmt2.setString(19, product.getDescp9Content());
					stmt2.setString(20, product.getDescp10Title());
					stmt2.setString(21, product.getDescp10Content());
					int rows1 = stmt2.executeUpdate();
					
					stmt3.setInt(1, product.getProdId());
					stmt3.setString(2, product.getSpecitb());
					stmt3.setString(3, product.getSpecmn());
					stmt3.setString(4, product.getSpecmna());
					stmt3.setString(5, product.getSpecColor());
					stmt3.setString(6, product.getSpecBrType());
					stmt3.setString(7, product.getSpecSType());
					stmt3.setString(8, product.getSpecTScreen());
					stmt3.setString(9, product.getSpecDsize());
					stmt3.setString(10, product.getSpecResolution());
					stmt3.setString(11, product.getSpecRType());
					stmt3.setString(12, product.getSpecDType());
					stmt3.setString(13, product.getSpecDColors());
					stmt3.setString(14, product.getSpecOs());
					stmt3.setString(15, product.getSpecPType());
					stmt3.setString(16, product.getSpecPCore());
					stmt3.setString(17, product.getSpecPClock());
					stmt3.setString(18, product.getSpecSClock());
					stmt3.setString(19, product.getSpecOFrequency());
					stmt3.setString(20, product.getSpecIStorage());
					stmt3.setString(21, product.getSpecRam());
					stmt3.setString(22, product.getSpecEStorage());
					stmt3.setString(23, product.getSpecSupMem());
					stmt3.setString(24, product.getSpecClMemory());
					stmt3.setString(25, product.getSpecPCamera());
					stmt3.setString(26, product.getSpecPCam());
					stmt3.setString(27, product.getSpecPCamFeatures());
					stmt3.setString(28, product.getSpecSCamera());
					stmt3.setString(29, product.getSpecSCam());
					stmt3.setString(30, product.getSpecSCamFeatures());
					stmt3.setString(31, product.getSpecFlash());
					stmt3.setString(32, product.getSpecHdRec());
					stmt3.setString(33, product.getSpecFHdRec());
					stmt3.setString(34, product.getSpecVRec());
					stmt3.setString(35, product.getSpecVRecRes());
					stmt3.setString(36, product.getSpecFRate());
					stmt3.setString(37, product.getSpecPBook());
					stmt3.setString(38, product.getSpecNType());
					stmt3.setString(39, product.getSpecSupNetwork());
					stmt3.setString(40, product.getSpecIC());
					stmt3.setString(41, product.getSpec3g());
					stmt3.setString(42, product.getSpecGPRS());
					stmt3.setString(43, product.getSpecPIB());
					stmt3.setString(44, product.getSpecBSupp());
					stmt3.setString(45, product.getSpecBVer());
					stmt3.setString(46, product.getSpecWifi());
					stmt3.setString(47, product.getSpecWifiV());
					stmt3.setString(48, product.getSpecNfc());
					stmt3.setString(49, product.getSpecUsb());
					stmt3.setString(50, product.getSpecAudioJ());
					stmt3.setString(51, product.getSpecSPhone());
					stmt3.setString(52, product.getSpecSimSize());
					stmt3.setString(53, product.getSpecRBattery());
					stmt3.setString(54, product.getSpecSms());
					stmt3.setString(55, product.getSpecSensors());
					stmt3.setString(56, product.getSpecOFeatures());
					stmt3.setString(57, product.getSpecIApps());
					stmt3.setString(58, product.getSpecAFormat());
					stmt3.setString(59, product.getSpecVFormat());
					stmt3.setString(60, product.getSpecBCapacity());
					stmt3.setString(61, product.getSpecBType());
					stmt3.setString(62, product.getSpecWidth());
					stmt3.setString(63, product.getSpecHeight());
					stmt3.setString(64, product.getSpecDepth());
					stmt3.setString(65, product.getSpecWeight());
					stmt3.setString(66, product.getSpecWSum());
					
					int rows2 = stmt3.executeUpdate();
					if(rows1!=0 && rows2!=0) {
						status = true;
					}
				}
				
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closePreparedStatement(stmt);
			closePreparedStatement(stmt1);
			closePreparedStatement(stmt2);
			closePreparedStatement(stmt3);
		}
		
		return status;
	}
	
	/**
     * Updates existing Product Record in the Table.
     *
     * @param   p
     *          A Product object containing data.
     *
     * @param   sql
     * 			Query for inserting products with images.
     * 
     * @return  boolean
     * 			true if record successfully inserted otherwise false.
     */
	public boolean updateProduct(Products p,String sql) {
		boolean status = false;
		
		Connection con = null;
		Statement stmt = null;
		PreparedStatement stmt1 = null;
		PreparedStatement stmt2 = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql1 = "UPDATE product_description SET descp_1_title=?, descp_1_content=?, descp_2_title=?, descp_2_content=?, descp_3_title=?, descp_3_content=?, descp_4_title=?, descp_4_content=? where pro_id = ?";
			String sql2 = "UPDATE product_specification SET spec_in_the_box = ?, spec_model_name = ?, spec_color = ?, spec_resolution=?, spec_display_type=?, spec_display_colors=? WHERE pro_id = ?";
			
			stmt = openStatement(con);
			stmt1 = openPreparedStatement(con,sql1);
			stmt1.setString(1, p.getDescp1Title());
			stmt1.setString(2, p.getDescp1Content());
			stmt1.setString(3, p.getDescp2Title());
			stmt1.setString(4, p.getDescp2Content());
			stmt1.setString(5, p.getDescp3Title());
			stmt1.setString(6, p.getDescp3Content());
			stmt1.setString(7, p.getDescp4Title());
			stmt1.setString(8, p.getDescp4Content());
			stmt1.setInt(9, p.getProdId());
			
			stmt2 = openPreparedStatement(con,sql2);
			stmt2.setString(1, p.getSpecitb());
			stmt2.setString(2, p.getSpecmna());
			stmt2.setString(3, p.getSpecColor());
			stmt2.setString(4, p.getSpecResolution());
			stmt2.setString(5, p.getSpecDType());
			stmt2.setString(6, p.getSpecDColors());
			stmt2.setInt(7, p.getProdId());
			
			int rows = stmt.executeUpdate(sql);
			if(rows != 0) {
				stmt1.executeUpdate();
				stmt2.executeUpdate();
				status = true;
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closeStatement(stmt);
			closePreparedStatement(stmt1);
			closePreparedStatement(stmt2);
			closeConnection(con);
		}
		
		return status;
	}
	
	/**
     * Deletes existing Product Record in the Table based on product id.
     *
     * @param   pid
     *         	product id to delete the product
     * 
     * @return  boolean
     * 			true if record successfully deleted otherwise false.
     */
	
	public boolean deleteProduct(int pid) {
		boolean status = false;
		
		Connection con = null;
		PreparedStatement stmt = null;
		PreparedStatement stmt1 = null;
		PreparedStatement stmt2 = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql = "DELETE from product_information WHERE prod_id = ?";
			String sql1 = "DELETE from product_description WHERE pro_id = ?";
			String sql2 = "DELETE from product_specification WHERE pro_id = ?";
			
			stmt = openPreparedStatement(con,sql);
			stmt1 = openPreparedStatement(con, sql1);
			stmt2 = openPreparedStatement(con, sql2);
					
			stmt.setInt(1, pid);
			stmt1.setInt(1, pid);
			stmt2.setInt(1, pid);
			
			int rows1 = stmt1.executeUpdate();
			int rows2 = stmt2.executeUpdate();
			if(rows1 != 0 && rows2 != 0) {
				stmt.executeUpdate();				
				status = true;
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closePreparedStatement(stmt);
			closePreparedStatement(stmt1);
			closePreparedStatement(stmt2);
			closeConnection(con);
		}
		
		return status;
	}
	
	/**
     * Searches all the products of a particular vendor.
     *
     * @param   vid
     *         	vendor id for displaying that particular vendor products
     * 
     * @return  List<Products>
     * 			list of products of that particular vendor.
     */
	public List<Products> selectAllProducts(int vid) {
		List<Products> productList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql = "SELECT * FROM product_information pi INNER JOIN product_description  pd on pi.prod_id = pd.pro_id INNER JOIN product_specification ps on pi.prod_id = ps.pro_id WHERE ven_id = ?;";
			stmt = openPreparedStatement(con,sql);
			
			stmt.setInt(1, vid);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Products prod = new Products();
				prod.setProdId(rs.getInt(1));
				prod.setVenId(rs.getInt(2));
				prod.setProdName(rs.getString(3));
				prod.setProdPrice(rs.getString(4));
				prod.setProdQuantity(rs.getString(5));
				prod.setProdDesc(rs.getString(8));
				prod.setProdCategory(rs.getString(6));
				prod.setProdSubCategory(rs.getString(7));
				prod.setProdImg1(rs.getString(9));
				prod.setProdImg2(rs.getString(10));
				prod.setProdImg3(rs.getString(11));
				prod.setProdImg4(rs.getString(12));
				prod.setProdImg5(rs.getString(13));
				prod.setDescp1Title(rs.getString(16));
				prod.setDescp1Content(rs.getString(17));
				prod.setDescp2Title(rs.getString(18));
				prod.setDescp2Content(rs.getString(19));
				prod.setDescp3Title(rs.getString(20));
				prod.setDescp3Content(rs.getString(21));
				prod.setDescp4Title(rs.getString(22));
				prod.setDescp4Content(rs.getString(23));
				prod.setSpecitb(rs.getString("spec_in_the_box"));
				prod.setSpecmna(rs.getString("spec_model_name"));
				prod.setSpecColor(rs.getString("spec_color"));
				prod.setSpecResolution(rs.getString("spec_resolution"));
				prod.setSpecDType(rs.getString("spec_display_type"));
				prod.setSpecDColors(rs.getString("spec_display_colors"));
				productList.add(prod);
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closeResultSet(rs);
			closePreparedStatement(stmt);
			closeConnection(con);
		}
		
		return productList;
	}
	
	/**
     * Searches all the products available to display to customer.
     *
     * @return  List<Products>
     * 			list of all products available.
     */
	public List<Products> selectAllProducts() {
		List<Products> productList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql = "SELECT * FROM product_information";
			stmt = openPreparedStatement(con,sql);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				Products prod = new Products();
				prod.setProdId(rs.getInt(1));
				prod.setVenId(rs.getInt(2));
				prod.setProdName(rs.getString(3));
				prod.setProdPrice(rs.getString(4));
				prod.setProdQuantity(rs.getString(5));
				prod.setProdDesc(rs.getString(8));
				prod.setProdCategory(rs.getString(6));
				prod.setProdSubCategory(rs.getString(7));
				prod.setProdImg1(rs.getString(9));
				prod.setProdImg2(rs.getString(10));
				prod.setProdImg3(rs.getString(11));
				prod.setProdImg4(rs.getString(12));
				prod.setProdImg5(rs.getString(13));
				
				productList.add(prod);

			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closeResultSet(rs);
			closePreparedStatement(stmt);
			closeConnection(con);
		}
		
		return productList;
	}
	/**
     * Searches for the product based on product id.
     *
     * @param   pid
     *         	product id for displaying a product.
     * 
     * @return  Products
     * 			product of that particular product id.
     */
	public Products selectProduct(int pid) {
		Products prod = new Products();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql = "SELECT * FROM product_information WHERE prod_id = ?";
			stmt = openPreparedStatement(con,sql);
			stmt.setInt(1, pid);
			rs = stmt.executeQuery();
			while(rs.next()) {
				prod.setProdId(rs.getInt(1));
				prod.setVenId(rs.getInt(2));
				prod.setProdName(rs.getString(3));
				prod.setProdPrice(rs.getString(4));
				prod.setProdQuantity(rs.getString(5));
				prod.setProdDesc(rs.getString(8));
				prod.setProdCategory(rs.getString(6));
				prod.setProdSubCategory(rs.getString(7));
				prod.setProdImg1(rs.getString(9));
				prod.setProdImg2(rs.getString(10));
				prod.setProdImg3(rs.getString(11));
				prod.setProdImg4(rs.getString(12));
				prod.setProdImg5(rs.getString(13));
				
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closeResultSet(rs);
			closePreparedStatement(stmt);
			closeConnection(con);
		}
		
		return prod;
	}
	
	/**
     * Searches all the products with description.
  	 *
     * @return  List<Products>
     * 			list of all products with description.
     */
	public List<Products> selectAllProductDescription() {
		List<Products> productList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource datasource = getDataSource();
			con = datasource.getConnection();
			String sql = "SELECT * FROM product_information pi INNER JOIN product_description  pd on pi.prod_id = pd.pro_id INNER JOIN product_specification ps on pi.prod_id = ps.pro_id;";
			stmt = openPreparedStatement(con,sql);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				Products prod = new Products();
				prod.setProdId(rs.getInt(1));
				prod.setVenId(rs.getInt(2));
				prod.setProdName(rs.getString(3));
				prod.setProdPrice(rs.getString(4));
				prod.setProdQuantity(rs.getString(5));
				prod.setProdDesc(rs.getString(8));
				prod.setProdCategory(rs.getString(6));
				prod.setProdSubCategory(rs.getString(7));
				prod.setProdImg1(rs.getString(9));
				prod.setProdImg2(rs.getString(10));
				prod.setProdImg3(rs.getString(11));
				prod.setProdImg4(rs.getString(12));
				prod.setProdImg5(rs.getString(13));
				prod.setDescp1Title(rs.getString(16));
				prod.setDescp1Content(rs.getString(17));
				prod.setDescp2Title(rs.getString(18));
				prod.setDescp2Content(rs.getString(19));
				prod.setDescp3Title(rs.getString(20));
				prod.setDescp3Content(rs.getString(21));
				prod.setDescp4Title(rs.getString(22));
				prod.setDescp4Content(rs.getString(23));
				prod.setSpecitb(rs.getString("spec_in_the_box"));
				prod.setSpecmna(rs.getString("spec_model_name"));
				prod.setSpecColor(rs.getString("spec_color"));
				prod.setSpecResolution(rs.getString("spec_resolution"));
				prod.setSpecDType(rs.getString("spec_display_type"));
				prod.setSpecDColors(rs.getString("spec_display_colors"));
				
				productList.add(prod);

			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			closeResultSet(rs);
			closePreparedStatement(stmt);
			closeConnection(con);
		}
		
		return productList;
	}
}