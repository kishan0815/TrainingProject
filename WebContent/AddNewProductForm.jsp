<%@ page language="java" import="java.sql.*,com.techaspect.entity.Vendor"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Vendor Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="css/custom.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	</head>
	<body>
	<%
		Vendor ven = (Vendor)session.getAttribute("vendor");
		if(ven!=null){
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
			<%@ include file="header.html" %>
  			<div id = "breadcrumb1">
	  			<div class="container">
					<nav class="row align-items-center justify-content-between" aria-label="breadcrumb">
						<h2 style="padding-left:15px;" >ADD PRODUCT</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="VendorHomePage.jsp">HOME</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">ADD PRODUCT</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<section>
			<br>
			<div class="container">
				<br>
				<form action="insertProduct" method="post" enctype="multipart/form-data">
					<p>Add New Product To the Inventory</p>
					<hr>
					<h4>GENERAL INFORMATION</h4>
					<div class="custom-hr"></div>
					<br>
					<div class="row">
						<div class="form-group col-md-4">
							<label class="custom-font-size">Name</label> 
							<input required type="text" class="form-control" name="pname"/>
						</div>
						<div class="form-group col-md-4">
							<label class="custom-font-size">Price</label> 
							<input required type="number" class="form-control" name="price"/>
						</div>
						<div class="form-group col-md-4">
							<label class="custom-font-size">Short Description</label>
							<textarea required class="form-control" name="pdescription" rows="2"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Category</label> 
							<select	required class="form-control" name="category">
								<option selected>Electronics</option>
								<option>Men</option>
								<option>Women</option>
								<option>Baby &amp; Kids</option>
								<option>Home &amp; Furniture</option>
							</select>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Sub Category</label> 
							<select	required class="form-control" name="scategory">
								<option selected>Mobiles</option>
								<option>Health Care Appliances</option>
								<option>Computer Accessories</option>
								<option>Home Entertainment</option>
								<option>Mobile Accessories</option>
								<option>Laptops</option>
								<option>Gaming Accessories</option>
								<option>Home Entertainment</option>
							</select>
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
							<input type="file" class="form-control-file border" name="img1" />
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Image 2</label>
							<input type="file" class="form-control-file border" name="img2" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Image 3</label>
							<input type="file" class="form-control-file border" name="img3" />
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Image 4</label>
							<input type="file" class="form-control-file border" name="img4" />
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Image 5</label>
							<input type="file" class="form-control-file border" name="img5" />
						</div>
					</div>				
					<br>
					<hr>
					<br>
					<br>
					<h4>PRODUCT DESCRIPTION</h4>
					<div class="custom-hr"></div>
					<br>	
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 1 Title</label> 
							<input type="text" class="form-control" name="dtitle1"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 1 Content</label>
							<textarea class="form-control" name="dcontent1" rows="2"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 2 Title</label> 
							<input type="text" class="form-control" name="dtitle2"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 2 Content</label>
							<textarea class="form-control" name="dcontent2" rows="2"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 3 Title</label> 
							<input type="text" class="form-control" name="dtitle3"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 3 Content</label>
							<textarea class="form-control" name="dcontent3" rows="2"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 4 Title</label> 
							<input type="text" class="form-control" name="dtitle4"/>
						</div>
						<div class="form-group col-md-6">
							<label class="custom-font-size">Description 4 Content</label>
							<textarea class="form-control" name="dcontent4" rows="2"></textarea>
						</div>
					</div>
					<div class="row">
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
					</div>
					<br>
					<h4>PRODUCT SPECIFICATION</h4>
					<div class="custom-hr"></div>
					<br>
					<h6>GENERAL</h6>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">In the Box</label> 
							<input type="text" class="form-control" name="itb"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Model Number</label> 
							<input type="text" class="form-control" name="mn"/>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Model Name</label> 
							<input type="text" class="form-control" name="mna"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Color</label> 
							<input type="text" class="form-control" name="color"/>
						</div>
					</div>
					<div class="row">
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
					</div>
					<br>
					<h6>DISPLAY FEATURES</h6>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Display Size</label> 
							<input type="text" class="form-control" name="dsize"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Resolution</label> 
							<input type="text" class="form-control" name="resolution"/>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md">
							<label class="custom-font-size">Resolution Type</label> 
							<input type="text" class="form-control" name="rtype"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Display Type</label> 
							<input type="text" class="form-control" name="dtype"/>
						</div>
						<div class="form-group col-md">
							<label class="custom-font-size">Display Colors</label> 
							<input type="text" class="form-control" name="dcolors"/>
						</div>
					</div>	
					<br>
					<h6>OS &amp; PROCESSOR FEATURES</h6>
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
					</div>
					<br>
					<div class="row justify-content-center">
						<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i>  Save</button>	
					</div>	
				</form>
			</div>
			<br>
			<br>
		</section>
		<%@ include file="footer.html" %>
		<%
			}
			else{
				response.sendRedirect("VendorLoginPage.jsp");
			}
		%>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>