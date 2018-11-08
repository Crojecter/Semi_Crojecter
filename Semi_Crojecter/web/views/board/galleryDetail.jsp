<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.gallery.model.vo.*, com.kh.member.model.vo.Member" %>

<%
	Member m = (Member)session.getAttribute("member");
	System.out.println("m : " + m);

	Gallery g = (Gallery)request.getAttribute("gallery");
	GalleryForDetail gfd = (GalleryForDetail)request.getAttribute("gfd");
	
	System.out.println("g : " + g);
	System.out.println("gfd : " + gfd);
	
	//ArrayList<BoardComment> clist = (ArrayList<BoardComment>) request.getAttribute("clist"); 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/myWeb/resources/js/jquery-3.3.1.min.js"></script>
<style>
	.outer{
		width:800px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	td {
		border:1px solid black;
		background : black;
		color: white;
	}

	.tableArea {
		border:1px solid black;
		background : white;
		color: black;
		width:800px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	
	.followBtn {
		background : red;
	}
	
	.unfollowBtn {
		background : yellow;
	}
	
</style>

<title>갤러리 상세보기</title>
</head>
<body>

	<div class="outer">
		<br>
		<h2 align="center">게시글 내용</h2>
		
		<div class="tableArea">
			<table align="center" width="800px">
				<tr>
					<td>제목 </td>
					<td colspan="5"><span><%= g.getBtitle() %></span></td>
				</tr>
				<tr>
					<td>작성자 </td>
					<td><span><%= gfd.getMname() %></span></td>
					<td>작성일</td>
					<td><span><%= g.getBdate() %></span></td>
					<td>조회수 </td>
					<td><span><%= g.getBcount() %></span></td>
				</tr>
				<tr>
					<td>카테고리 </td>
					<td><span><%= gfd.getGcategory() %></span></td>
					<td>태그</td>
					<td><span><%= g.getGtag() %></span></td>
					<td>ccl </td>
					<td><span><%= gfd.getCclname() %></span></td>
				</tr>
				<tr>
					<td colspan="6">내용 </td>
				</tr>
				<tr>
					<td colspan="6">
					<p id="content"><%= g.getBcontent() %>
					</td>
				</tr>
			</table>

		</div>
		
		<div align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/aaa.aa'">좋아요</button>
			<button onclick="location.href='<%= request.getContextPath() %>/aaa.aa'">후원하기</button>
			<button onclick="location.href='<%= request.getContextPath() %>/aaa.aa'">신고</button>
			<button onclick="location.href='/crojecter/main.html'">목록</button>
			
			<% if(m != null && m.getMname().equals(gfd.getMname())){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/gUpView.ga?bid='+<%=gfd.getBid()%>">수정하기</button>
			<% } %>
			
			<br>
			
			<button type="button" class="followBtn">팔로우</button>
	
		</div>

	</div>

	<script>

		$(function() {
				$.ajax({
					url : "/crojecter/fCheck.fo",
					type : "get",
					data : {
						wid : <%=g.getBwriter()%>,
						mid : <%=m.getMid()%>
					},
					success : function(data) {
						if(data == 'ok') {
							console.log("이미 팔로우 한 상태");
							$('.followBtn').attr('class','unfollowBtn');
						} else if(data == 'no') {
							console.log("아직 팔로우하지 않은 상태");
						}
					},
					error : function() {
						console.log("follow 정보 가져오기 실패");
					}
				});
		})

		
 		$(".followBtn").click(function(){
			$.ajax({
				url : "/crojecter/fInsert.fo",
				type : "get",
				data : {
					wid : <%=g.getBwriter()%>,
					mid : <%=m.getMid()%>
				}, 
				success : function(data){
					
					if(data == 'ok') {
						console.log('ok');
						$('.followBtn').attr('class','unfollowBtn');
					} else {
						console.log('no');
					}
					
				}, 
				error : function(data){
					console.log("follow 테스트 실패");
				}
			});
		}); 

		$(".unfollowBtn").click(function(){
			$.ajax({
				url : "/crojecter/fDelete.fo",
				type : "get",
				data : {
					wid : <%=g.getBwriter()%>,
					mid : <%=m.getMid()%>
				}, 
				success : function(data){
					
					if(data == 'ok') {
						console.log('ok');
						$('.unfollowBtn').attr('class','followBtn');
					} else {
						console.log('no');
					}
				}, 
				error : function(data){
					console.log("follow 테스트 실패");
				}
			});
		}); 
		
		
	</script>
	
</body>
</html>