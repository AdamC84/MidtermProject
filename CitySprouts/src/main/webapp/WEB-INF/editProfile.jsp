<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>

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
				<li class="nav-item"><a class="nav-link" href="getStoreNames.do">Urban Farms</a></li>
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
			<a class="nav-link tomato-text" href="registerPage.do">Sign Up</a>
			</div>
			<div class="nav-item"><a class="nav-link" href="login">
				<span style="font-size: 2em;">
				<i class="fa fa-user-circle-o"></i>
				</span></a>
				<c:if test="${user.role = BUYER} ">
				<a class="nav-link" href="cart.do?id=${user.id }"> <span
					style="font-size: 1em; position:relative"> <i class="fa fa-shopping-cart"></i>
				</span></a>
				</c:if>
			</div>
		</div>
	</nav>


<form:form action="updateSeller.do" method="POST" modelAttribute="seller">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">First</label>
      <form:input type="test" class="form-control" id="firstName" placeholder="first" path="user.firstName" value="${seller.user.firstName}"/>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Last</label>
      <form:input type="text" class="form-control" id="lastName" placeholder="last" path="user.lastName" value="${seller.user.lastName}"/>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">User Name</label>
      <form:input type="text" class="form-control" id="userName" placeholder="userName" path="user.username" value="${seller.user.username}"/>
    </div>
    </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <form:input type="email" class="form-control" id="inputEmail4" placeholder="Email" path="user.email" value="${seller.user.email}"/>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Password</label>
      <form:input type="password" class="form-control" id="inputPassword4" placeholder="Password" path="user.password" value="${seller.user.password}"/>
    </div>
   
  </div>

  
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <form:input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" path="user.address.streetAddress"/>
  </div>
  <div class="form-group">
    <label for="inputAddress2">Address 2</label>
    <form:input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" path="user.address.address2"/>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <form:input type="text" class="form-control" id="inputCity" path="user.address.city"/>
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <form:select id="inputState" class="form-control" path="user.address.state">
        <option selected>${seller.user.address.state}</option>
        <option>Alabama</option>
        <option>Alaska</option>
        <option>Colorado</option>
      </form:select>
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Zip</label>
      <form:input type="text" class="form-control" id="inputZip" path="user.address.zipcode"/>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Bank Routing</label>
      <form:input type="text" class="form-control" id="firstName" placeholder="first" path="bankRouting" />
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Bank Name</label>
      <form:input type="text" class="form-control" id="lastName" placeholder="last" path="bankName"/>
    </div>
  </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Bank acct number</label>
      <form:input type="text" class="form-control" id="lastName" placeholder="last" path="bankAcctNum" />
    </div>

  <button type="submit" class="btn btn-primary">Submit</button>
</form:form>



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