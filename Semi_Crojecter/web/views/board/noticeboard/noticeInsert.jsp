<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.board.notice.model.vo.*, com.kh.member.model.vo.Member"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>공지사항 업로드 페이지</title>

<!-- 폰트 설정 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
	
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

.thumbnailArea {
	width: 100%;
	height: 150px;
	border: 1px solid lightgray;
	text-align: center;
}

#titleImg {
	width: 100%;
	height: 100%;
	border: none;
}
</style>
</head>


<body>
	<%@ include file="../../common/header.jsp"%>
	<%
		if (m != null) {
	%>
	<form action="<%=request.getContextPath()%>/nInsert.no" method="post" >
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-2"></div>
			<div class="col-md-6">
				<input type="text" class="form-control" id="title" name="title"
					placeholder="제목을 입력하세요.">
				<textarea id="summernote" name="content"></textarea>
			</div>
			<div class="col-md-2">
				<input type="hidden" id="userId" name="userId" value="<%=m.getMid()%>" />
				<button class="btn btn-success" id="insertBtn" type="submit">업로드</button>
			</div>
			<div class="col-md-2"></div>
		</div>
	</form>

	<%
		} else {
			request.getRequestDispatcher("../member/login.jsp").forward(request, response);
		}
	%>

	<script type="text/javascript">
		$(document).ready(function() {
		      $('#summernote').summernote({
		        height: 500,
		        minHeight: 500,
		        maxHeight: 500,
		        focus: true,
		        callbacks: {
		          onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		              sendFile(files[i], this);
		            }
		          },
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
		</script>

</body>
</html>