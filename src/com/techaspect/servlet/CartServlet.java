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
 * The CartServlet class manages the shopping cart operations. 
 * 
 * 
 * @author  Kishan Kumar
 */

public class CartServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		HttpSession ses = req.getSession();
		ArrayList<Products> cartList = (ArrayList<Products>)ses.getAttribute("cart_list"); 
		String prodId = req.getParameter("prod_id");
		String del = req.getParameter("del");
		if(prodId != null && del == null) {
			ProductDao prodDao = ProductDao.getInstance();
			Products product = prodDao.selectProduct(Integer.parseInt(prodId));
			if(cartList == null) {
				cartList = new ArrayList<>();
			}
			cartList.add(product);
			ses.setAttribute("cart_list", cartList);
			RequestDispatcher rd = req.getRequestDispatcher("SubCategory.jsp");
			rd.forward(req, res);
		}
		else if(del != null && prodId != null) {
			for (Products products : cartList) {
				if(products.getProdId() == Integer.parseInt(prodId)) {
					cartList.remove(products);
					break;
				}
			}
			ses.setAttribute("cart_list", cartList);
			RequestDispatcher rd = req.getRequestDispatcher("ShoppingCart.jsp");
			rd.forward(req, res);
		}
		else {
			res.sendRedirect("Login.jsp");
		}		
	}
}
		

