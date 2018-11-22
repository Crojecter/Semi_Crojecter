<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.gallery.model.vo.*" %>
 
<% 
	ArrayList<Gallery> pList = (ArrayList<Project>)request.getAttribute("pList"); 

%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<style>
.card-img-to {
	display: inline-block;
  	vertical-align: middle;
    max-height: 100%;
    max-width: 100%;
}

</style>

</head>
<body style="height:100%;">
		<div class="galleryList">
		

		<% for (Project pro : pList) { %>
			<div id="pro-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<div style="width: 300px; height: 300px; display: inline-block; ">
			<a href=""> <!-- galleryUploadFiles/%=gal.getBoardfile() % -->		
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%= pro.getFname() %>"
			alt="Card image cap" class="gallery"></a>
			</div>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%= pro.getBtitle() %></a></h5>
					<% if(pro.getJtag() != null) {
						String tags[] = pro.getJtag().split(",");
						for(int i = 0; i < tags.length; i++) { %>
						<a href="<%= request.getContextPath()%>/search.all?keyword=<%= tags[i] %>">#<%= tags[i] %></a>
						<% }
					} else {
						
					} %>
					<div>
					<button disabled class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" alt="" style="height:22px;"><%= pro.getBcount() %>
					</button>
					<button onclick="addLike();" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" 
					alt="" style="height:22px;" data-toggle="tooltip" title="좋아요 +1"><%= pro.getGlike() %></button>
					<button src="<%= request.getContextPath()%>/views/board/galleryDetail.jsp" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" 
					alt="" style="height:22px;">수</button>
					</div>
				</div>
			</div>
		<% } %>
		</div>
		<script>
			$(function(){
				$("pro-list").click(function(){
					// 눌렀을때 갤러리 상세로 이동
					var bno = $(this).children().children().eq(0).val();
					location.href="<%=request.getContextPath()%>/selectOne.ga?bno=" + bno;
				})
			});
		</script>

</body>
</html>