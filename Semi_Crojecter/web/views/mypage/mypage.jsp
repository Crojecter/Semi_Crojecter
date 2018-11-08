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
	.btns{
	}
</style>
</head>
<body>
<form id="updateForm" action="<%=request.getContextPath()%>/mUpdate.do" method="post">
	        <table>
            <tr>
                <td><label>이름</label></td>
            </tr>
            <tr>
                <td colspan="2"><input type="text" name="nickName" id="nickName" value="<%= m.getMname()%>"> </td>
            </tr>
            <tr>
                <td><label>이메일</label></td>
            </tr>
            <tr>
                <td colspan="2"><input type="email" name="email" id="email" value="<%= m.getMemail()%>" readonly></td>
            </tr>
            <tr>
                <td><label>비밀번호</label></td>
            </tr>
            <tr>
                <td><input type="password" name="password" id="password" colspan="2"/></td>
            </tr>
            <tr>
                <td><input type="password" name="passwordCheck" id="passwordCheck" colspan="2"/></td>
            </tr>
            <tr colspan="2">
                <td><input type="submit" id="updateForm" onclick="updateMember();" value="수정하기"></td>
                <td><input type="button" id="delete" onclick="deleteMember();" value="탈퇴하기"></td>
            </tr> 
        </table>
	</form>
	<script>
	function updateMember() {
		$("#updateForm").submit();
	}
	
	function deleteMember() {
		location.href = "/crojecter/mDelete.do?mid=<%=m.getMemail()%>";
	}
	

	</script>
</body>
</html>