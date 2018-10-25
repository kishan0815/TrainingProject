<%@ page import="java.sql.*" language="java" %>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="css/custom.css">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login Status</title>
</head>
<body>
	<%!
			Connection con = null;
			Statement stmt = null;
			
	%>
	<%
				String name,price,quantity,desc,sql;
				String img[] = {"","","","",""};
				Part part;
				int vid; 
				name = request.getParameter("pname");
				price = request.getParameter("price") + "";
				quantity = request.getParameter("pquantity");
				desc = request.getParameter("pdescription");
				vid = (int)session.getAttribute("ven_id");
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
				
				/* if(request.getPart("img2").getSize() > 0){
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
				    	String imgArr[] = img3.split("\\.");
				    	img4 = "v"+vid+name+price+"4."+imgArr[1];
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
				    	String imgArr[] = img3.split("\\.");
				    	img3 = "v"+vid+name+price+"5."+imgArr[1];
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
				}*/
				sql = "INSERT INTO product_information(ven_id, prod_name, prod_price, prod_quantity, prod_desc, prod_img1, prod_img2, prod_img3, prod_img4, prod_img5) VALUES(" + vid + ",'" + name + "','" + price + "','" + quantity + "','" + desc + "','" + img[0] + "','" + img[1] + "','" + img[2] + "','" + img[3] + "','" + img[4] + "');";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb", "root", "");
					stmt = con.createStatement();
					
					int rows = stmt.executeUpdate(sql); //INSERT,UPDATE,DELETE commands using execute update , returns number of rows 
					if(rows != 0) {
						session.setAttribute("prod_added", true);
						response.sendRedirect("ProductList.jsp");
					}
					else{
						session.setAttribute("prod_added", false);
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
		%>
</body>
</html>