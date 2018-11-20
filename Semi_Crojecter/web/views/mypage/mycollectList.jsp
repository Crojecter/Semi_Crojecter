<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.likeit.model.vo.*"%>
    
<%
	ArrayList<Likeit> list = (ArrayList<Likeit>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<script src="/crojecter/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
	#name {
		color:black
	}
</style>
</head>
<body>
<%@ include file="../mypage/common/mypageHeader.jsp"%>
<form action="<%=request.getContextPath()%>/collectView.do" method="post">
<div class="collectList">
	<table>  
		<% for(Likeit l : list){ %>
		<tr>
			<td><%=l.getBtitle() %></td>
			<td><%=l.getBwriter() %></td>
		</tr>
		<% } %>
	</table>
</div>
</form>
</body>
</html>