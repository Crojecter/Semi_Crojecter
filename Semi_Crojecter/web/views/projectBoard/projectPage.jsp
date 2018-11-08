<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project Page</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<h1> 프로젝트 페이지입니다.</h1>
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
	<%@ include file="../common/footer.jsp"%>
</body>
</html>