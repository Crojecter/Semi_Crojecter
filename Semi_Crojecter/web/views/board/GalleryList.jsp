<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall1.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title  <span id="cid" class="badge" style="background:black; color:white;">5</span></a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
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
	<%-- 	<div class="outer">
		<br>
		<h2 align="center">사진게시판</h2>
		
		<div class="thumbnailArea">
		<% for (Gallery gal : list) { %>
			<div class="gal-list" align="center">
				<div>
					<input type="hidden" value="<%=gal.getBid()%>">
				 	<img src="<%= request.getContextPath()%>/resources/galleryUploadFiles/<%=gal.getBoardfile() %>">
				</div>
				<p>No. <%= gal.getBid() + " " + gal.getBtitle() %><br>
				조회수 : <%= gal.getBcount() %>
				</p>
			</div>
		<% } %>
		</div>
		<script>
			$(function(){
				$(".gal-list").click(function(){
					var bno = $(this).children().children().eq(0).val();
					//console.log(num);
					// selectOne.tn -> SelectOneThumbnailServlet
					location.href="<%=request.getContextPath()%>/selectOne.ga?bno=" + bno;
				})
			});
		</script> --%>


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
</body>
</html>