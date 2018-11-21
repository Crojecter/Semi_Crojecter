<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.kh.follow.model.vo.*, com.kh.member.model.vo.*,
    		com.kh.board.gallery.model.vo.*, java.util.*"%>
    
<%
	ArrayList<Follow> list = (ArrayList<Follow>)request.getAttribute("list");
	Follow f = (Follow)request.getAttribute("follow");
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
	
	.btn {
		border: 1px solid black;
	}
</style>
</head>
<body>
<%@ include file="../mypage/common/mypageHeader.jsp"%>
<form action="<%=request.getContextPath()%>/followerView.do" method="post">
<div class="followerList">
	<table>  
		<% for(Follow f1 : list){ %>
		<tr>
			<td id="name"><%=f1.getFollowername() %></td>
			<td>
				<input type="hidden" name="fid" value="<%= f1.getFollowerid() %>"/> 
				<% if(f1.getChk().equals("Y")){ %>
					<div class="btn btn-follow active" onclick="switchfollow(this);">
					<p class="p-follow" style="color: black">언팔로우</p></div>
				<% } else {%>
					<div class="btn btn-follow" onclick="switchfollow(this);">
					<p class="p-follow" style="color: black">팔로우</p></div>
				<% } %>
			</td>
		</tr>
		<% } %>
	</table>
</div>
</form>
<script>

	function switchfollow(obj){
		$.ajax({
			url : '/crojecter/fSwitch.fo',
			type : 'get',
			data : {
				mid : '<%= m.getMid() %>',
				wid : $(obj).siblings('input[name="fid"]').val()
			}, 
			success : function(data){
				if(data == 'insert') {
					$(obj).addClass('active');
					$(obj).children('p[class="p-follow"]').html('언팔로우');
				} else if (data == 'delete') {
					$(obj).removeClass('active');
					$(obj).children('p[class="p-follow"]').html('팔로우');
				} else {
					console.log('btnFollow() 에러 발생!');
				}
			}, error : function(data){
				console.log('btnFollow() 에러 발생!!');
			}
		});
	}

</script>
</body>
</html>