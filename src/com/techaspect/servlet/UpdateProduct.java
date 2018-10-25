/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */
package com.techaspect.servlet;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;

import com.techaspect.dao.ProductDao;
import com.techaspect.entity.Products;
import com.techaspect.entity.Vendor;

/**
 * The UpdateProduct class updates the product information modified by a vendor. 
 * 
 * 
 * @author  Kishan Kumar
 */
public class UpdateProduct extends HttpServlet {
	private static final Logger LOGGER = Logger.getLogger(InsertProduct.class);
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		final String PRODUCT_LIST = "productList";
		
		if(request.getParameter("pid")!=null){
			String name;
			String price;
			String quantity;
			String desc;
			String[] img= {"","","","",""};
			Part part;
			int pid;
			int vid;
			Vendor vendor = (Vendor)session.getAttribute("vendor");
			vid = vendor.getVenId();
			name = request.getParameter("pname");
			pid = Integer.parseInt(request.getParameter("pid"));
			price = request.getParameter("price") + "";
			quantity = request.getParameter("pquantity");
			desc = request.getParameter("pdescription");
			StringBuilder sql = new StringBuilder("UPDATE product_information SET prod_name='"+name+"', prod_price = '"+price+"', prod_quantity = '"+quantity+"', prod_desc = '"+desc+"'");  
			for(int i=1;i<6;i++){
				if(request.getPart("img"+i+"").getSize() > 0){
					part = request.getPart("img"+i+"");
				    for (String content : part.getHeader("content-disposition").split(";")) {
				        if (content.trim().startsWith("filename")) {
				        	img[i-1] = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
				        }
				    }
				    
				    String[] imgArr = img[i-1].split("\\.");
			    	img[i-1] = "v"+vid+name+price+i+"."+imgArr[1];
				    File file = new File("D:\\Training\\workspace\\TrainingProject_Kishan\\WebContent\\images" + File.separator + img[i-1]);
				    try(FileOutputStream fos = new FileOutputStream(file);
				    	InputStream is = part.getInputStream()) {
				    	
				    	sql.append(", prod_img"+i+" = '"+img[i-1]+"'");
				        
				        int read = 0;
				        final byte[] bytes = new byte[1024];

				        while((read = is.read(bytes)) != -1) {
				            fos.write(bytes, 0, read);
				        }
				       
				    } catch (FileNotFoundException fnfe) {
				    	LOGGER.error("Exception Raised",fnfe);
				    }
				}
			}
			sql.append(" WHERE prod_id = "+pid);
			ProductDao pdao = ProductDao.getInstance();
			Products prod = new Products();
			prod.setProdId(pid);
			prod.setDescp1Title(request.getParameter("dtitle1"));
			prod.setDescp1Content(request.getParameter("dcontent1"));
			prod.setDescp2Title(request.getParameter("dtitle2"));
			prod.setDescp2Content(request.getParameter("dcontent2"));
			prod.setDescp3Title(request.getParameter("dtitle3"));
			prod.setDescp3Content(request.getParameter("dcontent3"));
			prod.setDescp4Title(request.getParameter("dtitle4"));
			prod.setDescp4Content(request.getParameter("dcontent4"));
			prod.setSpecitb(request.getParameter("itb"));
			prod.setSpecmna(request.getParameter("mna"));
			prod.setSpecColor(request.getParameter("color"));
			prod.setSpecResolution(request.getParameter("resolution"));
			prod.setSpecDType(request.getParameter("dtype"));
			prod.setSpecDColors(request.getParameter("dcolors"));
			Boolean status = pdao.updateProduct(prod,sql.toString());
			if(status) {
				session.setAttribute("prod_edited", true);
				response.sendRedirect(PRODUCT_LIST);
			}
			else{
				session.setAttribute("prod_edited", false);
				response.sendRedirect(PRODUCT_LIST);
			}
			
		}
		else{
			response.sendRedirect(PRODUCT_LIST);
		}
	}
}
		

