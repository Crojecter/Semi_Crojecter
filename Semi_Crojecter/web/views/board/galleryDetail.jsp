<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.gallery.model.vo.*, com.kh.member.model.vo.Member" %>

<%
	Member m = (Member)session.getAttribute("member");
	System.out.println("m : " + m);

	Gallery g = (Gallery)request.getAttribute("gallery");
	//ArrayList<BoardComment> clist = (ArrayList<BoardComment>) request.getAttribute("clist"); 
	
	System.out.println("g : " + g);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
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
	
	.btn {
		width: 200px;
		height: 50px;
		border: 1px solid blue;
		background: lightyellow;
	}
	
	.active {
		background: red;
	}
	
	
	
</style>

<title>갤러리 상세보기</title>
</head>
<body>

	<div class="outer">
		<br>
		<h2 align="center">게시글 내용</h2>
		
		<div class="tableArea">
			<%if(m != null)  {  %>
			<span id="parentGetmid" style="display:none;"><%= m.getMid() %></span> <% } %>
			<table align="center" width="800px">
				<tr>
					<td>제목 </td>
					<td colspan="5"><span><%= g.getBtitle() %></span></td>
				</tr>
				<tr>
					<td>작성자 </td>
					<td><span id="parentGetName"><%= g.getMname() %></span></td>
					<td>작성일</td>
					<td><span><%= g.getBdate() %></span></td>
					<td>조회수 </td>
					<td><span><%= g.getBcount() %></span></td>
				</tr>
				<tr>
					<td>카테고리 </td>
					<td><span><%= g.getGcategoryname() %></span></td>
					<td>태그</td>
					<td><span><%= g.getGtag() %></span></td>
					<td>ccl </td>
					<td><span><%= g.getCclname() %></span></td>
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
			<button onclick="showSpon();">후원하기</button>
			<button onclick="location.href='<%= request.getContextPath() %>/aaa.aa'">신고</button>
			<button onclick="location.href='/crojecter/main.html'">목록</button>
			
			<% if(m != null && m.getMid() == g.getBwriter()){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/gUpView.ga?bid='+<%=g.getBid()%>">수정하기</button>
			<% } %>
			
			<br>

			<div id="btnFollow" class="btn btn-follow">
				<p id="p-follow" style="color: black">팔로우</p>
			</div>
			
			<div id="btnLikeit" class="btn btn-likeit">
				<p id="p-likeit" style="color: black">좋아요</p>
			</div>
	
		</div>

	</div>
	
	<div class="commentOuter">
	
	
	</div>
	
	<script>
	
		var windowObj = null;
	
		function showSpon() {
			var xPos = (document.body.clientWidth / 2) - (500 / 2); 
		    xPos += window.screenLeft;
		    var yPos = (screen.availHeight / 2) - (300 / 2);
		    
		    windowObj = window.open('<%= request.getContextPath() %>/views/board/popupSpon.jsp', '후원', 'width=500,height=300,top='+yPos+',left='+xPos+',toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no');
		}
	</script>
	
	
	<%if(m != null && m.getMid() == g.getBwriter()) { //글쓴이 본인인 경우 %>
		<script>
		$('#btnFollow').click(function(){
			alert("본인은 팔로우할 수 없습니다.");
		});
		$('#btnLikeit').click(function(){
			alert("본인 작품은 좋아요 할 수 없습니다.");
		});
		</script>
	<%} else if(m != null) { %>
		<script>
		$(function(){		
			$.ajax({
				url : '/crojecter/fCheck.fo',
				type : 'get',
				data : {
					mid : '<%= m.getMid() %>',
					wid : '<%= g.getBwriter() %>'
				}, 
				success : function(data){
					if(data == 'ok') {
						$("#btnFollow").addClass('active');
						$('#p-follow').html('언팔로우');
					} else if (data == 'no') {
						$("#btnFollow").removeClass('active');
					} 
				}, error : function(data){
					console.log('팔로우버튼 초기화 에러 발생!');
				}
			});
		});
		
		$('#btnFollow').click(function(){
			$.ajax({
				url : '/crojecter/fSwitch.fo',
				type : 'get',
				data : {
					mid : '<%= m.getMid() %>',
					wid : '<%= g.getBwriter() %>'
				}, 
				success : function(data){
					if(data == 'insert') {
						$("#btnFollow").addClass('active');
						$('#p-follow').html('언팔로우');
					} else if (data == 'delete') {
						$("#btnFollow").removeClass('active');
						$('#p-follow').html('팔로우');
					} else {
						console.log('btnFollow() 에러 발생!');
					}
				}, error : function(data){
					console.log('btnFollow() 에러 발생!!');
				}
			});
		});
		
		$('#btnLikeit').click(function(){
			$.ajax({
				url : '/crojecter/lSwitch.li',
				type : 'get',
				data : {
					mid : '<%= m.getMid() %>',
					bid : '<%= g.getBid() %>'
				}, 
				success : function(data){
					if(data == 'insert') {
						$("#btnLikeit").addClass('active');
					} else if (data == 'delete') {
						$("#btnLikeit").removeClass('active');
					} else {
						console.log('btnLikeit() 에러 발생!');
					}
				}, error : function(data){
					console.log('btnLikeit() 에러 발생!!');
				}
			});
		});
		</script>	
	<% } else { %>
		<script>
		$('#btnFollow').click(function(){
			alert("로그인이 필요한 기능입니다.");
		});
		$('#btnLikeit').click(function(){
			alert("로그인이 필요한 기능입니다.");
		});
		</script>
	<% } %>

		
	
</body>
</html>