<%@ page import="com.techaspect.entity.Customer,com.techaspect.entity.Order,com.techaspect.dao.CustomerDao" language="java"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Check Out</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/custom.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<style>
			.text-grey{
				color:#666666;
			}
			.custom-btn{
				background-color:#666666;
				color:#ffffff;
			}
			.product-caption-text{
				text-align:center;
			}
			.order-summary-top{
				padding-top:18px;
				padding-bottom: 18px;
				width:100%;
				background-color: #eeeeee;
				border-top: 1.2px solid #bbbbbb;
			}
			.custom-margin-left{
				margin-left: 15px;
			}
			.order-text-color{
				color: #666666;
			}
			.order-subtext-color{
				color: #999999;
			}
			.custom-pills{
				border-bottom: 1px solid #4fbfa8;
			}
			.nav-pills .nav-link.active{
				border-radius: 0;
				background-color: #4fbfa8; 
			}
			.nav-pills .nav-link{
				color: #4fbfa8;
			}
			.custom-btn{
				background-color:#666666;
				color:#ffffff;
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
		<%		} 
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
						<h2 style="padding-left:15px;" >CHECKOUT - ADDRESS</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="Login.jsp">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">CHECKOUT - ADDRESS</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<br>
		<section class = "container">
			<div class = "row">
				<section class = "col-md-9">
					<hr>
					<nav class="nav nav-pills nav-fill custom-pills">
						<a class="nav-item nav-link active" href="#">
							<p class="mb-0">
								<small class="mb-0">
									<i class="fas fa-map-marker-alt"></i>
								</small>	
							</p>
							<p class="mb-0">
								<small class="mb-0">Address</small>
							</p>
						</a>
						<a class="nav-item nav-link" href="#">
							<p class="mb-0">
								<small class="mb-0">
									<i class="fas fa-truck"></i>
								</small>	
							</p>
							<p class="mb-0">
								<small class="mb-0">Delivery Method</small>
							</p>
						</a>
						<a class="nav-item nav-link" href="#">
							<p class="mb-0">
								<small class="mb-0">
									<i class="far fa-money-bill-alt"></i>
								</small>	
							</p>
							<p class="mb-0">
								<small class="mb-0">Payment Method</small>
							</p>
						</a>
						<a class="nav-item nav-link" href="#">
							<p class="mb-0">
								<small >
									<i class="far fa-eye"></i>
								</small>	
							</p>
							<p class="mb-0">
								<small >Order Review</small>
							</p>
						</a>
					</nav>
					<br>
		<%
				Customer cust = (Customer)session.getAttribute("customer");
				Order order = (Order)session.getAttribute("order_details");
		%>
					<form action = "" method="post">
						<div class="row">
							<div class="col-md-6">
								<label class="custom-font-size">First Name</label>
	      						<input type="text" value="<%= cust.getcustFname() %>" name="fname" class="form-control">
	   						</div>
	   						<div class="col-md-6">
								<label class="custom-font-size">Last Name</label>
	      						<input type="text" value="<%= cust.getcustLname() %>" name="lname" class="form-control">
	   						</div>
						</div>
						<br/>
						<div class="row">
							<div class="col">
								<label class="custom-font-size">Address</label>
								<textarea  name="address" class="form-control" ><%= cust.getAddress() %></textarea>
							</div>	
						</div>
						<br/>
						<div class="row">
							<div class="col-md-3">
								<label class="custom-font-size">City</label>
	      						<input type="text" value="<%=cust.getCity() %>" name="city" class="form-control">
	   						</div>
	   						<div class="col-md-3">
								<label class="custom-font-size">ZIP</label>
	      						<input type="text" value="<%= cust.getZip() %>" name="zip" class="form-control">
	   						</div>
	   						<div class="col-md-3">
								<label class="custom-font-size">State</label>
	      						<select id="inputState" name="state" class="form-control">
						        	<option selected><%= cust.getState() %></option>
						        	<option>Andhra Pradesh</option>
						      	</select>
	   						</div>
	   						<div class="col-md-3">
								<label class="custom-font-size">Country</label>
	      						<select id="inputCountry" name="country" class="form-control">
						        	<option selected><%= cust.getCountry() %></option>
						        	<option>India</option>
						      	</select>
	   						</div>
						</div>
						<br/>
						<div class="row">
							<div class="col-md-6">
								<label class="custom-font-size">Contact Number</label>
	      						<input type="text" name="contact" value="<%= cust.getcustContact() %>" class="form-control">
	   						</div>
	   						<div class="col-md-6">
								<label class="custom-font-size">Email</label>
	      						<input type="text" name="email" value="<%= cust.getcustEmail() %>" class="form-control">
	   						</div>
						</div>
						<br/>
						<br/>
					</form>
					<div class="row justify-content-between">
						<a class="btn custom-btn" href="ShoppingCart.jsp" style="margin-left:15px"><i class="fas fa-chevron-left"></i> BACK TO CART</a>
						<a class="btn btn-primary" href="CheckOutDeliveryMethod.jsp" style="margin-right:15px" >CONTINUE TO DELIVERY METHOD  <i class="fas fa-angle-right"></i></a>
					</div>
				</section>
				<section class = "col-md-3" style="padding-right:0">
					<hr style="margin-bottom:0">
					<div class="order-summary-top">
						<h5><b class="custom-margin-left">ORDER SUMMARY</b></h5>
					</div>
					<br>
					<p class="order-text-color">
						Shipping and additional costs are calculated based on
						the values you have entered.
					</p>
					<hr>
					<div class="row">
        				<div class="col-md-7 order-subtext-color">Order SubTotal</div>
				        <div class="col-md-5 "><span class="float-right">&#8377;<%= order.getProductCost() %></span></div>
				    </div>
				    <hr>
				    <div class="row">
        				<div class="col-md-7 order-subtext-color">Shipping & Handling</div>
				        <div class="col-md-5 "><span class="float-right">&#8377;<%= order.getShippingCost() %></span></div>
				    </div>
				    <hr>
				    <div class="row">
        				<div class="col-md-7 order-subtext-color">Tax</div>
				        <div class="col-md-5 "><span class="float-right">&#8377;0.00</span></div>
				    </div>
				    <hr>
				    <div class="row">
        				<div class="col-md-7"><h5>Total</h5></div>
				        <div class="col-md-5"><span class="float-right"><h5>&#8377;<%= order.getTotalCost() %></h5></span></div>
				    </div>
				    <hr>
				    <br>
				</section>
			</div>
		</section>
		<br/>
		<%@ include file="footer.html" %>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>