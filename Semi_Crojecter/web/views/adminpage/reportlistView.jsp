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
<%@ include file="../mypage/common/mypageHeader.jsp" %>
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
    </tr>
    <% for(Report r : rlist){ %>
	<tr>
		<td><%= r.getRdate() %></td>
		<td><%= r.getRreason() %></td>
		<td><%= r.getRid() %></td>
		<td><%= r.getMid() %></td>		
	</tr>
	<% } %>
</table>

</body>
</html>