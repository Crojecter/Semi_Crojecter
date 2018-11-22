<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.project.model.vo.*" %>
 
<% 
	ArrayList<Project> projectList = (ArrayList<Project>)request.getAttribute("projectList"); 
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
		<%@ include file="../../common/header.jsp"%>
		<div class="row projectList" style="margin-bottom: 100px;">
		<div class="col-md-2"></div>
		
		<div class="col-md-8" style="padding: 0;">
		<% if(projectList == null) { %>
			해당 게시글이 존재하지 않습니다.
		<% } else { %>
		<% for (Project pro : projectList) { %>
			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href="<%= request.getContextPath()%>/jSelectOne.pr?bid=<%= pro.getBid() %>">
			<% if(pro.getFName() != null) { %>
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%= pro.getFName() %>">
			<% } else { %>
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/icon/upload.png">
			<% } %>
			</a>
				<div class="card-body">
					<h5 class="card-title"><%= pro.getMname() %> | <a style="text-decoration:none; color:black;" href="<%= request.getContextPath()%>/jSelectOne.pr?bid=<%= pro.getBid() %>"><%= pro.getBtitle() %></a></h5>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" style="height:22px;"><%= pro.getBcount() %>
					</label>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" style="height:22px;"><%= pro.getLikeCnt() %>
					</label>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" style="height:22px;"><%= pro.getCommCnt() %>
					</label>
				</div>
			</div>
				<% } %>
			<% } %>
			</div>
			<div class="col-md-2"></div>
		</div>
		<script>
			$(function(){
				$("#pro-list").click(function(){
					// 눌렀을때 갤러리 상세로 이동
					var bno = $(this).parent().children().eq(0).children().val();
					location.href="<%=request.getContextPath() %>/pSelectOne.pr?bid=" + bid;
				})
			});
			<script>
			
			$(document).ready(function(){
				$.ajax({
					url : "/crojecter/pCountDday.pr?=bid" + bid,
					type : "post",
					success : function(data){
						$("#Dday").text(data);
					}
				});
			});
			</script>
		</script>
		<%@ include file="../../common/footer.jsp"%>
</body>
</html>