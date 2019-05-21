<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>City Sprouts - Buy</title>
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
		<a class="navbar-brand navbar-left" href="home.do"></a> <img
			src="img/logo_trans.png" class="icon">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.do">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="getStoreNames.do">Urban Farms</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> More... </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="cart.do">Cart</a> <a
							class="dropdown-item" href="editProfile.do">Edit Profile</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="searchResults.do">Search
							Results</a> <a class="dropdown-item" href="buyerLearnMore.do">Buyer
							Learn More</a> <a class="dropdown-item" href="sellerLearnMore.do">Seller
							Learn More</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">Disabled</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0" action="search.do">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="keyword">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<div class="nav-item">
				<a class="nav-link tomato-text" href="registerPage.do">Sign up</a>
			</div>
			<div class="nav-item">
				<a class="nav-link" href="login"> <span
					style="font-size: 2em; position: relative"> <i
						class="fa fa-user-circle-o"></i>
				</span></a> <a class="nav-link" href="cart.do?id=${user.id }"> <span
					style="font-size: 1em; position: relative"> <i
						class="fa fa-shopping-cart"></i>
				</span></a>
			</div>
		</div>
	</nav>




	<div class="container-fluid text-center align-items-center justify-content-center">
		<div id="panel-green">
			<div id="white-text">
				<c:if test="${! empty items }">
					<h3>Items</h3>
					</c:if>
			</div>
			<c:forEach var="item" items="${items}">
				<div class="container-fluid">
					<div class="row">
						<div class="col-2"></div>
						<div class="col-9">
							<div class="row">
								<div class="col-lg-3">
									<div class="card">
										<img class="card-img-top" src="${item.imgUrl }"
											alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">${item.name}</h5>
											<ul class="list-group list-group-flush">
												<li class="list-group-item">Price: ${item.price }</li>
												<li class="list-group-item">Unit ${item.unit.name }</li>
												<li class="list-group-item">Category: ${item.category }</li>
												<li class="list-group-item">Harvested: ${item.picked }</li>
											</ul>
											<div class="card-body">
												<a href="addToCart.do?id=${item.id }" class="btn btn-info"
													role="button">Add to Cart</a><br> <a
													href="itemDetails.do?id=${item.id }" class="btn btn-info"
													role="button">Item Details</a>
											</div>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="card">
											<img class="card-img-top" src="${item.imgUrl }"
												alt="Card image cap">
											<div class="card-body">
												<h5 class="card-title">${item.name }</h5>
												<ul class="list-group list-group-flush">
													<li class="list-group-item">Price: ${item.price }</li>
													<li class="list-group-item">Unit ${item.unit.name }</li>
													<li class="list-group-item">Category: ${item.category }</li>
													<li class="list-group-item">Harvested: ${item.picked }</li>
												</ul>
												<div class="card-body">
													<a href="addToCart.do?id=${item.id }" class="btn btn-info"
														role="button">Add to Cart</a><br> <a
														href="itemDetails.do?id=${item.id }" class="btn btn-info"
														role="button">Item Details</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="card">
											<img class="card-img-top" src="${item.imgUrl }"
												alt="Card image cap">
											<div class="card-body">
												<h5 class="card-title">${item.name }</h5>
												<ul class="list-group list-group-flush">
													<li class="list-group-item">Price: ${item.price }</li>
													<li class="list-group-item">Unit ${item.unit.name }</li>
													<li class="list-group-item">Category: ${item.category }</li>
													<li class="list-group-item">Harvested: ${item.picked }</li>
												</ul>
												<div class="card-body">
													<a href="addToCart.do?id=${item.id }" class="btn btn-info"
														role="button">Add to Cart</a><br> <a
														href="itemDetails.do?id=${item.id }" class="btn btn-info"
														role="button">Item Details</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="card">
											<img class="card-img-top" src="${item.imgUrl }"
												alt="Card image cap">
											<div class="card-body">
												<h5 class="card-title">${item.name}</h5>
												<ul class="list-group list-group-flush">
													<li class="list-group-item">Price: ${item.price }</li>
													<li class="list-group-item">Unit ${item.unit.name }</li>
													<li class="list-group-item">Category: ${item.category }</li>
													<li class="list-group-item">Harvested: ${item.picked }</li>
												</ul>
												<div class="card-body">
													<a href="addToCart.do?id=${item.id }" class="btn btn-info"
														role="button">Add to Cart</a><br> <a
														href="itemDetails.do?id=${item.id }" class="btn btn-info"
														role="button">Item Details</a>
												</div>
											</div>
										</div>
									</div>

								</div>
	<div
		class="container-fluid text-center align-items-center justify-content-center">
		<div class="row">
			<div class="col-md-2 col-sm-1"></div>
			<div class="col-md-8 col-sm-10">
				<hr>
				<div id="panel-green">
					<div id="white-text">
						<c:if test="${! empty items }">
							<h3>Items</h3>
						<ul>
						<c:forEach var="item" items="${items}">
							<li>${item.name }</li>
							<li>${item.category.name }</li>
				                  <a class="nav-link" href="addToCart.do?id=${item.id }"> <span
					              style="font-size: 1em; position:relative"> <i class="fa fa-shopping-cart"></i>
				            </span></a>
					
									<hr>
						</c:forEach>
						</ul>
						</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div
		class="container-fluid text-center align-items-center justify-content-center">
		<div class="row">
			<div class="col-md-2 col-sm-1"></div>
			<div class="col-md-8 col-sm-10">
				<hr>
				<div id="panel-green">
					<div id="white-text">
						<h4>Personal Info</h4>
						Buyer Id: ${buyer.id} User Id: ${buyer.user.id}
						<h3>Personal Info</h3>
						Name: ${buyer.user.firstName }, ${buyer.user.lastName }<br>
						Username: ${buyer.user.username }<br> Password:
						${buyer.user.password }<br> Last Login:
						${buyer.user.lastLogin }<br> Role: ${buyer.user.role }<br>
						<h4>Address Details</h4>
						Street: ${buyer.user.address.streetAddress }<br> Street2:
						${buyer.user.address.address2 }<br> City:
						${buyer.user.address.city }<br> State:
						${buyer.user.address.state }<br> Zip Code:
						${buyer.user.address.zipcode }<br>
						<h2>Payment Methods</h2>
						Credit Card Number: ${buyer.creditCardNum }<br> Credit Card
						Exp Date: ${buyer.creditCardExpDate }<br> Credit Card CCV:
						${buyer.creditCardCcv }<br>

					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-sm-1"></div>
	</div>

	<c:if test="${! empty purchases }">
		<div
			class="container-fluid text-center align-items-center justify-content-center">
			<div class="row">
				<div class="col-md-2 col-sm-1"></div>
				<div class="col-md-8 col-sm-10">
					<hr>
					<hr>
					<div id="panel-green">
						<div id="white-text">
							<div class="form-group input-group"></div>
							<ul class="list-group">
								<c:forEach var="buyer" items="${buyer.purchases}">
									<li class="list-group-item list-group-item-action"><a
										href="getPurchaseById.do?purchaseid=${buyer.purchase.purchase.id }">
											Date purchased: ${buyer.purchase.payment.paymentDate } Total:
											$${buyer.purchase.payment.amount }</a></li>
									<hr>
								</c:forEach>
							</ul>
							<br>
						</div>
					</div>
					<ul class="list-group">
				<%-- 		<c:forEach var="purchase" items="${buyer.purchases}">
							<li class="list-group-item list-group-item-action"
							><a href="getPurchaseById.do?purchaseid=${purchase.id }">
								Date purchased: ${purchase.payment.paymentDate }
									Total: $${purchase.payment.amount }</a></li>
									<hr>
						</c:forEach>
 --%>					</ul>
					<br>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-1"></div>
		</div>
	</c:if>

	<c:if test="${! empty buyer.purchases }">
		<div
			class="container-fluid text-center align-items-center justify-content-center">
			<div class="row">
				<div class="col-md-2 col-sm-1"></div>
				<div class="col-md-8 col-sm-10">
					<hr>
					<hr>
					<div id="panel-green">
						<div id="white-text">

							<div class="form-group input-group"></div>
							<ul class="list-group">
								<c:forEach var="buyer" items="${buyer.inventoryItemsList}">
									<li class="list-group-item list-group-item-action"><a
										href="itemDetails.do?purchaseid=${buyer.purchase.inventory.itemId }">
											Item: ${buyer.purchase.inventory.item.name }</a>
										$${buyer.purchase.inventory.price } Store:
										${buyer.purchase.inventory.seller.storeName }</li>
									<hr>
								</c:forEach>
							</ul>
							<br>
						</div>
            </div>
					</div>
					<ul class="list-group">
				<%-- 		<c:forEach var="buyer" items="${buyer.inventoryItemsList}">
							<li class="list-group-item list-group-item-action"
							><a href="itemDetails.do?purchaseid=${buyer.purchase.inventory.itemId }">
								Item: ${buyer.purchase.inventory.item.name }</a>
									$${buyer.purchase.inventory.price }
								Store: ${buyer.purchase.inventory.seller.storeName }
									
									</li>
									<hr>
						</c:forEach> --%>
					</ul>
					<br>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-1"></div>
		</div>
	</c:if>


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

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
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