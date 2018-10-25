<%@ page import="java.sql.*,com.techaspect.entity.Customer,com.techaspect.entity.Products,com.techaspect.dao.ProductDao" language="java" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SignIn Sign up Forms</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" href="css/custom.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	</head>
	<body>
		<%
			ProductDao pdao = ProductDao.getInstance();
			session.setAttribute("all_products", (ArrayList<Products>)pdao.selectAllProducts());
			Cookie cookie[] = request.getCookies();
			int count = 0;
			if(cookie != null){
				for(Cookie c : cookie ){
					if(c.getName().equals("access_token")){
						session.setAttribute("access_token", c.getValue());
						count++;
					}
					if(c.getName().equals("cust_id")){
						Customer cust = new Customer();
						cust.setcustId(Integer.parseInt(c.getValue()));
						session.setAttribute("customer",cust);
						count++;
					}
				}
				if(count == 2){
					response.sendRedirect("login");
				}
			}
		%>
		<header >
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
			<%@ include file="header.html" %>
  			<div id = "breadcrumb1">
	  			<div class="container">
					<nav class="row align-items-center justify-content-between" aria-label="breadcrumb">
						<h2 style="padding-left:15px;" >NEW ACCOUNT/SIGN IN</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="#">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">NEW ACCOUNT/SIGN IN</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<section class = "container">
		
		<%
			if(session.getAttribute("logout_status") != null && (Boolean)session.getAttribute("logout_status") == true){
		%>
					<br>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
					  Log Out Successful, please login to continue shopping with us.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
					<br>
		<%	
				session.removeAttribute("logout_status");
			} 
		%>
		
			<div class = "row">
				<section class = "col-md-6">
					<hr>
					<h4>NEW ACCOUNT</h4>
					<p>With registration with us new fashion,fantastic discounts.......</p>
		<%
			if(session.getAttribute("regStatus") != null && (Boolean)session.getAttribute("regStatus") == true){
		%>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
					  Registered Successfully, please login.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
		<%	
				session.removeAttribute("regStatus");
			} 
		%>
					<form method="post" action="register">
						<div class="form-group">
							<label >Name</label> 
							<span id = "nameAlert" class="alert alert-danger">
						  	</span>
							<input type="text" id="name" oninput="validateName(this.id,'nameAlert')" onblur="validateName(this.id,'nameAlert')" onkeypress="validateName(this.id,'nameAlert')" class="form-control" name = "name" placeholder="Enter name"> 
						</div>
						<div class="form-group">
							<label >Email address</label> 
							<span  id = "emailAlert" class="alert alert-danger">
						  	</span>
							<input type="email" id="email" oninput="validateEmail(this.id,'emailAlert',0)" onblur="validateEmail(this.id,'emailAlert',0)" onkeypress="validateEmail(this.id,'emailAlert',0)" class="form-control" name = "email" placeholder="Enter email"> 
						</div>
						<div class="form-group">
							<label >Password</label> 
							<span id = "passwordAlert" class="alert alert-danger">
						  	</span>
							<input type="password" id="password" oninput="validatePassword(this.id,'passwordAlert',0)" onblur="validatePassword(this.id,'passwordAlert',0)" onkeypress="validatePassword(this.id,'passwordAlert',0)" class="form-control" name = "pwd" placeholder="Password">
						</div>
						<div class="row justify-content-center">
							<button type="submit" id="regButton" class="btn btn-primary"><i class="fas fa-user"></i> Register</button>						
						</div>
						<hr>
					</form>
				</section>
				<section class = "col-md-6">
					<hr>
					<h4>LOGIN</h4>
					<p>Get access to your orders, wishlist and recommendations</p>
		<%
			if(session.getAttribute("is_logged_in") != null && (Boolean)session.getAttribute("is_logged_in") == false){
		%>
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
					  Invalid Credentials! Please try again.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
		<%	
				session.removeAttribute("is_logged_in");
			} 
		%>
					<form action="login" method="post">
						<div class="form-group">
							<label >Email address</label> 
							<span  id = "lemailAlert" class="alert alert-danger"></span>
							<input type="email" id="lemail" oninput="validateEmail(this.id,'lemailAlert',1)" onblur="validateEmail(this.id,'lemailAlert',1)" onkeypress="validateEmail(this.id,'lemailAlert',1)" name="email" class="form-control" placeholder="Enter email"> 
						</div>
						<div class="form-group">
							<label >Password</label> 
							<span id = "lpasswordAlert" class="alert alert-danger">
						  	</span>
							<input type="password" id="lpwd" oninput="validatePassword(this.id,'lpasswordAlert',1)" onblur="validatePassword(this.id,'lpasswordAlert',1)" onkeypress="validatePassword(this.id,'lpasswordAlert',1)" name="password" class="form-control" placeholder="Password">
						</div>
						<div class="custom-control custom-checkbox my-1 mr-sm-2">
						    <input type="checkbox" class="custom-control-input" name="rem_check" id="customControlInline">
						    <label class="custom-control-label" for="customControlInline">Remember me</label>
					  	</div>
						<div class="row justify-content-center">
							<button type="submit" id="loginButton" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> LOGIN</button>						
						</div>
						<hr>
					</form>
				</section>
			</div>
		</section>
		<br/>
		<%@ include file="footer.html" %>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/custom.js"></script>
	</body>
</html>