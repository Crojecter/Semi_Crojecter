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

	
	#btnFollow {
	
	background:lightblue;
	font-weight:bold;
	width: 130px;
	height: 35px;
	margin-bottom:20px;
	
	}
	
	#name {
	
	color:darkgray;
	padding-right:50px;
	padding-left:100px;
	font-size:20px;
	padding-top:30px;
	}
	
	.form {
	
	border: 1px solid black;
	margin-bottom:20px;

	}
	
	.table {
	
	width:50%;
	border:1px black solid;
	
	}

	.btn {
		border: 1px solid black;
	}
</style>
</head>
<body>
<%@ include file="../mypage/common/mypageHeader.jsp"%><br><br>
<form action="<%=request.getContextPath()%>/followerView.do" method="post">
<div class="followerList">
	<table class="table">  
		<% for(Follow f1 : list){ %>
		<tr class="form">
			<td id="name" name="name"><%=f1.getFollowername() %></td>
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