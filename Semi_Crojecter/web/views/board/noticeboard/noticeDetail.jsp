<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.notice.model.vo.*, com.kh.member.model.vo.Member, java.util.*, com.kh.boardcomment.model.vo.*" %>

<%
   Notice n = (Notice)request.getAttribute("notice");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<style>
.outer {
	width: 1000px;
	height: auto;
	color: black;
	margin: 100px;
	padding: 20px;
	border: 1px solid gray;
}
</style>

<title>공지사항 상세보기</title>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<div class="outer">
		<h1>공지사항</h1>
		<hr />
		<div>
			<span style="font-size:18px;"><%= n.getBtitle() %></span>
			<span style="float:right;"><%= n.getBdate() %></span>
		</div>
		<hr />
		<p id="content"><%= n.getBcontent() %></p>
		<br /><br /><hr />

		<div align="center" style="display: inline;">
			<% if(m != null && m.getMid() == n.getBwriter()) { // 글쓴이 본인인 경우 %>
			<button onclick="location.href='<%= request.getContextPath() %>/nUpView.no?bid='+<%=n.getBid()%>">수정하기</button>
			<button onclick="location.href='<%= request.getContextPath() %>/nDelete.no?bid='+<%=n.getBid()%>">삭제하기</button>
			<br /> 
			<% } %>
			<input type="button" onclick="location.href='/crojecter/main.html'" value="목록" />
		</div>
	</div>

	<%@ include file="../../common/footer.jsp"%>
</body>
</html>