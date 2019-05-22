<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<a class="navbar-brand navbar-left" href="home.do"> <img src="img/logo_trans.png"
			class="icon"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="getStoreNames.do">Urban Farms</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> More... </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<div class="dropdown-divider"></div>
 <a class="dropdown-item" href="buyerLearnMore.do">Buyer
							Learn More</a> <a class="dropdown-item" href="sellerLearnMore.do">Seller
							Learn More</a>
							<a class="dropdown-item" href="about">About</a>
					</div></li>
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
			</div>
		</div>
	</nav>
	
	<div
		class="container-fluid text-center align-items-center justify-content-center">
		<div class="row">
			<div class="col-md-4 col-sm-1"></div>
			<div class="col-md-4 col-sm-10">
				<hr>
				<div id="panel-green">
					<div id="white-text">
					<h3>Sign In</h3>
					<form action="login.do" method="POST" >
					<div class="form-group">

						<input autofocus="autofocus" name="username" class="form-control" placeholder="Enter username" />
						
					</div>
					<div class="input-group form-group">
						<input name="password" type="password" class="form-control" placeholder="Enter password" />
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div>
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn"/>
					</div>
					</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4 col-sm-1"></div>
	</div>
	
	<div class="container" style="padding: 20px 0px 0px 0px">
		<div class="d-flex justify-content-center h-100"><br>
			<div class="card">
				<div class="card-header">
					<h3>Sign In</h3>
				</div>
				<div class="card-body">
 				<form action="login.do" method="POST" >
					<div class="form-group">

						<input autofocus="autofocus" name="username" class="form-control" placeholder="Enter username" />
						
					</div>
					<div class="input-group form-group">
						<input name="password" type="password" class="form-control" placeholder="Enter password" />
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div>
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn"/>
					</div>
				</form>
				</div>
				<div class="card-footer">
					<div class="justify-content-center text-warning font-weight-bold" >
				<c:if test="${ ! empty error }">
				<h3>${error }</h3>
				</c:if>
				</div>
			</div>
		</div>
	</div>
	</div>
	
 	
			<div class="container-fluid text-center align-items-center justify-content-center" style="padding: 20px 0px 0px 0px">
			</div>
<%--	<div class="row">
			<div class="col-md-2 col-sm-1"></div>
			<div class="col-md-8 col-sm-10"><hr>
				<hr>
				<div id="panel-green">
					<div id="white-text">
 
 				<div  style="width: 24rem;">
					<form action="login" method="GET">
							<input autofocus="autofocus" type="submit" value="Login"
								class="btn float-none login_btn">
						</form>
				</div>
									<br>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-sm-1"></div>
	</div> --%>


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