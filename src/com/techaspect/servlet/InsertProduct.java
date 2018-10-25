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
 * The InsertProduct class inserts the product added by a vendor. 
 * 
 * 
 * @author  Kishan Kumar
 */
public class InsertProduct extends HttpServlet {
	private static final Logger LOGGER = Logger.getLogger(InsertProduct.class);
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		
		String name;
		String price;
		String quantity;
		String desc;
		String[] img = {"","","","",""};
		Part part;
		int vid; 
		name = request.getParameter("pname");
		price = request.getParameter("price") + "";
		quantity = request.getParameter("pquantity");
		desc = request.getParameter("pdescription");
		Vendor vendor = (Vendor)session.getAttribute("vendor");
		vid = vendor.getVenId();
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
		Products prod = new Products();
		prod.setVenId(vid);
		prod.setProdName(name);
		prod.setProdPrice(price);
		prod.setProdQuantity(quantity);
		prod.setProdDesc(desc);
		prod.setProdCategory(request.getParameter("category"));
		prod.setProdSubCategory(request.getParameter("scategory"));
		prod.setProdImg1(img[0]);
		prod.setProdImg2(img[1]);
		prod.setProdImg3(img[2]);
		prod.setProdImg4(img[3]);
		prod.setProdImg5(img[4]);
		prod.setDescp1Title(request.getParameter("dtitle1"));
		prod.setDescp1Content(request.getParameter("dcontent1"));
		prod.setDescp2Title(request.getParameter("dtitle2"));
		prod.setDescp2Content(request.getParameter("dcontent2"));
		prod.setDescp3Title(request.getParameter("dtitle3"));
		prod.setDescp3Content(request.getParameter("dcontent3"));
		prod.setDescp4Title(request.getParameter("dtitle4"));
		prod.setDescp4Content(request.getParameter("dcontent4"));
		prod.setDescp5Title(request.getParameter("dtitle5"));
		prod.setDescp5Content(request.getParameter("dcontent5"));
		prod.setDescp6Title(request.getParameter("dtitle6"));
		prod.setDescp6Content(request.getParameter("dcontent6"));
		prod.setDescp7Title(request.getParameter("dtitle7"));
		prod.setDescp7Content(request.getParameter("dcontent7"));
		prod.setDescp8Title(request.getParameter("dtitle8"));
		prod.setDescp8Content(request.getParameter("dcontent8"));
		prod.setDescp9Title(request.getParameter("dtitle9"));
		prod.setDescp9Content(request.getParameter("dcontent9"));
		prod.setDescp10Title(request.getParameter("dtitle10"));
		prod.setDescp10Content(request.getParameter("dcontent10"));
		prod.setSpecitb(request.getParameter("itb"));
		prod.setSpecmn(request.getParameter("mn"));
		prod.setSpecmna(request.getParameter("mna"));
		prod.setSpecColor(request.getParameter("color"));
		prod.setSpecBrType(request.getParameter("brtype"));
		prod.setSpecSType(request.getParameter("stype"));
		prod.setSpecTScreen(request.getParameter("tscreen"));
		prod.setSpecDsize(request.getParameter("dsize"));
		prod.setSpecResolution(request.getParameter("resolution"));
		prod.setSpecRType(request.getParameter("rtype"));
		prod.setSpecDType(request.getParameter("dtype"));
		prod.setSpecDColors(request.getParameter("dcolors"));
		prod.setSpecOs(request.getParameter("os"));
		prod.setSpecPType(request.getParameter("ptype"));
		prod.setSpecPCore(request.getParameter("pcore"));
		prod.setSpecPClock(request.getParameter("pclock"));
		prod.setSpecSClock(request.getParameter("sclock"));
		prod.setSpecOFrequency(request.getParameter("ofrequency"));
		prod.setSpecIStorage(request.getParameter("istorage"));
		prod.setSpecRam(request.getParameter("ram"));
		prod.setSpecEStorage(request.getParameter("estorage"));
		prod.setSpecSupMem(request.getParameter("supMem"));
		prod.setSpecClMemory(request.getParameter("clmemory"));
		prod.setSpecPCamera(request.getParameter("pcamera"));
		prod.setSpecPCam(request.getParameter("pcam"));
		prod.setSpecPCamFeatures(request.getParameter("pcamfeatures"));
		prod.setSpecSCamera(request.getParameter("scamera"));
		prod.setSpecSCam(request.getParameter("scam"));
		prod.setSpecSCamFeatures(request.getParameter("scamfeatures"));
		prod.setSpecFlash(request.getParameter("flash"));
		prod.setSpecHdRec(request.getParameter("hdrec"));
		prod.setSpecFHdRec(request.getParameter("fhdrec"));
		prod.setSpecVRec(request.getParameter("vrec"));
		prod.setSpecVRecRes(request.getParameter("vrecres"));
		prod.setSpecFRate(request.getParameter("frate"));
		prod.setSpecPBook(request.getParameter("pbook"));
		prod.setSpecNType(request.getParameter("ntype"));
		prod.setSpecSupNetwork(request.getParameter("supnetwork"));
		prod.setSpecIC(request.getParameter("ic"));
		prod.setSpec3g(request.getParameter("3g"));
		prod.setSpecGPRS(request.getParameter("gprs"));
		prod.setSpecPIB(request.getParameter("pib"));
		prod.setSpecBSupp(request.getParameter("bsupp"));
		prod.setSpecBVer(request.getParameter("bver"));
		prod.setSpecWifi(request.getParameter("wifi"));
		prod.setSpecWifiV(request.getParameter("wifiv"));
		prod.setSpecNfc(request.getParameter("nfc"));
		prod.setSpecUsb(request.getParameter("usb"));
		prod.setSpecAudioJ(request.getParameter("audioj"));
		prod.setSpecSPhone(request.getParameter("sphone"));
		prod.setSpecSimSize(request.getParameter("simsize"));
		prod.setSpecRBattery(request.getParameter("rbattery"));
		prod.setSpecSms(request.getParameter("sms"));
		prod.setSpecSensors(request.getParameter("sensors"));
		prod.setSpecOFeatures(request.getParameter("ofeatures"));
		prod.setSpecIApps(request.getParameter("iapps"));
		prod.setSpecAFormat(request.getParameter("aformat"));
		prod.setSpecVFormat(request.getParameter("vformat"));
		prod.setSpecBCapacity(request.getParameter("bcapacity"));
		prod.setSpecBType(request.getParameter("btype"));
		prod.setSpecWidth(request.getParameter("width"));
		prod.setSpecHeight(request.getParameter("height"));
		prod.setSpecDepth(request.getParameter("depth"));
		prod.setSpecWeight(request.getParameter("weight"));
		prod.setSpecWSum(request.getParameter("wsum"));
		ProductDao prodDao = ProductDao.getInstance();
		Boolean status = prodDao.insertProduct(prod);
		
		if(status) {
			session.setAttribute("prod_added", true);
			response.sendRedirect("productList");
		}
		else{
			session.setAttribute("prod_added", false);
			response.sendRedirect("productList");
		}
		
	}
}
		

