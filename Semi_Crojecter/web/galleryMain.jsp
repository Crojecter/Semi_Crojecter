<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.gallery.model.vo.* " %>
<!DOCTYPE html>
<%
 
	ArrayList<Gallery> gTop5List = (ArrayList<Gallery>)request.getAttribute("gTop5List");
 	
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Gallery Main</title>
		<meta charset="UTF-8">
		<style>
		
		body {
		font-family: 'Nanum Gothic', sans-serif;		
		}
		
		#slide{ height:400px;}
		
		.carousel-caption {
			font-size: 30px;			
			background-color: rgba( 255, 255, 255, 0.5 );
			
			
		}
		
		.carousel-indicators li {
		margin: 10px;}
		
		</style> 
	</head>
	<body>
		<%@ include file="views/common/header.jsp" %>
		<div class="row" style="margin-bottom: 60px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div id="slideBody" class="carousel slide" data-ride="carousel" style="display : inline-block; width:100%">
		<!-- 슬라이드 버튼 -->
		<ul class="carousel-indicators">
			<li data-target="#slideBody" data-slide-to="0" class="active" style="background-color: #30B2A0;"> </li>
			<li data-target="#slideBody" data-slide-to="1" class="" style="background-color: #30B2A0;"> </li>
			<li data-target="#slideBody" data-slide-to="2" class="" style="background-color: #30B2A0;"> </li>
			<li data-target="#slideBody" data-slide-to="3" class="" style="background-color: #30B2A0;"> </li>
			<li data-target="#slideBody" data-slide-to="4" class="" style="background-color: #30B2A0;"> </li>
		</ul>
		<!--  슬라이드 본문 -->
			<div class="carousel-inner" id="top5test">
						
			</div>
		
			<!-- 슬라이드 넘기기 -->	
			<a class="carousel-control-prev" href="#slideBody" data-slide="prev">
			<span class="carousel-control-prev-icon"></span></a>
			<a class="carousel-control-next" href="#slideBody" data-slide="next">
			<span class="carousel-control-next-icon"></span></a>
		</div>
	
		
		<script>
			// Top 5 계산 (TOP-N 분석)
			$(document).ready(function(){
				$.ajax({
					url : '/crojecter/gTop5.ga',
					type : 'get',
					success : function(data){

						var body = $('#top5test');
						
						for(var i in data){

							var top5Slide = ( i == 0 ) ? $("<div class='carousel-item active'>") : $("<div class='carousel-item'>");
							var img = $('<img height="400px" width="50px">');
							$(img).addClass('d-block w-100');
							$(img).attr('src', '<%= request.getContextPath()%>/resources/uploadFiles/' + data[i].fname);
							
							top5Slide.append($(img));
							top5Slide.append($("<div class='carousel-caption' style='text-shadow: none; padding: 0; margin: 40px; color: black; '><h5 class='top5Title'>").text(data[i].btitle));
							//top5Slide.append($("<p class='top5Writer'>").text(data[i].bwriter));
							
							body.append(top5Slide);
						}
						
					}, error : function(data){
						console.log("top5 조회 실패!!");
					}
				});
				
			});
		</script>
		

		<!-- 게시글 선택보기 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<button type="button" value="0" class="btn btn-light" onclick="location.href='<%= request.getContextPath()%>/gList.ga'">
				<img src="<%= request.getContextPath()%>/resources/images/icon/selectImg.png" alt="" style="height:30px">
			</button>

			<button type="button" value="2" class="btn btn-light" onclick="location.href='<%= request.getContextPath()%>/gCategoryList.ga?cateId=2'">
				<img src="<%= request.getContextPath()%>/resources/images/icon/imageImg.png" alt="" style="height:30px">
			</button><!-- 2 -->		
			<button type="button" value="3" class="btn btn-light" onclick="location.href='<%= request.getContextPath()%>/gCategoryList.ga?cateId=3'">
				<img src="<%= request.getContextPath()%>/resources/images/icon/soundImg.png" alt="" style="height:30px">
				</button><!-- 3 -->
			<button type="button" value="1" class="btn btn-light" onclick="location.href='<%= request.getContextPath()%>/gCategoryList.ga?cateId=1'">
				<img src="<%= request.getContextPath()%>/resources/images/icon/textImg.png" alt="" style="height:30px">
			</button><!-- 1 -->
			<button type="button" value="4" class="btn btn-light" onclick="location.href='<%= request.getContextPath()%>/gCategoryList.ga?cateId=4'">
				<img src="<%= request.getContextPath()%>/resources/images/icon/vidioImg.png" alt="" style="height:30px">
			</button><!-- 4 -->
		</nav>
	
		<!-- 갤러리 내용 -->
		<%@ include file="views/board/galleryboard/galleryList.jsp" %>
		<%@ include file="views/common/footer.jsp" %>
		</div>
		<div class="col-md-2"></div>
		</div>
</body>

</html>