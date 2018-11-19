<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.project.model.vo.*, com.kh.member.model.vo.Member, java.util.*, com.kh.boardcomment.model.vo.*" %>

<%
	Member m = (Member)session.getAttribute("member");
	System.out.println("m : " + m);
	Project j = (Project)request.getAttribute("project");
	ArrayList<BoardComment> clist = (ArrayList<BoardComment>) request.getAttribute("clist"); 
	
	System.out.println("j : " + j);
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
					<td colspan="5"><span><%= j.getBtitle() %></span></td>
				</tr>
				<tr>
					<td>작성자 </td>
					<td><span id="parentGetName"><%= j.getMname() %></span></td>
					<td>작성일</td>
					<td><span><%= j.getBdate() %></span></td>
					<td>조회수 </td>
					<td><span><%= j.getBcount() %></span></td>
				</tr>
				<tr>
					<td>태그</td>
					<td><span><%= j.getJtag() %></span></td>
					<td>마감일 </td>
					<td><span><%= j.getJend() %></span></td>
					<td>마감일 </td>
					<td><span><%= j.getDday() %></span></td>
				</tr>
				<tr>
					<td colspan="6">내용 </td>
				</tr>
				<tr>
					<td colspan="6">
					<p id="content"><%= j.getBcontent() %>
					</td>
				</tr>
			</table>
		</div>
		
		<div align="center" style="display:inline;">
			<button onclick="showReport(<%=j.getBid()%>, 0);">신고</button>
			<% if(m != null && m.getMid() == j.getBwriter()){ // 글쓴이 본인인 경우 %>
			<button onclick="location.href='<%= request.getContextPath() %>/jUpView.pr?bid='+<%=j.getBid()%>">수정하기</button>
			<button onclick="location.href='<%= request.getContextPath() %>/jDelete.pr?bid='+<%=j.getBid()%>">삭제하기</button>
			<% } %>	
		</div>
		<input type="button" onclick="location.href='/crojecter/main.html'" value="목록"/>
	</div>
	
	<div class="commentOuter" style="padding:5px;">
		<div class="commentWriteArea">
			<div><input type="hidden" name="crefmid" value="-1" /></div>
			<div style="display:inline;">
				<textarea rows="3" cols="80" id="ccontent" name="ccontent"></textArea>
				<button id="addComment" onclick="insertComment(this);">댓글 등록</button>
			</div>
		</div>
		
		<div class="commentListArea">
	      <% if( clist != null ) { %>
	      	<% for(BoardComment bc : clist) { %>
	      	<div class="comment">
	      		<div class="commentInfo" style="display:inline;">
	      			<input type="hidden" name="cid" value="<%=bc.getCid()%>"/>
	      			<span>닉네임 : <%=bc.getCwname() %></span> &nbsp;&nbsp;
	      			<span>작성날짜 : <%=bc.getCdate() %></span>
	      				
	      			<% if(m != null) { // 로그인한 회원의 경우 댓글달기 버튼 출력 %>
	      			<% if(m.getMid() == bc.getCwriter()) { // 댓글쓴이 본인인 경우 수정,삭제버튼 추가 출력 %>	 
					<button type="button" class="updateBtn" onclick="updateComment(this);">수정하기</button>
					<button type="button" class="updateConfirm" onclick="updateConfirm(this);"
						    style="display:none;" >수정완료</button> &nbsp;&nbsp;
					<button type="button" class="deleteBtn" onclick="deleteComment(this);">삭제하기</button> &nbsp;&nbsp;
	      			<% } %>
					<input type="hidden" name="crefmid" value="<%= bc.getCwriter() %>" />
					<button type="button" class="insertBtn" onclick="reComment(this);">댓글달기</button>&nbsp;&nbsp;
					<button type="button" class="reportBtn" onclick="showReport(<%=j.getBid()%>, <%=bc.getCid()%>);">신고</button>				 
	      			<% } %>
	      		</div>
	      		<div class="comment commentContent">
	      			<textarea class="comment-content" cols="105" rows="3" style="display:none;"><%= bc.getCcontent() %></textarea>
	      			<p style="border:1px solid gray; background:white; height:70px;">
	      				<% if(bc.getCrefmid()>0) { %><a href="https://www.naver.com/">@<%= bc.getCfname() %></a> <% } %>
	      				<%= bc.getCcontent() %>
	      			</p>
	      		</div>
	      		<hr />
	      	</div>
	  		<% } } %>
		</div>
	</div>

	<% if(m != null) { // 회원 %>
	<script> 
		// 댓글 삽입 
		function insertComment(obj) {
	
			var bid = '<%= j.getBid() %>';
			var btype = '<%= j.getBtype() %>';
			var cwriter = '<%= m.getMid() %>';
			var ccontent = $(obj).siblings('textarea').val();
			var crefmid = $(obj).parent().siblings().children('input[name="crefmid"]').val();
			
			location.href='/crojecter/cInsert.co?bid=' + bid
					+ '&btype=' + btype + '&cwriter=' + cwriter
					+ '&ccontent=' + ccontent + '&crefmid=' + crefmid;
		}
		
		// 댓글 수정
		function updateComment(obj) {	
			$(obj).parent().parent().find('textarea').css('display', 'block');
			$(obj).parent().parent().find('p').css('display', 'none');
			$(obj).siblings('.updateConfirm').css('display','inline');
			$(obj).css('display', 'none');
		}
		
		// 댓글 수정 완료 
		function updateConfirm(obj) {
			var cid = $(obj).siblings('input[name="cid"]').val();
			var bid = '<%=j.getBid()%>';
			var btype = '<%= j.getBtype() %>';
			var content = $(obj).parent().parent().find('textarea').val();
			
			location.href="/crojecter/cUpdate.co?cid="+cid+"&bid="+bid+"&btype="+btype+"&content="+content;
		}
		
		// 대댓글
		function reComment(obj){
			// 클릭한 버튼 숨기기
			$(obj).css('display', 'none');
			
			// 내용 입력 공간 만들기
			var htmlForm = '<div display="inline" style="padding-left:20px;">'
				+ '<textarea rows="3" cols="80" id="ccontent" name="ccontent"></textArea>'
				+ '<button id="addComment" onclick="insertComment(this);">댓글 등록</button>'
				+ '</div>';
			
			$(obj).parents('.comment').append(htmlForm);
		}		
		
		// 댓글 삭제 
		function deleteComment(obj) {
			var cid = $(obj).siblings('input[name="cid"]').val();
			var bid = '<%= j.getBid() %>';
			var btype = '<%= j.getBtype() %>';
			
			location.href="/crojecter/cDelete.co?cid="+cid+"&bid="+bid+"&btype="+btype;
		}	
	</script>
	
	<% if(m.getMid() == j.getBwriter()) { // 글쓴이 본인 %>	 
	<script>
		function showReport() {
			alert("본인은 신고할 수 없습니다.");
		}	
	</script>
	<% } else { // 뷰어 입장 %>
	<script>				
		// 신고하기
		function showReport(bid, cid) {
			var windowObj = null;
			var xPos = (document.body.clientWidth / 2) - 250; 
		    xPos += window.screenLeft;
		    var yPos = (screen.availHeight / 2) - 150;
		    var b = bid;
		    var c = cid;
	
		    windowObj = window.open('<%= request.getContextPath() %>/views/board/popupReport.jsp?b='+b+'&c='+c,
		    		'신고', 'width=500,height=550,top='+yPos+',left='+xPos
		    		+',toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no');
		}	
	</script>
	<% } %> <% } else { // 비회원 %>
	<script>
		$('button').click(function(){
			alert("로그인이 필요한 기능입니다.");
		});
		$('.btn').click(function(){
			alert("로그인이 필요한 기능입니다.");
		});
	</script>
	<% } %>
	
</body>
</html>
