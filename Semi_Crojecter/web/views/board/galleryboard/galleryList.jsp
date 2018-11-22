<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.gallery.model.vo.*" %>
 
<% ArrayList<Gallery> gList = (ArrayList<Gallery>)request.getAttribute("glist");
System.out.println("jps gList : " + gList);%> 
 
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
		<% if(gList == null) { %>
			검색결과가 없습니다.
		<% } else { %>
		<% for (Gallery g : gList) { %>
			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href="<%= request.getContextPath()%>/gSelectOne.ga?bid=<%= g.getBid() %>">
			<% if(g.getFName() != null) { %>
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%= g.getFName() %>">
			<% } else { %>
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/icon/upload.png">
			<% } %>
			</a>
				<div class="card-body">
					<h5 class="card-title"><%= g.getMname() %> | <a style="text-decoration:none; color:black;" href="<%= request.getContextPath()%>/gSelectOne.ga?bid=<%= g.getBid() %>"><%= g.getBtitle() %></a></h5>
					<% if(g.getgTag() != null) {
						String tags[] = g.getgTag().split(",");
						for(int i = 0; i < tags.length; i++) { %>
						<a style="text-decoration:none;" href="<%= request.getContextPath()%>/search.all?keyword=<%= tags[i] %>">#<%= tags[i] %></a>
						<% }
					} else {
						
					} %>
					<br>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" style="height:22px;"><%= g.getBcount() %>
					</label>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" style="height:22px;"><%= g.getLikeCnt() %>
					</label>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" style="height:22px;"><%= g.getCommCnt() %>
					</label>
				</div>
			</div>
		<% } %>
		<% } %>
		</div>
</body>
</html>