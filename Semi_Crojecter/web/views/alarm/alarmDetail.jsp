<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.alarm.model.vo.*, java.util.*" %>
<% 
	// 읽지않은 알람목록 조회용
	ArrayList<Alarm> alarmList = (ArrayList<Alarm>)request.getAttribute("alarmList");
	System.out.println("alarmDetail alist : "+ alarmList);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알람메세지 페이지입니다.</title>
	<style>
		#alarmTB, #alarmTR, #alarmTB {background:lightyellow; border:solid 3px;}
	</style>

</head>

	<div class="outer">
		<br>
		<div class="tableArea">
		<% if(alarmList != null){ %>
			<table align="center" id="alarmList">
			<tr>
				<th id="alarmTH">내용</th>
				<th id="alarmTH">날짜</th>
				<th id="alarmTH">확인</th>
			</tr>
			<% for(Alarm al : alarmList){ %>
			<tr>
				
				<td><%= al.getAMsg() %>
					<input type="hidden" value="<%= al.getMid() %>">
				</td>
				<td><%= al.getADate() %></td>
				<% if( al.getAFlag().equals("Y")) { %>
				<td> 확인 </td>
				<% } %>
			</tr>
			<% } %>
			</table>
		<% } else { %>
			현재 전송된 알람이 없습니다.
		<% } %>
		</div>
		<script>
			$(function(){
				$("#alarmList td").mouseenter(function(){
					var bno = $(this).parent().find("input").val();
					location.href="<%=request.getContextPath()%>/aList.al?Aid=" + Aid;
				});
			});
		</script>


	</table>
</body>
</html>