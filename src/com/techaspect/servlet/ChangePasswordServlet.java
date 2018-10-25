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
 * The ChangePasswordServlet class changes the password as requested by the customer.
 * 
 * 
 * @author  Kishan Kumar
 */

public class ChangePasswordServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		
		HttpSession session = req.getSession();
		
		String pwd;
		String newPwd;
		pwd = req.getParameter("opwd");
		newPwd = req.getParameter("npwd");
		Customer cust = (Customer)session.getAttribute("customer");
		CustomerDao cdao = CustomerDao.getInstance();
		Boolean status = cdao.changePassword(cust, pwd, newPwd);
		
		if(status) {
			session.setAttribute("pwd_status", true);
			res.sendRedirect("CustomerAccount.jsp");
		} else {
			session.setAttribute("pwd_status", false);
			res.sendRedirect("CustomerAccount.jsp");
		}
		
	}
}
