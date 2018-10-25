/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.techaspect.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.VendorDao;
import com.techaspect.entity.Vendor;

/**
 * The VendorLoginServlet class logs in the vendor based on email id,password or access token from cookie. 
 * 
 * 
 * @author  Kishan Kumar
 */
public class VendorLoginServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		HttpSession session = req.getSession();
		final String IS_LOGGED_IN = "is_vlogged_in";
		final String VENDOR = "vendor";
		String email;
		String pwd;
		String vaccessToken = (String)session.getAttribute("vaccess_token");
		Vendor ven = (Vendor)session.getAttribute(VENDOR);
		if(vaccessToken != null && ven != null ){
			VendorDao vendorDao = VendorDao.getInstance();
			Boolean status = vendorDao.selectVendorByVenId(ven,vaccessToken);
			if(status){
						session.setAttribute(VENDOR, ven);
						session.setAttribute(IS_LOGGED_IN,true);
						res.sendRedirect("VendorHomePage.jsp");
			}
			else{
				if(session.getAttribute(IS_LOGGED_IN)==null || !(Boolean)session.getAttribute(IS_LOGGED_IN)){
					session.setAttribute("is_vlogged_in",false);
					res.sendRedirect("VendorLoginForm.jsp");
				}
			}
		} else{
			email = req.getParameter("email");
			pwd = req.getParameter("password");
			Vendor vendor = new Vendor();
			vendor.setVenEmail(email);
			vendor.setVenPassword(pwd);
			VendorDao vendorDao = VendorDao.getInstance();
			
			boolean status = vendorDao.selectVendorByEmailAndPassword(vendor);
	 
					
			if(status) {
				if(req.getParameter("rem_check")!=null){
					StringBuilder sum = new StringBuilder("");
					for(int i = 0; i < email.split("@")[0].length(); i++) {
						char c = email.charAt(i);
						sum.append((int)c + 2 + ""); 
					}
					for(int i = 0; i < pwd.length(); i++) {
						char c = pwd.charAt(i);
						sum.append((int)c - 1 + ""); 
					}
					Cookie cookie1 = new Cookie("vaccess_token",sum.toString());
					cookie1.setMaxAge(60*60*24*30);
					res.addCookie(cookie1);
					Cookie cookie2 = new Cookie("ven_id",vendor.getVenId()+"");
					cookie2.setMaxAge(60*60*24*30);
					res.addCookie(cookie2);
				}
						
				session.setAttribute(VENDOR, vendor);
				session.setAttribute(IS_LOGGED_IN,true);
				res.sendRedirect("VendorHomePage.jsp");
			}
			else{
				if(session.getAttribute(IS_LOGGED_IN)==null || !(Boolean)session.getAttribute(IS_LOGGED_IN)){
					session.setAttribute(IS_LOGGED_IN,false);
					res.sendRedirect("VendorLoginForm.jsp");
				}
			}
		
		}
	}
}
		

