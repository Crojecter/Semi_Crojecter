<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.gallery.model.vo.* " %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Gallery Main</title>
		<meta charset="UTF-8">
		<style>
		#slide{ height:400px;}
		</style> 
	</head>
	<body>
		<%@ include file="views/common/header.jsp" %>
		<!-- 슬라이드 -->


		<div id="demo1" class="carousel slide" data-ride="carousel" style="display: inline-block;">
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
		      <img id= "slide" class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg1.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>One</h3>
		        <p>수달은 즐겁다</p>
		      </div>   
		    </div>
		    <div class="carousel-item">
		      <img id= "slide"  class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg2.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>Two</h3>
		        <p>나는 안즐겁다</p>
		      </div>   
		    </div>
		    <div class="carousel-item">
		      <img id= "slide"  class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg3.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>Three</h3>
		        <p>We love the Big Apple!</p>
		      </div>   
		    </div>
		    <div class="carousel-item">
		      <img id= "slide" class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg4.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>Four</h3>
		        <p>Thank you, Chicago!</p>
		      </div>   
		    </div>  
		    <div class="carousel-item">
		      <img id= "slide" class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg5.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>Five</h3>
		        <p>Thank you, Chicago!</p>
		      </div>   
		    </div>  
		    <div class="carousel-item">
		      <img id= "slide" class="d-block w-100" src="<%= request.getContextPath()%>/resources/images/slideSample/slideImg6.jpg" alt="" data-holder-rendered="true">
		      <div class="carousel-caption">
		        <h3>Six</h3>
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
			<div style="background:violet; width: 300px; height: 300px;">
				<h4> = 자주 사용한 태그 = </h4>
			</div>
		
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
						<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
		<!-- 갤러리 내용 -->
		<%@ include file="views/board/galleryList.jsp" %>

		<!-- 리모컨 -->
		<div style="position: fixed; right: 50%; top: 80%; margin-right: -720px; text-align:center; width: 10%;">
		<button><a href="#top"><img src="<%= request.getContextPath()%>/resources/images/icon/up.png" alt="" style="height:30px;"></a></button><br>
		<button><a href="#bottom"> <img src="<%= request.getContextPath()%>/resources/images/icon/down.png" alt="" style="height:30px;"></a></button>
		</div>
		<a name="bottom"></a>
	<%@ include file="views/common/footer.jsp" %>
</body>

</html>