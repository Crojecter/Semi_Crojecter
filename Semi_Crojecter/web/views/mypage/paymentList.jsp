<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "com.kh.payment.model.vo.*, com.kh.member.model.vo.*, com.kh.spon.model.vo.*, java.util.*"%>
<% 
	Member m = (Member)session.getAttribute("member");
	ArrayList<Spon> slist = (ArrayList<Spon>)request.getAttribute("list");
	ArrayList<Payment> plist = (ArrayList<Payment>)request.getAttribute("list"); 
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
<form id="sponForm" action="<%=request.getContextPath()%>/sponSelect.do" method="post">
<table class="sponTable">
	<thead class="sThead">
	<tr> 
		<th>날짜</th>
		<th>내용</th>
		<th>사용내역</th>
		<th>비고</th>
	</tr>
	</thead>
	<tbody>
	<% for(Spon s : slist){ %>
	<tr>
		<td><%=s.getSdate() %></td>
		<td><%=s.getSreceivername() %></td>
		<td><%=s.getShodu() %></td>
		<td></td>
	</tr>
	<% } %>
	</tbody>
</table>
<label>충전 내역</label>
<form id="paymentForm" action="<%=request.getContextPath()%>/paymentSelect.do" method="post">
<table class="paymentTable">
	<thead class="pThead">
	<tr> 
		<th>날짜</th>
		<th>충전내역</th>
		<th>비고</th>
	</tr>
	
	</thead>
	<tbody>
	<% for(Payment p : plist){ %>
	<tr>
		<td><%=p.getPdate() %></td>
		<td><%=p.getPmoney() %></td>
		<td></td>
	</tr>
	<% } %>
	</tbody>
</table>
<label>현재 호두 잔액</label><input <%=m.getMhodu() %>>
</body>
</html>