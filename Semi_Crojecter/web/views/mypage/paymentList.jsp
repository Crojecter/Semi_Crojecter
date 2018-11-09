<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.*" import="com.kh.spon.model.vo.*"
    import = "com.kh.payment.model.vo.*"%>
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
	.table {
	border: 1px solid black;
	}
	
	.thead {
	color : white;
	background : grey;
	}
	
	.tbody {
	
	}
</style>
</head>
<body>
<label>후원 내역</label>
<table class="sponTable">
	<thead class="sThead">
	<tr> 
		<th>날짜</th>
		<th>내용</th>
		<th>사용내역</th>
		<th>잔액</th>
		<th>비고</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td value=""></td>
		<td value=""></td>
		<td value=""></td>
		<td value=""></td>
		<td></td>
	</tr>
	</tbody>
</table>
<label>충전 내역</label>
<table class="paymentTable">
	<thead class="pThead">
	<tr> 
		<th>날짜</th>
		<th>내용</th>
		<th>충전내역</th>
		<th>잔액</th>
		<th>비고</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td value=""></td>
		<td value=""></td>
		<td value=""></td>
		<td value=""></td>
		<td></td>
	</tr>
	</tbody>
</table>
<label>호두 잔액</label><input type="text" value="개">
</body>
</html>