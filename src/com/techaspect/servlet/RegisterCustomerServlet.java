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
import com.techaspect.service.EmailService;

/**
 * The RegisterCustomerServlet class registers a new customer. 
 * 
 * 
 * @author  Kishan Kumar
 */
public class RegisterCustomerServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		HttpSession session = req.getSession();
		
		String name;
		StringBuilder lname= new StringBuilder("");
		String fname;
		String email;
		String pwd;
		name = req.getParameter("name");
		String[] nameArr = name.split("\\s+");
		email = req.getParameter("email");
		pwd = req.getParameter("pwd");
		
		Customer customer = new Customer();
		customer.setcustEmail(email);
		customer.setcustPassword(pwd);
		if(nameArr.length == 1) {
			fname = nameArr[0];
			customer.setcustFname(fname);
		}
		else {
			fname = nameArr[0];
			for(int i = 1; i < nameArr.length; i++) {
				lname.append(nameArr[i] + " "); 
			}
			customer.setcustFname(fname);
			customer.setcustLname(lname.toString());
		}
		
		CustomerDao customerDao = CustomerDao.getInstance();
		
		boolean status = customerDao.insertCustomer(customer);
		if(status) {
			session.setAttribute("regStatus", true);
			EmailService emailService = EmailService.getInstance();
			emailService.sendWelcomeMailToCustomer(customer);
			res.sendRedirect("index.jsp");
		} else {
			res.sendRedirect("index.jsp");
		}
		
	}
}
		

