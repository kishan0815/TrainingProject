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

import com.techaspect.entity.Order;

/**
 * The SetOrderServlet class sets updated order object into the session. 
 * 
 * 
 * @author  Kishan Kumar
 */
public class SetOrderServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Order order = (Order)session.getAttribute("order_details");
		String data = req.getParameter("sCost");
		int sCost = Integer.parseInt(data);
		order.setTotalCost(order.getProductCost()+sCost);
		order.setShippingCost(sCost);
		session.setAttribute("order_details", order);
	}
}
