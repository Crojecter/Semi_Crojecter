<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.board.project.model.vo.*, com.kh.member.model.vo.Member, com.kh.board.attachedfile.model.vo.*"%>
<%
	Project p = (Project)request.getAttribute("project");
	AttachedFile af = (AttachedFile)request.getAttribute("attachedfile");	
	String root = af.getFpath() + af.getFname();
	
	System.out.println(p.getJend());
%>	
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
}

.jend {
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
	<form  id="insertform"  action="<%=request.getContextPath()%>/jUpdate.pr?bid=<%=p.getBid() %>" method="post" encType="multipart/form-data">
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-2"></div>
			<div id="fileArea">
				<input type="file" name="thumbnailInput" id="thumbnailInput"
					onchange="LoadImg(this)">
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" id="title" name="title" value="<%=p.getBtitle()%>">
				<textarea id="summernote" name="content"><%=p.getBcontent()%></textarea>
			</div>
			<div class="col-md-2">
				<input type="hidden" id="userId" name="userId" value="<%=m.getMid()%>" /> 
				<div class="thumbnailArea" id="thumbnailArea" name="thumbnailArea">
					<label id="thumbnailLabel">대표이미지 설정</label> <img id="titleImg"
						style="border: white;">
				</div>
				<input class="jend" id="jend" name="date" type="date" min="" max="">
				<input type="text" name="tags" data-role="tagsinput" value="<%=g.getGtag()%>" id="tagsinput" class="tagsinput">
				<button class="btn btn-success" id="insertBtn" type="submit" onclick="insertProject();">업로드</button>
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
	      
		   // 대표 이미지 레디
		   $('#titleImg').attr('src', "resources/uploadFiles/<%=af.getFname()%>");	
			
	    });
		      
		      
		
		$('input[type="date"], input[type="datetime"], input[type="datetime-local"], input[type="month"], input[type="time"], input[type="week"]').each(function() {
		    var el = this, type = $(el).attr('type');
		    
		    var today = new Date();
		    var dd = today.getDate();
		    var mm = today.getMonth()+2; //January is 0!
		    var yyyy = today.getFullYear();	    
		    
		    if(dd<10){
		        dd='0'+dd;
		    } 	    
		    if(mm>12){
		    	mm=mm-11;
		    }	    
		    if(mm<10){
		        mm='0'+mm;
		    } 	
		    
		    today = yyyy+'-'+mm+'-'+dd;
		    $(el).attr('max', today);	    
		    
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
						alert(url);
						
						$(el).summernote('editor.insertImage', url);
					}, error : function(){						
						console.log("실패!!");
						
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
			else return;
			event.preventDefault();
			
		});
		
		$('#tagsinput').tagsinput({maxTags: 10});
		
		</script>

</body>
</html>