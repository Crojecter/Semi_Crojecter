<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="/crojecter/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
.form {
	width: 300px;
	margin: 0 auto;
	margin-top: 160px;
	margin-bottom: 160px;
	padding: 10px 10px 10px 10px;
}

.label {
	color: red;
	text-align: center;
	font-size: 10px;
	width: auto;
	margin: 1px 10px 1px 10px;
}

#submit {
	color: white;
	text-align: center;
	border-radius: 5px;
	height: 40px;
	width: 120px;
	font-size: 15px;
	margin: 1px 10px 1px 10px;
}
</style>
</head>
<body>
	<%@ include file="../mypage/common/mypageHeader.jsp"%>
	<div class="form">
		<form id="updateForm" action="<%=request.getContextPath()%>/mUpdate.do" method="post">
			<table>
				<tr>
					<td><label class="inputContent">닉네임</label></td>
					<td colspan="2"><input type="text" class="inputContent"
						name="nickName" id="nickName" oninput="checkNickName();"
						value="<%= m.getMname()%>" readonly></td>
				</tr>
				<tr>
					<td><label class="inputContent">이메일</label></td>
					<td colspan="2"><input type="email" class="inputContent"
						value="<%= m.getMemail()%>" readonly></td>
				</tr>
				<tr>
					<td><label class="inputContent">호두</label></td>
					<td colspan="2"><input type="text" class="inputContent"
						value="<%= m.getMhodu()%>" readonly></td>
				</tr>
				<tr>
					<td><label>가입일</label></td>
					<td><input type="text" value="<%=m.getMdate() %>" readonly></td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>