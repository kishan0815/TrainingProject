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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.ProductDao;
import com.techaspect.entity.Products;
import com.techaspect.entity.Vendor;

/**
 * The ProductListServlet class fetches all the products. 
 * 
 * 
 * @author  Kishan Kumar
 */
public class ProductListServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		HttpSession ses = req.getSession();
		
		Vendor vendor = (Vendor)ses.getAttribute("vendor");
	
		ProductDao prodDao = ProductDao.getInstance();
		
		ses.setAttribute("productList", (ArrayList<Products>)prodDao.selectAllProducts(vendor.getVenId()));
		
		res.sendRedirect("ProductList.jsp");
			
	}
}
		

