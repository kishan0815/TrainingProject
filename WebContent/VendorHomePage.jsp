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
			Vendor ven = (Vendor)session.getAttribute("vendor");
		    if(ven != null){ 
				String fname = ven.getVenFname();
				String lname = ven.getVenLname();
			
		%>	
		<header>
			<nav class="navbar navbar-expand-lg" style = "background-color:#333333;color:#FFFFFF;padding:0.1%">
				<div class="container">
					<div class = "navbar-collapse">
						<ul class="navbar-nav mr-auto">
		      				<li class="custom-font-size nav-item">Contact Us on +91 40 66217777</li>
		       			</ul>
					    <ul class="navbar-nav">
						  <li class="custom-font-size custom1 nav-link nav-item">Welcome <%= fname %> <%= lname %></li>	
						  <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="LogoutVendor.jsp"><i class="fas fa-sign-out-alt"></i>  LOG OUT</a></li>
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
						<h2 style="padding-left:15px;" >WELCOME</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="#">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">WELCOME</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<section>
			<div class="container">
					<h3 align="center">Welcome <%=fname +" "+ lname%></h3>	
					<hr>
					<br>
					<div class="row">
						<div class="col-md-4 offset-md-2">
							<div class="card">
							  <div align="center" class="card-header">
							    Add
							  </div>
							  <div class="card-body">
							    <h5 class="card-title">Add Products</h5>
							    <p class="card-text">Add new products in your inventory to sell.</p>
							    <a href="AddNewProductForm.jsp" class=" text-center btn btn-primary">Go</a>
							  </div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
							  <div align="center" class="card-header">
							    Edit/Delete
							  </div>
							  <div class="card-body">
							    <h5 class="card-title">Edit/Delete Existing Products</h5>
							    <p class="card-text">Edit name, price, quantity, description and images of exisiting products.</p>
							    <a href="productList" class="justify-content-center btn btn-primary">Go</a>
							  </div>
							</div>
						</div>
					</div>
					<hr>
					<br>
			</div>
		</section>
		<%@ include file="footer.html" %>
		<%
			}
			else{
				response.sendRedirect("VendorLoginPage.jsp");
			}
		%> 
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>