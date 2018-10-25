<%@ page import="com.techaspect.entity.Customer" language="java"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>My Wishlist</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/custom.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<style>
			.product-caption-text{
				text-align:center;
			}
			.striked-price{
				text-decoration: line-through;
				color:#999999;
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
						<h2 style="padding-left:15px;" >MY WISHLIST</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="Login.jsp">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">MY WISHLIST</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<br>
		<section class = "container">
			<div class = "row">
				<section class = "col-md-9">
					<p>Pellentesque habitant morbi tritisque senetus et netus et malesuada fames 
							ac turpis egestas</p>
					<div class="row">
						<div class="col-md-3">
							<img class="img-fluid" src="images/product1.jpg"/>
							<br>
							<br>
							<p class="product-caption-text"><b>FUR COAT WITH VERY BUT VERY LONG NAME</b></p>
							<p class="product-caption-text">&#8377;143.00</p>
							<hr>
						</div>
						<div class="col-md-3">
							<img class="img-fluid" src="images/product2.jpg"/>
							<br>
							<br>
							<p class="product-caption-text"><b>WHITE BLOUSE ARMANI</b></p>
							<p class="product-caption-text"><span class="striked-price">&#8377;280</span><span> &#8377;143.00 </span></p>
							<hr>
						</div>
						<div class="col-md-3">
							<img class="img-fluid" src="images/product3.jpg"/>
							<br>
							<br>
							<p class="product-caption-text"><b >BLACK BLOUSE VERSACE</b></p>
							<p class="product-caption-text">&#8377;143.00</p>
							<hr>
						</div>
						<div class="col-md-3">
							<img class="img-fluid" src="images/product4.jpg"/>
							<br>
							<br>
							<p class="product-caption-text"><b>BLACK BLOUSE VERSACE</b></p>
							<p class="product-caption-text">&#8377;143.00</p>
							<hr>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3">
							<img class="img-fluid" src="images/product3.jpg"/>
							<br>
							<br>
							<p class="product-caption-text"><b>WHITE BLOUSE ARMANI</b></p>
							<p class="product-caption-text"><span class="striked-price">&#8377;285</span><span> &#8377;145.00 </span></p>
							<hr>
						</div>
						<div class="col-md-3">
							<img class="img-fluid" src="images/product4.jpg"/>
							<br>
							<br>
							<p class="product-caption-text"><b>WHITE BLOUSE VERSACE</b></p>
							<p class="product-caption-text">&#8377;143.00</p>
							<hr>
						</div>
						<div class="col-md-3">
							<img class="img-fluid" src="images/product2.jpg"/>
							<br>
							<br>
							<p class="product-caption-text"><b>WHITE BLOUSE VERSACE</b></p>
							<p class="product-caption-text">&#8377;143.00</p>
							<hr>
						</div>
						<div class="col-md-3">
							<img class="img-fluid" src="images/product1.jpg"/>
							<br>
							<br>
							<p class="product-caption-text"><b>FUR COAT</b></p>
							<p class="product-caption-text">&#8377;143.00</p>
							<hr>
						</div>
					</div>
				</section>
				<section class = "col-md-3">
					<h5><b>CUSTOMER SECTION</b></h5>
					<div class="list-group">
  						<a href="CustomerOrders.jsp" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-list-ul"></i> My Orders</a>
  						<a href="CustomerWishList.jsp" style="border:none"  class="list-group-item list-group-item-action active"><i class="fas fa-heart"></i> My wishlist</a>
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