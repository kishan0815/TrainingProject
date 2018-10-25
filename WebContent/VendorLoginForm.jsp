<%@ page language="java" import="java.sql.*,com.techaspect.entity.Vendor"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Vendor Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="css/custom.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	</head>
	<body>
		<%
			Cookie cookie[] = request.getCookies();
			int count = 0;
			if(cookie != null){
				for(Cookie c : cookie ){
					if(c.getName().equals("vaccess_token")){
						session.setAttribute("vaccess_token", c.getValue());
						count++;
					}
					if(c.getName().equals("ven_id")){
						Vendor ven = new Vendor();
						ven.setVenId(Integer.parseInt(c.getValue()));
						session.setAttribute("vendor",ven);
						count++;
					}
				}
				if(count == 2){
					response.sendRedirect("vendor_login");
				}
			}
		%>
		<header>
			<nav class="navbar navbar-expand-lg" style = "background-color:#333333;color:#FFFFFF;padding:0.1%">
				<div class="container">
					<div class = "navbar-collapse">
						<ul class="navbar-nav mr-auto">
		      				<li class="custom-font-size nav-item">Contact Us on +91 40 66217777</li>
		       			</ul>
					    <ul class="navbar-nav">
	
					      <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fas fa-sign-in-alt"></i>  SIGN IN</a></li>
					      <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fas fa-user"></i>  SIGN UP</a></li>
					      <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-facebook-f"></i></a></li>
					      <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-google-plus-g"></i></a></li>
					      <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-twitter"></i></a></li>
					      <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fas fa-envelope"></i></a></li>
					    </ul>
				    </div>
				</div>
			</nav>
			<nav class="navbar navbar-expand-lg">
				<div class = "container">
					<div class= "navbar-collapse">
						<ul class = "navbar-nav mr-auto ">
							<li class="nav-item"><img src = "images/logo.png"/></li>
						</ul>
						
			    		<ul class="navbar-nav">
							<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Electronics</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
					        		<a class="dropdown-item" href="#">Mobiles</a>
					        	</div>
					    	</li>
					    	<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Men</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
					        		<a class="dropdown-item" href="#">Shirts</a>
					        	</div>
					    	</li>
					    	<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Women</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
					        		<a class="dropdown-item" href="#">Saree</a>
					        	</div>
					    	</li>
					    	<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Baby & Kids</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
					        		<a class="dropdown-item" href="#">Dress</a>
					        	</div>
					    	</li>
					    	<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown5" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home & Furniture</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown5">
					        		<a class="dropdown-item" href="#">Tables</a>
					        	</div>
					    	</li>
						</ul>
					</div>
				</div>
  			</nav>
  			<div id = "breadcrumb1">
	  			<div class="container">
					<nav class="row align-items-center justify-content-between" aria-label="breadcrumb">
						<h2 style="padding-left:15px;" >VENDOR SIGN IN</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="#">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">VENDOR SIGN IN</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<section class="container">
			<hr>
			<div class="row">
				<div class = "offset-md-3 col-md-6">
		<%
				if(session.getAttribute("is_vlogged_in") != null && (Boolean)session.getAttribute("is_vlogged_in") == false){
		%>
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
					  Invalid Credentials! Please try again.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
		<%	
					session.removeAttribute("is_vlogged_in");
				} 
		%>
					<h4>LOGIN</h4>
					<p>Add, Remove and Edit your products.</p>	
					<form action="vendor_login" method="post">
						<div class="form-group">
							<label >Email address</label> 
							<input type="email" required name="email" class="form-control" placeholder="Enter email"> 
						</div>
						<div class="form-group">
							<label >Password</label> 
							<input type="password" required name="password" class="form-control" placeholder="Password">
						</div>
						<div class="custom-control custom-checkbox my-1 mr-sm-2">
						    <input type="checkbox" class="custom-control-input" name="rem_check" id="customControlInline">
						    <label class="custom-control-label" for="customControlInline">Remember me</label>
					  	</div>
						<div class="row justify-content-center">
							<button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> LOGIN</button>						
						</div>
						<br>
					</form>
				</div>			
			</div>
		</section>
		<%@ include file="footer.html" %>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>