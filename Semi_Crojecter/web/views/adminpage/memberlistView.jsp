<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.*, java.util.*"%>
<%  
	ArrayList<Member> mlist = (ArrayList<Member>)request.getAttribute("mlist");
	System.out.println("mlist : " + mlist);
%>
<!DOCTYPE html>
<html>

<head>
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
		<select id="searchCondition" name="searchCondition">
			<option value="name">이름</option>
			<option value="email">이메일</option>
		</select>
		<input type="search" id="keyword" placeholder="검색어를 입력하세요!">
		<button type="button" onclick="search();">검색하기</button>
	</div>
<table>
	<tr>
		<th>회원번호</th>
		<th>닉네임</th>
		<th>이메일</th>
		<th>호두</th>
		<th>상태</th>	
    </tr>
    <% if(mlist.size() > 0) { %>
    <% for(Member m2 : mlist){ %>
	<tr>
		<td><%= m2.getMid()%></td>
		<td><%= m2.getMname()%></td>
		<td><%= m2.getMemail()%></td>
		<td><%= m2.getMhodu()%></td>
		<td>
			<select id="status" name="status">
				<option value="1">활성</option>
				<option value="2">비활성</option>
				<option value="3">탈퇴</option>
			</select>
			<button onclick="changeStatusSelect(this);">설정</button>
		</td>		
	</tr>
	<% } } else { %>
	<tr><td colspan="5"><p>검색 결과가 존재하지 않습니다.</p></td></tr>
	<% } %>
</table>

<script>

	function chageStatusSelect(obj){
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
		location.href="<%=request.getContextPath()%>/searchMember.do?con="
				+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
	}

</script>
</body>
</html>