<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>City Sprouts - Connecting Urban Growers</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


<style>
<%@include file="css/style.css" %>
</style>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.do">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <!-- <a class="nav-link" href="#">Link</a> -->
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="addItem.do">Add Item</a>
          <a class="dropdown-item" href="editItem.do">Edit Item</a>
        <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="buyerLearnMore.do">Buyer Learn More</a>
	      <a class="dropdown-item" href="sellerLearnMore.do">Seller Learn More</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>



<!-- 
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-main">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="img/logo.png" class="img-fluid">
      </a>
  </div>
  </div>
  <div class="collapse navbar-collapse" id="navbar-collapse-main">
    <ul class="nav navbar-nav navbar-right">
      <li><a class="active" href="#">Home</a></li>
      <li><a href="#">Produce</a></li>
      <li><a href="#">Contact</a></li>
      <li><a href="#">About</a></li>
    </ul>
  </div>
  </nav> -->


  
<div class="container-fluid">
<h1 class="text-center mb-3">City Sprouts</h1>
<header class="text-center">
  <h4 class="text-uppercase"><small>Connecting Urban farmers with the local market.</small></h4>
  <h2>Our Featured Picks</h2> <!--@@ fore through inventory item.lastUpdated -->
</header>
</div>

<div id="home">
<img src="img/hero-bg.jpg">
    <div class="landing-text">
      <h1>City Sprouts</h1>
      <h3>Connecting Urban farmers with the local market</h3>
      <a href="#" Class="btn btn-default btn-lg">Fresh produce</a>
    </div>
  </div>

  <div class="padding">
    <div class="container">
      <div class="row">
          <div class="col-sm-6">
            <img src="img/bootstrap.png">
            <p>
            
            <c:if test="${! empty random }">
          <c:forEach var="random" items="${random}">
<div class="carousel-item col-md-3">
<div class="card">
<img class="card-img-top img-fluid" src="https://images.unsplash.com/photo-1556843824-256570ca21c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" alt="Card image cap">

              <div class="image d-flex align-items-center justify-content-center"><img src="${random.imgUrl}" alt="product" class="img-fluid">

              <div class="title"><a href="detail.html">
                  <h3 class="h6 text-uppercase no-margin-bottom">${random.picked } </h3></a><span class="price text-muted">$${random.price }</span></div>
            </div>
          </div>
<div class="card-body">
<h4 class="card-title">Card 5</h4>
<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
</div>
</div>
         </c:forEach>
           </c:if>
            
            
            </p>
          </div>
        <div class="col-sm-6 text-center">
          <h2>FRESH PICKS</h2>
          <p class="lead">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
    
          <p class="lead">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
   
        </div>
      </div>
    </div>
  </div>

  <div class="padding">
    <div class="container">
      <div class ="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <h4>Built with Sass</h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
          </p>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <img src="img/sass.png" class="img-responsive">
    </div>
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
      <h4>And Less</h4>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
      </p>
  </div>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
<img src="img/less.png" class="img-responsive">
</div>
    </div>
  </div>
  </div>
<div id="fixed">
</div>

  <div class="padding">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <h4>FRESH PICKS</h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
        </div>
          <div class="col-sm-6">
            <img src="img/bootstrap2.png">
          </div>

      </div>
    </div>
  </div>


<!--- iOS Landing Page Fix
<section>
	<div class="landing-text">
		<h1>BOOTSTRAP</h1>
		<h3>Learn the basic building blocks.</h3>
		<a href="#" class="btn btn-default btn-lg">Get Started</a>
	</div>
	<div class="home-wrap">
        <div id="home">
		</div>
    </div>
</section>
-->

<!--- iOS Fixed Image Fix
<figure>
	<div class="fixed-wrap">
        <div id="fixed">
		</div>
    </div>
</figure>
-->





<footer class="container-fluid text-center">
    <div class="row">
      <div class="col-sm-4">
        <h3>Contact Us</h3>
        <br>
        <h4>Address and contact info</h4>
      </div>
      <div class="col-sm-4">
        <h3> Connect</h3>
        <a href="#" class="fa fa-facebook"></a>
        <a href="#" class="fa fa-twitter"></a>
        <a href="#" class="fa fa-linkedin"></a>
        <a href="#" class="fa fa-youtube"></a>
        <a href="#" class="fa fa-github"></a>
      </div>
      <div class="col-sm-4">
        <img src="img/logo.png" class="icon">
      </div>
    </div>
  </footer>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  </body>
</html>