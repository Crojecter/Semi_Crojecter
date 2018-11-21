<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.gallery.model.vo.*" %>
 
<% ArrayList<Gallery> gList = (ArrayList<Gallery>)request.getAttribute("list"); 
	/* System.out.println("GalleryList ArrayList : "+ gList); */
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	//System.out.println("PageInfo gl : "+ pi);
	int currentPage = pi.getCurrentPage();
	int listCount = pi.getListCount();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

		<div class="galleryList">
		
		<% for (Gallery gal : gList) { %>
			<%-- <% System.out.println("gList jsp : "+gList); %> --%>
			<div id="gal-list" class="card" style="width: 300px; height: auto; display: inline-block;">
			<a href=""> <!-- galleryUploadFiles/%=gal.getBoardfile() % -->
			
			<img class="card-img-top" src="<%= request.getContextPath()%>/resources/uploadFiles/<%= gal.getFname() %>"
			alt="Card image cap" class="gallery"></a>
				<div class="card-body">
					<h5 class="card-title"><a href=""><%= gal.getBtitle() %></a></h5>
					<p class="card-text"><a href=""><%= gal.getGtag() %></a></p>
					<button disabled class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/view.png" alt="" style="height:22px;"><%= gal.getBcount() %>
					</button>
					<button onclick="addLike();" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/like.png" 
					alt="" style="height:22px;" data-toggle="tooltip" title="좋아요 +1"><%= gal.getGlike() %></button>
					<button src="<%= request.getContextPath()%>/views/board/galleryDetail.jsp" class="btn btn-primary">
					<img src="<%= request.getContextPath()%>/resources/images/icon/reply.png" 
					alt="" style="height:22px;">수</button>
				</div>
			</div>
		<% } %>
		</div>
		<script>
			$(function(){
				$("#gal-list").click(function(){
					// 눌렀을때 갤러리 상세로 이동
					var bno = $(this).children().children().eq(0).val();
					location.href="<%=request.getContextPath()%>/selectOne.ga?bno=" + bno;
				})
			});
		</script>


<%-- 		<!-- 페이지  UI-->
		<nav aria-label="..." class="pageNav"  align="center" style="float: right; position: absolute; left: 40%;">
			<br>
			<ul class="pagination" style="text-align: center">
				<li class="page-item disabled">
				<a class="page-link" href="<%= request.getContextPath() %>/gList.ga?currentPage=1'" tabindex="-1">Previous</a>
				</li>
				<li class="page-item"><a class="page-link" href="page1">1</a></li>
				<li class="page-item active"><a class="page-link" href="page2">2<span class="sr-only">(current)</span></a></li>
				<li class="page-item"><a class="page-link" href="page3">3</a></li>
				<li class="page-item">
				<li class="page-item"><a class="page-link" href="page4">4</a></li>
				<li class="page-item">	
				<li class="page-item"><a class="page-link" href="page5">5</a></li>
				<li class="page-item">	
				<a class="page-link" href="#">Next</a>
				</li>
			</ul>
		</nav>
		<!-- 페이지  -->
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/gList.ga?currentPage=1'">First</button>
			<%  if(currentPage <= 1){  %>
			<button disabled style="background:black">Pre</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/gList.ga?currentPage=<%=currentPage - 1 %>'">Pre</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>Next</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/gList.ga?currentPage=<%=currentPage + 1 %>'">Next</button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/gList.ga?currentPage=<%= maxPage %>'">Last</button>			
		</div> 
 --%>
</body>
</html>