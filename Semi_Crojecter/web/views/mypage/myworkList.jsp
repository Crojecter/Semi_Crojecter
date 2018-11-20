<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.kh.board.notice.model.vo.*, java.util.*"%>
<% 
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<script src="/crojecter/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
	.card{
		margin: 20px 20px 20px 20px;
		width: 300px; 
		height: auto; 
		display: inline-block;
		border: solid 1px black;
	}
	
	.card-title{

		background:black; 
		color:white;
		text-decoration: none;
	}
	
	.card-text{

		
	}
	
	.card-body{

	}
	
	
</style>
</head>
<body>
<%@ include file="../mypage/common/mypageHeader.jsp" %>
<form action="<%=request.getContextPath()%>/mworkView.do" method="post">
<div>
<table>
<% for(Notice n : list){ %>
		<tr>
			<td><%=n.getBwriter() %></td>
			<td><%=n.getBtitle()%></td>
			<td><%=n.getBid() %></td>
		</tr>
<% } %>
</table>
</div>
</form>
</body>
</html>