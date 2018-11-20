<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.kh.follow.model.vo.*, com.kh.member.model.vo.*,
    		com.kh.board.gallery.model.vo.*, java.util.*"%>
<%
	ArrayList<Follow> list = (ArrayList<Follow>)request.getAttribute("list");
	Gallery g = (Gallery)request.getAttribute("gallery");
	System.out.println("list : " + list);
%>
<!DOCTYPE html>
<html>
<head>
<script src="/crojecter/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
	#name {
		color:black
	}
</style>
</head>
<body>
<%@ include file="../mypage/common/mypageHeader.jsp"%>
<form action="<%=request.getContextPath()%>/followingView.do" method="post">
<div class="followList">
	<table>  
		<% for(Follow f : list){ %>
		<tr>
			<td id="name"><%=f.getFollowname() %></td>
			<td> <div id="btnFollow" class="btn btn-follow">
					<p id="p-follow" style="color: black">언팔로우</p></div>
			</td>
		</tr>
		<% } %>
	</table>

</div>
</form>
<script>

</script>
</body>
</html>