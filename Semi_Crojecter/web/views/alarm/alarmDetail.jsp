<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.alarm.model.vo.*, java.util.*" %>
<% 
	
	ArrayList<Alarm> alarmList = (ArrayList<Alarm>)request.getAttribute("alarmList");
	System.out.println("alarmDetail alist : "+ alarmList);
		
/* 	Alarm al = (Alarm) request.getAttribute("Alarm");
	int Mid = al.getMid();
	String AFlag = al.getAFlag(); */

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


<%--     		
	    	<td id="alarmTD"><span id="amsg"><%=al.getAmsg()%></span></td>
	    	<td id="alarmTD"><span id="adate"><%=al.getAdate()%></span></td>
--%>	

<%-- 	    	<td id="alarmTD">	    	
	    	<% if( Aflag == 'Y' ) { %>
				확인
			<% } else { %>
				미확인
			<% } %></td> 
--%>

		<table id="alarmTB">
		    <tr id="alarmTR"> 
		      <td id="alarmTD">내용</td>
		      <td id="alarmTD">날짜</td>
		      <td id="alarmTD">확인</td>
		   	</tr>
		   	<tr id="alarmTR">
		    	<td id="alarmTD">
		<div class="thumbnailArea">

	<div class="outer">
		<br>
		<h2 align="center">알림 목록</h2>
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
				<%} else { %>
				<td> 미확인 </td>
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