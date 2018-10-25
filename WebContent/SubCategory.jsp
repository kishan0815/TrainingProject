<%@ page import="com.techaspect.entity.Customer,com.techaspect.entity.Products" language="java"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/custom.css"/>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<style>
		.custom-hr{
			border-bottom: 1.4px solid #4fbfa8;
			width: 100px;
			margin:0
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
			
			<%
				Products prod = (Products)session.getAttribute("prod_description");
				if(prod!=null){
					String simg = "";
					String img1 = "default.png";
					String img2 = "default.png";
					String img3 = "default.png";
					String img4 = "default.png";
					String img5 = "default.png";
					if(prod.getProdImg5().length()>0){
						img5 = prod.getProdImg5();
						simg = prod.getProdImg5();
					}
					if(prod.getProdImg4().length()>0){
						img4 = prod.getProdImg4();
						simg = prod.getProdImg4();
					}
					if(prod.getProdImg3().length()>0){
						img3 = prod.getProdImg3();
						simg = prod.getProdImg3();
					}
					if(prod.getProdImg2().length()>0){
						img2 = prod.getProdImg2();
						simg = prod.getProdImg2();
					}
					if(prod.getProdImg1().length()>0){
						img1 = prod.getProdImg1();
						simg = prod.getProdImg1();
					}
			%> 
  			<div id = "breadcrumb1">
	  			<div class="container">
					<nav class="row align-items-center justify-content-between" aria-label="breadcrumb">
						<h2 style="padding-left:15px;" ><%=prod.getProdName() %></h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="Login.jsp">HOME</a></li>
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="#">ELECTRONICS</a></li>
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="Category.jsp">MOBILES</a></li>
	    					<li class="breadcrumb-item active" aria-current="page"><%=prod.getProdName() %></li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<section class = "container-fluid">
			<br>
			<div class="custom-caption"><%=prod.getProdDesc() %></div>
			<br>
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<img class="img-fluid" src="images/<%=simg%>"/>
					</div>
					<div class="col-md-6" align="center">
						<br>
						<br>
						<br>
						<br>
						<hr>
						<h5>Available Colors</h5>
						<select style="width:38%" class="custom-select">
						  <option selected value="Black">Black</option>
						  <option value="Blue">Blue</option>
						  <option value="Red">Red</option>
						</select>
						<br>
						<br>
						<h3 style="color:#444444">&#8377;<%=prod.getProdPrice() %></h3>
						<br>
						<div><a href="cart?prod_id=<%=prod.getProdId()%>" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Add To Cart</a> <button class="btn btn-primary"><i class="fas fa-heart"></i></button></div>
						<br>
						<hr>
						<br>
						<br>
						<div class="row">
							<div class="col border mr-2">
								<img class="img-fluid" alt="image1" src="images/<%=img1%>"/>
							</div>
							<div class="col border mr-2">
								<img class="img-fluid" alt="image2" src="images/<%=img2%>"/>
							</div>
							<div class="col border mr-2">
								<img class="img-fluid" alt="image3" src="images/<%=img3%>"/>
							</div>
							<div class="col border mr-2">
								<img class="img-fluid" alt="image4" src="images/<%=img4%>"/>
							</div>
							<div class="col border mr-2">
								<img class="img-fluid" alt="image5" src="images/<%=img5%>"/>
							</div>
						</div>
					</div>
				</div>
				<br>
				<hr>
			</div>
			<h4>
				Product Description
			</h4>
			<hr class="float-left custom-hr">
			<br>
			<h6><%=prod.getDescp1Title()%></h6>
			<p><%=prod.getDescp1Content()%></p>
			<h6><%=prod.getDescp2Title()%></h6>
			<p><%=prod.getDescp2Content()%></p>
			<h6><%=prod.getDescp3Title()%></h6>
			<p><%=prod.getDescp3Title()%></p>
			<h6><%=prod.getDescp4Title()%></h6>
			<p><%=prod.getDescp4Title()%></p>
			<hr>
			<h4>
				Specification
			</h4>
			<hr class="float-left custom-hr">
			<br>
			<h6>General</h6>
			<table class="table table-striped table-dark">
			  <thead>
			  </thead>
			  <tbody>
			    <tr class="d-flex">
			      <td class="col-3 border border-secondary">In the Box</td>
			      <td class="col-9 border border-secondary"><%=prod.getSpecitb()%></td>
			    </tr>
			    <tr class="d-flex">
			      <td class="col-3 border border-secondary">Model Name</td>
			      <td class="col-9 border border-secondary"><%=prod.getSpecmna()%></td>
			    </tr>
			    <tr class="d-flex">
			      <td class="col-3 border border-secondary">Color</td>
			      <td class="col-9 border border-secondary"><%=prod.getSpecColor()%></td>
			    </tr>
			  </tbody>
			</table>
			<br>
			<h6>Display Features</h6>
			<table class="table table-striped table-dark">
			  <thead>
			  </thead>
			  <tbody>
			    <tr class="d-flex">
			      <td class="col-3 border border-secondary">Resolution</td>
			      <td class="col-9 border border-secondary"><%=prod.getSpecResolution()%></td>
			    </tr>
			    <tr class="d-flex">
			      <td class="col-3 border border-secondary">Display Type</td>
			      <td class="col-9 border border-secondary"><%=prod.getSpecDType()%></td>
			    </tr>
			    <tr class="d-flex">
			      <td class="col-3 border border-secondary">Display Colors</td>
			      <td class="col-9 border border-secondary"><%=prod.getSpecDColors()%></td>
			    </tr>
			  </tbody>
			</table>
			<br>
			<hr>
			<h4>
				Ratings &amp; Reviews
			</h4>
			<hr class="float-left custom-hr">
			<br>
			<div class="row">
				<div class="col-md-3">
					<h4>4.3 &#9733;</h4>
					<p class="light-font">14,377 Ratings and 3437 reviews</p>
				</div>
				<div class="col-md-3">
					<div class="row align-items-center">
						<span class="col-md-2">5 &#9733; </span>
						<div class="progress col-md-7 p-0">
						  <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<span class="col-md"> 8,399</span>
					</div>
					<div class="row align-items-center">
						<span class="col-md-2">4 &#9733; </span>
						<div class="progress col-md-7 p-0">
						  <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<span class="col-md"> 3,594</span>
					</div>
					<div class="row align-items-center">
						<span class="col-md-2">3 &#9733; </span>
						<div class="progress col-md-7 p-0">
						  <div class="progress-bar bg-warning" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<span class="col-md"> 1,137</span>
					</div>
					<div class="row align-items-center">
						<span class="col-md-2">2 &#9733; </span>
						<div class="progress col-md-7 p-0">
						  <div class="progress-bar bg-danger" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<span class="col-md"> 378</span>
					</div>
					<div class="row align-items-center">
						<span class="col-md-2">1 &#9733; </span>
						<div class="progress col-md-7 p-0">
						  <div class="progress-bar bg-warning" role="progressbar" style="width: 18%" aria-valuenow="18" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<span class="col-md"> 869</span>
					</div>
				</div>
				<div class="col-md-2 offset-1">
					<button class="btn btn-primary">Rate This Product</button>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-10">
					<div class="card">
					  <div class="card-body">
					    <h6 class="card-title">Akshat Kumar</h6>
					    <div>&#9733;&#9733;&#9733;&#9733;&#9734;</div>
					    <p>September 7,2018</p>
					    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
					    <a href="#" class="btn btn-primary border-0 rounded-0 pl-6 pr-6" style="line-height:1.2">Go somewhere</a>
					    <a href="#" class="btn btn-primary border-0 rounded-0 pl-6 pr-6" style="line-height:1.2">Comment</a>
					    <a href="#" class="btn btn-primary border-0 rounded-0 pl-6 pr-6" style="line-height:1.2">Report Abuse</a>
					  </div>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-10">
					<div class="card">
					  <div class="card-body">
					    <h6 class="card-title">Chetan Sharma</h6>
					    <div>&#9733;&#9733;&#9733;&#9734;&#9734;</div>
					    <p>August 23,2018</p>
					    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
					    <a href="#" class="btn btn-primary border-0 rounded-0 pl-6 pr-6" style="line-height:1.2">Go somewhere</a>
					    <a href="#" class="btn btn-primary border-0 rounded-0 pl-6 pr-6" style="line-height:1.2">Comment</a>
					    <a href="#" class="btn btn-primary border-0 rounded-0 pl-6 pr-6" style="line-height:1.2">Report Abuse</a>
					  </div>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-10">
					<div class="card">
					  <div class="card-body">
					    <h6 class="card-title">Gaurav Kapoor</h6>
					    <div>&#9733;&#9733;&#9733;&#9733;&#9733;</div>
					    <p>August 14,2018</p>
					    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
					    <a href="#" class="btn btn-primary border-0 rounded-0 pl-6 pr-6" style="line-height:1.2">Go somewhere</a>
					    <a href="#" class="btn btn-primary border-0 rounded-0 pl-6 pr-6" style="line-height:1.2">Comment</a>
					    <a href="#" class="btn btn-primary border-0 rounded-0 pl-6 pr-6" style="line-height:1.2">Report Abuse</a>
					  </div>
					</div>
				</div>
			</div>
		</section>
		<br/>
		<%@ include file="footer.html" %>
		<% } %>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>