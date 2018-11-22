<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.gallery.model.vo.* " %>
<!DOCTYPE html>
<%
 
   ArrayList<Gallery> gTop5List = (ArrayList<Gallery>)request.getAttribute("gTop5List"); 
   System.out.println("GalleryList ArrayList : "+ gTop5List);
   
    
%>
<html>
   <head>
   <meta charset="UTF-8">
   <title>Gallery Main</title>
      <meta charset="UTF-8">
      <style>
      #slide{ height:400px;}
      </style> 
   </head>
   <body>
      <%@ include file="views/common/header.jsp" %>
      <div class="row">
   <div class="col-md-2"></div>
   <div class="col-md-8">
      <div id="slideBody" class="carousel slide" data-ride="carousel" style="display : inline-block;">
      <!-- 슬라이드 버튼 -->
      <ul class="carousel-indicators">
         <li data-target="#slideBody" data-slide-to="0" class="active"></li>
         <li data-target="#slideBody" data-slide-to="1" class=""></li>
         <li data-target="#slideBody" data-slide-to="2" class=""></li>
         <li data-target="#slideBody" data-slide-to="3" class=""></li>
         <li data-target="#slideBody" data-slide-to="4" class=""></li>
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
                  console.log(data);
                  
                  for(var i in data){

                     var top5Slide = ( i == 0 ) ? 
                           $("<div class='carousel-item active' style='width: 1200px;'>") 
                           : $("<div class='carousel-item'  style='width: 1200px;'>");
                     var img = $('<img height="400px" width="50px">');
                     $(img).addClass('d-block w-100');
                     $(img).attr('src', '<%= request.getContextPath()%>/resources/uploadFiles/' + data[i].fname);
                     
                     top5Slide.append($(img));
                     top5Slide.append($("<div class='carousel-caption'><h5 class='top5Title'>").text(data[i].btitle));
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
      <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 1200px;">
         <button type="button" class="btn btn-light"><a class="nav-link" href="#" id="viewAll">
            <img src="<%= request.getContextPath()%>/resources/images/icon/selectImg.png" alt="" style="height:30px"></a></button>

         <button type="button" class="btn btn-light" onclick="searchImg();"><a class="nav-link" href="#" id="viewImg">
            <img src="<%= request.getContextPath()%>/resources/images/icon/imageImg.png" alt="" style="height:30px"></a></button>      
         <button type="button" class="btn btn-light" onclick="searchAud();"><a class="nav-link" href="#" id="viewSound">
            <img src="<%= request.getContextPath()%>/resources/images/icon/soundImg.png" alt="" style="height:30px"></a></button>
         <button type="button" class="btn btn-light" onclick="searchTxt();"><a class="nav-link" href="#" id="viewText">
            <img src="<%= request.getContextPath()%>/resources/images/icon/textImg.png" alt="" style="height:30px"></a></button>
         <button type="button" class="btn btn-light" onclick="searchVid();"><a class="nav-link" href="#" id="viewVidio">
            <img src="<%= request.getContextPath()%>/resources/images/icon/vidioImg.png" alt="" style="height:30px"></a></button>
            
         <div class="collapse navbar-collapse" id="navbarSupportedContent">      
            <ul class="navbar-nav mr-auto"></ul>
            <form class="form-inline my-2 my-lg-0">
               <button class="nav-item dropdown" type="submit">
                  <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     최신순      
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#" id="viewRecent">최신순</a>
                  <a class="dropdown-item" href="#" id="viewLike">좋아요순</a>
                  <a class="dropdown-item active" href="#" id="viewHits">조회순</a>
                  </div>
               </button>
            </form>
         </div>      
      </nav>
      
      <script>
      function searchImg(){
         location.href="<%=request.getContextPath()%>/gSearch.ga?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
      }
      function searchAud(){
         location.href="<%=request.getContextPath()%>/gSearch.ga?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
      }
      function searchTxt(){
         location.href="<%=request.getContextPath()%>/gSearch.ga?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
      }
      function searchVid(){
         location.href="<%=request.getContextPath()%>/gSearch.ga?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
      }
      </script>
   
      <!-- 갤러리 내용 -->
      <%@ include file="views/board/galleryboard/galleryList.jsp" %>
      <%@ include file="views/common/footer.jsp" %>
      </div>
      <div class="col-md-2"></div>
      </div>
</body>

</html>