<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.*, java.util.*"%>
<!DOCTYPE html>
<html>

<head>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
.outer{
		width:900px;
		height:600px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table {
		padding : 20px;
		border:1px solid white;
		text-align:center;
	}
	.tableArea {
		width:750px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	.searchArea {
		width:650px;
		margin-left:auto;
		margin-right:auto;
	}

</style>
</head>
<body>
<%@ include file="../adminpage/common/adminpageHeader.jsp" %>
	<div class="searchArea">
		<select id="searchMember" name="searchMember">
			<option value="name">이름</option>
			<option value="email">이메일</option>
		</select>
		<input type="search">
		<button type="button" onclick="search();">검색하기</button>
</div>
<table>
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>이메일주소</th>
		<th>호두</th>
		<th>상태</th>	
    </tr>
    <%-- <% for(Member m : mlist){ %> --%>
	<tr>
		<td id="mid"><%-- <%= m.getMid()%> --%>회원 번호</td>
		<td><%-- <%= m.getMname()%> --%>회원 이름</td>
		<td><%-- <%= m.getMemail()%> --%>이메일 주소</td>
		<td><%-- <%= m.getMhodu()%> --%>호두</td>
		<td>
			<select name="status" onchange="changeStatusSelect()">
				<option id="status1" value="1" selected>활성</option>
				<option id="status2" value="2">비활성</option>
				<option id="status3"value="3">탈퇴</option>
			</select>
		</td>			
	</tr>
	<%-- <% } %> --%>
</table>
<script>
	console.log(<%= m.getMsid() %>);
	var status_name = null;
	switch(<%= m.getMsid() %>) {
	case 1 : status_name = "활성"; break;
	case 2 : status_name = "비활성"; break;
	case 3 : status_name = "탈퇴"; break;
	}
	console.log("회원 상태 : " + status_name);
	console.log($("#status").text());
	if($("#status1").text() == status_name) {
		//console.log("값 일치");
		$("#status1").attr("selected", true);
		$("#status2").removeAttr("selected");
		$("#status3").removeAttr("selected");
		
	}else if($("#status2").text() == status_name){
		//console.log("값2 일치");
		$("#status2").attr("selected", true);
		$("#status1").removeAttr("selected");
		$("#status3").removeAttr("selected");
		
	}else if($("#status3").text() == status_name){
		//console.log("값3 일치");
		$("#status3").attr("selected", true);
		$("#status1").removeAttr("selected");
		$("#status2").removeAttr("selected");
		
	}else {
		console.log("값 불일치");
	}

	function chageStatusSelect(){
    	var sel = document.getElementById("status").value;
    	var mid = document.getElementById("mid").value;
    	$.ajax({
    		type:'get',
    		url : '/crojecter/mStatusChange.do',
    		data : {changeSel:sel, chageMid:mid},
    		
    		success : function(data){
    			location.href='/crojecter/views/adminpage/memberlistView.jsp';
    			console.log("성공");
    		},
    		error : function (request,status,error){
    			console.log("실패");
    		}
    	});
	}
	
	function search(){
		location.href="<%=request.getContextPath()%>/searchMember.do?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
	}

</script>
</body>
</html>