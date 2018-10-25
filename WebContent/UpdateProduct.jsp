<%@ page import="java.sql.*" language="java" %>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%><!DOCTYPE html>
<html>
	<head>
		<meta content="text/html; charset=ISO-8859-1">
		<title>Add Address</title>
	</head>
	<body>
	<%!
			Connection con = null;
			Statement stmt = null;
			
	%>
	<%
				if(request.getParameter("pid")!=null){
					String name,price,quantity,desc,sql;
					String img[]= {"","","","",""};
					Part part;
					int pid,vid;
					vid = (int)session.getAttribute("ven_id");
					name = request.getParameter("pname");
					pid = Integer.parseInt(request.getParameter("pid"));
					price = request.getParameter("price") + "";
					quantity = request.getParameter("pquantity");
					desc = request.getParameter("pdescription");
					sql = "UPDATE product_information SET prod_name='"+name+"', prod_price = '"+price+"', prod_quantity = '"+quantity+"', prod_desc = '"+desc+"'";  
					for(int i=1;i<6;i++){
						if(request.getPart("img"+i+"").getSize() > 0){
							part = request.getPart("img"+i+"");
							String partHeader = part.getHeader("content-disposition");
						    for (String content : part.getHeader("content-disposition").split(";")) {
						        if (content.trim().startsWith("filename")) {
						        	img[i-1] = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
						        }
						    }
						    
						    FileOutputStream fos = null;
						    InputStream is = null;
						   
						    try {
						    	String imgArr[] = img[i-1].split("\\.");
						    	img[i-1] = "v"+vid+name+price+i+"."+imgArr[1];
						    	sql = sql + ", prod_img"+i+" = '"+img[i-1]+"'";
						    	File file = new File("D:\\Training\\workspace\\TrainingProject_Kishan\\WebContent\\images" + File.separator + img[i-1]);
						        fos = new FileOutputStream(file);
						        is = part.getInputStream();

						        int read = 0;
						        final byte[] bytes = new byte[1024];

						        while((read = is.read(bytes)) != -1) {
						            fos.write(bytes, 0, read);
						        }
						       
						    } catch (FileNotFoundException fnfe) {
						        fnfe.printStackTrace();
						    } finally {
						        if (fos != null) {
						            fos.close();
						        }
						        if (is != null) {
						        	is.close();
						        }
						    }
						}
					}
					/* if(request.getPart("img1").getSize() > 0){
						part = request.getPart("img1");
						String partHeader = part.getHeader("content-disposition");
					    for (String content : part.getHeader("content-disposition").split(";")) {
					        if (content.trim().startsWith("filename")) {
					        	img1 = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
					        }
					    }
					    
					    FileOutputStream fos = null;
					    InputStream is = null;
					   
					    try {
					    	String imgArr[] = img1.split("\\.");
					    	img1 = "v"+vid+name+price+"1."+imgArr[1];
					    	sql = sql + ", prod_img1 = '"+img1+"'";
					    	File file = new File("D:\\Training\\workspace\\TrainingProject_Kishan\\WebContent\\images" + File.separator + img1);
					        fos = new FileOutputStream(file);
					        is = part.getInputStream();

					        int read = 0;
					        final byte[] bytes = new byte[1024];

					        while((read = is.read(bytes)) != -1) {
					            fos.write(bytes, 0, read);
					        }
					        
					    } catch (FileNotFoundException fnfe) {
					        fnfe.printStackTrace();
					    } finally {
					        if (fos != null) {
					            fos.close();
					        }
					        if (is != null) {
					        	is.close();
					        }
					    }
					}
					if(request.getPart("img2").getSize() > 0){
						part = request.getPart("img2");
						String partHeader = part.getHeader("content-disposition");
					    for (String content : part.getHeader("content-disposition").split(";")) {
					        if (content.trim().startsWith("filename")) {
					        	img2 = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
					        }
					    }
					    
					    FileOutputStream fos = null;
					    InputStream is = null;
					   
					    try { 
					    	String imgArr[] = img2.split("\\.");
					    	img2 = "v"+vid+name+price+"2."+imgArr[1];
					    	sql = sql + ", prod_img2 = '"+img2+"'";
					    	File file = new File("D:\\Training\\workspace\\TrainingProject_Kishan\\WebContent\\images" + File.separator + img2);
					        fos = new FileOutputStream(file);
					        is = part.getInputStream();

					        int read = 0;
					        final byte[] bytes = new byte[1024];

					        while((read = is.read(bytes)) != -1) {
					            fos.write(bytes, 0, read); 
					        }
					        
					    } catch (FileNotFoundException fnfe) {
					        fnfe.printStackTrace();
					    } finally {
					        if (fos != null) {
					            fos.close();
					        }
					        if (is != null) {
					        	is.close();
					        }
					    }
					}
					if(request.getPart("img3").getSize() > 0){
						part = request.getPart("img3");
						String partHeader = part.getHeader("content-disposition");
					    for (String content : part.getHeader("content-disposition").split(";")) {
					        if (content.trim().startsWith("filename")) {
					        	img3 = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
					        }
					    }
					    
					    FileOutputStream fos = null;
					    InputStream is = null;
					   
					    try {
					    	String imgArr[] = img3.split("\\.");
					    	img3 = "v"+vid+name+price+"3."+imgArr[1];
					    	sql = sql + ", prod_img3 = '"+img3+"'";
					    	File file = new File("D:\\Training\\workspace\\TrainingProject_Kishan\\WebContent\\images" + File.separator + img3);
					        fos = new FileOutputStream(file);
					        is = part.getInputStream();

					        int read = 0;
					        final byte[] bytes = new byte[1024];

					        while((read = is.read(bytes)) != -1) {
					            fos.write(bytes, 0, read);
					        }
					        
					    } catch (FileNotFoundException fnfe) {
					        fnfe.printStackTrace();
					    } finally {
					        if (fos != null) {
					            fos.close();
					        }
					        if (is != null) {
					        	is.close();
					        }
					    }
					}
					if(request.getPart("img4").getSize() > 0){
						part = request.getPart("img4");
						String partHeader = part.getHeader("content-disposition");
					    for (String content : part.getHeader("content-disposition").split(";")) {
					        if (content.trim().startsWith("filename")) {
					        	img4 = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
					        }
					    }
					    
					    FileOutputStream fos = null;
					    InputStream is = null;
					   
					    try {
					    	String imgArr[] = img4.split("\\.");
					    	img4 = "v"+vid+name+price+"4."+imgArr[1];
					    	sql = sql + ", prod_img4 = '"+img4+"'";
					    	File file = new File("D:\\Training\\workspace\\TrainingProject_Kishan\\WebContent\\images" + File.separator + img4);
					        fos = new FileOutputStream(file);
					        is = part.getInputStream();

					        int read = 0;
					        final byte[] bytes = new byte[1024];

					        while((read = is.read(bytes)) != -1) {
					            fos.write(bytes, 0, read);
					        }
					        
					    } catch (FileNotFoundException fnfe) {
					        fnfe.printStackTrace();
					    } finally {
					        if (fos != null) {
					            fos.close();
					        }
					        if (is != null) {
					        	is.close();
					        }
					    }
					}
					if(request.getPart("img5").getSize() > 0){
						part = request.getPart("img5");
						String partHeader = part.getHeader("content-disposition");
					    for (String content : part.getHeader("content-disposition").split(";")) {
					        if (content.trim().startsWith("filename")) {
					        	img5 = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
					        }
					    }
					    
					    FileOutputStream fos = null;
					    InputStream is = null;
					   
					    try {
					    	String imgArr[] = img5.split("\\.");
					    	img5 = "v"+vid+name+price+"5."+imgArr[1];
					    	sql = sql + ", prod_img5 = '"+img5+"'";
					    	File file = new File("D:\\Training\\workspace\\TrainingProject_Kishan\\WebContent\\images" + File.separator + img5);
					        fos = new FileOutputStream(file);
					        is = part.getInputStream();

					        int read = 0;
					        final byte[] bytes = new byte[1024];

					        while((read = is.read(bytes)) != -1) {
					            fos.write(bytes, 0, read);
					        }
					        
					    } catch (FileNotFoundException fnfe) {
					        fnfe.printStackTrace();
					    } finally {
					        if (fos != null) {
					            fos.close();
					        }
					        if (is != null) {
					        	is.close();
					        }
					    }
					} */
					
					try {
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb", "root", "");
						stmt = con.createStatement();
						sql = sql + " WHERE prod_id = "+pid;
						System.out.println(sql);
						int rows = stmt.executeUpdate(sql); 
						if(rows != 0) {
							response.sendRedirect("ProductList.jsp");
						}
						else{
							response.sendRedirect("ProductList.jsp");
						}
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						try {
							if(stmt != null) {
								stmt.close();
							}
							if(con != null) {
								con.close();
							}
						} catch (SQLException e) {
								e.printStackTrace();
						}
					}
				}
				else{
					response.sendRedirect("productList.jsp");
				}
		%>
	</body>
</html>