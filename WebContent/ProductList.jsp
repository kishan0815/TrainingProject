<%@ page language="java" import="java.sql.*,com.techaspect.entity.Products,com.techaspect.entity.Vendor"%>
<%@ page import="java.util.ArrayList, java.util.Iterator" %>
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
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Baby &amp; Kids</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
					        		<a class="dropdown-item" href="#">Dress</a>
					        	</div>
					    	</li>
					    	<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown5" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home &amp; Furniture</a>
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
						<h2 style="padding-left:15px;" >PRODUCT LIST</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="VendorHomePage.jsp">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">PRODUCT LIST</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<section class="container">
		<br>
		<%
			}
			else{
				response.sendRedirect("VendorLoginForm.jsp");
			}
			if(session.getAttribute("prod_added") != null && (Boolean)session.getAttribute("prod_added") == false){
		%>
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
					  Could not add product please try again.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
		<%	
				session.removeAttribute("prod_added");
			} else if (session.getAttribute("prod_added") != null && (Boolean)session.getAttribute("prod_added") == true) {
		%>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
					  Added Successfully.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
		<%  
				session.removeAttribute("prod_added");
			} 
			if (session.getAttribute("prod_deleted") != null && (Boolean)session.getAttribute("prod_deleted") == true) {
		%>
							<div class="alert alert-success alert-dismissible fade show" role="alert">
							  Deleted Successfully.
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							</div>
		<%  
						session.removeAttribute("prod_deleted");
			}
			if (session.getAttribute("prod_edited") != null && (Boolean)session.getAttribute("prod_edited") == true) {
		%>
							<div class="alert alert-success alert-dismissible fade show" role="alert">
							  Updated Successfully.
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							</div>
		<%  
						session.removeAttribute("prod_edited");
			}
		%>
		<br>
		<table class="table table-hover">
		    <thead>
		    	<tr>
		      		<th scope="col">ID</th>
		      		<th scope="col">Name</th>
		      		<th scope="col">Price</th>
		      		<th scope="col">Quantity</th>
		      		<th scope="col">Description</th>
		      		<th scope="col"></th>
		    	</tr>
		  	</thead>
			<tbody>
		<%

				ArrayList<Products> productList = (ArrayList)session.getAttribute("productList");
				Iterator<Products> iter = productList.iterator();
				
			    Vendor v = (Vendor)session.getAttribute("vendor");
				int vid = v.getVenId();
				
				int i = 0;
				while(iter.hasNext()){
					Products prod = iter.next();
					int pid = prod.getProdId();
					String name = prod.getProdName();
					String price = prod.getProdPrice();
					String quantity = prod.getProdQuantity();
					String desc = prod.getProdDesc();
					i++;
		%>
				<tr>
					<td><%= i %></td>
					<td><%= name %></td>
					<td><%= price %></td>
					<td><%= quantity %></td>
					<td><%= desc %></td> 
					<td>
						<form style="display: inline-block" action="EditProductForm.jsp" method="post">
							<input type="hidden" name="pid" value="<%= pid %>"/>
							<button type="submit" class="btn btn-primary">Edit</button>
						</form>
						<form style="display: inline-block" action="deleteProduct" method="post">
							<input type="hidden" name="pid" value="<%= pid %>"/>
							<button type="submit" class="btn btn-primary">Delete</button>
							</form>
						</td>
				</tr>
		<%
					}
		%>
				</tbody>
			</table>
		</section>
		<%@ include file="footer.html" %>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>