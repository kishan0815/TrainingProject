<%@ page import="java.sql.*,com.techaspect.entity.Customer" language="java"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>My Account</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/custom.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
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
						<h2 style="padding-left:15px;" >MY ACCOUNT</h2>
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
					<p>Change your personal details or your passwords here.</p>
					<p class="custom-font-size">Pellentesque habitant morbi tritisque senetus et netus et malesuada fames 
							ac turpis egestas</p>
					<hr>
					<h5>CHANGE PASSWORD</h5>
		<%
			if(session.getAttribute("pwd_status") != null && (Boolean)session.getAttribute("pwd_status") == true){
		%>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
					  Password Changed Successfully.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
		<%	
				session.removeAttribute("pwd_status");
			} else if(session.getAttribute("pwd_status") != null && (Boolean)session.getAttribute("pwd_status") == false){
		%>
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
					  Could not change password.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
		<%		} %>
					<form action = "changepwd" method="post">
						<div class="row">
							<div class="col-md-6">
								<label class="custom-font-size">Old password</label>
	      						<input type="password" name="opwd" class="form-control">
	   						</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="custom-font-size">New password</label>
	      						<input type="password" name="npwd" class="form-control">
	   						</div>
	   						<div class="col-md-6">
								<label class="custom-font-size">Retype password</label>
	      						<input type="password" name="rnpwd" class="form-control">
	   						</div>
						</div>
						<br/>
						<div class="row justify-content-center">
							<button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> SAVE NEW PASSWORD</button>
						</div>
					</form>	
					<hr>
					<h5>PERSONAL DETAILS</h5>
		
		<%
			if(session.getAttribute("address_status") != null && (Boolean)session.getAttribute("address_status") == true){
		%>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
					  Updated Successfully.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
		<%	
				session.removeAttribute("address_status");
			} 
		%>
					<form action = "addaddress" method="post">
						<div class="row">
							<div class="col-md-6">
								<label class="custom-font-size">First Name</label>
	      						<input type="text" name="fname" value= "<%= fname %>" class="form-control">
	   						</div>
	   						<div class="col-md-6">
								<label class="custom-font-size">Last Name</label>
	      						<input type="text" name="lname" value= "<%= lname %>" class="form-control">
	   						</div>
						</div>
						<br/>
						<div class="row">	
							<div class="col-md-12">
								<label class="custom-font-size">Gender</label>
								<div class="form-check">
								<%if(cust.getcustGender()!= null && cust.getcustGender().equals("Male")){ %>
									<input class="form-check-input" type="radio" name="radioGender" value="Male" checked>
								<%} else { %>	
							  		<input class="form-check-input" type="radio" name="radioGender" value="Male">
							  	<% } %>
							  		<label class="form-check-label" for="exampleRadios1">
							    		Male
							  		</label>
								</div>
								<div class="form-check">
								<% if(cust.getcustGender()!= null && cust.getcustGender().equals("Female")){ %>
							  		<input class="form-check-input" type="radio" name="radioGender" value="Female" checked>
							  	<%} else { %>
							  		<input class="form-check-input" type="radio" name="radioGender" value="Female">
							  	<% } %>
							  		<label class="form-check-label" for="exampleRadios2">
							    		Female
							  		</label>
								</div>
								<div class="form-check">
								<% if(cust.getcustGender()!= null && cust.getcustGender().equals("Transgender")){ %>
							  		<input class="form-check-input" type="radio" name="radioGender" value="Transgender" checked>
							  	<%} else { %>
							  		<input class="form-check-input" type="radio" name="radioGender" value="Transgender">
							  	<% } %>
							  		<label class="form-check-label" for="exampleRadios2">
							    		Transgender
							  		</label>
								</div>
							</div>
						</div>
						<br/>
						<div class="row">
							<div class="col">
								<label class="custom-font-size">Address</label>
								<% if(cust.getAddress().length() > 0){ %>
								<textarea  name="address" class="form-control" ><%= cust.getAddress() %></textarea>
								<%} else { %>
								<textarea  name="address" class="form-control" ></textarea>
								<%} %>
							</div>	
						</div>
						<br/>
						<div class="row">
							<div class="col-md-3">
								<label class="custom-font-size">City</label>
								<% if(cust.getCity().length() > 0){ %>
	      						<input type="text" name="city" value= "<%= cust.getCity() %>" class="form-control">
	      						<%} else { %>
	      						<input type="text" name="city" class="form-control">
	      						<%} %>
	   						</div>
	   						<div class="col-md-3">
								<label class="custom-font-size">ZIP</label>
								<% if(cust.getZip().length() > 0){ %>
	      						<input type="text" name="zip" value = "<%= cust.getZip() %>" class="form-control">
	      						<%} else { %>
	      						<input type="text" name="zip" class="form-control">
	      						<%} %>
	   						</div>
	   						<div class="col-md-3">
								<label class="custom-font-size">State</label>
	      						<select id="inputState" name="state" class="form-control">
	      							<%
	      								if(cust.getState().length() > 0){
	      							%>
	      							<option selected><%= cust.getState() %></option>
	      							<% } else{ %>
						        	<option selected>Select</option>
						        	<option>Andhra Pradesh</option>
						        	<% } %>
						      	</select>
	   						</div>
	   						<div class="col-md-3">
								<label class="custom-font-size">Country</label>
	      						<select id="inputCountry" name="country" class="form-control">
	      						<%
	      								if(cust.getCountry().length() > 0){
	      						%>
	      							<option selected><%= cust.getCountry() %></option>
	      							<% } else{ %>
						        	<option selected>Select</option>
						        	<option>India</option>
						        	<% } %>
						      	</select>
	   						</div>
						</div>
						<br/>
						<div class="row">
							<div class="col-md-6">
								<label class="custom-font-size">Contact Number</label>
	      						<input type="text" name="contact" value = "<%= cust.getcustContact() %>" class="form-control">
	   						</div>
	   						<div class="col-md-6">
								<label class="custom-font-size">Email</label>
	      						<input type="text" name="email" disabled value=<%= cust.getcustEmail() %> class="form-control">
	   						</div>
						</div>
						<br/>
						<div class="row justify-content-center">
							<button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> SAVE CHANGES</button>
						</div>
						<br/>
					</form>		
				</section>
				<section class = "col-md-3">
					<h5><b>CUSTOMER SECTION</b></h5>
					<div class="list-group">
  						<a href="CustomerOrders.jsp" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-list-ul"></i> My Orders</a>
  						<a href="CustomerWishList.jsp" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-heart"></i> My wishlist</a>
					  	<a href="CustomerAccount.jsp" style="border:none"  class="list-group-item list-group-item-action active"><i class="fas fa-user"></i> My account</a>
					  	<a href="#" style="border:none"  class="list-group-item list-group-item-action"><i class="fas fa-sign-out-alt"></i> Logout</a>
					</div>
				</section>
			</div>
		</section>
		<br/>
		<%	
			}
				}
		%>
		<%@ include file="footer.html" %>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>