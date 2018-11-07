<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<% Member m = (Member)session.getAttribute("member"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
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
<body>
	<div style="width:400px">
		<p style="font-size:25px; color:orange; text-align:center;">호두 충전하기</p>
		<p>크리에이터들의 창작활동에 후원을 할 수 있는<br>호두를 충전하세요.</p>
		<table>
			<tr>
				<td><button id="pay5500" onclick="pay(100, 50);">50알(5,550원)</button></td>
				<td><button id="pay11000" onclick="pay(200, 100);">100알(11,000원)</button></td>
			</tr>
			<tr>
				<td><button id="pay33000" onclick="pay(300, 300);">300알(33,000원)</button></td>
				<td><button id="pay55000" onclick="pay(400, 500);">500알(55,000원)</button></td>
			</tr>
		</table>
	</div>

	<script>
		function pay(price, hodu){
			IMP.init("imp17136479");

			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : hodu+'알('+price+'원)',
			    amount : price,
			    buyer_email : '<%= m.getMemail() %>',
			    buyer_name : '<%= m.getMname() %>'
			}, function(rsp) {
			    if ( rsp.success ) {
			    	// 결제 완료시
			        var msg = '결제가 완료되었습니다.';
			        // ajax async 속성 으로 처리
			        $.ajax({
			        	data : { Mhodu : hodu },
						url : "/crojecter/inserthodu.pm",
						type : "post",
						success : function(data) {
							console.log('성공');
						}
			        });
			    } else {
			    	// 결제 실패시
			        var msg = '결제에 실패하였습니다.';
			        
			    }

			    alert(msg);
			    
			});
		}
	</script>
</body>
</html>