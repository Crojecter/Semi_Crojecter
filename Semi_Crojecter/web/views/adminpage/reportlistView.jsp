<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.report.model.vo.*, java.util.*"%>
<%
	ArrayList<Report> rlist = (ArrayList<Report>)request.getAttribute("rlist"); 
	System.out.println("rlist : " + rlist);
%>
<!DOCTYPE html>
<html>

<head>
<script src="/crojecter/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
.outer{
		width:900px;
		height:600px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table {
		padding : 20px;
		border:1px solid white;
		text-align:center;
	}
	.tableArea {
		width:750px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	.searchArea {
		width:650px;
		margin-left:auto;
		margin-right:auto;
	}
</style>
</head>
<body>
<%@ include file="../adminpage/common/adminpageHeader.jsp" %>
<div class="searchArea">
	<select id="searchList" name="searchList" type="submit">
		<option>---</option>
		<option value="date" href="">날짜순</option>
		<option value="comment" href="">사유순</option>
	</select>
</div>
<table>
	<tr>
		<th>날짜</th>
		<th>사유</th>
		<th>신고자</th>
		<th>작성자</th>
		<th>게시물 번호</th>
		<th>댓글 번호</th>
    </tr>
    <% for(Report r : rlist){ %>
	<tr>
		<td><%= r.getRdate() %></td>
		<td><%= r.getRetc() %>
		<td><%= r.getMname() %></td>
		<td><%= r.getCwriter() %></td>		
		<td><%= r.getBid() %></td>
		<td><%=	r.getCid()%></td>
	</tr>
	<% } %>
</table>

</body>
</html>