<%@ page import="com.techaspect.entity.Customer" language="java"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Order Details</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/custom.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<style>
			.table th{
				border-top:none;
			}
			.table td{
				max-width: 250px;
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
						<h2 style="padding-left:15px;" >ORDER DETAILS</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="Login.jsp">HOME</a></li>
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="CustomerOrders.jsp">MY ORDERS</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">ORDER DETAILS</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<br>
		<section class = "container">
			<div class = "row">
				<section class = "col-md-9">
					<p>Order #1735 was placed on <b>22/06/2013</b> and is currently <b>Being prepared.</b></p>
					<p>If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer
					service center is working for you 24/7.</p>
					<br>
					<br>
					<hr>
					<table class="table">
					  	<thead>
						    <tr>
						      <th scope="col">Product</th>
						      <th scope="col">Quantity</th>
						      <th scope="col">Unit price</th>
						      <th scope="col">Discount</th>
						      <th scope="col">Total</th>
						    </tr>
					  	</thead>
					  	<tbody>
						    <tr>
						      <td scope="row">
						      	<div class="row">
						      		<div class="col-md-3">
						      			<img class="img-fluid" src="images/product2.jpg"/>
						      		</div>
						      		<div class="col-md-9">
						      			White Blouse Armani
						      		</div>
						      	</div>
						      </td>
						      <td>2</td>
						      <td>&#8377; 123.00</td>
						      <td>&#8377; 0.00</td>
						      <td>&#8377; 246.00</td>
						      <td></td>
						    </tr>
						    <tr>
						      <td scope="row">
						      	<div class="row">
						      		<div class="col-md-3">
						      			<img class="img-fluid" src="images/product3.jpg"/>
						      		</div>
						      		<div class="col-md-9">
						      			Black Blouse Armani
						      		</div>
						      	</div>
						      </td>
						      <td>1</td>
						      <td>&#8377; 200.00</td>
						      <td>&#8377; 0.00</td>
						      <td>&#8377; 200.00</td>
						      <td></td>
						    </tr>
						    <tr>
						    	<td colspan="3"></td>
						    	<td>Order subtotal</td>
						    	<td>&#8377; 446.00</td>
						    </tr>
						    <tr>
						    	<td colspan="3"></td>
						    	<td>Shipping and Handling</td>
						    	<td>&#8377; 10.00</td>
						    </tr>
						    <tr>
						    	<td colspan="3"></td>
						    	<td>Tax</td>
						    	<td>&#8377; 0.00</td>
						    </tr>
						    <tr>
						    	<td colspan="3"></td>
						    	<td>Total</td>
						    	<td>&#8377; 456.00</td>
						    </tr>
					  	</tbody>
					</table>
					<br>
					<h5>SHIPPING ADDRESS</h5>
					<p>
						Akshat Kumar<br/>
						Plot No. 110, Road No.3<br/>
						Ajanta Homes<br/>
						Madinaguda<br/>
						Hyderabad - 500081<br/>
						Telengana, India
					</p>	
					<hr>
					<br>
					<br>
				</section>
				<section class = "col-md-3">
					<h5><b>CUSTOMER SECTION</b></h5>
					<div class="list-group">
  						<a href="#" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-list-ul"></i> My Orders</a>
  						<a href="#" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-heart"></i> My WishList</a>
					  	<a href="#" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-user"></i> My Account</a>
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