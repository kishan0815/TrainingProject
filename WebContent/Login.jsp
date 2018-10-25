<%@ page import="java.sql.*,com.techaspect.entity.Customer,com.techaspect.entity.Products,com.techaspect.dao.ProductDao" language="java" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="css/custom.css">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<title>Login Status</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg" style = "background-color:#333333;color:#FFFFFF;padding:0.1%">
				<div class="container">
					<div class = "navbar-collapse">
						<ul class="navbar-nav mr-auto">
		      				<li class="custom-font-size nav-item">Contact Us on +91 40 66217777</li>
		       			</ul>
					    <ul class="navbar-nav">
	<%
		String fname,lname;
		
		if(session.getAttribute("is_logged_in") == null){
			response.sendRedirect("index.jsp");
	%>
	<%
		} else if((Boolean)session.getAttribute("is_logged_in")){
			Customer cust = (Customer)session.getAttribute("customer");
			
			if(cust != null){
				fname = cust.getcustFname();
				lname = cust.getcustLname();
	%>		
						<li class="custom-font-size custom1 nav-link nav-item">Welcome <%= fname %> <%= lname %></li>	
							<li class="nav-item custom-font-size"><a class="custom1 nav-link" href="Logout.jsp"><i class="fas fa-sign-out-alt"></i>  LOG OUT</a></li>
							
		
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
						<h2 style="padding-left:15px;" >HOME</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item active"><a class="breadcrumb-color " href="Login.jsp">HOME</a></li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<br>
		<section class = "container">
			<div class="row">
				<div class="col-md-9">
					<div class="row">
		<%
			ArrayList<Products> productList = (ArrayList<Products>)session.getAttribute("all_products");
			if(productList !=null){
				String img = "";
				int count = 0;
				for(Products p : productList){
					count = count + 1;
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
						<div class="col-md-4">
							<div class="card" >
							  <img class="card-img-top" src="images/<%=img%>" alt="Product image">
							  <div class="card-body">
							    <h5 class="card-title"><%=p.getProdName() %></h5>
							    <p class="card-text"><%=p.getProdDesc() %></p>
							    <a href="description?prod_id=<%=p.getProdId()%>" class="btn btn-primary">See More</a>
							  </div>
							</div>	
						</div>
		<% 			if(count % 3 == 0){ %>
						<br>
		<% 			} %>
		<%		
				}
			}else{
				ProductDao pdao = ProductDao.getInstance();
				productList = (ArrayList<Products>)pdao.selectAllProducts();
				if(productList !=null){
					String img = "";
					int count = 0;
					for(Products p : productList){
						count = count + 1;
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
						<div class="col-md-4">
							<div class="card" >
							  <img class="card-img-top" src="images/<%=img%>" alt="Product image">
							  <div class="card-body">
							    <h5 class="card-title"><%=p.getProdName() %></h5>
							    <p class="card-text"><%=p.getProdDesc() %></p>
							    <a href="description?prod_name=<%=p.getProdName()%>" class="btn btn-primary">See More</a>
							  </div>
							</div>	
						</div>
		<% 			if(count % 3 == 0){ %>
						<br>
						<br>
		<% 			} %>
		<%
					}
				}
			}
		%>
						</div>
					</div>	
				<div class="col-md-3">
					<h5><b>CUSTOMER SECTION</b></h5>
					<div class="list-group">
  						<a href="CustomerOrders.jsp" style="border:none"  class="list-group-item list-group-item-action active"><i class="fas fa-list-ul"></i> My Orders</a>
  						<a href="CustomerWishList.jsp" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-heart"></i> My wishlist</a>
					  	<a href="CustomerAccount.jsp" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-user"></i> My account</a>
					  	<a href="ShoppingCart.jsp" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-shopping-cart"></i> My Cart</a>
					  	<a href="Logout.jsp" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-sign-out-alt"></i> Logout</a>
					</div>
				</div>
			</div>
		</section>
		<br>
		<%@ include file="footer.html" %>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
		
		<%
				}
			}
		%>
				
</body>
</html>