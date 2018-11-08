<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.gallery.model.vo.*, com.kh.member.model.vo.Member" %>
<%
	Member m = (Member)session.getAttribute("member");
	System.out.println("m : " + m);
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>게시물 업로드 페이지</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	  
<style>
	body{
		font-family: 'Nanum Gothic', sans-serif;
	}
	.sidebar{
		width: 100%; 
		height: 50px;
	}
	
	#insertBtn{
		 width: 100%; 
		 height: 50px;
		 font-size: 20px;
	}
</style>
</head>


<body>
	<% if (m != null) { %>
	<form action="<%= request.getContextPath() %>/gInsert.ga" >
	<div class="row" style="margin-top: 20px;">
		<div class="col-md-1"></div>
		<div class="col-md-8">
		<input type="hidden" name="userId" value="<%= m.getMid() %>" />
			<div id="summernote">
				<p><br><br>당신만의 창작물을 작성해주세요.</p>
			</div>
		</div>
		<div class="col-md-2">
			<select class="sidebar" name="category" id="category">
				<option value="" disabled selected>카테고리 선택</option>
				<option value="c1">IMAGE</option>
				<option value="c2">VIDEO</option>
				<option value="c3">AUDIO</option>
				<option value="c4">TEXT</option>
			</select> 
			<select class="sidebar" name="ccl" id="ccl">
				<option value="" disabled selected>CCL 선택</option>
				<option value="ccl1">저작자 표시</option>
				<option value="ccl2">저작자-비영리</option>
				<option value="ccl3">저작자-동일조건변경허락</option>
				<option value="ccl4">저작자-변경금지</option>
				<option value="ccl5">저작자-비영리-변경금지</option>
				<option value="ccl6">저작자-비영리-동일조건변경허락</option>
			</select> 
			<input type="text" placeholder="태그 입력(,로 구분)" style="width: 100%; height: 150px">

			<button class="btn btn-success" id="insertBtn" type="submit">업로드</button>
		</div>
		<div class="col-md-1"></div>
	</div>
	</form>
	<% } else { 
		request.getRequestDispatcher("../member/login.jsp").forward(request, response);
	 } %>
	<div class="output"></div> 	<%--출력물을 보여주는 임시 div --%> 

	<script>
		$(document).ready(function() {
			$('#summernote').summernote();
		});
		
		$('#summernote').summernote({
			  height: 500,                 // set editor height
			  minHeight: null,             // set minimum height of editor
			  maxHeight: null,             // set maximum height of editor
			  focus: true,                  // set focus to editable area after initializing summernote
			});
		
		function showContent() {
            $('.output').html($('#summernote').summernote('code'));
        }
		
		fuction 
	</script>
</body>
</html>