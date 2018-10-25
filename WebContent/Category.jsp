<%@ page import="com.techaspect.entity.Customer,com.techaspect.dao.ProductDao,com.techaspect.entity.Products" language="java"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Mobiles</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/custom.css"/>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
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
			ArrayList<Products> productList = (ArrayList<Products>)session.getAttribute("all_products");
			if(productList !=null){
		%>
  			<div id = "breadcrumb1">
	  			<div class="container">
					<nav class="row align-items-center justify-content-between" aria-label="breadcrumb">
						<h2 style="padding-left:15px;" >MOBILES</h2>
	  					<ol class="breadcrumb" style="background:none;margin-bottom:0;padding:2.5%;" >
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="Login.jsp">HOME</a></li>
	    					<li class="breadcrumb-item"><a class="breadcrumb-color " href="#">ELECTRONICS</a></li>
	    					<li class="breadcrumb-item active" aria-current="page">MOBILES</li>
	    				</ol>
					</nav>
				</div>
			</div>	
		</header>
		<section class = "container-fluid">
			<br>
			<h5>
				Exclusive Offers
			</h5>
			<div class="custom-hr"></div>
			<br>
			<div class="container">
				<div class="row">
					<div class="col-md">
						<img class="img-fluid" src="images/razor.jpg" />
					</div>
					<div class="col-md">
						<img class="img-fluid" src="images/razor.jpg" />
					</div>
					<div class="col-md">
						<img class="img-fluid" src="images/razor.jpg" />
					</div>
					<div class="col-md">
						<img class="img-fluid" src="images/razor.jpg" />
					</div>
				</div>
				<br>
				<br>
				<div class="row">
					<div class="col-md">
						<img class="img-fluid" src="images/razor.jpg" />
					</div>
					<div class="col-md">
						<img class="img-fluid" src="images/razor.jpg" />
					</div>
					<div class="col-md">
						<img class="img-fluid" src="images/razor.jpg" />
					</div>
					<div class="col-md">
						<img class="img-fluid" src="images/razor.jpg" />
					</div>
				</div>
			</div>
			<br>
			<h5>
				Most Viewed
			</h5>
			<div class="custom-hr"></div>
			<br>
			<div id="carouselExampleControls" class="carousel slide" style="line-height:1.2" data-ride="carousel">
			  <div class="carousel-inner">
			  	<div class="carousel-item container-fluid">
			    	<div class="row">
			    		<div class="card col-md text-center pl-2 pr-2 ml-3 mr-2">
						  <img class="card-img-top img-fluid" src="images/razer2.jpg" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <p style="color:#aaaaaa">Now &#8377;8,990</p>
						  </div>
						</div>
						<div class="card col-md text-center pl-2 pr-2 ml-2 mr-2" >
						  <img class="card-img-top" src="images/razer2.jpg" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <p style="color:#aaaaaa">Now &#8377;8,990</p>
						  </div>
						</div>
						<div class="card col-md text-center pl-2 pr-2 ml-2 mr-2">
						  <img class="card-img-top" src="images/razer2.jpg" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <p style="color:#aaaaaa">Now &#8377;8,990</p>
						  </div>
						</div>
						<div class="card col-md text-center pl-2 pr-2 ml-2 mr-2">
						  <img class="card-img-top" src="images/razer2.jpg" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <p style="color:#aaaaaa">Now &#8377;8,990</p>
						  </div>
						</div>
						<div class="card col-md text-center pl-2 pr-2 ml-2 mr-2">
						  <img class="card-img-top" src="images/razer2.jpg" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <p style="color:#aaaaaa">Now &#8377;8,990</p>
						  </div>
						</div>
						<div class="card col-md text-center pl-2 pr-2 ml-2 mr-3">
						  <img class="card-img-top" src="images/razer2.jpg" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <p style="color:#aaaaaa">Now &#8377;8,990</p>
						  </div>
						</div>
			    	</div>
			    </div>
			    <div class="carousel-item active container-fluid">
			    	<div class="row">
			    		<% 
			    			for(Products p : productList){
			    				String img = "";
			    				int count = 0;
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
			    		<div class="card col-md text-center pl-2 pr-2 ml-3 mr-2">
						  <img class="card-img-top" src="images/<%=img %>" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title"><%= p.getProdName() %></h5>
						    <p class="card-text"><%= p.getProdDesc() %></p>
						    <p style="color:#aaaaaa">Now &#8377;<%= p.getProdPrice() %></p>
						  </div>
						</div>
						<%
			    				}
						%>
			    	</div>
			    </div>
			    
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"><i class="fas fa-chevron-circle-left"></i></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"><i class="fas fa-chevron-circle-right"></i></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
			<br>
			<div class="row">
				<div class="col-md-3">
					<h5>
						Refine By
					</h5>
					<div class="custom-hr"></div>
					<br>
					<div id="accordion">
					  <div class="card">
					    <div class="card-header" id="headingOne">
					      <h5 class="mb-0">
					        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					          Brand
					        </button>
					      </h5>
					    </div>
					
					    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
					      <div class="card-body">
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>Samsung</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>Samsung</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>Samsung</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>Samsung</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>Samsung</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>Samsung</label>
					      	<br>
					      </div>
					    </div>
					  </div>
					  <div class="card">
					    <div class="card-header" id="headingTwo">
					      <h5 class="mb-0">
					        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					          Price
					        </button>
					      </h5>
					    </div>
					    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
					      <div class="card-body">
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>Under &#8377;1000</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>&#8377;1000 - &#8377;5000</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>&#8377;5000 - &#8377;10000</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>&#8377;15000 - &#8377;20000</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>Above &#8377;20000</label>
					      	<br>
					      </div>
					    </div>
					  </div>
					  <div class="card">
					    <div class="card-header" id="headingThree">
					      <h5 class="mb-0">
					        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					          Customer Rating
					        </button>
					      </h5>
					    </div>
					    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
					      <div class="card-body">
						  	<input type="checkbox" name = "Samsung"/>
					      	<label>&#9733;&#9733;&#9733;&#9733;&#9734; &amp; Up</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>&#9733;&#9733;&#9733;&#9734;&#9734; &amp; Up</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>&#9733;&#9733;&#9734;&#9734;&#9734; &amp; Up</label>
					      	<br>
					      	<input type="checkbox" name = "Samsung"/>
					      	<label>&#9733;&#9734;&#9734;&#9734;&#9734; &amp; Up</label>
					      	<br>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				<div class="offset-md-1 col-md-8">
					<h5>
						Explore All Mobiles
					</h5>
					<div class="custom-hr"></div>
					<div id="page1">
						<div class="row">
					<% 
			    			for(Products p : productList){
			    				String img = "";
			    				int count = 0;
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
							<div class="card col-md-4 text-center border-0" >
							  <img class="card-img-top" style="height:23em" src="images/<%= img %>" alt="Card image cap">
							  <div class="card-body">
							    <h5 class="card-title"><%= p.getProdName() %></h5>
							    <p>&#8377;<%= p.getProdPrice() %></p>
							    <a href="description?prod_id=<%=p.getProdId()%>" class="btn btn-primary">See More</a>
							    <hr>
							  </div>
							</div>
					<%
			    			}
						}
					%>
						</div>
					</div>
					
					<nav class="row justify-content-center" aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					        <span class="sr-only">Previous</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#page1">1</a></li>
					    <li class="page-item"><a class="page-link" href="#page2">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">4</a></li>
					    <li class="page-item"><a class="page-link" href="#">5</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					        <span class="sr-only">Next</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
			</div>
		</section>
		<br/>
		<%@ include file="footer.html" %>
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>