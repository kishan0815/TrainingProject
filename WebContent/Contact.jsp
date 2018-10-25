<%@ page import="com.techaspect.entity.Customer"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Contact</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/custom.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	</head>
	<body class = "">
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
						<h2 style="padding-left:15px;" >CONTACT</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color" href="index.jsp">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">CONTACT</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<br/>
		<section class = "container">
			<div class = "row">
				<section class = "col-md-8">
					<h4>WE ARE HERE TO HELP YOU</h4>
					<p>Are you curious about something? Do you have some kind of problem with our products?</p>
		<%
			if(session.getAttribute("contacted") != null && (Boolean)session.getAttribute("contacted") == true){
		%>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
					  Contacted Successfully, please wait for response.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
		<%	
				session.removeAttribute("contacted");
			} 
		%>	
		<%
			if(session.getAttribute("contacted") != null && (Boolean)session.getAttribute("contacted") == false){
		%>
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
					  Could not Contact, please try again.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
		<%	
				session.removeAttribute("contacted");
			} 
		%>			
					<br/>
					<h4>CONTACT FORM</h4>
					<form action="contact" method="post">
						<div class="row">
							<div class="col">
								<label>First Name</label>
	      						<input type="text" name="fname" class="form-control">
	   						</div>
	    					<div class="col">
	    						<label>Last Name</label>
	      						<input type="text" name="lname" class="form-control">
	    					</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Email</label>
	      						<input type="text" name="email" class="form-control">
	   						</div>
	    					<div class="col">
	    						<label>Subject</label>
	      						<input type="text" name="subject" class="form-control">
	    					</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Message</label>
								<textarea  name="message" class="form-control" ></textarea>
							</div>	
						</div>
						<br/>
						<div class="row justify-content-center">
							<button class="btn btn-primary" type="submit"><i class="fas fa-envelope"></i> Send Message</button>
						</div>
					</form>
				</section>
				<section class = "col-md-4">
					<div class="row">
						<div style="padding-right:0;padding-left:0" class="col-md-8">
							<h4>ADDRESS</h4>
							<p>TechAspect Solutions Pvt. Ltd.
							Plot No.38, N Heights, 3rd Floor
							Hitech City Phase 2, Madhapur
							Hyderabad, Telengana - 500081
							<b>India</b></p>
						</div>
					</div>
					<div class="row">
						<h4>CALL CENTER</h4>
						<p>This number is toll free if calling from Great Britain otherwise
						we advise you yo use the electronic form of communication.</p>
					</div>
					<div class="row">
						<h4>ELECTRONIC SUPPORT</h4>
						<p>Please feel free to write an email to us or to use our electronic ticketing system.</p>
						<ul>
							<li> info@techaspect.com</li>
							<li> Tech 360 - our ticketing platform support</li>
						</ul>
					</div>
				</section>
			</div>
		</section>
		<br/>
		<div id="map"></div>
		<%@ include file="footer.html" %>
		<div class="modal fade bd-signUp-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="container">
						<br>
						<h5 align="center">Register Here</h5>
						<hr>
						<form method="post" action="RegisterUser.jsp">
						<div class="form-group">
							<label >Name</label> 
							<input type="text" class="form-control" name = "name" placeholder="Enter name"> 
						</div>
						<div class="form-group">
							<label >Email address</label> 
							<input type="email" class="form-control" name = "email" placeholder="Enter email"> 
						</div>
						<div class="form-group">
							<label >Password</label> 
							<input type="password" class="form-control" name = "pwd" placeholder="Password">
						</div>
						<div class="row justify-content-center">
							<button type="submit" class="btn btn-primary"><i class="fas fa-user"></i> Register</button>						
						</div>
						<hr>
					</form>
					</div>
					
				</div>
			</div>
		</div>
		<div class="modal fade bd-signIn-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="container">
						<br>
						<h5 align="center">Login Here</h5>
						<hr>
						<form action="Login.jsp" method="post">
							<div class="form-group">
								<label >Email address</label> 
								<input type="email" required name="email" class="form-control" placeholder="Enter email"> 
							</div>
							<div class="form-group">
								<label >Password</label> 
								<input type="password" required name="password" class="form-control" placeholder="Password">
							</div>
							<div class="row justify-content-center">
								<button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> LOGIN</button>						
							</div>
							<hr>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	<script>
		// Initialize and add the map
		function initMap() {
			// The location of Uluru
			var loc = {
				lat : -25.344,
				lng : 131.036
			};
			// The map, centered at Uluru
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 4,
				center : loc
			});
			// The marker, positioned at Uluru
			var marker = new google.maps.Marker({
				position : loc,
				map : map
			});
		}
	</script>
      <script async defer
    	  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOtIslxtegpSxlgPLNYsNBiE_8_XPCNa0&callback=initMap">
      </script>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>