<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.notice.model.vo.*, com.kh.member.model.vo.Member, java.util.*, com.kh.boardcomment.model.vo.*" %>

<%
	Notice n = (Notice)request.getAttribute("notice");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<style>
	.outer{
		width:800px;
		height:auto;
		background:lightblue;
		color:black;
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
	
	.btn {
		width: 150px;
		height: 50px;
		border: 1px solid blue;
		background: lightyellow;
	}	
</style>

<title>공지사항 상세보기</title>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>

	<div class="outer">		
		<div class="tableArea">
			<table align="center" width="800px">
				<tr>
					<td>제목 </td>
					<td colspan="5"><span><%= n.getBtitle() %></span></td>
				</tr>
				<tr>
					<td>작성자 </td>
					<td><span id="parentGetName"><%= n.getMname() %></span></td>
					<td>작성일</td>
					<td><span><%= n.getBdate() %></span></td>
					<td>조회수 </td>
					<td><span><%= n.getBcount() %></span></td>
				</tr>
				<tr>
					<td colspan="6">내용 </td>
				</tr>
				<tr>
					<td colspan="6">
					<p id="content"><%= n.getBcontent() %>
					</td>
				</tr>
			</table>
		</div>
		
		<div align="center" style="display:inline;">
			<% if(m != null && m.getMid() == n.getBwriter()) { // 글쓴이 본인인 경우 %>
			<button onclick="location.href='<%= request.getContextPath() %>/nUpView.no?bid='+<%=n.getBid()%>">수정하기</button>
			<button onclick="location.href='<%= request.getContextPath() %>/nDelete.no?bid='+<%=n.getBid()%>">삭제하기</button>
			<input type="button" onclick="location.href='/crojecter/main.html'" value="목록"/>
			<% } %>	
		</div>
		
	</div>
	
</body>
</html>
