<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.kh.board.notice.model.vo.*, java.util.*, com.kh.board.gallery.model.vo.*"%>
<% 
	ArrayList<Gallery> glist = (ArrayList<Gallery>)request.getAttribute("glist"); 
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
<%@ include file="../mypage/common/mypageHeader.jsp" %>
<form action="<%=request.getContextPath()%>/mworkView.do" method="post">
<div class="row galleryList">
	<div class="col-md-2"></div>
	<div class="col-md-8" style="margin-bottom: 50px; margin-top: 50px;">
		<% if(glist.size() > 0) { %>
		<% for (Gallery gal : glist) { %>
			<%-- <% System.out.println("gList jsp : "+gList); %> --%>
			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
				<input type="hidden" value="<%= gal.getBid() %>" />
				<a href=""> <!-- galleryUploadFiles/%=gal.getBoardfile() % -->
				<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%= gal.getFname() %>"
				 	alt="Card image cap" class="gallery">
				</a>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%= gal.getBtitle() %></a></h5>
					<p class="card-text"><a href=""><%= gal.getGtag() %></a></p>
					<button disabled class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" alt="" style="height:22px;"><%= gal.getBcount() %>
					</button>
					<button onclick="addLike();" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" 
						 alt="" style="height:22px;" data-toggle="tooltip" title="좋아요 +1"><%= gal.getGlike() %>
					</button>
					<button src="<%= request.getContextPath()%>/views/board/galleryDetail.jsp" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" alt="" style="height:22px;" />
					</button>
				</div>
			</div>
			<%} }   else { %>
			<div class="alarm" align="center">아직 업로드한 작품이 없습니다.</div>
		<% } %>
		</div>
	<div class="col-md-2"></div>
</div>

		<script>
			$(function(){
				$("#gal-list").click(function(){
					// 눌렀을때 갤러리 상세로 이동
					var bno = $(this).children().eq(0).val();
					location.href="<%=request.getContextPath()%>/gSelectOne.ga?bid=" + bno;
				})
			});
		</script>
</form>
<%@ include file="../common/footer.jsp" %>
</body>
</html>