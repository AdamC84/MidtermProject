<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>City Sprouts - Connecting Urban Growers</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<style>
<%@ include file="css/style.css"%>
</style>

</head>
<body>
	<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand navbar-left" href="home.do"><img
			src="img/logo_trans.png" class="icon"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
					href="getStoreNames.do">Urban Farms</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> More... </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="home.do">Home</a> <a
							class="dropdown-item" href="login">Profile</a> <a
							class="dropdown-item" href="editProfile.do">Edit Profile</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="cart.do">Cart</a> <a
							class="dropdown-item" href="search.do">Search</a>
					</div></li>
			</ul>
			<form class="form-inline my-2 my-lg-0" action="search.do">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="keyword">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<div class="nav-item">
				<a class="nav-link tomato-text" href="logout.do">Logout</a>
			</div>
			<div class="nav-item">
				<div id="btn_height">
					<a class="nav-link" href="cart.do?id=${user.id }"> <span
						style="font-size: 12px; padding: 0px 0px 0px 0px"> <img
							style="padding: 0px 0px 10px 0px" id="btn_height"
							src="img/basket.png">
					</span></a>
				</div>
			</div>
			<div class="nav-item">
				<a class="nav-link" href="login"> <span
					style="font-size: 2em; position: relative"> <i
						class="fa fa-user-circle-o" id="btn_height"></i>
				</span></a>
			</div>
		</div>
	</nav>

	<div
		class="container-fluid text-left align-items-center justify-content-center">
		<div class="row">
			<div class="col-md-2 col-sm-1"></div>
			<div class="col-md-8 col-sm-10">
				<div id="panel-green">
					<br>
					<div id="white-text">
						<div class="text-center">
							<h2>Your Cart</h2>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-1"></div>
		</div>
	</div>
	<div
			class="container-fluid text-left align-items-center justify-content-center">
			<c:forEach var="p" items="${buyer.purchases}">
				<c:if test="${p.purchaseStatus.id == 5}">
					<c:forEach var="i" items="${p.inventory}">
						<div class="row">
							<div class="col-md-2 col-sm-1"></div>
							<div class="col-md-8 col-sm-10">
								<div id="panel-green">
									<div id="white-text">
										<div class="text-center">
											<div class="card">
												<div class="row">
													<div class="col-md-4 col-lg-4 col-sm-2 inner" style="">
														<div class="container" id="sResults">
															<img src="${i.item.imgUrl }" class="img-fluid" alt="">
														</div>
													</div>
													<div class="col">
														<div class="card-block px-2" style="color: black">
															<h5 class="card-title">${i.item.name}</h5>
															Price: ${i.item.price }<br> Unit ${i.item.unit.name }<br>
															<div style="font-size: 15px; padding: 0px 0px 10px 0px">
																Category: ${i.item.category.name } &nbsp;|&nbsp;
																Harvested: ${i.item.picked }<br> <a
																	href="getItemsFromStore.do?id=${i.item.seller.id }">${i.item.seller.storeName }</a>
															</div>
															<a href="itemDetails.do?id=${i.id }"
																class="btn btn-success float-right" role="button">Item
																Details</a>
															<a href="removeItem.do?id=${i.id }"
																class="btn btn-success float-right" role="button">Remove Item</a>
															<%-- <a href="addToCart.do?id=${i.item.id }" class="btn btn-success">Add to Cart</a> --%>
														</div>
													</div>
												</div>
												<div class="card-footer w-20"
													style="background-color: tomato"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-1"></div>
						</div>
					</c:forEach>
				</c:if>
			</c:forEach>
		</div>

		<div
			class="container-fluid text-left align-items-center justify-content-center">
			<div class="row">
				<div class="col-md-2 col-sm-1"></div>
				<div class="col-md-8 col-sm-10">
					<div id="panel-green">
						<div id="white-text">
							<div class="text-center">

								<form action="checkout.do">
									<c:if test="${not empty buyer.purchases }">
										<div class="text-center">
											Total ${total}<br> <input type="hidden" name="total"
												value="${total}">
										</div>
										<div style="padding: 0px 0px 10px 0px">
											<button type="submit" class="btn btn-success float-right">Checkout</button>
										</div>
									</c:if>
								</form>

							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2 col-sm-1"></div>
			</div>
		</div>



		<div
			class="container-fluid text-center align-items-center justify-content-center">
			<div class="row" style="padding: 0% 0% 3% 1.5%">
				<div class="col-md-2 col-sm-1"></div>
				<div class="col-md-8 col-sm-10">
					<hr>
					<div id="panel-green" style="padding: 0% 0% 3% 0%">
						<div id="white-text-lg">
							<h1>Find your Urban Farmer</h1>
							<h4>
								<small>Buy it local...</small>
							</h4>
							<h3>Denver Area</h3>
						</div>
						<div id="Container"
							style="padding-bottom: 56.25%; position: relative; display: block; width: 100%">
							<iframe width="100%" height="100%" frameborder="0"
								src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJzxcfI6qAa4cR1jaKJ_j0jhE&key=AIzaSyDAxjvHqQQNx3ZZLcUiMDuQB3uQwitKsKY"
								allowfullscreen=""
								style="position: absolute; top: 0; left: 0; padding: 10px">
							</iframe>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-1"></div>
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
					<a href="https://github.com/Randybeach" class="fa fa-github"></a> <a
						href="https://github.com/AdamC84" class="fa fa-github"></a> <a
						href="https://github.com/robrides" class="fa fa-github"></a><br>
					<a href="#" class="fa fa-facebook"></a> <a href="#"
						class="fa fa-twitter"></a> <a
						href="https://www.linkedin.com/in/roblounsbury"
						class="fa fa-linkedin"></a>
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