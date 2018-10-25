/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.techaspect.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDataSource;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.log4j.Logger;

/**
 * The Dao class contains the establishing connection pool,connection and creating,closing statements.
 * 
 * This class belongs to get connections from database. 
 * 
 * @author  Kishan Kumar
 */

public class Dao {
private static DataSource dataSource = null;
	private static final Logger LOGGER = Logger.getLogger(Dao.class);	
	/**
	 * This static block contains the code for DataSource pooling.
	 * 
	 * 
	 */
	static {
		Properties properties = new Properties();
		
		InputStream inputStream = Dao.class.getClassLoader().getResourceAsStream("db.properties");
		
		try {
			properties.load(inputStream);
		} catch (IOException ioe) {
			LOGGER.error("Exception Raised",ioe);
		}
		
		DriverManagerConnectionFactory connectionFactory = new DriverManagerConnectionFactory(properties.getProperty("jdbc.url"), properties.getProperty("jdbc.username"), properties.getProperty("jdbc.password"));
		PoolableConnectionFactory poolableConnectionFactory = new PoolableConnectionFactory(connectionFactory, null);
		GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnectionFactory);
		connectionPool.setMaxTotal(100);
		poolableConnectionFactory.setPool(connectionPool);
		
		PoolingDataSource<PoolableConnection> poolingDataSource = new PoolingDataSource<>(connectionPool);
		dataSource = poolingDataSource;
	}
	/**
	 * This method contains the code for getting the DataSource object.
	 * 
	 * 
	 */
	protected static DataSource getDataSource() {
		return dataSource;	
	}
	/**
	 * This method contains the code for closing the DataSource object.
	 * 
	 * 
	 */
	protected static void shutdownDataSource() {
		PoolingDataSource<PoolableConnection> poolingDataSource = (PoolingDataSource) dataSource;
		try {
			poolingDataSource.close();
		} catch (Exception e) {
			LOGGER.error("Exception Raised",e);
		}
	}

	/**
	 * This method contains the code for creating Statement object.
	 * 
	 * @param 	con
	 * 			A Connection object containing the database connection.
	 * 
	 * @return  Statement
	 * 			A statement object created from connection object
	 */
	
	protected Statement openStatement(Connection con) {
		if(con != null) {
			try {
				return con.createStatement();
			
			}  catch(SQLException sqle) {
				LOGGER.error("Exception Raised",sqle);
			}
		}
		
		return null;
	}
	
	/**
	 * This method contains the code for creating Statement object.
	 * 
	 * @param 	con
	 * 			A Connection object containing the database connection.
	 * 
	 * @param   sql
	 * 			sql query to compile while establishing connection with DB.
	 *
	 * @return  PreparedStatement
	 * 			A prepared statement object created from connection object.
	 */
	protected PreparedStatement openPreparedStatement(Connection con,String sql) {
		if(con != null) {
			try {
				return con.prepareStatement(sql);
			
			}  catch(SQLException sqle) {
				LOGGER.error("Exception Raised",sqle);
			}
		}
		
		return null;
	}
	/**
	 * This method contains the code for closing Connection object.
	 * 
	 * @param 	con
	 * 			A Connection object containing the database connection.
	 */
	protected void closeConnection(Connection con) {
		if(con != null) {
			try {
				con.close();
			} catch(SQLException sqle) {
				LOGGER.error("Exception Raised",sqle);
			}
		}
	}
	/**
	 * This method contains the code for closing Statement object.
	 * 
	 * @param 	stmt
	 * 			A Statement object containing the sql query related inforatiom.
	 */
	protected void closeStatement(Statement stmt) {
		if(stmt != null) {
			try {
				stmt.close();
			} catch(SQLException sqle) {
				LOGGER.error("Exception Raised",sqle);
			}
		}
	}
	/**
	 * This method contains the code for closing PreparedStatement object.
	 * 
	 * @param 	stmt
	 * 			A PreparedStatement object containing the sql query related inforatiom.
	 */
	protected void closePreparedStatement(PreparedStatement stmt) {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				LOGGER.error("Exception Raised",e);
			}
		}
	}
	/**
	 * This method contains the code for closing ResultSet object.
	 * 
	 * @param rs
	 * 			A ResultSet object containing the records from the tables.
	 */
	protected void closeResultSet(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch(SQLException sqle) {
				LOGGER.error("Exception Raised",sqle);
			}
		}
	}
}