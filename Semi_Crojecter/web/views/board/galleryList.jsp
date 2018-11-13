<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.gallery.model.vo.*" %>
 
<% ArrayList<Gallery> gList = (ArrayList<Gallery>)request.getAttribute("list"); 
	System.out.println(gList);
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	System.out.println(pi);
	int currentPage = pi.getCurrentPage();
	int listCount = pi.getListCount();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%> 
 
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
				<h5 class="card-title"><a href="">제목부분  <span id="cid" class="badge" style="background:black; color:white;">5</span></a></h5>
				<p class="card-text"><a href="">내용이 들어갈 부분입니다. 안들어갈수도 있어요. </a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
			</div>
		</div>
		<div class="card" style="width: 300px; height: auto; display: inline-block;">
		<a href="<%= request.getContextPath()%>/views/board/galleryDetail.jsp"><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall4.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="<%= request.getContextPath()%>/views/board/galleryDetail.jsp">제목부분</a></h5>
				<p class="card-text"><a href="<%= request.getContextPath()%>/views/board/galleryDetail.jsp">내용이 들어갈 부분입니다. 안들어갈수도 있어요. </a></p>
					<button disabled class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/view.png" alt="" style="height:22px;">12</button>
					<button onclick="addLike();" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;">14</button>
					<button src="<%= request.getContextPath()%>/views/board/galleryDetail.jsp" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 22</button>
			</div>
		</div>
 		<%-- 
		<div class="galleryList">
		<% for (Gallery gal : gList) { %>
			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href=""> <!-- galleryUploadFiles/%=gal.getBoardfile() % -->
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall1.png"
			alt="Card image cap" class="gallery"></a>
				<div class="card-body">
					<h5 class="card-title"><a href="">제목부분</a></h5>
					<p class="card-text"><a href="">내용이 들어갈 부분입니다. 안들어갈수도 있어요.</a></p>
					<button disabled class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" alt="" style="height:22px;"><%= gal.getBcount() %></button>
					<button onclick="addLike*();" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"><%= gal.getGlike() %></button>
					<button src="<%= request.getContextPath()%>/views/board/galleryDetail.jsp" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 22</button>
				</div>
			</div>
		<% } %>
		</div>
		<script>
			$(function(){
				$("#gal-list").click(function(){
					// 눌렀을때 갤러리 상세로 이동
					var bno = $(this).children().children().eq(0).val();
					location.href="<%=request.getContextPath()%>/selectOne.ga?bno=" + bno;
				})
			});
		</script>
 --%>

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