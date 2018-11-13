<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<script src="/crojecter/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
		.profileArea{
			border:1px solid black;
			color:black;
			background: lavender;

		}
		.profileMenu{
			border: solid 1px black;
			text-decoration: none;
			color:black;
			background-color: lightgray;
			margin-left:10px;
			
		}

		.menu{
			border:1px solid black;
		}

		.menuMenu a{
			text-decoration: none;
			color:darkgray;
			width: 100px;
			margin-right: 30px;
			margin-left: 30px;

		}

		.form{
			border:1px solid black;
		}

		.profilePic{
			width:100px;
			height: 100px;
			border-radius: 50px;
			margin-top:10px;
			margin-left:10px;

		}

</style>
</head>

<body>
<div class="profileArea">
	<img src="../resources/images/icon/likeSelect.png" class="profilePic">
	<p id="profileName"> <%=m.getMname()%>님의 페이지</p>
	<a class="profileMenu" href="/views/mypage/paymentList.jsp">결제내역</a>
	<a class="profileMenu" href="/views/mypage/mypage.jsp">내정보</a>
	<br><br>
</div>
<br>
<div class="menu">
	<table>
		<tr>
			<td class="menuMenu"><a>About</a></td>
			<td class="menuMenu"><a href="/views/mypage/">Works</a></td>
			<td class="menuMenu"><a href="/views/mypage/">Collect</a></td>
			<td class="menuMenu"><a href="/views/mypage/">Followings</a></td>
			<td class="menuMenu"><a href="/views/mypage/">Followers</a></td>
		</tr>
	</table>
</div>
</body>
</html>