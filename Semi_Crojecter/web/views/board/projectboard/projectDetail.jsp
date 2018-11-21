<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.project.model.vo.*, com.kh.member.model.vo.Member, java.util.*, com.kh.boardcomment.model.vo.*" %>

<%
	Project j = (Project)request.getAttribute("project");
	ArrayList<BoardComment> clist = (ArrayList<BoardComment>) request.getAttribute("clist"); 	
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
   
   .active {
      background: red;
   }
   
   .titleArea {
      width: 100%;
      height:50px;
      height: 50px;
      border: 1px solid lightgray;   
      border-radius: 3px;
   }
   
   .contentArea {
      min-height: 500px;
      padding: 15px;
      border: 1px solid lightgray;   
   }
   
   .title {
      padding-top: -5px;
   }
   
   .count {
      padding: 20px;      
   }
   
   .commentOuter {
      width:auto;
      height:auto;
      color:black;
      margin-left:auto;
      margin-right:auto;
      margin-top:20px;
   }
   
   #profileImg {
      margin-top: 10px;
      margin-bottom: 5px;
      width: 120px;
      height: 120px;
      border-radius: 50px;
      border: 1px solid lightgray;      
   }
   
   .sidebar {
      width: 100%;
      height: 50px;
      border: 1px solid lightgray;
      padding-top:15px;
      padding-left:5px;
   
   }
   
   .btnArea1 {
      width: 90%;
      height: 40px;
      border: 1px solid lightpink;
      background:lightpink;
   }
   
   .btnArea2 {
      width: 70px;
      height: 40px;
      border: 1px solid lightpink;
      background:lightpink;
   }
   
   .btnComment {
      width: 60px;
      height: 25px;
      background: lightpink;
      border: 1px solid  lightpink;
      border-radius: 5px;
      color: white;
      float: right; 
   }
   
   #addComment {
      width: 100px;
      height: 40px;
      margin: 10px;
   }
   
   .bottomBtn {
      width: 20%;
      height: 25px;
      background: lightpink;
      border: 1px solid  lightpink;
      border-radius: 5px;
      color: white;
      float: right;
      margin-right:2px;
   }
   
   .insertBtn{
      width: 25%;
   } 
   
   .content img {
      display: inline-block;
  	  vertical-align: middle;
      max-height: 100%;
      max-width: 100%;
   }
	
</style>

<title>프로젝트 상세보기</title>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	
	<div class="row">
      	<div class="col-md-2"></div>
      	<div class="col-md-6">
      	
      	<%if(m != null)  {  %>
         <span id="parentGetmid" style="display:none;"><%= m.getMid() %></span> <% } %>
         
         <div class="row titleArea"  style="margin: 0;">
            <div class="col-md-10"><h3 class="title" style="margin-top: 14px;"><%= j.getBtitle() %></h3></div>
            <div class="col-md-2 count"><p class="">조회수 :  <%= j.getBcount() %></p></div>
         </div>
         
         
         <div class="row contentArea" style="margin: 0;">
            <div class="content"><%= j.getBcontent() %></div>
         </div>
         
         <div class="commentOuter" >
            <div class="commentWriteArea">
               <div><input type="hidden" name="crefmid" value="-1" /></div>               
               <div class="row contentArea1">
                  <div class="col-md-10"><textarea rows="3" id="ccontent" name="ccontent" style="width:100%;"></textArea></div>
                  <div class="col-md-2"><button class="btnComment" id="addComment" onclick="insertComment(this);"style="width:100%;" >댓글 등록</button></div>                     
               </div>            
            </div>
         </div>

         <div class="commentListArea">
         	<% if( clist != null ) { %>
            <% for(BoardComment bc : clist) { %>
			<div class="comment">
            	<div class="row commentInfo" style="display:inline; height:30px;">
                	<div class="col-md-5" style="padding:0;">
                    <input type="hidden" name="cid" value="<%=bc.getCid()%>"/>
                    <span>닉네임 : <%=bc.getCwname() %></span> &nbsp;&nbsp;
                    <span>작성날짜 : <%=bc.getCdate() %></span>
                    </div>
                     
                    <% if(m != null) { // 로그인한 회원의 경우 댓글달기 버튼 출력 %>
                    <input type="hidden" name="crefmid" value="<%= bc.getCwriter() %>" />
                    <div class="col-md-5" style="padding:0; float:right;">                  
                    	<% if(m.getMid() == bc.getCwriter()) { // 댓글쓴이 본인인 경우 수정,삭제버튼 추가 출력 %>   
                        <div class="" style="padding:0;"><button type="button" class="bottomBtn updateBtn" onclick="updateComment(this);">수정</button>
                     	<button type="button" class="bottomBtn updateConfirm" onclick="updateConfirm(this);"
                            style="display:none;">수정완료</button></div>
                     	<div class="" style="padding:0;"><button type="button" class="bottomBtn deleteBtn" onclick="deleteComment(this);">삭제</button></div>
                        <% } %>                     
                     	<div class="" style="padding:0;"><button type="button" class="bottomBtn insertBtn" onclick="reComment(this);">댓글 달기</button></div>
                     	<div class="" style="padding:0;"><button type="button" class="bottomBtn reportBtn" onclick="showReport(<%=j.getBid()%>, <%=bc.getCid()%>);">신고</button></div>          
                        <% } %>
                     </div>
                     
                  </div>
                  <div class="comment commentContent">                
                     <textarea class="comment-content" cols="80" rows="3" style="display:none;"><%= bc.getCcontent() %></textarea>                     
                     <div class="row">                     
                     <p style="border:1px solid lightgray; background:white; height:70px;">
                        <% if(bc.getCrefmid()>0) { %><a href="https://www.naver.com/">@<%= bc.getCfname() %></a> <% } %>
                        <%= bc.getCcontent() %>
                     </p>                                       
                     </div>                    
                  <hr />
               </div>
              <% } } %>
         	</div>
      	</div>
      	
      	<div class="col-md-2">
      		<div align="center">
         	<% if(j.getMprofile() == null) { %>
         	<img id="profileImg" src="<%=request.getContextPath()%>/resources/images/user.png">
         	<% } else { %>
         	<img id="profileImg" src="<%=request.getContextPath()%>/resources/images/profileImg/<%=j.getMprofile()%>">
         	<% }  %>
         	</div>
         
         	<h4 align="center"><%=j.getMname()%></h4>

         	<div class="row" align="center" id="btnArea1" style="margin-top: 10px;">
	            <div class="col-md-6" style="padding:0;"><button class="btn btn-follow btnArea1" id="btnFollow">팔로우</button></div>         
	            <div class="col-md-6" style="padding:0;"><button class="btn btn-likeit btnArea1" id="btnLikeit">좋아요</button></div>                        
         	</div>         
         
         	<div class="sidebar" style="margin-top: 10px;">마감일 : <%=j.getJend() %></div>
         	<input type="text" value=<%=j.getJtag()%> data-role="tagsinput" id="tagsinput" class="tagsinput" disabled>      
         
         	<div class="row" align="center" id="btnArea2" style="margin-top: 10px;">            
	            <div class="col-md-6" style="padding:0;"><button class="btn btnArea1" onclick="showSpon();">후원</button></div>
	            <div class="col-md-6" style="padding:0;"><button class="btn btnArea1" onclick="showReport();">신고</button></div>   
	            <!-- <input class="btn btnArea2" type="button" onclick="location.href='/crojecter/main.html'" value="목록"/> -->
         	</div>
         	<div class="row" align="center" id="btnArea3" style="margin-top: 10px;">
            	<% if(m != null && m.getMid() == j.getBwriter()){ // 글쓴이 본인인 경우 %>
            	<div class="col-md-6" style="padding:0;">
            	<button class="btn btnArea1" onclick="location.href='<%= request.getContextPath() %>/jUpView.pr?bid='+<%=j.getBid()%>">수정하기</button>
            	</div>
            	<div class="col-md-6" style="padding:0;">
            	<button class="btn btnArea1" onclick="location.href='<%= request.getContextPath() %>/jDelete.pr?bid='+<%=j.getBid()%>">삭제하기</button>
            	</div>
            	<% } %>
            </div>

		<div class="col-md-2"></div>
	</div>
	
	 <!-- -----------------------여기서부터  스크립트----------------------- -->

	<% if(m != null) { // 회원 %>
	<script> 
		// 댓글 삽입 
		function insertComment(obj) {
	
			var bid = '<%= j.getBid() %>';
			var btype = '<%= j.getBtype() %>';
			var cwriter = '<%= m.getMid() %>';
			var ccontent = $(obj).parent().siblings().children('textarea').val();
	        var crefmid = $(obj).parent().parent().siblings().children('input[name="crefmid"]').val();
			
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
			var htmlForm = '<div class="row contentArea1" style="">'
	            + '<div class="col-md-1"></div>'
	            + '<div class="col-md-9"><textarea rows="3" cols="70" id="ccontent" name="ccontent" style=""></textArea></div>'
	            + '<div class="col-md-2"><button class="btnComment" id="addComment" onclick="insertComment(this);">댓글 등록</button></div>   '
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
