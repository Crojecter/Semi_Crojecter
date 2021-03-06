<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.board.project.model.vo.*, com.kh.member.model.vo.Member"%>
	
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>프로젝트 업로드 페이지</title>

<!-- 폰트 설정 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
	
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
	background-image: url("<%=request.getContextPath()%>/resources/images/background2.jpg");
}

.jend {
	width: 100%;
	height: 50px;
	padding-left: 10px;
}

.uploadBtn {
	width: 100%;
    height: 50px;
    border: 1.5px solid lightblue;
    background: lightblue;
    color: black;
    border-radius: 5px;
    margin-top: 5px;
    font-size: 16px;
}

#thumbnailArea {
	position: relative;
	width: 100%;
	height: 150px;
	border: 1px solid lightgray;
}

#titleImg {
	width: 100%;
	height: 100%;
	vertical-align: middle;	
	border: none;
}

#thumbnailLabel {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
}
</style>
</head>


<body>
	<%@ include file="../../common/header.jsp"%>
	<%
		if (m != null) {
	%>
	<form id="insertform" action="<%=request.getContextPath()%>/pInsert.pr" method="post" encType="multipart/form-data">
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-2"></div>
			<div id="fileArea">
				<input type="file" name="thumbnailInput" id="thumbnailInput"
					onchange="LoadImg(this)">
			</div>
			<div class="col-md-6"
				 style="background: white; padding-top: 10px; 
				 background-color: rgba( 255, 255, 255, 0.5 ); margin-bottom: 100px;">
				<input type="text" class="form-control" id="title" name="title"
					placeholder="제목을 입력하세요.">
				<textarea id="summernote" name="content"></textarea>
			</div>
			<div class="col-md-2"
				 style="background: white; padding-top: 10px; padding-right: -5px; background-color: rgba( 255, 255, 255, 0.5 );">
				<input type="hidden" id="userId" name="userId" value="<%=m.getMid()%>" /> 
				<div class="thumbnailArea" id="thumbnailArea" name="thumbnailArea" style="background: white;">
					<img id="titleImg" style="border: white;">
					<div id="thumbnailLabel" class="tagText">여기를 눌러 <br>대표이미지를 <br>설정하세요!</div>
				</div>
				<input class="jend" id="date" name="date" type="date" min="" max="">
				<input type="text" name="tags" placeholder="태그를 입력해주세요!" 
				data-role="tagsinput" id="tagsinput" class="tagsinput">
				<button class="uploadBtn" id="insertBtn" type="submit" onclick="insertProject();">업로드</button>
			</div>
			<div class="col-md-2"></div>
		</div>
	</form>
	
	<%@ include file="../../common/footer.jsp"%>

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
		
		$('input[type="date"], input[type="datetime"], input[type="datetime-local"], input[type="month"], input[type="time"], input[type="week"]').each(function() {
		    var el = this, type = $(el).attr('type');
		    
		    var today = new Date();
		    var dd = today.getDate();
		    var mm = today.getMonth()+1; //January is 0!
		    var yyyy = today.getFullYear();	    	
		    
		    today = yyyy+'-'+mm+'-'+dd;
		    $(el).attr('min', today);	    
		    
		    if ($(el).val() == ''){
		    	$(el).attr('type', 'text');	    
		    	$(el).attr('placeholder', '마감일 선택');	
		    }
		    $(el).focus(function() {
		        $(el).attr('type', type);
		        el.click();	       
		        
		    });
		    $(el).blur(function() {
		        if ($(el).val() == '') $(el).attr('type', 'text');
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
						
						$(el).summernote('editor.insertImage', url);
					}, error : function() {						
						console.log("실패!!");
						
					}
				});
			}
		
		$(function(){
			$('#fileArea').hide();
			
			$('#thumbnailArea').click(() => {
				$('#thumbnailInput').click();
			});
		});
		
		function LoadImg(value) {
			if(value.files && value.files[0]) {
				var reader = new FileReader();
				
				reader.onload = function(e){					
					$('#titleImg').attr('src', e.target.result);	
					$('#thumbnailLabel').hide();
				}
				
				reader.readAsDataURL(value.files[0]);
				$('#thumbnailLabel').attr('style', 'display : none');
			}
		}
		
		function insertProject() {							
			if($("#title").val() == "") {
				alert("제목을 입력하세요.");
				$("#title").focus();
			}
			else if(!$("#summernote").val()){
				alert("내용을 입력해주세요.");	
			}
			else if(!$("#thumbnailInput").val()){
				alert("대표 이미지를 설정해주세요.");	
			}
			else if(!$("#date").val()){
				alert("마감날짜를 입력해주세요.");	
			}
			else if(!$('#tagsinput').val()) {
				alert("태그를 한 개 이상 입력해주세요.");				
			}
			else $("#insertform").submit();
			
			event.preventDefault();			
		}
		
		$('#tagsinput').tagsinput({maxTags: 10});
		
		</script>

</body>
</html>