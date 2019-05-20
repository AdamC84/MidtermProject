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


<style>
<%@include file="css/style.css" %>
</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Navbar</a>
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
				<!-- <li class="nav-item"><a class="nav-link" href="#">Link</a></li> -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Menu </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="buyerLearnMore.do">Buyer Learn More</a>
						<a class="dropdown-item" href="sellerLearnMore.do">Seller Learn More</a>
					<!-- 	<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a> -->
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">Disabled</a></li>
			</ul>
			 <a class="nav-link" href="#">Login/Sign up</a>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	
	
 <div class="container">
 <form:form action="registerBuyer.do" method="POST" modelAttribute="buyer">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Bank Routing</label>
      <form:input type="test" class="form-control" id="firstName" placeholder="12443" path="bankRouting" />
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Bank Name</label>
      <form:input type="text" class="form-control" id="lastName" placeholder="Citi" path="bankName" />
    </div>
  </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Bank acct number</label>
      <form:input type="text" class="form-control" id="lastName" placeholder="4355353" path="bankAcctNum" />
    </div>
 
  <button type="submit" class="btn btn-primary">Next</button>
  </form:form>
  </div>
  



 



	<footer class="container-fluid text-center">
		<div class="row">
			<div class="col-sm-4">
				<h3>Contact Us</h3>
				<br>
				<h4>Address and contact info</h4>
			</div>
			<div class="col-sm-4">
				<h3>Connect</h3>
				<a href="#" class="fa fa-facebook"></a> <a href="#"
					class="fa fa-twitter"></a> <a href="#" class="fa fa-linkedin"></a>
				<a href="#" class="fa fa-youtube"></a> <a href="#"
					class="fa fa-github"></a>
			</div>
			<div class="col-sm-4">
				<img src="img/b.png" class="icon">
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