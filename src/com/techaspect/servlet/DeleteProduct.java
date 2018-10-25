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

import com.techaspect.dao.ProductDao;

/**
 * The DeleteProduct class deletes the product that the vendor chooses. 
 * 
 * 
 * @author  Kishan Kumar
 */
public class DeleteProduct extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		final String REDIRECT_URL = "productList";
		if(request.getParameter("pid")!=null){
			int pid; 
			pid = Integer.parseInt(request.getParameter("pid"));
			ProductDao pdao = ProductDao.getInstance();
			Boolean status = pdao.deleteProduct(pid);
				
			if(status) {
				session.setAttribute("prod_deleted", true);
				response.sendRedirect(REDIRECT_URL);
			}
			else{
				session.setAttribute("prod_deleted", false);
				response.sendRedirect(REDIRECT_URL);
			}
		}
		else{
			response.sendRedirect(REDIRECT_URL);
		}
	}
}
		

