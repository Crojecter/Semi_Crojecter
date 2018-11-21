<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="/crojecter/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
	.profileArea {
		border: 1px solid black;
		color: black;
		background: lavender;
	}
	
	.menu {
		border: 1px solid black;
	}
	
	.menuMenu a {
		text-decoration: none;
		color: darkgray;
		width: 100px;
		margin-right: 30px;
		margin-left: 30px;
	}
	
	.form {
		border: 1px solid black;
	}
	
	.profileMenu {
		border: solid 1px gray;
		text-decoration: none;
		color: white;
		background-color: gray;
		text-align: center;
		border-radius: 5px;
		height: 40px;
		width: 120px;
		font-size: 15px;
		margin: 1px 10px 1px 10px;
		float: right;
	}
	
	#profileImg {
		width: 100px;
		height: 100px;
		border-radius: 50px;
		margin-top: 10px;
		margin-left: 10px;
	}			
</style>
</head>

<body>
	<%@ include file="../../common/header.jsp"%>
	<div class="profileArea">
		<form id="updateForm" action="<%=request.getContextPath()%>/mUpdateProfile.me" method="post" encType="multipart/form-data">
			<img id="profileImg" name="profileImg" src="../../resources/profileFiles/user.png"><br />
			<input type="file" name="file" id="btnProfile" style="display:none;" onchange="updateProfile();"/>
		</form>
		<p id="profileName"><%=m.getMname()%>님의 페이지</p>
		<a class="profileMenu" href="/crojecter/myPaymentSelect.do?mid=<%=m.getMid()%>">결제내역</a> 
		<a class="profileMenu" href="/crojecter/views/mypage/mypage.jsp">정보수정</a>
		<br><br>
	</div>
	<br>
	<div class="menu">
		<table>
			<tr>
				<td class="menuMenu"><a
					href="/crojecter/mypageView.do?mid=<%=m.getMid()%>">About</a></td>
				<td class="menuMenu"><a
					href="/crojecter/mworkView.do?mid=<%=m.getMid()%>">Works</a></td>
				<td class="menuMenu"><a
					href="/crojecter/collectView.do?mid=<%=m.getMid()%>">Collect</a></td>
				<td class="menuMenu"><a
					href="/crojecter/followingView.do?mid=<%=m.getMid()%>">Followings</a></td>
				<td class="menuMenu"><a
					href="/crojecter/followerView.do?mid=<%=m.getMid()%>">Followers</a></td>
			</tr>
		</table>
	</div>
	
	<script>

	$(function() {
		$('#profileImg').attr('src', "../../resources/profileFiles/<%= m.getMprofile() %>");
	});
		
	function updateProfile() {
		$("#updateForm").submit();
	}
	
	$('#profileImg').click(() => {
		$('#btnProfile').click();   
	});
	
	function LoadImg(value) {
		if(value.files && value.files[0]) {
			var reader = new FileReader();			
			reader.onload = function(e){					
				$('#profileImg').attr('src', e.target.result);	
			}			
			reader.readAsDataURL(value.files[0]);
		}
		
		$.ajax({
			url : '/crojecter/mUpdateProfile.me',
			type : 'get',
			data : {
				mid : '<%= m.getMid() %>',
				mprofile : $('#profileImg').attr('src')
			}, 
			success : function(data){
				if(data == 'success') {
					console.log('프로필 변경 성공');
				} else {
					console.log('프로필 변경 실패');
				}
			}, error : function(data){
				console.log('프로필 변경 에러 발생!!');
			}
		});
	}
	
	</script>
</body>
</html>