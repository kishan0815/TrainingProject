<%@ page language="java" import="java.sql.*,com.techaspect.entity.Products,com.techaspect.entity.Vendor"%>
<%@ page import="java.util.ArrayList, java.util.Iterator" %><!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Edit Product</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="css/custom.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	</head>
	<body>
		<%
			Vendor ven = (Vendor)session.getAttribute("vendor");
			if(ven != null){
				String fname = ven.getVenFname();
				String lname = ven.getVenLname();
			
		%>	
		<header>
			<nav class="navbar navbar-expand-lg" style = "background-color:#333333;color:#FFFFFF;padding:0.1%">
				<div class="container">
					<div class = "navbar-collapse">
						<ul class="navbar-nav mr-auto">
		      				<li class="custom-font-size nav-item">Contact Us on +91 40 66217777</li>
		       			</ul>
					    <ul class="navbar-nav">
	
					      <li class="custom-font-size custom1 nav-link nav-item">Welcome <%= fname %> <%= lname %></li>	
						  <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="LogoutVendor.jsp"><i class="fas fa-sign-out-alt"></i>  LOG OUT</a></li>
					      <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-facebook-f"></i></a></li>
					      <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-google-plus-g"></i></a></li>
					      <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fab fa-twitter"></i></a></li>
					      <li class="nav-item custom-font-size"><a class="custom1 nav-link" href="#"><i class="fas fa-envelope"></i></a></li>
					    </ul>
				    </div>
				</div>
			</nav>
			<nav class="navbar navbar-expand-lg">
				<div class = "container">
					<div class= "navbar-collapse">
						<ul class = "navbar-nav mr-auto ">
							<li class="nav-item"><img src = "images/logo.png"/></li>
						</ul>
						
			    		<ul class="navbar-nav">
							<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Electronics</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
					        		<a class="dropdown-item" href="#">Mobiles</a>
					        	</div>
					    	</li>
					    	<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Men</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
					        		<a class="dropdown-item" href="#">Shirts</a>
					        	</div>
					    	</li>
					    	<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Women</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
					        		<a class="dropdown-item" href="#">Saree</a>
					        	</div>
					    	</li>
					    	<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Baby & Kids</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
					        		<a class="dropdown-item" href="#">Dress</a>
					        	</div>
					    	</li>
					    	<li class="nav-item dropdown">
					        	<a class="custom-color nav-link dropdown-toggle" href="#" id="navbarDropdown5" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home & Furniture</a>
					        	<div class="dropdown-menu" aria-labelledby="navbarDropdown5">
					        		<a class="dropdown-item" href="#">Tables</a>
					        	</div>
					    	</li>
						</ul>
					</div>
				</div>
  			</nav>
  			<div id = "breadcrumb1">
	  			<div class="container">
					<nav class="row align-items-center justify-content-between" aria-label="breadcrumb">
						<h2 style="padding-left:15px;" >EDIT PRODUCT</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="VendorHomePage.jsp">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">EDIT PRODUCT</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<sector>
			<br>
			<div>
				<br>
				<div class="row">
		<%
							String pid = request.getParameter("pid");
							int prod_id = Integer.parseInt(pid);
							ArrayList<Products> productList = (ArrayList)session.getAttribute("productList"); 
							Iterator<Products> iter = productList.iterator();
							while(iter.hasNext()){
								Products prod = iter.next();
								if(prod.getProdId() == prod_id){
									String name = prod.getProdName();
									String price = prod.getProdPrice();
									String quantity = prod.getProdQuantity();
									String desc = prod.getProdDesc();
									String img1 = prod.getProdImg1();
									if(img1.length()==0) {
										img1 = "logo.png";
									}
									String img2 = prod.getProdImg2();
									if(img2.length()==0) {
										img2 = "logo.png";
									}
									String img3 = prod.getProdImg3();
									if(img3.length()==0) {
										img3 = "logo.png";
									}
									String img4 = prod.getProdImg4();
									if(img4.length()==0) {
										img4 = "logo.png";
									}
									String img5 = prod.getProdImg5();
									if(img5.length()==0) {
										img5 = "logo.png";
									}
		%>
					<form action="updateProduct" method="post" enctype="multipart/form-data" class="col-md-8 offset-md-2">
						<h4 align="center">EDIT PRODUCT HERE</h4>
						<br>
						<h4>GENERAL INFORMATION</h4>
						<div class="custom-hr"></div>
						<br>
						<input type="hidden" name="pid" value="<%= pid %>"/>
						<div class="row">
							<div class="form-group col-md">
								<label class="custom-font-size">Name</label> 
								<input required type="text" class="form-control" value="<%= name %>" name="pname"/>
							</div> 
							<div class="form-group col-md">
								<label class="custom-font-size">Price</label> 
								<input required type="number" value="<%= price %>" class="form-control" name="price"/>
							</div>
							<div class="form-group col-md">
								<label class="custom-font-size">Short Description</label>
								<textarea required class="form-control" name="pdescription" rows="2"><%= desc %></textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md">
								<label class="custom-font-size">Quantity</label> 
								<select	required class="form-control" name="pquantity">
									<option selected>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>
							</div>
							<div class="form-group col-md">
								<label class="custom-font-size">Image 1</label>
								<p><img src="images/<%= img1 %>" class="img-fluid" style="max-width:150px;"/></p>
								<input type="file" class="form-control-file" name="img1" />
							</div> 
							<div class="form-group col-md">
								<label class="custom-font-size">Image 2</label>
								<p><img src="images/<%= img2 %>" class="img-fluid" style="max-width:150px;"/></p>
								<input type="file" class="form-control-file" name="img2" />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md">
								<label class="custom-font-size">Image 3</label>
								<p><img src="images/<%= img3 %>" class="img-fluid" style="max-width:150px;"/></p>
								<input type="file" class="form-control-file" name="img3" />
							</div>
							<div class="form-group col-md">
								<label class="custom-font-size">Image 4</label>
								<p><img src="images/<%= img4 %>" class="img-fluid" style="max-width:150px;"/></p>
								<input type="file" class="form-control-file" name="img4" />
							</div>
							<div class="form-group col-md">
								<label class="custom-font-size">Image 5</label>
								<p><img src="images/<%= img5 %>" class="img-fluid" style="max-width:150px;"/></p>
								<input type="file" class="form-control-file" name="img5" />
							</div>
						</div>
					<br>
					<br>
					<h4>PRODUCT DESCRIPTION</h4>
					<div class="custom-hr"></div>
					<br>	
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 1 Title</label> 
							<input type="text" class="form-control" value="<%= prod.getDescp1Title() %>" name="dtitle1"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 1 Content</label>
							<textarea class="form-control" name="dcontent1" rows="2"><%= prod.getDescp1Content() %></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 2 Title</label> 
							<input type="text" class="form-control" value="<%= prod.getDescp2Title() %>" name="dtitle2"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 2 Content</label>
							<textarea class="form-control" name="dcontent2" rows="2"><%= prod.getDescp2Content() %></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 3 Title</label> 
							<input type="text" class="form-control" value="<%= prod.getDescp3Title() %>" name="dtitle3"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 3 Content</label>
							<textarea class="form-control" name="dcontent3" rows="2"><%=prod.getDescp3Content()%></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 4 Title</label> 
							<input type="text" class="form-control" value="<%= prod.getDescp4Title() %>" name="dtitle4"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 4 Content</label>
							<textarea class="form-control" name="dcontent4" rows="2"><%= prod.getDescp4Content() %></textarea>
						</div>
					</div>
					<!-- <div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 5 Title</label> 
							<input type="text" class="form-control" name="dtitle5"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 5 Content</label>
							<textarea class="form-control" name="dcontent5" rows="2"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 6 Title</label> 
							<input type="text" class="form-control" name="dtitle6"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 6 Content</label>
							<textarea class="form-control" name="dcontent6" rows="2"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 7 Title</label> 
							<input type="text" class="form-control" name="dtitle7"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 7 Content</label>
							<textarea class="form-control" name="dcontent7" rows="2"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 8 Title</label> 
							<input type="text" class="form-control" name="dtitle8"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 8 Content</label>
							<textarea class="form-control" name="dcontent8" rows="2"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 9 Title</label> 
							<input type="text" class="form-control" name="dtitle9"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 9 Content</label>
							<textarea class="form-control" name="dcontent9" rows="2"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 10 Title</label> 
							<input type="text" class="form-control" name="dtitle10"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 10 Content</label>
							<textarea class="form-control" name="dcontent10" rows="2"></textarea>
						</div>
					</div> -->
					<br>
					<h4>PRODUCT SPECIFICATION</h4>
					<div class="custom-hr"></div>
					<br>
					<h6>GENERAL</h6>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">In the Box</label> 
							<input type="text" class="form-control" value="<%= prod.getSpecitb() %>" name="itb"/>
						</div>
						<!-- <div class="form-group col-md">
							<label class="custom-font-size">Model Number</label> 
							<input type="text" class="form-control" name="mn"/>
						</div> -->
					</div>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Model Name</label> 
							<input type="text" class="form-control" value="<%= prod.getSpecmna() %>" name="mna"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Color</label> 
							<input type="text" class="form-control" value="<%= prod.getSpecColor() %>" name="color"/>
						</div>
					</div>
					<!-- <div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Browser Type</label> 
							<input type="text" class="form-control" name="brtype"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">SIM Type</label> 
							<input type="text" class="form-control" name="stype"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Touch Screen</label> 
							<input type="text" class="form-control" name="tscreen"/>
						</div>
					</div> -->
					<br>
					<h6>DISPLAY FEATURES</h6>
					<div class="row">
						<!-- <div class="form-group col-md">
							<label class="custom-font-size">Display Size</label> 
							<input type="text" class="form-control" name="dsize"/>
						</div> -->
						<div class="form-group col-md">
							<label class="custom-font-size">Resolution</label> 
							<input type="text" class="form-control" value="<%= prod.getSpecResolution() %>" name="resolution"/>
						</div>
					</div>
					<div class="row">
						<!-- <div class="form-group col-md">
							<label class="custom-font-size">Resolution Type</label> 
							<input type="text" class="form-control" name="rtype"/>
						</div> -->
						<div class="form-group col-md">
							<label class="custom-font-size">Display Type</label> 
							<input type="text" class="form-control" value="<%= prod.getSpecDType() %>" name="dtype"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Display Colors</label> 
							<input type="text" class="form-control" value="<%= prod.getSpecDColors() %>" name="dcolors"/>
						</div>
					</div>	
					<br>
					<!-- <h6>OS &amp; PROCESSOR FEATURES</h6>
					<div class="row">
						<div class="form-group col-md-4">
							<label class="custom-font-size">Operating System</label> 
							<input type="text" class="form-control" name="os"/>
						</div>
						<div class="form-group col-md-4">
							<label class="custom-font-size">Processor Type</label> 
							<input type="text" class="form-control" name="ptype"/>
						</div>
						<div class="form-group col-md-4">
							<label class="custom-font-size">Processor Core</label> 
							<input type="text" class="form-control" name="pcore"/>
						</div>
					</div>	
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Primary Clock Speed</label> 
							<input type="text" class="form-control" name="pclock"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Secondary Clock Speed</label> 
							<input type="text" class="form-control" name="sclock"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Operating Frequency</label>
							<textarea class="form-control" name="ofrequency" rows="2"></textarea>
						</div>
					</div>		
					<br>	
					<h6>MEMORY &amp; STORAGE FEATURES</h6>	
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Internal Storage</label> 
							<input type="text" class="form-control" name="istorage"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">RAM</label> 
							<input type="text" class="form-control" name="ram"/>
						</div>
					</div>	
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Expendable Storage</label> 
							<input type="text" class="form-control" name="estorage"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Supported Memory Card Type</label> 
							<input type="text" class="form-control" name="supMem"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Call Log Memory</label> 
							<input type="text" class="form-control" name="clmemory"/>
						</div>
					</div>	
					<br>
					<h6>CAMERA FEATURES</h6>	
					<div class="row">
						<div class="form-group col-md-4">
							<label class="custom-font-size">Primary Camera Available</label> 
							<input type="text" class="form-control" name="pcamera"/>
						</div>
						<div class="form-group col-md-4">
							<label class="custom-font-size">Primary Camera</label> 
							<input type="text" class="form-control" name="pcam"/>
						</div>
						<div class="form-group col-md-4">
							<label class="custom-font-size">Primary Camera Features</label>
							<textarea class="form-control" name="pcamfeatures" rows="2"></textarea>
						</div>
					</div>	
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Secondary Camera Available</label> 
							<input type="text" class="form-control" name="scamera"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Secondary Camera</label> 
							<input type="text" class="form-control" name="scam"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Secondary Camera Features</label>
							<textarea class="form-control" name="scamfeatures" rows="2"></textarea>
						</div>
					</div>	
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Flash</label> 
							<input type="text" class="form-control" name="flash"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">HD Recording</label> 
							<input type="text" class="form-control" name="hdrec"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Full HD Recording</label> 
							<input type="text" class="form-control" name="fhdrec"/>
						</div>
					</div>	
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Video Recording</label> 
							<input type="text" class="form-control" name="vrec"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Video Recording Resolution</label> 
							<input type="text" class="form-control" name="vrecres"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Frame Rate</label> 
							<input type="text" class="form-control" name="frate"/>
						</div>
					</div>	
					<br>
					<h6>CALL FEATURES</h6>	
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Phone Book</label> 
							<input type="text" class="form-control" name="pbook"/>
						</div>
					</div>
					<br>
					<h6>CONNECTIVITY FEATURES</h6>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Network Type</label> 
							<input type="text" class="form-control" name="ntype"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Supported Networks</label> 
							<input type="text" class="form-control" name="supnetwork"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Internet Connectivity</label> 
							<input type="text" class="form-control" name="ic"/>
						</div>
					</div>	
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">3G</label> 
							<input type="text" class="form-control" name="3g"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">GPRS</label> 
							<input type="text" class="form-control" name="gprs"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Pre Installed Browser</label> 
							<input type="text" class="form-control" name="pib"/>
						</div>
					</div>	
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Bluetooth Support</label> 
							<input type="text" class="form-control" name="bsupp"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Bluetooth Version</label> 
							<input type="text" class="form-control" name="bver"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Wi-Fi</label> 
							<input type="text" class="form-control" name="wifi"/>
						</div>
					</div>	
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Wi-Fi Version</label> 
							<input type="text" class="form-control" name="wifiv"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">NFC</label> 
							<input type="text" class="form-control" name="nfc"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">USB Connectivity</label> 
							<input type="text" class="form-control" name="usb"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Audio Jack</label> 
							<input type="text" class="form-control" name="audioj"/>
						</div>
					</div>		
					<br>
					<h6>OTHER DETAILS</h6>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Smart Phone</label> 
							<input type="text" class="form-control" name="sphone"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Sim Size</label> 
							<input type="text" class="form-control" name="simsize"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Removable Battery</label> 
							<input type="text" class="form-control" name="rbattery"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">SMS</label> 
							<input type="text" class="form-control" name="sms"/>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Sensors</label>
							<textarea class="form-control" name="sensors" rows="2"></textarea>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Other Features</label>
							<textarea class="form-control" name="ofeatures" rows="2"></textarea>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Important Apps</label> 
							<input type="text" class="form-control" name="iapps"/>
						</div>
					</div>
					<br>
					<h6>MULTIMEDIA FEATURES</h6>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Audio Formats</label> 
							<input type="text" class="form-control" name="aformat"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Video Formats</label> 
							<input type="text" class="form-control" name="vformat"/>
						</div>
					</div>
					<br>
					<h6>BATTERY &amp; POWER FEATURES</h6>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Battery Capacity</label> 
							<input type="text" class="form-control" name="bcapacity"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Battery Type</label> 
							<input type="text" class="form-control" name="btype"/>
						</div>
					</div>
					<br>
					<h6>DIMENSIONS</h6>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Width</label> 
							<input type="text" class="form-control" name="width"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Height</label> 
							<input type="text" class="form-control" name="height"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Depth</label> 
							<input type="text" class="form-control" name="depth"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Weight</label> 
							<input type="text" class="form-control" name="weight"/>
						</div>
					</div>
					<br>
					<h6>WARRANTY</h6>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Warranty Summary</label>
							<textarea class="form-control" name="wsum" rows="2"></textarea>
						</div>
					</div> -->
					<br>
					<div class="row justify-content-center">
						<button type="submit" class="btn btn-primary">UPDATE</button>	
					</div>					
					<br>
					<hr>
					</form>
		
				</div>
			</div>
			<br>
		</sector>
		<%@ include file="footer.html" %>
		<%
								}
							}
				}
				else{
					response.sendRedirect("VendorLoginPage.jsp");
				}
				
		%>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>