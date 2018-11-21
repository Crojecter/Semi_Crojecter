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
		height: 300px; 
		display: inline-block;
		padding-top:30px;
	}
	
	#gal-list a {
	
		color:darkgray;
		font-weight:bold;
		font-size: 18px;
	}
	
	.card-title {
	
		text-align:center;
	}
	

</style>
</head>
<body>
<%@ include file="../mypage/common/mypageHeader.jsp"%><br><br>
<form action="<%=request.getContextPath()%>/collectView.do" method="post">
<div class="collectList">
		<% for(Likeit l : list){ %>
		<%-- <% System.out.println("gList jsp : "+gList); %> --%>
			<div id="gal-list" class="card">
			<a href="">
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%= l.getFname() %>"
			alt="Card image cap" class="gallery"></a>
				<div class="card-body">
					<h5 class="card-title"><a class="classA" name="title" href=""><%= l.getBtitle() %></a></h5>
					<h5 class="card-title"><a href=""><%= l.getMname() %></a></h5>
				</div>
			</div>
		<% } %>
		</div>
</form>
</body>
</html>