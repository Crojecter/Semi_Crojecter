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
	#gal-list {
		width: 300px; 
		height: auto; 
		display: inline-block;
		padding-top:30px;
		margin-left:30px;
		margin-top:100px;
		border:1px solid darkgary;
	}
	
	#gal-list a {
	
		color:darkgray;
		font-weight:bold;
		font-size: 18px;
	}
	
	
	.card-title {
	
		text-align:center;
	}
	
	.alarm {
	
	color:black;
	padding-top:100px;
	font-weight:bold;
	
	}
	
	.card-img-top {
	
	width:250px;
	height:250px;
	}

	

</style>
</head>
<body>
<%@ include file="../mypage/common/mypageHeader.jsp"%><br><br>
<form action="<%=request.getContextPath()%>/collectView.do" method="post">
<div class="collectList">
	<% if(list.size() > 0) { %>
	<% for(Likeit l : list){ %>
	<div id="gal-list" class="card">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%= l.getFname() %>"
						alt="Card image cap" class="gallery"></a>
		<div class="card-body">
			<h5 class="card-title"><a class="classA" href=""><%= l.getBtitle() %></a></h5>
			<h5 class="card-title"><a href=""><%= l.getMname() %></a></h5>
		</div>
	</div>
	<% } } else { %>
		<div class="alarm" align="center">아직 좋아요한 작품이 없습니다.</div>
	<% } %>
</div>
</form>
<%@ include file="../common/footer.jsp" %>
</body>
</html>