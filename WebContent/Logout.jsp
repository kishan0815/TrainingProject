<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/custom.css">
	<title>Logging Out..</title>
</head>
<body>
	<%
		Cookie cookie1 = new Cookie("access_token",null);
		cookie1.setMaxAge(0);
		response.addCookie(cookie1);
		Cookie cookie2 = new Cookie("cust_id",null);
		cookie2.setMaxAge(0);
		response.addCookie(cookie2);
		session.invalidate();
		session = request.getSession();
		session.setAttribute("logout_status", true);
		response.sendRedirect("index.jsp");
	%>
	
	<script src="js/jquery-3.3.1.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>