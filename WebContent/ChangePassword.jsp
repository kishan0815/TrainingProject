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
			
			String pwd,new_pwd,fname,lname;		
		%>
		<%
			pwd = request.getParameter("opwd");
			new_pwd = request.getParameter("npwd");
			int cid = (int)session.getAttribute("cust_id");
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb", "root", "");
				stmt = con.createStatement();
				
				String sql = "UPDATE customer_information SET cust_password = '"+new_pwd+"' WHERE cust_password = '"+pwd+"' AND cust_id = "+cid+";";
				int rows = stmt.executeUpdate(sql); //INSERT,UPDATE,DELETE commands using execute update , returns number of rows 
				if(rows != 0) {
					session.setAttribute("pwd_status", true);
					response.sendRedirect("CustomerAccount.jsp");
				} else {
					session.setAttribute("pwd_status", false);
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