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
			ResultSet rs = null;
			
			String address,city,zip,state,country,sql,gender;
		%>
		<%
			address = request.getParameter("address");
			city = request.getParameter("city");
			zip = request.getParameter("zip");
			state = request.getParameter("state");
			country = request.getParameter("country");
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb", "root", "");
				stmt = con.createStatement();
				
				sql = "INSERT INTO address_information(cust_id, add_address, add_city, add_zip, add_state, add_country) VALUES(1,'" + address + "','" + city + "','" + zip + "','" + state + "','" + country + "');";
				
				int rows = stmt.executeUpdate(sql); //INSERT,UPDATE,DELETE commands using execute update , returns number of rows 
				if(rows != 0) {
					session.setAttribute("address_status", true);
					response.sendRedirect("CustomerAccount.jsp");
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) {
						rs.close();
					}
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