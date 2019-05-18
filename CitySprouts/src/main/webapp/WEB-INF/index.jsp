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
    <link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    

<style>
      @media (min-width: 768px) {
  /* show 4 items */
  .carousel-inner .active,
  .carousel-inner .active + .carousel-item,
  .carousel-inner .active + .carousel-item + .carousel-item,
  .carousel-inner .active + .carousel-item + .carousel-item + .carousel-item {
    display: block;
  }

  .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left),
  .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item,
  .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item + .carousel-item,
  .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item + .carousel-item + .carousel-item {
    transition: none;
  }

  .carousel-inner .carousel-item-next,
  .carousel-inner .carousel-item-prev {
    position: relative;
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
  }

  .carousel-inner .active.carousel-item + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
    position: absolute;
    top: 0;
    right: -25%;
    z-index: -1;
    display: block;
    visibility: visible;
  }

  /* left or forward direction */
  .active.carousel-item-left + .carousel-item-next.carousel-item-left,
  .carousel-item-next.carousel-item-left + .carousel-item,
  .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item,
  .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item + .carousel-item,
  .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
    position: relative;
    -webkit-transform: translate3d(-100%, 0, 0);
            transform: translate3d(-100%, 0, 0);
    visibility: visible;
  }

  /* farthest right hidden item must be absolue position for animations */
  .carousel-inner .carousel-item-prev.carousel-item-right {
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;
    display: block;
    visibility: visible;
  }

  /* right or prev direction */
  .active.carousel-item-right + .carousel-item-prev.carousel-item-right,
  .carousel-item-prev.carousel-item-right + .carousel-item,
  .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item,
  .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item + .carousel-item,
  .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
    position: relative;
    -webkit-transform: translate3d(100%, 0, 0);
            transform: translate3d(100%, 0, 0);
    visibility: visible;
    display: block;
    visibility: visible;
  }
}

    </style>
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
<title>City Sprouts - Connecting Urban Farmers</title>

</head>
<body translate="no">

  
<div class="container-fluid">
<h1 class="text-center mb-3">City Sprouts</h1>
<header class="text-center">
  <h4 class="text-uppercase"><small>Connecting Urban farmers with the local market.</small></h4>
  <h2>Our Featured Picks</h2> <!--@@ fore through inventory item.lastUpdated -->
</header>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
<div class="carousel-inner row w-100 mx-auto">

<div class="carousel-item col-md-3">
<div class="card">
<img class="card-img-top img-fluid" src="https://images.unsplash.com/photo-1556843824-256570ca21c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" alt="Card image cap">
<div class="card-body">
<h4 class="card-title">Card 5</h4>
<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
</div>
</div>
</div>







<div class="carousel-item col-md-3">
<div class="card">
<img class="card-img-top img-fluid" src="https://image.shutterstock.com/z/stock-photo-yellow-golden-raisins-isolated-on-white-background-1064872322.jpg" alt="Card image cap">
<div class="card-body">
<h4 class="card-title">Card 6</h4>
<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
</div>
</div>
</div>
<div class="carousel-item col-md-3">
<div class="card">
<img class="card-img-top img-fluid" src="https://image.shutterstock.com/z/stock-photo-ripe-peaches-in-basket-on-wooden-background-297863489.jpg" alt="Card image cap">
<div class="card-body">
<h4 class="card-title">Card 7</h4>
<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
</div>
</div>
</div>
<div class="carousel-item col-md-3 active">
<div class="card">
<img class="card-img-top img-fluid" src="https://image.shutterstock.com/z/stock-photo-pink-lady-apples-isolated-on-white-background-1122706196.jpg" alt="Card image cap">
<div class="card-body">
<h4 class="card-title">Card 1</h4>
 <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
</div>
</div>
</div><div class="carousel-item col-md-3">
<div class="card">
<img class="card-img-top img-fluid" src="https://image.shutterstock.com/z/stock-photo-isolated-berries-red-currant-fruits-isolated-on-white-background-137215997.jpg" alt="Card image cap">
<div class="card-body">
<h4 class="card-title">Card 2</h4>
<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
</div>
</div>
</div><div class="carousel-item col-md-3">
<div class="card">
<img class="card-img-top img-fluid" src="https://image.shutterstock.com/z/stock-vector-honeydew-melon-whole-fresh-ripe-sweet-fruit-with-sliced-juicy-piece-of-cut-melon-realistic-fruits-1157387923.jpg" alt="Card image cap">
<div class="card-body">
<h4 class="card-title">Card 3</h4>
<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
</div>
</div>
</div><div class="carousel-item col-md-3">
<div class="card">
<img class="card-img-top img-fluid" src="https://image.shutterstock.com/z/stock-photo-ripe-peaches-in-basket-on-wooden-background-297863489.jpg" alt="Card image cap">
<div class="card-body">
<h4 class="card-title">Card 4</h4>
<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
</div>
</div>
</div></div>
<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
<span class="carousel-control-prev-icon" aria-hidden="true"></span>
<span class="sr-only">Previous</span>
</a>
<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
<span class="carousel-control-next-icon" aria-hidden="true"></span>
<span class="sr-only">Next</span>
</a>
</div>
</div>

<section class="categories">
  <div class="item d-flex align-items-center">
  <div class="container">
    <header class="text-center">
      <h2>Find your Urban Farmer</h2>
      <h4><small>Get it local...</small></h4>

      <h3>Denver Area</h3>
            </header>
      <div class="image d-flex align-items-center justify-content-center">
        <iframe width="800" height="400" frameborder="0" style="border:0"
            src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJzxcfI6qAa4cR1jaKJ_j0jhE&key=AIzaSyDAxjvHqQQNx3ZZLcUiMDuQB3uQwitKsKY" allowfullscreen>
        </iframe>
      </div>
    </div>
  </div>
</section>




<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script id="rendered-js">
      $(document).ready(function () {
  $("#myCarousel").on("slide.bs.carousel", function (e) {
    var $e = $(e.relatedTarget);
    var idx = $e.index();
    var itemsPerSlide = 4;
    var totalItems = $(".carousel-item").length;

    if (idx >= totalItems - (itemsPerSlide - 1)) {
      var it = itemsPerSlide - (totalItems - idx);
      for (var i = 0; i < it; i++) {if (window.CP.shouldStopExecution(0)) break;
        // append slides to end
        if (e.direction == "left") {
          $(".carousel-item").
          eq(i).
          appendTo(".carousel-inner");
        } else {
          $(".carousel-item").
          eq(0).
          appendTo($(this).find(".carousel-inner"));
        }
      }window.CP.exitedLoop(0);
    }
  });
});
      //# sourceURL=pen.js
    </script>
<script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>






  </body>
</html>
