<%@ page import="java.sql.*" language="java"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registration Status</title>
</head>
<body>
	<%!
		Connection con = null;
		Statement stmt = null;
		
		String name,lname="",fname,email,pwd,sql;
	%>
	<%
		name = request.getParameter("name");
		String nameArr[] = name.split("\\s+");
		email = request.getParameter("email");
		pwd = request.getParameter("pwd");
		if(nameArr.length == 1) {
			fname = nameArr[0];
			sql = "INSERT INTO customer_information(cust_fname, cust_email, cust_password) VALUES('" + fname + "','" + email + "','" + pwd + "');";
		}
		else {
			fname = nameArr[0];
			for(int i = 1; i < nameArr.length; i++) {
				lname += nameArr[i] + " "; 
			}
			sql = "INSERT INTO customer_information(cust_fname, cust_lname, cust_email, cust_password) VALUES('" + fname + "','" + lname + "','" + email + "','" + pwd + "');";
		}
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb", "root", "");
			stmt = con.createStatement();
			
			int rows = stmt.executeUpdate(sql); //INSERT,UPDATE,DELETE commands using execute update , returns number of rows 
			if(rows != 0) {
				session.setAttribute("regStatus", true);
				response.sendRedirect("index.jsp");
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