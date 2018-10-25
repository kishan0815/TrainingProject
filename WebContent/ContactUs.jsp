<%@ page import="java.sql.*" language="java"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Contact Status</title>
</head>
<body>
	<%!
		Connection con = null;
		Statement stmt = null;
		
		String lname,fname,email,sub,message;
	%>
	<%
		fname = request.getParameter("fname");
		lname = request.getParameter("lname");
		email = request.getParameter("email");
		sub = request.getParameter("subject");
		message = request.getParameter("message");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb", "root", "");
			stmt = con.createStatement();
			
			String sql = "INSERT INTO contact_information(cont_fname, cont_lname, cont_email, cont_subject, cont_message) VALUES('" + fname + "','" + lname + "','" + email + "','" + sub + "','" + message + "');";
			int rows = stmt.executeUpdate(sql); //INSERT,UPDATE,DELETE commands using execute update , returns number of rows 
			if(rows != 0) {
	%>
				<h4>Contact Insertion Successful</h4>
	<%
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