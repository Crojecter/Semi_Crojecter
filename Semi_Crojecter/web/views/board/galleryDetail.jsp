<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.gallery.model.vo.*, com.kh.member.model.vo.Member" %>

<%
	Member m = (Member)session.getAttribute("member");
	System.out.println("m : " + m);

	Gallery g = (Gallery)request.getAttribute("gallery");
	GalleryForDetail gfd = (GalleryForDetail)request.getAttribute("gfd");
	
	System.out.println("g : " + g);
	System.out.println("gfd : " + gfd);
	
	//ArrayList<BoardComment> clist = (ArrayList<BoardComment>) request.getAttribute("clist"); 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	.outer{
		width:800px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	td {
		border:1px solid black;
		background : black;
		color: white;
	}

	.tableArea {
		border:1px solid black;
		background : white;
		color: black;
		width:800px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
</style>

<title>갤러리 상세보기</title>
</head>
<body>

	<div class="outer">
		<br>
		<h2 align="center">게시글 내용</h2>
		
		<div class="tableArea">
			<table align="center" width="800px">
				<tr>
					<td>제목 </td>
					<td colspan="5"><span><%= g.getBtitle() %></span></td>
				</tr>
				<tr>
					<td>작성자 </td>
					<td><span><%= gfd.getMname() %></span></td>
					<td>작성일</td>
					<td><span><%= g.getBdate() %></span></td>
					<td>조회수 </td>
					<td><span><%= g.getBcount() %></span></td>
				</tr>
				<tr>
					<td>카테고리 </td>
					<td><span><%= gfd.getGcategory() %></span></td>
					<td>태그</td>
					<td><span><%= g.getGtag() %></span></td>
					<td>ccl </td>
					<td><span><%= gfd.getCclname() %></span></td>
				</tr>
				<tr>
					<td colspan="6">내용 </td>
				</tr>
				<tr>
					<td colspan="6">
					<p id="content"><%= g.getBcontent() %>
					</td>
				</tr>
			</table>

		</div>
		
		<div align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/aaa.aa'">팔로우</button>
			<button onclick="location.href='<%= request.getContextPath() %>/aaa.aa'">좋아요</button>
			<button onclick="location.href='<%= request.getContextPath() %>/aaa.aa'">후원하기</button>
			<button onclick="location.href='<%= request.getContextPath() %>/aaa.aa'">신고</button>
			<button onclick="location.href='/crojecter/main.html'">목록</button>
			
			<% if(m != null && m.getMname().equals(gfd.getMname())){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/gUpView.ga?bid='+<%=gfd.getBid()%>">수정하기</button>
			<% } %>

		</div>
		
	</div>
	
	
	<script>
	
	
	
	</script>


</body>
</html>