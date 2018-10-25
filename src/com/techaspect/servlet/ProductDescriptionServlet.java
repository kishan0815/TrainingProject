/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.techaspect.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.ProductDao;
import com.techaspect.entity.Products;
import com.techaspect.entity.Vendor;

/**
 * The ProductDescriptionServlet class fetches the product description of a product. 
 * 
 * 
 * @author  Kishan Kumar
 */
public class ProductDescriptionServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		HttpSession ses = req.getSession();
		
		String prodId = req.getParameter("prod_id");
		if(prodId != null) {
			ProductDao prodDao = ProductDao.getInstance();
			ArrayList<Products> productList = (ArrayList<Products>)prodDao.selectAllProductDescription();
			Products prod = new Products();
			for (Products products : productList) {
				if(Integer.parseInt(prodId) == products.getProdId()) {
					prod = products;
				}
			}
			ses.setAttribute("prod_description", prod);
			RequestDispatcher rd = req.getRequestDispatcher("SubCategory.jsp");
			rd.forward(req, res);
		}
		else {
			res.sendRedirect("Login.jsp");
		}		
	}
}
		

