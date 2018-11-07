<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</style> 
</head>
<body>
		<!-- 헤더 -->
		<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a href="mainLink"><img src="../resource/image/LogoImage.png" style="height:50px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
		
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				왼쪽&nbsp;&nbsp;&nbsp;
				<ul class="navbar-nav mr-auto">
					갤러리
					<li class="galleryLink">
					<h4><a class="galleryLink" href="galleryLink">갤러리</a> &nbsp;&nbsp;&nbsp;</h4>
					</li>
					프로젝트
					<li class="projectLink">
					<h4><a class="projectLink" href="projectLink">프로젝트</a></h4>
					</li>
				</ul>
				오른쪽
				<form class="form-inline my-2 my-lg-0">
					<ul class="navbar-nav mr-auto">
						알람
						<li>
						<button type="button" class="btn btn-primary" data-toggle="tooltip" title="" 
						data-original-title="읽지않은 알림메세지가 있을수도 있고 없을수도 있습니다.">
						<img src="../resource/image/alarm.png" style="height:30px"><span class="badge badge-light">0</span>
						<span class="sr-only">unread messages</span>
						</button>
						<script>
							$(document).ready(function(){
								$('[data-toggle="tooltip"]').tooltip(); 
							});
						</script>	
						프로필
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="../resource/image/user.png" style="height: 30px;">
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="walnut">호두충전</a>
							<a class="dropdown-item" href="myPageLink">마이페이지</a>
							<a class="dropdown-item" href="logout">로그아웃</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#"><img src="../resource/image/gal/walnut.jpg" alt="" style="height:30px;">: <span>??</span>개</a>
						</div>
					</ul>
					<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit"><img src="../resource/image/gal/search.png" alt="" style="height:20px;"></button> &nbsp;
					<button class="btn btn-outline-success my-2 my-sm-0" type="button"><a href="writePage"><img src="../resource/image/gal/upload.png" alt="" style="height:20px;"></a></button>
				</form>
			</div>
		</nav> -->
		<%@ include file="views/common/header.jsp" %>
		<!-- 슬라이드 -->
		<div class="carousel-item">
		  <img src="la.jpg" alt="Los Angeles">
		  <div class="carousel-caption">
		    <h3>Los Angeles</h3>
		    <p>We had such a great time in LA!</p>
		  </div>
		</div>
		
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
				<img class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/bonobono1.jpg" alt="First slide" style="height: 300px; width: 300px;">
				</div>
				<div class="carousel-item">
				<img class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/bonobono2.jpg" alt="Second slide" style="height: 300px; width: 300px;">
				</div>
				<div class="carousel-item">
				<img class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/bonobono3.jpg" alt="Third slide" style="height: 300px; width: 300px;">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- 순위 -->
		<div style="width:300px; height:300px">
			<h3> 인기태그 순위</h3>
			<span>1</span><div class="progress">
			  <div class="progress-bar bg-danger" style="width:80%"><apan>조회수</apan></div>
			</div>
			<span>2</span><div class="progress">
			   <div class="progress-bar bg-warning" style="width:70%"><span>조회수</span></div>
			</div>
			<span>3</span><div class="progress">
			  <div class="progress-bar bg-success" style="width:60%"><span>조회수</span></div>
			</div>
			<span>4</span><div class="progress">
			  <div class="progress-bar bg-info" style="width:50%"><span>조회수</span></div>
			</div>
			<span>5</span><div class="progress">
			  <div class="progress-bar " style="width:40%"><span>조회수</span></div>
			</div>
			<span>6</span><div class="progress">
			  <div class="progress-bar" style="width:30%"><span>조회수</span></div>
			</div>
			<span>7</span><div class="progress">
			  <div class="progress-bar" style="width:20%"><span>조회수</span></div>
			</div>
					
		</div>


		<!-- 게시글보기 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<button type="button" class="btn btn-light"><a class="nav-link" href="#">
				<img src="<%= request.getContextPath()%>/resources/images/icon/selectImg.png" alt="" style="height:30px"></a></button>
			<button type="button" class="btn btn-light"><a class="nav-link" href="#">
				<img src="<%= request.getContextPath()%>/resources/images/icon/imageImg.png" alt="" style="height:30px"></a></button>		
			<button type="button" class="btn btn-light"><a class="nav-link" href="#">
				<img src="<%= request.getContextPath()%>/resources/images/icon/soundImg.png" alt="" style="height:30px"></a></button>
			<button type="button" class="btn btn-light"><a class="nav-link" href="#">
				<img src="<%= request.getContextPath()%>/resources/images/icon/textImg.png" alt="" style="height:30px"></a></button>
			<button type="button" class="btn btn-light"><a class="nav-link" href="#">
				<img src="<%= request.getContextPath()%>/resources/images/icon/vidioImg.png" alt="" style="height:30px"></a></button>
				
			<div class="collapse navbar-collapse" id="navbarSupportedContent">		
				<ul class="navbar-nav mr-auto"></ul>
				<form class="form-inline my-2 my-lg-0">
					<button class="nav-item dropdown" type="submit">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							최신순		
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">최신순</a>
						<a class="dropdown-item" href="#">좋아요순</a>
						<a class="dropdown-item active" href="#">조회순</a>
						</div>			
					</button>
				</form>
			</div>		
		</nav>

		<!-- 게시글 썸네일 -->
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall1.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall2.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall3.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall4.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall5.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall6.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall7.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall8.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall1.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall2.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall3.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall4.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall5.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall6.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall7.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall8.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall1.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall2.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall3.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall4.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>
	
		

		<!-- 페이지 -->
		<nav aria-label="..." class="pageNav"  style="float: right; position: absolute; left: 40%;">
			<br>
			<ul class="pagination" style="text-align: center">
				<li class="page-item disabled">
				<a class="page-link" href="#" tabindex="-1">Previous</a>
				</li>
				<li class="page-item"><a class="page-link" href="page1">1</a></li>
				<li class="page-item active"><a class="page-link" href="page2">2<span class="sr-only">(current)</span></a></li>
				<li class="page-item"><a class="page-link" href="page3">3</a></li>
				<li class="page-item">
				<li class="page-item"><a class="page-link" href="page4">4</a></li>
				<li class="page-item">	
				<li class="page-item"><a class="page-link" href="page5">5</a></li>
				<li class="page-item">	
				<a class="page-link" href="#">Next</a>
				</li>
			</ul>
		</nav>
		<!-- 리모컨 -->
		<div style="position: fixed; right: 50%; top: 80%; margin-right: -720px; text-align:center; width: 10%;">
		<button><a href="#top"><img src="<%= request.getContextPath()%>/resources/images/icon/up.png" alt="" style="height:30px;"></a></button><br>
		<button><a href="#bottom"> <img src="<%= request.getContextPath()%>/resources/images/icon/down.png" alt="" style="height:30px;"></a></button>
		</div>
		<a name="bottom"></a>
	<%@ include file="views/common/footer.jsp" %>
</body>
	<!-- 풋터 -->

</html>