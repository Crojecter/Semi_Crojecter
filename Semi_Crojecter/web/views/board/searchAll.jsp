<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.common.model.vo.*"%>
<%
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	System.out.println("jsp bList : " + bList);
	int count = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<% if(bList == null) { %>
		검색결과가 없습니다.
	<% } else { %>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" align="right"><label>검색 결과 총 "<%= bList.size() %>"개 입니다.</label></div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<h3 style="text-align:center;">갤러리</h3>
		<br />		<% for (Board b : bList) { %>
			<% if(b.getBtype() == 2) { %>
			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href="<%= request.getContextPath()%>/gSelectOne.ga?bid=<%= b.getBid() %>">
			<% if(b.getFname() != null) { %>
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%= b.getFname() %>">
			<% } else { %>
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/icon/upload.png">
			<% } %>
			</a>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%= b.getBtitle() %></a></h5>
					<% if(b.getTag() != null) {
						String tags[] = b.getTag().split(",");
						for(int i = 0; i < tags.length; i++) { %>
						<a href="<%= request.getContextPath()%>/search.all?keyword=<%= tags[i] %>"><%= tags[i] %></a>
						<% }
					} else {
						
					} %>
					<br>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" style="height:22px;"><%= b.getBcount() %>
					</label>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" style="height:22px;"><span class="likeit"></span>
					</label>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" style="height:22px;">수
					</label>
				</div>
			</div>
			<script>
				$(document).ready(function(){
					$.ajax({
						data : { bid : <%= b.getBid() %>, btype : <%= b.getBtype() %> },
						url : "/crojecter/search.like",
						success : function(data){
							console.log("성공 : " + data);
							$(".likeit").text(data);
						}
					})
				})
			</script>
			<% count ++; } %>
		<% } %>
		<% if(count == 0) { %>
		<h4 style="margin-left:30px;">갤러리 검색결과가 없습니다.</h4>
		<% } else { count = 0; } %>
		<hr style="height:3px; background:gray;"/>
		<h3 style="text-align:center;">프로젝트</h3>
		<br />
		<% for (Board b : bList) { %>
			<% if(b.getBtype() == 3) { %>

			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href="<%= request.getContextPath()%>/jSelectOne.pr?bid=<%= b.getBid() %>">
			<% if(b.getFname() != null) { %>
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%= b.getFname() %>">
			<% } else { %>
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/images/icon/upload.png">
			<% } %></a>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%= b.getBtitle() %></a></h5>
					<% if(b.getTag() != null) {
						String tags[] = b.getTag().split(",");
						for(int i = 0; i < tags.length; i++) { %>
						<a href="<%= request.getContextPath()%>/search.all?keyword=<%= tags[i] %>"><%= tags[i] %></a>
						<% }
					} else {
						
					} %>
					<br>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" style="height:22px;"><%= b.getBcount() %>
					</label>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" style="height:22px;"><span class="likeit"></span>
					</label>
					<label>
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" style="height:22px;">수
					</label>
				</div>
			</div>
			<%-- <script>
				$(document).ready(function(){
					$.ajax({
						data : { bid : <%= b.getBid() %>, btype : <%= b.getBtype() %> },
						url : "/crojecter/search.like",
						success : function(data){
							//console.log("성공 : " + data);
							$(".likeit").text(data);
						}
					})
				})
			</script> --%>
			<% count ++; } %>
		<% } %>
		<% if(count == 0) { %>
		<h4 style="margin-left:30px;">프로젝트 검색결과가 없습니다.</h4>
		<% } else { count = 0; } %>
		<hr style="height:3px; background:gray;"/>
		<h3 style="text-align:center;">공지사항</h3>
		<br />
		<% for (Board b : bList) { %>
			<% if(b.getBtype() == 1) { %>
			<table style="width:600px; height:30px; text-align:center; margin:auto;">
				<tr onclick="location.href='<%= request.getContextPath()%>/nSelectOne.no?bid=<%= b.getBid() %>'">
					<td style="width:20px;"><%= b.getBid() %></td>
					<td style="width:260px;"><%= b.getBtitle() %></td>
					<td style="width:80px;"><%= b.getMname() %></td>
					<td style="width:140px;"><%= b.getBdate() %></td>
					<td style="width:20px;"><%= b.getBcount() %></td>
				</tr>
			</table>
			<% count ++; } %>
		<% } %>
		<% if(count == 0) { %>
		<h4 style="margin-left:30px;">공지사항 검색결과가 없습니다.</h4>
		<% } else { count = 0; } %>
	<% } %>
	</div>
	<div class="col-md-2"></div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>