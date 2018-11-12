<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.gallery.model.vo.Gallery" %>
<% ArrayList<Gallery> list = (ArrayList<Gallery>)request.getAttribute("list"); %> 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Gallery Main</title>
		<meta charset="UTF-8">
	<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
		bootstrap css include
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="css/main.css">
		bootstrap js include
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
		<script src="/myWeb/resources/js/jquery-3.3.1.min.js"></script>-->
		<style>
		.d-block w-100{ height:300px;}
		</style> 
	</head>
	<body>
		<%@ include file="views/common/header.jsp" %>
		<!-- 슬라이드 -->


		<div id="demo1" class="carousel slide" data-ride="carousel">
		  <ul class="carousel-indicators" style="z-index:1">
		    <li data-target="#demo1" data-slide-to="0" class="active"></li>
		    <li data-target="#demo1" data-slide-to="1" class=""></li>
		    <li data-target="#demo1" data-slide-to="2" class=""></li>
		    <li data-target="#demo1" data-slide-to="3" class="active"></li>
		    <li data-target="#demo1" data-slide-to="4" class=""></li>
		    <li data-target="#demo1" data-slide-to="5" class=""></li>
		  </ul>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg1.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>11111111</h3>
		        <p>We had such a great time in LA!</p>
		      </div>   
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg2.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>2222222</h3>
		        <p>Thank you, Chicago!</p>
		      </div>   
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg3.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>3333333</h3>
		        <p>We love the Big Apple!</p>
		      </div>   
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg4.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>4444444</h3>
		        <p>Thank you, Chicago!</p>
		      </div>   
		    </div>  
		    <div class="carousel-item">
		      <img class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg5.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>5555555</h3>
		        <p>Thank you, Chicago!</p>
		      </div>   
		    </div>  
		    <div class="carousel-item">
		      <img class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg6.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>6666666</h3>
		        <p>Thank you, Chicago!</p>
		      </div>   
		    </div>
			</div>
		
		
		  <a class="carousel-control-prev" href="#demo1" data-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next" href="#demo1" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
		</div>




		<!-- 인기태그 -->


		<!-- 게시글 선택보기 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<button type="button" class="btn btn-light"><a class="nav-link" href="#" id="viewAll">
				<img src="<%= request.getContextPath()%>/resources/images/icon/selectImg.png" alt="" style="height:30px"></a></button>
			<button type="button" class="btn btn-light"><a class="nav-link" href="#" id="viewImg">
				<img src="<%= request.getContextPath()%>/resources/images/icon/imageImg.png" alt="" style="height:30px"></a></button>		
			<button type="button" class="btn btn-light"><a class="nav-link" href="#" id="viewSound">
				<img src="<%= request.getContextPath()%>/resources/images/icon/soundImg.png" alt="" style="height:30px"></a></button>
			<button type="button" class="btn btn-light"><a class="nav-link" href="#" id="viewText">
				<img src="<%= request.getContextPath()%>/resources/images/icon/textImg.png" alt="" style="height:30px"></a></button>
			<button type="button" class="btn btn-light"><a class="nav-link" href="#" id="viewVidio">
				<img src="<%= request.getContextPath()%>/resources/images/icon/vidioImg.png" alt="" style="height:30px"></a></button>
				
			<div class="collapse navbar-collapse" id="navbarSupportedContent">		
				<ul class="navbar-nav mr-auto"></ul>
				<form class="form-inline my-2 my-lg-0">
					<button class="nav-item dropdown" type="submit">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							최신순		
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#" id="viewRecent">최신순</a>
						<a class="dropdown-item" href="#" id="viewLike">좋아요순</a>
						<a class="dropdown-item active" href="#" id="viewHits">조회순</a>
						</div>			
					</button>
				</form>
			</div>		
		</nav>
		
		<%@ include file="views/board/GalleryList.jsp" %>

		<!-- 리모컨 -->
		<div style="position: fixed; right: 50%; top: 80%; margin-right: -720px; text-align:center; width: 10%;">
		<button><a href="#top"><img src="<%= request.getContextPath()%>/resources/images/icon/up.png" alt="" style="height:30px;"></a></button><br>
		<button><a href="#bottom"> <img src="<%= request.getContextPath()%>/resources/images/icon/down.png" alt="" style="height:30px;"></a></button>
		</div>
		<a name="bottom"></a>
	<%@ include file="views/common/footer.jsp" %>
</body>

</html>