/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.techaspect.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.CustomerDao;
import com.techaspect.entity.Customer;

/**
 * The InsertAddressServlet class inserts the address or updates the existing address. 
 * 
 * 
 * @author  Kishan Kumar
 */
public class InsertAddressServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		
		HttpSession session = req.getSession();
		String address;
		String city;
		String zip;
		String state;
		String country;
		int op;
		address = req.getParameter("address");
		city = req.getParameter("city");
		zip = req.getParameter("zip");
		state = req.getParameter("state");
		country = req.getParameter("country");
		Customer cust = (Customer)session.getAttribute("customer");
		if(cust.getAddress().length() == 0) {
			op = 0;
		}
		else {
			op = 1;
		}
		cust.setAddress(address);
		cust.setCity(city);
		cust.setZip(zip);
		cust.setState(state);
		cust.setCountry(country);
		cust.setcustFname(req.getParameter("fname"));
		cust.setcustLname(req.getParameter("lname"));
		cust.setcustGender(req.getParameter("radioGender"));
		cust.setcustContact(req.getParameter("contact"));
		cust.setcustEmail(cust.getcustEmail());
		CustomerDao cdao = CustomerDao.getInstance();
		Boolean status = cdao.insertAddress(cust,op);
		
		if(status) {
			
			session.setAttribute("customer", cust);
			session.setAttribute("address_status", true);
			res.sendRedirect("CustomerAccount.jsp");
		}
		
	}
}
		

