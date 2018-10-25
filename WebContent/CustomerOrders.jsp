<%@ page import="com.techaspect.entity.Customer" language="java"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MY ORDERS</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/custom.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<style>
			.table th{
				border-top:none;
			}
		</style>
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
		<%
			if(session.getAttribute("is_logged_in") == null){
		%>
			
							<li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fas fa-sign-in-alt"></i>  SIGN IN</a></li>
					        <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fas fa-user"></i>  SIGN UP</a></li>
				    
		<%
			} else if((Boolean)session.getAttribute("is_logged_in")){
				Customer cust = (Customer)session.getAttribute("customer");
				if(cust != null){
					String fname = cust.getcustFname();
					String lname = cust.getcustLname();
		%>		
							<li class="custom-font-size custom1 nav-link nav-item">Welcome <%= fname %> <%= lname %></li>	
							<li class="nav-item custom-font-size"><a class="custom1 nav-link" href="Logout.jsp"><i class="fas fa-sign-out-alt"></i>  LOG OUT</a></li>
							
		<%	
				}
			} 
		%>
							<li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-facebook-f"></i></a></li>
					        <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-google-plus-g"></i></a></li>
					        <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-twitter"></i></a></li>
					        <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fas fa-envelope"></i></a></li>
					        <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="ShoppingCart.jsp"><i class="fas fa-shopping-cart"></i></a></li>						
						</ul>
				    </div>
				</div>
			</nav>
					    
			<%@ include file="header.html" %>
  			<div id = "breadcrumb1">
	  			<div class="container">
					<nav class="row align-items-center justify-content-between" aria-label="breadcrumb">
						<h2 style="padding-left:15px;" >MY ORDERS</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="Login.jsp">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">MY ACCOUNT</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<br>
		<section class = "container">
			<div class = "row">
				<section class = "col-md-9">
					<p>If you have any questions, please feel free to <a href="Contact.html">contact us</a>, our customer
					service center is working for you 24/7.</p>
					<br>
					<hr>
					<table class="table">
					  	<thead>
						    <tr>
						      <th scope="col">Order</th>
						      <th scope="col">Date</th>
						      <th scope="col">Total</th>
						      <th scope="col">Status</th>
						      <th scope="col">View</th>
						    </tr>
					  	</thead>
					  	<tbody>
						    <tr>
						      <th scope="row">#1735</th>
						      <td>22/06/2013</td>
						      <td>&#8377; 150.00</td>
						      <td><span class="badge badge-primary">BEING PREPARED</span></td>
						      <td><a class="btn btn-primary" href="CustomerOrderDetails.jsp">VIEW</a></td>
						    </tr>
						    <tr>
						      <th scope="row">#1735</th>
						      <td>22/06/2013</td>
						      <td>&#8377; 150.00</td>
						      <td><span class="badge badge-primary">BEING PREPARED</span></td>
						      <td><a class="btn btn-primary" href="CustomerOrderDetails.jsp">VIEW</a></td>
						    </tr>
						    <tr>
						      <th scope="row">#1735</th>
						      <td>22/06/2013</td>
						      <td>&#8377; 150.00</td>
						      <td><span class="badge badge-success">RECIEVED</span></td>
						      <td><button class="btn btn-primary">VIEW</button></td>
						    </tr>
						    <tr>
						      <th scope="row">#1735</th>
						      <td>22/06/2013</td>
						      <td>&#8377; 150.00</td>
						      <td><span class="badge badge-danger">CANCELLED</span></td>
						      <td><button class="btn btn-primary">VIEW</button></td>
						    </tr>
						    <tr>
						      <th scope="row">#1735</th>
						      <td>22/06/2013</td>
						      <td>&#8377; 150.00</td>
						      <td><span class="badge badge-warning">ON HOLD</span></td>
						      <td><button class="btn btn-primary">VIEW</button></td>
						    </tr>
					  	</tbody>
					</table>
				</section>
				<section class = "col-md-3">
					<h5><b>CUSTOMER SECTION</b></h5>
					<div class="list-group">
  						<a href="CustomerOrders.jsp" style="border:none"  class="list-group-item list-group-item-action active"><i class="fas fa-list-ul"></i> My Orders</a>
  						<a href="CustomerWishList.jsp" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-heart"></i> My wishlist</a>
					  	<a href="CustomerAccount.jsp" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-user"></i> My account</a>
					  	<a href="#" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-sign-out-alt"></i> Logout</a>
					</div>
				</section>
			</div>
		</section>
		<br/>
		<%@ include file="footer.html" %>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>