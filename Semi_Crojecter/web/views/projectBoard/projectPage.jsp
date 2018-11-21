<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.project.model.vo.*" %>
<% ArrayList<Project> pList = (ArrayList<Project>)request.getAttribute("list"); 
	/* System.out.println("GalleryList ArrayList : "+ gList); */
	/* PageInfo pi = (PageInfo)request.getAttribute("pi");
	//System.out.println("PageInfo gl : "+ pi);
	int currentPage = pi.getCurrentPage();
	int listCount = pi.getListCount();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); */
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project Page</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%-- <% for (Project pr : pList) { %>
			<% System.out.println("pList jsp : "+pList); %> --%>
			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href=""> <!-- galleryUploadFiles/%=gal.getBoardfile() % -->
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall1.png"
			alt="Card image cap" class="gallery"></a>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%-- <%= pr.getBtitle() %> --%>제목</a></h5>
					<%-- <p class="card-text"><a href=""><%= pr.getGtag() %></p> --%>
					<button disabled class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" 
					alt="" style="height:22px;"><%-- <%= pr.getBcount() %> --%> 조회수</button>
					<%-- <button onclick="addLike();" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" 
					alt="" style="height:22px;"><%= pr.getGlike() %></button> --%>
					<button src="<%= request.getContextPath()%>/views/board/galleryDetail.jsp" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" 
					alt="" style="height:22px;">댓글수</button>
					
					디데이 추가해야됨
				</div>
			</div>
		<%-- <% } %> --%>
		</div>

	<!-- 리모컨 -->
	<div style="position: fixed; right: 50%; top: 80%; margin-right: -720px; text-align:center; width: 10%;">
	<button><a href="#top"><img src="<%= request.getContextPath()%>/resources/images/icon/up.png" alt="" style="height:30px;"></a></button><br>
	<button><a href="#bottom"> <img src="<%= request.getContextPath()%>/resources/images/icon/down.png" alt="" style="height:30px;"></a></button>
	</div>
	<a name="bottom"></a>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>