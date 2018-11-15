<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.board.gallery.model.vo.*"%>
<%
	Gallery g = (Gallery)request.getAttribute("gallery");
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>갤러리 수정 페이지</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 폰트 설정 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">


<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
}

.sidebar {
	width: 100%;
	height: 50px;
}

#insertBtn {
	width: 100%;
	height: 50px;
	font-size: 20px;
}
</style>
</head>

<body>
	<form id="updateForm" method="post" encType="multipart/form-data">
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-2"></div>
			<div class="col-md-6">
				<input type="text" class="form-control" id="title" name="title" value="<%= g.getBtitle()%>">
				<textarea id="summernote" name="content"><%=g.getBcontent()%></textarea>
			</div>
			<div class="col-md-2">
				<input type="hidden" id="userId" name="userId" value="<%=g.getBwriter() %>" /> 
				<input type="hidden" id="bid" name="bid" value="<%=g.getBid() %>" /> 
				<select class="sidebar" name="category" id="category">
					<option value="<%=g.getGcategoryid()%>" disabled selected>카테고리 : <%=g.getGcategoryname() %></option>
					<option value="1">TEXT</option>
					<option value="2">IMAGE</option>
					<option value="3">AUDIO</option>
					<option value="4">VIDEO</option>
				</select> 
				<select class="sidebar" name="cclid" id="ccl">
					<option value="g.getCclid()" disabled selected>CCL 표시 : <%=g.getCclname() %></option>
					<option value="1">저작자 표시</option>
					<option value="2">저작자-비영리</option>
					<option value="3">저작자-동일조건변경허락</option>
					<option value="4">저작자-변경금지</option>
					<option value="5">저작자-비영리-변경금지</option>
					<option value="6">저작자-비영리-동일조건변경허락</option>
				</select> 
				<input type="text" name="tags" value="<%= g.getGtag()%>"style="width: 100%; height: 150px">

				<button class="btn btn-success" id="insertBtn"  onclick="complete();">수정완료</button>
			</div>
			<div class="col-md-2"></div>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
		      $('#summernote').summernote({
		        height: 500,
		        minHeight: null,
		        maxHeight: null,
		        focus: true,
		        callbacks: {
		          onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		              sendFile(files[i], this);
		            }
		          }
		        }
		      });
		      
		      
		    });
    
		function sendFile(file, el) {
				var form_data = new FormData();
		      	form_data.append('file', file);
		      	$.ajax({
		        	data: form_data,
		        	type: "post",
		        	url: "/crojecter/sInsert.fo",
					cache : false,
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(url) {
						url.replace("\/","/");
						alert(url);
						
						$(el).summernote('editor.insertImage', url);
					}, error : function(){						
						console.log("실패!!");
						
					}
				});
			}
		function complete(){
			$("#updateForm").attr("action","<%= request.getContextPath()%>/gUpdate.ga");
		}
		
		function deleteBoard(){
			$("#updateForm").attr("action","<%= request.getContextPath()%>/gDelete.ga");
		}
		</script>

</body>
</html>