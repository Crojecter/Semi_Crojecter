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
	<h1> 프로젝트 페이지입니다.</h1>
	
	<div class="searchArea" align="center">
		<select id="searchCondition" name="searchCondition">
			<option>---</option>
			<option value="writer">작성자</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="search">
		<button type="submit">검색하기</button>
	</div>


		<div class="galleryList">
<%-- 
		<!-- 상세데이터 조회용 코드 -->
		<% if(gList != null){ %>
			
			<table align="center" id="projectList" style="background:lightblue">
			<tr id="noticeTR">

				<th id="noticeTH" width="50px">갤러리 id</th>
				<th id="noticeTH" width="50px">갤러리 종류</th>
				<th id="noticeTH" width="50px">갤러리 태그</th>
				<th id="noticeTH" width="50px">갤러리 좋아요</th>
				<th id="noticeTH" width="50px">보드명</th>
				<th id="noticeTH" width="50px">보드 타입</th>
				<th id="noticeTH" width="50px">게시글 제목</th>
				<th id="noticeTH" width="50px">게시글 내용</th>
				<th id="noticeTH" width="50px">조회수</th>
				<th id="noticeTH" width="50px">작성일</th>
				<th id="noticeTH" width="50px">상태</th>
				<th id="noticeTH" width="50px">작성자</th>
				
			</tr>
			<% for(Gallery gal : gList){ %>
			<tr id="noticeTR">				
				<td id="noticeTD"><%= gal.getGid() %></td>
				<td id="noticeTD"><%= gal.getGcategoryid() %></td>
				<td id="noticeTD"><%= gal.getGtag() %></td>
				<td id="noticeTD"><%= gal.getGlike() %></td>
				<td id="noticeTD"><%= gal.getBid() %></td>
				<td id="noticeTD"><%= gal.getBtype() %></td>
				<td id="noticeTD"><%= gal.getBtitle() %></td>
				<td id="noticeTD"><%= gal.getBcontent() %></td>
				<td id="noticeTD"><%= gal.getBcount() %></td>
				<td id="noticeTD"><%= gal.getBdate() %></td>
				<td id="noticeTD"><%= gal.getBstatus() %></td>
				<td id="noticeTD"><%= gal.getBwriter() %></td>
			</tr>
			<% } %>
	
			</table>
			
		<% } else { %>
				현재 갤러리 내용이 없습니다.
		<% } %>
		</div>	
		
 --%>
		
		<% for (Project pr : pList) { %>
			<% System.out.println("pList jsp : "+pList); %>
			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href=""> <!-- galleryUploadFiles/%=gal.getBoardfile() % -->
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall1.png"
			alt="Card image cap" class="gallery"></a>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%= pr.getBtitle() %></a></h5>
					<%-- <p class="card-text"><a href=""><%= pr.getGtag() %></p> --%>
					<button disabled class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" 
					alt="" style="height:22px;"><%= pr.getBcount() %></button>
					<%-- <button onclick="addLike();" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" 
					alt="" style="height:22px;"><%= pr.getGlike() %></button> --%>
					<button src="<%= request.getContextPath()%>/views/board/galleryDetail.jsp" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" 
					alt="" style="height:22px;"> 수</button>
				</div>
			</div>
		<% } %>
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