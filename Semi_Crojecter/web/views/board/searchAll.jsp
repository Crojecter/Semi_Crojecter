<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.common.model.vo.*"%>
<%
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	System.out.println("jsp bList : " + bList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<% if(bList == null) { %>
		검색결과가 없습니다.
	<% } else { %>
		공지사항
		<br />
		<% for (Board b : bList) { %>
			<% if(b.getBtype() == 1) { %>

			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href=""> <!-- galleryUploadFiles/%=gal.getBoardfile() % -->
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%-- <%= b.getFname() %> --%>이미지경로.png"
			alt="Card image cap" class="gallery"></a>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%= b.getBtitle() %></a></h5>
					<p class="card-text"><a href="">태그<%-- <%= b.getGtag() %> --%></a></p>
					<button disabled class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" alt="" style="height:22px;"><%= b.getBcount() %>
					</button>
					<button onclick="addLike();" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" 
					alt="" style="height:22px;" data-toggle="tooltip" title="좋아요 +1">좋아요<%-- <%= b.getGlike() %> --%></button>
					<button src="<%= request.getContextPath()%>/views/board/galleryDetail.jsp" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" 
					alt="" style="height:22px;">수</button>
				</div>
			</div>
			<% } %>
		<% } %>
		<hr />
		갤러리
		<br />
		<% for (Board b : bList) { %>
			<% if(b.getBtype() == 2) { %>

			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href=""> <!-- galleryUploadFiles/%=gal.getBoardfile() % -->
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%-- <%= b.getFname() %> --%>이미지경로.png"
			alt="Card image cap" class="gallery"></a>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%= b.getBtitle() %></a></h5>
					<p class="card-text"><a href="">태그<%-- <%= b.getGtag() %> --%></a></p>
					<button disabled class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" alt="" style="height:22px;"><%= b.getBcount() %>
					</button>
					<button onclick="addLike();" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" 
					alt="" style="height:22px;" data-toggle="tooltip" title="좋아요 +1">좋아요<%-- <%= b.getGlike() %> --%></button>
					<button src="<%= request.getContextPath()%>/views/board/galleryDetail.jsp" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" 
					alt="" style="height:22px;">수</button>
				</div>
			</div>
			<% } %>
		<% } %>
		<hr />
		프로젝트
		<br />
		<% for (Board b : bList) { %>
			<% if(b.getBtype() == 3) { %>

			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href=""> <!-- galleryUploadFiles/%=gal.getBoardfile() % -->
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%-- <%= b.getFname() %> --%>이미지경로.png"
			alt="Card image cap" class="gallery"></a>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%= b.getBtitle() %></a></h5>
					<p class="card-text"><a href="">태그<%-- <%= b.getGtag() %> --%></a></p>
					<button disabled class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" alt="" style="height:22px;"><%= b.getBcount() %>
					</button>
					<button onclick="addLike();" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" 
					alt="" style="height:22px;" data-toggle="tooltip" title="좋아요 +1">좋아요<%-- <%= b.getGlike() %> --%></button>
					<button src="<%= request.getContextPath()%>/views/board/galleryDetail.jsp" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" 
					alt="" style="height:22px;">수</button>
				</div>
			</div>
			<% } %>
		<% } %>
	<% } %>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>