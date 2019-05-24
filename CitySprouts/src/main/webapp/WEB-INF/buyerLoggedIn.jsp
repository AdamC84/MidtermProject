<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<title>City Sprouts - Profile</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script>
$(document).ready(function() {
	    $('#Carousel').carousel({
	        interval: 2000
	    })
	});
	
}

</script>
	
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>

<style>
<%@include file="css/style.css" %>
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand navbar-left" href="home.do"><img src="img/logo_trans.png"
			class="icon"></a>
			
			
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent"  style="padding: 20px 0px 0px 0px">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="getStoreNames.do">Urban Farms</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> More... </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="home.do">Home</a> 
							<a class="dropdown-item" href="login">Profile</a> 
						 <a 	class="dropdown-item" href="editProfile.do">Edit Profile</a>
						<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="cart.do">Cart</a>
						<a class="dropdown-item" href="search.do">Search</a> 
					</div></li>
			</ul>
			<form class="form-inline my-2 my-lg-0" action="search.do">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="keyword">
				<button class="btn btn-outline-success" my-2 my-sm-0" type="submit">Search</button>
			</form>
			<div class="nav-item">
				<a class="nav-link pull-right" href="login"> <span  
					style="font-size: 2em; position:relative"> <i class="fa fa-user-circle-o" id="btn_height"></i>
				</span></a>
				</div>
			<div class="nav-item">
			<div id="btn_height" >				
				<a class="nav-link pull-right" href="cart.do?id=${user.id }"> 
				<span style="font-size: 12px; padding: 0px 0px 0px 0px"> <img style="padding: 0px 0px 10px 0px" id="btn_height" src="img/basket.png">
				</span></a>
				</div>
			</div>
			<div class="nav-item" id="btn_height" style="color: tomato"  >
			<a class="nav-link pull-right" href="logout.do">Logout</a>
		</div>
		</div>
		
	</nav>



	<div class="container-fluid text-left align-items-center justify-content-center" >
		<div class="row">
			<div class="col-md-2 col-sm-1"></div>
			<div class="col-md-8 col-sm-10" >
				<div id="panel-green">
					<div id="white-text">
					<div class="text-center">
							<h2>Fresh Picks...</h2>
                <div id="Carousel" class="carousel slide">
                 
                <ol class="carousel-indicators">
                    <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#Carousel" data-slide-to="1"></li>
                    <li data-target="#Carousel" data-slide-to="2"></li>
                </ol>
                 
                <!-- Carousel items -->
                <div class="carousel-inner">
                    
                <div class="item active">
                	<div class="row">
                	  <div class="col-md-3"><a href="itemDetails.do?id=${inventory[0].id }" class="thumbnail"><img src="${inventory[0].item.imgUrl } " alt="Image" style="max-width:100%;" style="max-height: 40px;"></a></div>
                	  <div class="col-md-3"><a href="itemDetails.do?id=${inventory[1].id }" class="thumbnail"><img src="${inventory[1].item.imgUrl } " alt="Image" style="max-width:100%;" style="max-height: 40px;"></a></div>
                	  <div class="col-md-3"><a href="itemDetails.do?id=${inventory[2].id }" class="thumbnail"><img src="${inventory[2].item.imgUrl } " alt="Image" style="max-width:100%;" style="max-height: 40px;"></a></div>
                	  <div class="col-md-3"><a href="itemDetails.do?id=${inventory[3].id }" class="thumbnail"><img src="${inventory[3].item.imgUrl } " alt="Image" style="max-width:100%;" style="max-height: 40px;"></a></div>
                	</div><!--.row-->
                </div><!--.item-->
                 
                <div class="item">
                	<div class="row">
                		<div class="col-md-3"><a href="itemDetails.do?id=${inventory[4].id }" class="thumbnail"><img src="${inventory[4].item.imgUrl } " alt="Image" style="max-width:100%;" style="object-fit:contain;"></a></div>
                		<div class="col-md-3"><a href="itemDetails.do?id=${inventory[5].id }" class="thumbnail"><img src="${inventory[5].item.imgUrl } " alt="Image" style="max-width:100%;" style="object-fit:contain;"></a></div>
                		<div class="col-md-3"><a href="itemDetails.do?id=${inventory[6].id }" class="thumbnail"><img src="${inventory[6].item.imgUrl } " alt="Image" style="max-width:100%;" style="object-fit:contain;"></a></div>
                		<div class="col-md-3"><a href="itemDetails.do?id=${inventory[7].id }" class="thumbnail"><img src="${inventory[7].item.imgUrl } " alt="Image" style="max-width:100%;" style="object-fit:contain;"></a></div>
                	</div><!--.row-->
                </div><!--.item-->
                 
                <div class="item">
                	<div class="row">
                		<div class="col-md-3"><a href="itemDetails.do?id=${inventory[8].id }" class="thumbnail"><img src="${inventory[8].item.imgUrl } " alt="Image" style="max-width:100%;" style="object-fit:contain;"></a></div>
                		<div class="col-md-3"><a href="itemDetails.do?id=${inventory[9].id }" class="thumbnail"><img src="${inventory[9].item.imgUrl } " alt="Image" style="max-width:100%;" style="object-fit:contain;"></a></div>
                		<div class="col-md-3"><a href="itemDetails.do?id=${inventory[10].id }" class="thumbnail"><img src="${inventory[10].item.imgUrl } " alt="Image" style="max-width:100%;" style="object-fit:contain;"></a></div>
                		<div class="col-md-3"><a href="itemDetails.do?id=${inventory[11].id }" class="thumbnail"><img src="${inventory[11].item.imgUrl } " alt="Image" style="max-width:100%;" style="object-fit:contain;"></a></div> 
                	</div><!--.row-->
                </div><!--.item-->
                 
                </div><!--.carousel-inner-->
                  <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
                  <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
                </div><!--.Carousel-->
                 
					</div>
				</div>
			</div>
			</div>
		<div class="col-md-2 col-sm-1"></div>
	</div>
</div>

	<div class="container-fluid text-left align-items-center justify-content-center">
		<div class="row">
			<div class="col-md-2 col-sm-1"></div>
			<div class="col-md-8 col-sm-10" >
				<div id="panel-green">
					<div id="white-text">
					<div class="text-center">
							<h2>Personal Info</h2>
					</div>
							Name: ${buyer.user.firstName }, ${buyer.user.lastName }<br>
							Username: ${buyer.user.username }<br>
							Password: ${buyer.user.password }<br>
							Last Login: ${buyer.user.lastLogin }<br>
							Role: ${buyer.user.role }<br>
							<hr>
							Street: ${buyer.user.address.streetAddress }<br>
							Street2: ${buyer.user.address.address2 }<br>
							City: ${buyer.user.address.city }<br>
							State: ${buyer.user.address.state }<br>
							Zip Code: ${buyer.user.address.zipcode }<br>
							<hr>
							<h4>Payment Methods</h4>
							Credit Card Number: ${buyer.creditCardNum }<br>
							Credit Card Exp Date: ${buyer.creditCardExpDate }<br>
							Credit Card CCV: ${buyer.creditCardCcv }<br>

					</div>
				</div>
			</div>
		<div class="col-md-2 col-sm-1"></div>
	</div>
</div>

	
		<div class="container-fluid text-left align-items-center justify-content-center">
		<div class="row">
			<div class="col-md-2 col-sm-1"></div>
			<div class="col-md-8 col-sm-10">
				<div id="panel-green"><br>
					<div id="white-text">
					<div class="text-center">
						<h2>Your Purchase History</h2>
					</div>
                    <c:forEach var="p" items="${buyer.purchases}">
                    <c:if test="${p.purchaseStatus.id == 4}">
                    <c:forEach var="i" items="${p.inventory}">
                <div id="panel-green">
                    <div id="white-text">
                    <div class="text-center">
                    <div class="card">
                        <div class="row">
                        <div class="col-md-4 col-lg-4 col-sm-2 inner" style="">
                        <div class="container" id="sResults">
                        <img src="${i.item.imgUrl }" class="img-fluid1" alt="">
                        </div>
                        </div>
                        <div class="col">
                        <div class="card-block px-2" style="color: black">
                        <h5 class="card-title">${i.item.name}</h5>
                                Price: $${i.item.price }<br>
                            Unit ${i.item.unit.name }<br>
                            <div style="font-size: 15px; padding: 0px 0px 10px 0px">
                            Category: ${i.item.category.name } &nbsp;|&nbsp; 
                            Harvested: ${i.item.picked }<br>
                            <a href="getItemsFromStore.do?id=${i.item.seller.id }">${i.item.seller.storeName }</a>
                            </div>
                        <a href="itemDetails.do?id=${i.id }" class="btn btn-info" role="button">Item Details</a>

                      <%--   <a href="addToCart.do?id=${i.item.id }" class="btn btn-success">Add to Cart</a> --%>
                    </div>
                </div>
                </div>
                 <div class="card-footer w-20" style="background-color: tomato">
                </div>
              </div>
                    </div>
                </div>
            </div>
    </c:forEach>
    </c:if>
              </c:forEach>
					</div>
				</div>
			</div>
		<div class="col-md-2 col-sm-1"></div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<div class="row">
			<div class="col-sm-4">
				<h3>Contact Us</h3>
				<br>
				<h6>7400 E Orchard, Denver, CO 80327</h6>
			</div>
			<div class="col-sm-4">
				<h3>Connect</h3>
				<a href="https://github.com/Randybeach" class="fa fa-github"></a>
				<a href="https://github.com/AdamC84" class="fa fa-github"></a>				
				<a href="https://github.com/robrides" class="fa fa-github"></a><br>
				<a href="#" class="fa fa-facebook"></a> <a href="#"
					class="fa fa-twitter"></a> 
					<a href="https://www.linkedin.com/in/roblounsbury" class="fa fa-linkedin"></a>
<!-- 				<a href="#" class="fa fa-youtube"></a>  -->			
			</div>
			<div class="col-sm-4">
				<img src="img/logo_rd.png" class="icon">
			</div>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>
</html>