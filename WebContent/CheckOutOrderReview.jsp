<%@ page import="com.techaspect.entity.Customer,com.techaspect.entity.Products,com.techaspect.entity.Order" language="java"%>
<%@ page import="java.util.ArrayList" %>
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
			.table td{
				max-width: 250px;
			}
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
				border-bottom: 1.2px solid #4fbfa8;
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
						<h2 style="padding-left:15px;" >CHECKOUT - ORDER REVIEW</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="Login.jsp">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">CHECKOUT - ORDER REVIEW</li>
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
						<a class="nav-item nav-link" href="#">
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
						<a class="nav-item nav-link active" href="#">
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
					<table class="table">
					  	<thead>
						    <tr>
						      <th scope="col">Product</th>
						      <th scope="col">Quantity</th>
						      <th scope="col">Unit Price</th>
						      <th scope="col">Discount</th>
						      <th scope="col">Total</th>
						    </tr>
					  	</thead>
					  	<tbody>
			<%
						Order order = (Order)session.getAttribute("order_details");
						ArrayList<Products> cartList = (ArrayList<Products>)session.getAttribute("cart_list");
						if(cartList != null){
						    String img = "";
							for(Products p : cartList){
								if(p.getProdImg5().length()>0){
									img = p.getProdImg5();
								}
								if(p.getProdImg4().length()>0){
									img = p.getProdImg4();
								}
								if(p.getProdImg3().length()>0){
									img = p.getProdImg3();
								}
								if(p.getProdImg2().length()>0){
									img = p.getProdImg2();
								}
								if(p.getProdImg1().length()>0){
									img = p.getProdImg1();
								}
		%>
						    <tr>
						      <td scope="row">
						      	<div class="row">
						      		<div class="col-md-3">
						      			<img class="img-fluid" src="images/<%=img%>"/>
						      		</div>
						      		<div class="col-md-9">
						      			<%=p.getProdName() %>
						      		</div>
						      	</div>
						      </td>
						      <td>
						      	<select class="border-0">
	  								<option value="1" selected >1</option>
	  								<option value="2">2</option>
	  								<option value="3">3</option>
								</select>
						      </td>
						      <td>&#8377;<%= p.getProdPrice() %> </td>
						      <td>&#8377; 0.00</td>
						      <td>&#8377; <%= p.getProdPrice() %></td>
						      <!-- <td><i class="fas fa-trash-alt"></i></td> -->
						    </tr>
			<% 
							}
						}
			%>   
						    <tr>
						    	<td colspan="4" ><b class="text-grey">Total</b></td>
						    	<td colspan="1" ><b class="text-grey">&#8377; <%= order.getTotalCost() %></b></td>
						    </tr>	
					  	</tbody>
					</table>
					<br>
					<div class="row justify-content-between">
						<a class="btn custom-btn" href="ShoppingCart.jsp" style="margin-left:15px"><i class="fas fa-chevron-left"></i> BACK TO CART</a>
						<button class="btn btn-primary" style="margin-right:15px" >PLACE THE ORDER  <i class="fas fa-angle-right"></i></button>
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
				        <div class="col-md-5 "><span class="float-right">&#8377;<%= order.getTaxCost() %></span></div>
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