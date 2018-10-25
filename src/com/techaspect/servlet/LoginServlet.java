/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.techaspect.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.CustomerDao;
import com.techaspect.dao.ProductDao;
import com.techaspect.entity.Customer;
import com.techaspect.entity.Products;
import com.techaspect.service.EmailService;

/**
 * The LoginServlet class logs in the customer based on email id,password or access token from cookie. 
 * 
 * 
 * @author  Kishan Kumar
 */
public class LoginServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		
		HttpSession session = req.getSession();
		String email;
		String pwd;
		final String CUSTOMER = "customer";
		final String IS_LOGGED_IN = "is_logged_in";
		String accessToken = (String)session.getAttribute("access_token");
		Customer cust = (Customer)session.getAttribute(CUSTOMER);
		if(accessToken != null && cust != null ){
			CustomerDao customerDao = CustomerDao.getInstance();
			ProductDao pdao = ProductDao.getInstance();
			Boolean status = customerDao.selectCustomerByCustId(cust,accessToken);
			if(status){
				customerDao.selectCustomerAddressDetails(cust);		
				session.setAttribute("all_products", (ArrayList<Products>)pdao.selectAllProducts());
				session.setAttribute(CUSTOMER, cust);
				session.setAttribute(IS_LOGGED_IN,true);
				res.sendRedirect("Login.jsp");
			}
			else{
				if(session.getAttribute(IS_LOGGED_IN)==null || !(Boolean)session.getAttribute(IS_LOGGED_IN)){
					session.setAttribute(IS_LOGGED_IN,false);
					res.sendRedirect("index.jsp");
				}
			}
		} else{
			email = req.getParameter("email");
			pwd = req.getParameter("password");
			Customer customer = new Customer();
			customer.setcustEmail(email);
			customer.setcustPassword(pwd);
			CustomerDao customerDao = CustomerDao.getInstance();
			ProductDao pdao = ProductDao.getInstance();
			boolean status = customerDao.selectCustomerByEmailAndPassword(customer);
	 
					
			if(status) {
				if(req.getParameter("rem_check")!=null){
					StringBuilder sum = new StringBuilder("");
					for(int i = 0; i < email.split("@")[0].length(); i++) {
						char c = email.charAt(i);
						sum.append((int)c + 2 + ""); 
					}
					for(int i = 0; i < pwd.length(); i++) {
						char c = pwd.charAt(i);
						sum .append((int)c - 1 + ""); 
					}
					Cookie cookie1 = new Cookie("access_token",sum.toString());
					cookie1.setMaxAge(60*60*24*30);
					res.addCookie(cookie1);
					Cookie cookie2 = new Cookie("cust_id",customer.getcustId()+"");
					cookie2.setMaxAge(60*60*24*30);
					res.addCookie(cookie2);
				}
				customerDao.selectCustomerAddressDetails(customer);		
				session.setAttribute("all_products", (ArrayList<Products>)pdao.selectAllProducts());
				session.setAttribute(CUSTOMER, customer);
				session.setAttribute(IS_LOGGED_IN,true);
				res.sendRedirect("Login.jsp");
			}
			else{
				if(session.getAttribute(IS_LOGGED_IN)==null || !(Boolean)session.getAttribute(IS_LOGGED_IN)){
					session.setAttribute(IS_LOGGED_IN,false);
					res.sendRedirect("index.jsp");
				}
			}
		}
	}
}
		

