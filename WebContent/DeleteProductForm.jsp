<%@ page import="java.sql.*" language="java"%>
<!DOCTYPE html>
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
					String sql;
					int pid; 
					pid = Integer.parseInt(request.getParameter("pid"));
					sql = "DELETE from product_information WHERE prod_id = "+pid;
					try {
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb", "root", "");
						stmt = con.createStatement();
						
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