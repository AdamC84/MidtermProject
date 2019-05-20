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
<title>City Sprouts - Sell</title>
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


<style>
<%@include file="css/style.css" %>
</style>
</head>
<body>
	<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand navbar-left" href="home.do"></a> <img src="img/logo_trans.png"
			class="icon">
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
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
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
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<div class="nav-item">
			<a class="nav-link tomato-text" href="registerPage.do">Sign up</a>
			</div>
			<div class="nav-item"><a class="nav-link" href="login.do">
				<span style="font-size: 2em;">
				<i class="fa fa-user-circle-o"></i>
				</span></a>
								<a class="nav-link" href="cart.do?id=${user.id }"> <span
					style="font-size: 1em; position:relative"> <i class="fa fa-shopping-cart"></i>
				</span></a>
			</div>
		</div>
	</nav>

	<div
		class="container-fluid text-center align-items-center justify-content-center">
		<div class="row">
			<div class="col-md-2 col-sm-1"></div>
			<div class="col-md-8 col-sm-10">
				<hr>
				<div id="panel-green">
					<div id="white-text">
						<h3>Seller Id</h3>
						${seller.id}
						<h3>User Id</h3>
						${seller.user.id}
						<h3>Personal Info</h3>
						Name: ${seller.user.firstName }, ${seller.user.lastName }<br>
						Username: ${seller.user.username }<br>
						Password: ${seller.user.password }<br>
						Last Login: ${seller.user.lastLogin }<br>
						Role: ${seller.user.role }<br>
						<h4>Address Details</h4>
						Street: ${seller.user.address.streetAddress }<br>
						Street2: ${seller.user.address.address2 }<br>
						City: ${seller.user.address.city }<br>
						State: ${seller.user.address.state }<br>
						Zip Code: ${seller.user.address.zipCode }<br>
						
						
						<h3>Bank Info</h3>
						${seller.bankName }<br>
						${seller.bankAcctNum }<br>
						${seller.bankRouting }<br>
						<h3>Store</h3>
						${seller.storeName }<br>
	
	
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-sm-1"></div>
	</div>
	
	<div class="container">
	<c:if test="${empty item}">
	<form:form action="addItemView.do" method="POST" modelAttribute="seller">
		<form:input type="hidden" value="${seller.id}" path="id"/>
	  <button type="submit" class="btn btn-primary">add Item</button>
	</form:form>
	</c:if>
	
	
	<c:if test="${not empty item}">
	
	<form:form action="addItem.do" method="POST" modelAttribute="item">
  	<div class="form-row">
    <div class="col-md-4 mb-3">
      Name<form:input type="text" class="form-control" id="validationDefault01" placeholder="Product Name" value="Delicious Red Strawberries" required="true" path="name"/>
    </div>
    </div>
  	<div class="form-row">
    <div class="col-md-4 mb-3">
      Description<form:input type="text" class="form-control" id="validationDefault01" placeholder="Description" value="Fresh organic berries..." required="true" path="description"/>
    </div>
    </div>
  	<div class="form-row">
    <div class="col-md-4 mb-3">
      Price<form:input type="text" class="form-control" id="validationDefault01" placeholder="Description" value="2.99" required="true" path="price"/>
    </div>
    </div>
    <div class="form-row">
  		<div class="col-md-4 mb-3">
  		Unit<form:select class="form-control" path="unit.name" value="unit">
  		<c:forEach var="unit" items="${unitList}">
  			<option>${unit.name}</option>
  		</c:forEach>
  		
		</form:select>
  		</div>
 	</div>
    <div class="form-row">
  		<div class="col-md-4 mb-3">
  		Commodity<form:select class="form-control" path="commodity.name" value="unit">
  		<c:forEach var="commodity" items="${commodityList}">
  			<option>${commodity.name}</option>
  		</c:forEach>
  		
		</form:select>
  		</div>
 	</div>
    <div class="form-row">
  		<div class="col-md-4 mb-3">
  		Variety<form:select class="form-control" path="variety.name" value="unit">
  		<c:forEach var="variety" items="${varietyList}">
  			<option>${variety.name}</option>
  		</c:forEach>
  		
		</form:select>
  		</div>
 	</div>
    <div class="form-row">
  		<div class="col-md-4 mb-3">
  		Category<form:select class="form-control" path="category.name" value="unit">
  		<c:forEach var="category" items="${categoryList}">
  			<option>${category.name}</option>
  		</c:forEach>
  		
		</form:select>
  		</div>
 	</div>

	  <button type="submit" class="btn btn-primary">add Item</button>
	</form:form>
	
	
	</c:if>
	<c:if test="${not empty inventory }">
	<c:forEach var="inventory" items="${inventory}">
	${inventory.item.name }<br>
	${inventory.item.description }<br>
	${inventory.item.price }<br>
	${inventory.item.category.name }<br>
	
	
	</c:forEach>
	
	
	
	</c:if>









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
				<a href="#" class="fa fa-facebook"></a> <a href="#"
					class="fa fa-twitter"></a> <a href="#" class="fa fa-linkedin"></a>
				<a href="#" class="fa fa-youtube"></a> <a href="#"
					class="fa fa-github"></a>
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