<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.project.model.vo.*" %>
 
<% 
	ArrayList<Project> projectList = (ArrayList<Project>)request.getAttribute("projectList"); 
	System.out.println("projectList : " + projectList);
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
		
		<% for (Project pro : projectList) { %>
			<div id="pro-list" class="card" style="width: 300px; height: auto; display: inline-block;">
				<div style="width: 300px; height: 300px; display: inline-block; ">
					<a href="">		
					<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%= pro.getFname() %>"
					alt="Card image cap" class="project"></a>
				</div>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%= pro.getBtitle() %></a></h5>
					<% if(pro.getJtag() != null) {
						String tags[] = pro.getJtag().split(",");
						for(int i = 0; i < tags.length; i++) { %>
						<a style="text-decoration:none;" href="<%= request.getContextPath()%>/search.all?keyword=<%= tags[i] %>">#<%= tags[i] %></a>
						<% }
					} else {
						
					} %>
					<div>

						<button disabled class="btn btn-primary">
						<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" id="proImg" style="height:22px;"><%= pro.getBcount() %>
						</button>
						<button onclick="" class="btn btn-primary">
						<img src="<%= request.getContextPath()%>/resources/images/icon/dday.png" 
						alt="" style="height:22px;" data-toggle="tooltip" title=""><%= pro.getJend() %></button>
						<button src="<%= request.getContextPath()%>/views/board/projectDetail.jsp" class="btn btn-primary">
						<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" 
						alt="" style="height:22px;"><%= pro.getCommCnt() %></button>
						<span id=Dday>.</span>

					</div>
				</div>
				
				</div>
				<% } %>
				<div class="col-md-2"></div>
			</div>
				
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