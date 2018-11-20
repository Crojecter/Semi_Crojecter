<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "com.kh.payment.model.vo.*, com.kh.member.model.vo.*, com.kh.spon.model.vo.*, java.util.*"%>
<% 
	ArrayList<Spon> slist = (ArrayList<Spon>)request.getAttribute("slist");
	ArrayList<Payment> plist = (ArrayList<Payment>)request.getAttribute("plist"); 
%>
<!DOCTYPE html>
<html>
 
<head>
<script src="/crojecter/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>

</head>
<body>
<%@ include file="../mypage/common/mypageHeader.jsp" %>
<div>
<label>*후원 내역</label>
<table class="sponTable">
	<tr> 
		<th>날짜</th>
		<th>받는이</th>
		<th>후원호두</th>
	</tr>
		<% for(Spon s : slist){ %>
	<tr>
		<td><%=s.getSdate()%></td>
		<td><%=s.getSreceivername() %></td>
		<td><%=s.getShodu() %></td>
	</tr>
	<% } %>


</table>
</div>
<br><br><br><br><br><br>
<div>
<label>*충전 내역</label>
<table class="paymentTable">
	<tr> 
		<th>날짜</th>
		<th>충전 호두</th>
		<th>충전 금액</th>
	</tr>
	<% for(Payment p : plist){ %>
	<tr>
		<td><%=p.getPdate()%></td>
		<td><%=p.getPhodu() %></td>
		<td><%=p.getPmoney_1() %></td>
	</tr>
	<% } %>
</table>
</div>
</body>
</html>