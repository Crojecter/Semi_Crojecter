<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.board.gallery.model.vo.*, com.kh.member.model.vo.Member"%>
<%
	Member m = (Member) session.getAttribute("member");
	System.out.println("m : " + m);
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>프로젝트 업로드 페이지</title>

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
	<%
		if (m != null) {
	%>
	<form action="<%=request.getContextPath()%>/pInsert.pr" method="post" encType="multipart/form-data">
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-2"></div>
			<div class="col-md-6">
				<input type="text" class="form-control" id="title" name="title"
					placeholder="제목을 입력하세요.">
				<textarea id="summernote" name="content"></textarea>
			</div>
			<div class="col-md-2">
				<input type="hidden" id="userId" name="userId" value="<%=m.getMid()%>" /> 
				<input class="sidebar" name="date" type="date" min="" max="">
				<input type="text" name="tags" placeholder="태그 입력(,로 구분)"
					style="width: 100%; height: 150px">
				<input type="text" value="Amsterdam,Washington" data-role="tagsinput" >
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
		        height: 300,
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
		    alert('max 날짜 : ' + today);
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
		
		$('input').tagsinput({
			  typeahead: {
			    source: function(query) {
			      return $.getJSON('citynames.json');
			    }
			  }
			});
		</script>

</body>
</html>