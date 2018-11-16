<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.board.gallery.model.vo.*, com.kh.member.model.vo.Member"%>
<%-- <%
	Member m = (Member) session.getAttribute("member");
	System.out.println("m : " + m);
%> --%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>갤러리 업로드 페이지</title>
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

.thumbnailArea {
	width: 100%;
	height: 150px;
	border: 1px solid lightgray; 
	text-align: center;
}

#insertBtn {
	width: 100%;
	height: 50px;
	font-size: 20px;
}

#titleImg {
	width: 100%;
	height: 100%;
	border: none;
}
</style>
</head>


<body>
<%@ include file="../../common/header.jsp" %>
	<%
		if (m != null) {
	%>
	<form id="insertform" action="<%=request.getContextPath()%>/gInsert.ga" method="post" encType="multipart/form-data">
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-2"></div>
			<div id="fileArea">
				<input type="file" id="thumbnailInput" multiple="multiple" onchange="LoadImg(this)">
			</div>
			
			<div class="col-md-6">
				<input type="text" class="form-control" id="title" name="title"
					placeholder="제목을 입력하세요.">
				<textarea id="summernote" name="content"></textarea>
			</div>
			<div class="col-md-2">
				<input type="hidden" id="userId" name="userId" value="<%=m.getMid()%>" /> 
				<div class="thumbnailArea" id="thumbnailArea" name="thumbnailArea">				
					<label id="thumbnailLabel">대표이미지 설정</label>
					<img id="titleImg" style="border: white;"></div>
				<select class="sidebar" name="category" id="category">
					<option value="" disabled selected>카테고리 선택</option>
					<option value="1">TEXT</option>
					<option value="2">IMAGE</option>
					<option value="3">AUDIO</option>
					<option value="4">VIDEO</option>
				</select> 
				<select class="sidebar" name="cclid" id="cclid">
					<option value="" disabled selected>CCL 선택</option>
					<option value="1">저작자 표시</option>
					<option value="2">저작자-비영리</option>
					<option value="3">저작자-동일조건변경허락</option>
					<option value="4">저작자-변경금지</option>
					<option value="5">저작자-비영리-변경금지</option>
					<option value="6">저작자-비영리-동일조건변경허락</option>
				</select> <input type="text" name="tags" placeholder="태그 입력(,로 구분)"
					style="width: 100%; height: 150px">

				<button class="btn btn-success" id="insertBtn" onclick="insertMember();">업로드</button>
				
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
		        minHeight: null,
		        maxHeight: null,
		        focus: true,
		        callbacks: {
		          onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		              sendFile(files[i], this);
		            }
		          },
		      		onMediaDelete : function(target) {
	                alert(target[0].src); 
	                deleteFile(target[0].src);
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
		
		// 아직 구현중
		function deleteFile(src) {
		    $.ajax({
		        data: {src : src},
		        type: "POST",
		        url: "/crojecter/resources/uploadFiles/"+src, // replace with your url
		        cache: false,
		        success: function(resp) {
		            console.log(resp);
		        }
		    });
		}
		
		$(function(){
			$('#fileArea').hide();
			
			$('#thumbnailArea').click(() => {
				$('#thumbnailInput').click();
				$('#thumbnailLabel').hide();
			});
		});
		function LoadImg(value) {
			if(value.files && value.files[0]) {
				var reader = new FileReader();
				
				reader.onload = function(e){					
					$('#titleImg').attr('src', e.target.result);	
				}
				
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		function insertMember() {
			$("#insertform").submit();
		}
		
		$("#insertform").submit(function(event){
			
			if(title.legnth < 0){
				alert("제목을 입력해주세요.");
			}
			else if($("#summernote").val == null){
				alert("내용을 입력해주세요.");	
			}
			else if($("#titleImg").val == null){
				alert("대표 이미지를 설정해주세요.");	
			}
			else if($("#category").val() == null) {
				alert("카테고리를 선택해주세요.");				
			}
			else if($('#cclid').val() == null) {
				alert("ccl을 선택해주세요.");				
			}
			else return;
			event.preventDefault();
		});
		
		
		
		</script>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>