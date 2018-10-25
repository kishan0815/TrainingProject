/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.techaspect.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * The ContactServlet class inserts the contact form details. 
 * 
 * 
 * @author  Kishan Kumar
 */

public class ContactServlet extends HttpServlet {
	private final static Logger LOGGER = Logger.getLogger(ContactServlet.class);
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		Connection con = null;
		Statement stmt = null;
		HttpSession session = req.getSession();
		String lname;
		String fname;
		String email;
		String sub;
		String message;
		fname = req.getParameter("fname");
		lname = req.getParameter("lname");
		email = req.getParameter("email");
		sub = req.getParameter("subject");
		message = req.getParameter("message");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb", "root", "");
			stmt = con.createStatement();
			
			String sql = "INSERT INTO contact_information(cont_fname, cont_lname, cont_email, cont_subject, cont_message) VALUES('" + fname + "','" + lname + "','" + email + "','" + sub + "','" + message + "');";
			int rows = stmt.executeUpdate(sql); //INSERT,UPDATE,DELETE commands using execute update , returns number of rows 
			if(rows!=0) {
				session.setAttribute("contacted", true);
				res.sendRedirect("Contact.jsp");
			}
			else {
				session.setAttribute("contacted", false);
				res.sendRedirect("Contact.jsp");
			}
		} catch (ClassNotFoundException cnfe) {
			LOGGER.error("Exception Raised",cnfe);
		} catch (SQLException sqle) {
			LOGGER.error("Exception Raised",sqle);
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(con != null) {
					con.close();
				}
			} catch (SQLException sqle) {
				LOGGER.error("Exception Raised",sqle);
			}
		}
	}
}
