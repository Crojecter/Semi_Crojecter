<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.kh.member.model.vo.*, com.kh.board.gallery.model.vo.*, java.util.*"%>
<% 
	ArrayList<Gallery> glist = (ArrayList<Gallery>)session.getAttribute("glist");
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
<div class="card">
<form action="<%=request.getContextPath()%>/mworkView.do" method="post"></form>
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall1.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title  <span id="cid" class="badge" style="background:black; color:white;">5</span></a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
			</div>
		</div>
		<div class="card">
		<a href=""><img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/galSample/gall4.png" alt="Card image cap" class="gallery"></a>
			<div class="card-body">
				<h5 class="card-title"><a href="">Card title</a></h5>
				<p class="card-text"><a href="">Some quick example text to build on the card title and make up the bulk of the card's content.</a></p>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/eye.png" alt="" style="height:22px;"> 0000</a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/like.png" alt="" style="height:22px;"></a>
				<a href="#" class="btn btn-primary"><img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;"> 2200</a>
			</div>
		</div>

</body>
</html>