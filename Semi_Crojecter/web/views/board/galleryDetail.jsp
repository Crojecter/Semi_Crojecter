<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.gallery.model.vo.*, com.kh.member.model.vo.Member, java.util.*, com.kh.boardcomment.model.vo.*" %>

<%
	Member m = (Member)session.getAttribute("member");
	System.out.println("m : " + m);

	Gallery g = (Gallery)request.getAttribute("gallery");
	ArrayList<BoardComment> clist = (ArrayList<BoardComment>) request.getAttribute("clist"); 
	
	System.out.println("g : " + g);
	System.out.println("clist : " + clist);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<style>
	.outer{
		width:800px;
		height:auto;
		background:lightblue;
		color:black;
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
		width: 150px;
		height: 50px;
		border: 1px solid blue;
		background: lightyellow;
	}
	
	.active {
		background: red;
	}
	
	.commentOuter {
		width:800px;
		height:auto;
		background:lightblue;
		color:black;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
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
		
		<div align="center" style="display:inline;">
			<div id="btnFollow" class="btn btn-follow"><p id="p-follow" style="color: black">팔로우</p></div>			
			<div id="btnLikeit" class="btn btn-likeit"><p id="p-likeit" style="color: black">좋아요</p></div>
			<button onclick="showSpon();">후원하기</button>
			<button onclick="showReport();">신고</button>
			
			<% if(m != null && m.getMid() == g.getBwriter()){ // 글쓴이 본인인 경우 %>
			<button onclick="location.href='<%= request.getContextPath() %>/gUpView.ga?bid='+<%=g.getBid()%>">수정하기</button>
			<% } %>	
		</div>
		<input type="button" onclick="location.href='/crojecter/main.html'" value="목록"/>

	</div>
	
	

	<div class="commentOuter">
	
		<div class="commentWriteArea" style="display:none;">
			<form action="/crojecter/cInsert.co" method="post">
				<input type="hidden" id="cwriter" name="cwriter" value="m.getMid" /> 
				<input type="hidden" name="bid" value="<%=g.getBid()%>" /> 
				<input type="hidden" name="btype" value="<%=g.getBtype()%>" /> 
				<input type="hidden" name="crefmid" value="-1" />
				<div display="inline">
					<textArea rows="3" cols="80" id="commentContent" name="commentContent"></textArea>
					<button class="btn" type="submit" id="addComment">댓글 등록</button>
				</div>
			</form>
		</div>
		
		<div class="commentListArea">
	      <% if( clist != null ) { %>
	      	<% for(BoardComment bc : clist) { %>
	      	
	      	<div class="comment">
	      		<div class="commentInfo" style="display:inline;">
	      			<input type="hidden" name="crefmid" value="<%=bc.getCrefmid() %>" />
	      			<span><%=bc.getCwname() %></span>
	      			<span><%=bc.getCdate() %></span>
	      				
	      			<% if(m != null) { %>
	      			<% if(m.getMid() == bc.getCwriter()) { // 댓글쓴이 본인인 경우%>	
	      				<input type="text" name="cid" value="<%=bc.getCid()%>"/>
							  
						<button type="button" class="updateBtn" onclick="updateComment(this);">수정하기</button> &nbsp;&nbsp;
						<button type="button" class="updateConfirm" onclick="updateConfirm(this);"
							    style="display:none;" >수정완료</button> &nbsp;&nbsp;
						<button type="button" class="deleteBtn" onclick="deleteComment(this);">삭제하기</button> &nbsp;&nbsp;
	      			<% } %>
	      				<input type="hidden" name="cwriter" value="<%=m.getMid()%>"/>
						<input type="hidden" name="cid" value="<%= bc.getCid() %>" />
						<input type="hidden" name="crefmid" value="<%= bc.getCwriter() %>" />
						
						<button type="button" class="insertBtn" onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;				 
						<button type="button" class="insertConfirm" onclick="reConfirm(this);"
							    style="display:none;" >댓글 달기 완료</button> 
	      			<% } %>
	      		</div>
	      		<div class="comment commentContent">
	      			<textarea class="comment-content" cols="105" rows="3" readonly="readonly"><%= bc.getCcontent() %></textarea>
	      		</div>
	      	</div>
	  		<% } } %>
		</div>
	</div>


	<% if(m == null) { //비회원 %>
	<script>
		$('button').click(function(){
			alert("로그인이 필요한 기능입니다.");
		});
		$('.btn').click(function(){
			alert("로그인이 필요한 기능입니다.");
		});
	</script>
	<% } else if (m.getMid() == g.getBwriter()) { //글쓴이 본인 %>
	<script>
		$('#btnFollow').click(function(){
			alert("본인은 팔로우할 수 없습니다.");
		});
		$('#btnLikeit').click(function(){
			alert("본인 작품은 좋아요 할 수 없습니다.");
		});
		function showSpon() {
			alert("본인에게는 후원할 수 없습니다.");
		}
		function showReport() {
			alert("본인은 신고할 수 없습니다.");
		}
	</script>
	<% } else { // 회원 %>
	<script>
		var windowObj = null;
		
		function showSpon() {
			var xPos = (document.body.clientWidth / 2) - (500 / 2); 
		    xPos += window.screenLeft;
		    var yPos = (screen.availHeight / 2) - (300 / 2);
		    
		    windowObj = window.open('<%= request.getContextPath() %>/views/board/popupSpon.jsp', '후원', 
		    		'width=500,height=300,top='+yPos+',left='+xPos+',toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no');
		}
		
		// 초기화 함수
		$(function(){		
			
			$('.commentWriteArea').css({
				'display' : 'block'
			});
			
			$('#cwriter').attr({
				'value' : '<%= m.getMid() %>'
			});
			
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
			
			$.ajax({
				url : '/crojecter/lCheck.li',
				type : 'get',
				data : {
					mid : '<%= m.getMid() %>',
					bid : '<%= g.getBid() %>'
				}, 
				success : function(data){
					if(data == 'ok') {
						$("#btnFollow").addClass('active');
					} else if (data == 'no') {
						$("#btnFollow").removeClass('active');
					} 
				}, error : function(data){
					console.log('좋아요버튼 초기화 에러 발생!');
				}
			});
		});
		
		// 팔로우 버튼 클릭
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
		
		// 좋아요 버튼 클릭
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
		
		// 댓글 수정하기 - 완성
		function updateComment(obj) {
			// 현재 위치와 가장 근접한 textarea 접근하기		
			$(obj).parent().parent().find('textarea').removeAttr('readonly');

			// 수정 완료 버튼을 화면 보이게 하기
			$(obj).siblings('.updateConfirm').css('display','inline');
			
			// 수정하기 버튼 숨기기
			$(obj).css('display', 'none');
		}
		
		// 댓글 수정완료 - 완성
		function updateConfirm(obj) {
			var cid = $(obj).siblings('input[name="cid"]').val();
			var bid = '<%=g.getBid()%>';
			var btype = '<%= g.getBtype() %>';
			var content = $(obj).parent().parent().find('textarea').val();
			
			location.href="/crojecter/cUpdate.co?cid="+cid+"&bid="+bid+"&btype="+btype+"&content="+content;
		}
		
		// 댓글 삭제 - 완성
		function deleteComment(obj) {
			var cid = $(obj).siblings('input[name="cid"]').val();
			var bid = '<%= g.getBid() %>';
			var btype = '<%= g.getBtype() %>';
			
			location.href="/crojecter/cDelete.co?cid="+cid+"&bid="+bid+"&btype="+btype;
		}
		
		// 대댓글
		function reComment(obj){
			// 클릭한 버튼 숨기기
			$(obj).css('display', 'none');
			
			// 내용 입력 공간 만들기
			var htmlForm = '<div display="inline" style="padding-left:20px;">'
				+ '<textArea rows="3" cols="80" id="replyContent" name="replyContent"></textArea>'
				+ '<button class="btn" id="addComment" onclick="reConfirm();">댓글 등록</button>'
				+ '</div>';
			
			$(obj).parents('.comment').append(htmlForm);
		}
		
		function reConfirm(obj) {

		}

	</script>
	<% }  %>
	
	
	
	
</body>
</html>