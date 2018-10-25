<%@ page isErrorPage="true" language="java"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Exception Page</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/custom.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	</head>
	<body>
		<header >
			<nav class="navbar navbar-expand-lg" style = "background-color:#333333;color:#FFFFFF;padding:0.1%">
				<div class="container">
					<div class = "navbar-collapse">
						<ul class="navbar-nav mr-auto">
		      				<li class="custom-font-size nav-item">Contact Us on +91 40 66217777</li>
		       			</ul>
					    <ul class="navbar-nav">
		
			
							<li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fas fa-sign-in-alt"></i>  SIGN IN</a></li>
					        <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fas fa-user"></i>  SIGN UP</a></li>
				    
			
							<li class="nav-item custom-font-size"><a class="custom1 nav-link" href="Logout.jsp"><i class="fas fa-sign-out-alt"></i>  LOG OUT</a></li>
							
	
							<li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-facebook-f"></i></a></li>
					        <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-google-plus-g"></i></a></li>
					        <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-twitter"></i></a></li>
					        <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fas fa-envelope"></i></a></li>
						</ul>
				    </div>
				</div>
			</nav>
			<%@ include file="header.html" %>
  			<div id = "breadcrumb1">
	  			<div class="container">
					<nav class="row align-items-center justify-content-between" aria-label="breadcrumb">
						<h2 style="padding-left:15px;" >EXCEPTION PAGE</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="index.jsp">HOME</a></li>
	    					<li class="breadcrumb-item active"><a class="breadcrumb-color " href="#">EXCEPTION PAGE</a></li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<br>
		<section class = "container">
			<div class="row justify-content-center text-center">
			<hr>
				<div class="col-md-10">		
					<h4 style="text-align:center">Sorry for the Inconvenience - The Page you are looking for has a technical Error.</h4>
					<br>
					<p style="text-align:center">Seems like either you have tried to write or modify the URL. Use only
					the Navigation Links provided on the Web Page.</p>
					<br>
					<a  class="btn btn-primary text-center" href="index.jsp"><i class="fas fa-home"></i> Home</a>
					<a  class="btn btn-primary text-center" href="#"><i class="fas fa-home"></i> Report</a>
				</div>
			<hr>
			</div>
			<br>
			<br>
			<br>
			<br>
			<div class="row">
				<div style="background-color: #e09e9a" class="offset-md-1 col-md-10">
						<div ><% exception.printStackTrace(new java.io.PrintWriter(out)); %></div>
				</div>
			</div>
		</section>
		<br/>
		<%@ include file="footer.html" %>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>