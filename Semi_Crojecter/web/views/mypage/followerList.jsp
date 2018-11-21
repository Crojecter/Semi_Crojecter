<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.kh.follow.model.vo.*, com.kh.member.model.vo.*,
    		com.kh.board.gallery.model.vo.*, java.util.*"%>
    
<%
	ArrayList<Follow> list = (ArrayList<Follow>)request.getAttribute("list");
	Gallery g = (Gallery)request.getAttribute("gallery");
	Follow f = (Follow)request.getAttribute("follow");
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
<form action="<%=request.getContextPath()%>/followerView.do" method="post">
<div class="followerList">
	<table>  
		<% for(Follow f1 : list){ %>
		<tr>
			<td id="name"><%=f1.getFollowername() %></td>
			<td>
				<input type="hidden" name="fid" value="<%= f1.getFollowerid() %>"/> 
				<div id="btnFollow" class="btn btn-follow" onclick="switchfollow(this);">
				<p id="p-follow" style="color: black">팔로우</p></div>
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
					$("#btnFollow").addClass('active');
					$('#p-follow').html('언팔로우');
				} else if (data == 'delete') {
					$("#btnFollow").removeClass('active');
					$('#p-follow').html('팔로우');
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