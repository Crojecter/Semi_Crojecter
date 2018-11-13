<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.alarm.model.vo.*, java.util.*"%>
<% 
	ArrayList<Alarm> alarmList = (ArrayList<Alarm>)request.getAttribute("list"); 
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

<body>
	<table id="alarmTB">
	    <tr id="alarmTR"> 
	      <td id="alarmTD">작성자</td>
	      <td id="alarmTD">내용</td>
	      <td id="alarmTD">날짜</td>
	      <td id="alarmTD">확인</td>
	   	</tr>
	   	<tr id="alarmTR">
	    	<td id="alarmTD">관리자</td>
	    	<td id="alarmTD"><label id="amsg"><span>눈사람도 법인격이 있는건가요</span></label></td>
	    	<td id="alarmTD"><label id="adate"><span>SYSDATE</span></label></td>
	    	<td id="alarmTD"><label id="aflag"><span>모름</span></label></td>
	   	</tr>
	   	<tr id="alarmTR">
	    	<td id="alarmTD">관리자</td>
	    	<td id="alarmTD"><label id="amsg"><span>눈사람도 법인격이 있는건가요</span></label></td>
	    	<td id="alarmTD"><label id="adate"><span>SYSDATE</span></label></td>
	    	<td id="alarmTD"><label id="aflag"><span>모름</span></label></td>
	   	</tr>
	   	<tr id="alarmTR">
	    	<td id="alarmTD">관리자</td>
	    	<td id="alarmTD"><label id="amsg"><span>눈사람도 법인격이 있는건가요</span></label></td>
	    	<td id="alarmTD"><label id="adate"><span>SYSDATE</span></label></td>
	    	<td id="alarmTD"><label id="aflag"><span>모름</span></label></td>
	   	</tr>
	   	<tr id="alarmTR" >
	    	<td id="alarmTD">관리자</td>
	    	<td id="alarmTD"><label id="amsg"><span>눈사람도 법인격이 있는건가요</span></label></td>
	    	<td id="alarmTD"><label id="adate"><span>SYSDATE</span></label></td>
	    	<td id="alarmTD"><label id="aflag"><span>모름</span></label></td>
	   	</tr>								
	</table>
</body>
</html>