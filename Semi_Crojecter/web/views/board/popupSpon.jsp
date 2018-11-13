<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.gallery.model.vo.*, com.kh.member.model.vo.Member" %>
<%
	Member m = (Member)session.getAttribute("member");
	Gallery g = (Gallery)request.getAttribute("gallery");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<title>후원하기</title>
<style>
	button{
		width:180px;
		height:80px;
		font-size:20px;
		color:white;
		text-align:center;
		border-radius:5px;
		background-color:#30B2A0;
		border:1px solid #30B2A0;
	}
	p{
		margin:10px 10px 10px 10px;
	}
</style>
</head>
<body style="width:400px; margin:auto; margin-top:40px;">
	<div align="center" style="width:400px">
		<span id="childGiverid" style="display:none;"></span>
		<p style="font-size:20px; text-align:center;"><span style="color:orange;" id="childName"></span> 님에게 <span style="color:orange;">후원</span>하시겠습니까?</p>
		<table>
			<tr>
				<td><button id="spon10" onclick="spon(10);">호두 10알</button></td>
				<td><button id="spon30" onclick="spon(30);">호두 30알</button></td>
			</tr>
			<tr>
				<td><button id="spon50" onclick="spon(50);">호두 50알</button></td>
				<td><button id="spon100" onclick="spon(100);">호두 100알</button></td>
			</tr>
		</table>
	</div>
	<script>
		$("#childName").text($(opener.document).find("#parentGetName").text());
		$("#childGiverid").text($(opener.document).find("#parentGetmid").text());
		var swriter = $("#childName").text();
		var smid = $("#childGiverid").text();
		console.log("로그인 : " + smid);
		console.log("작성자 : " + swriter);
		
		function spon(hodu){
			$.ajax({
				data : { Shodu : hodu, Smid : smid, Swriter : swriter },
				url : "/crojecter/spon.sp",
				type : "post",
				success : function(data) {
					if(data == "success") {
						alert("후원에 성공했습니다.");
						close();
					}else if(data == "-2") {
						alert("잔여 호두량이 부족합니다.");
						window.opener.location.href = "../payment/payment.jsp";
						close();
					}else if(data == "fail") {
						alert("후원에 실패했습니다.<br>관리자에게 문의해주세요.");
						close();
					}
				}
			});
		}
	</script>
</body>
</html>