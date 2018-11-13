<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.*, java.util.*"%>
<%
	ArrayList<Member> mlist = (ArrayList<Member>)request.getAttribute("mlist"); 
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
	<select id="searchMember" name="searchMember">
		<option>---</option>
		<option value="name">이름</option>
		<option value="email">이메일</option>
	</select>
		<input type="search">
		<button type="button" onclick="search();">검색하기</button>
</div>
<table>
	<tr>
		<th>날짜</th>
		<th>이름</th>
		<th>이메일</th>
		<th>내용</th>
		<th>사용내역</th>
		<th>잔액</th>
		
    </tr>
    <% for(Member m : mlist){ %>
	<tr>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>	
		<td><%= %></td>
		<td><%= %></td>	
	</tr>
	<% } %>
</table>
<script>
	function search(){
		location.href="<%=request.getContextPath()%>/searchPayment.do?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
	}
</script>
</body>
</html>