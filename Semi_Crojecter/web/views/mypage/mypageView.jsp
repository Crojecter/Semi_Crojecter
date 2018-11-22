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
	background:lightgray;
	border-radius: 5px;

}

.label {
	color: red;
	text-align: center;
	font-size: 10px;
	width: auto;
	margin: 1px 10px 1px 10px;
}

.inputContent {

	width: auto;
	text-align:center;
	background:lightgray;
	border:lightgray;

}

.table{

	font-size:15px;
	height: 300px;
	color:white;

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

.subject {
	margin-top:20px;
	margin-bottom:20px;
}

.tdStyle{
	height:20px;
}
</style>
</head>
<body>
	<%@ include file="../mypage/common/mypageHeader.jsp"%>
	<div class="form">
			<table class="table">
				<tr>
					<td class="tdStyle"><label class="subject">닉네임</label></td>
					<td colspan="2" class="tdStyle"><input type="text"
						class="inputContent" name="nickName" id="nickName"
						oninput="checkNickName();" value="<%=m2.getMname()%>" readonly></td>
				</tr>
				<tr>
					<td class="tdStyle"><label class="subject">이메일</label></td>
					<td colspan="2" class="tdStyle"><input type="email"
						class="inputContent" value="<%=m2.getMemail()%>" readonly></td>
				</tr>
				<tr>
					<td class="tdStyle"><label class="subject">호두</label></td>
					<td colspan="2" class="tdStyle"><input type="text"
						class="inputContent" value="<%=m2.getMhodu()%>" readonly></td>
				</tr>
				<tr>
					<td class="tdStyle"><label class="subject">가입일</label></td>
					<td class="tdStyle"><input type="text" class="inputContent"
						value="<%=m2.getMdate()%>" readonly></td>
				</tr>
			</table>
	</div>

</body>
</html>