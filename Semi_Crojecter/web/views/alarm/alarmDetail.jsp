<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.alarm.model.vo.*, java.util.*" %>
<% 
	// 읽지않은 알람목록 조회용
	ArrayList<Alarm> alarmList = (ArrayList<Alarm>)request.getAttribute("alarmList");
	System.out.println("alarmDetail alist : "+ alarmList);
	System.out.println("alarmDetail sz : "+ alarmList.size());
	int Mid = Integer.parseInt(request.getParameter("Mid"));
	int result = 0;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<title>알람메세지 페이지입니다.</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<style>
		#alarmTB, #alarmTR, #alarmTB {background:lightyellow; border:solid 3px;}
	</style>
</head>
<body>
	<div class="outer">
		<br>
		<script>
		$(function(){
			console.log(sessionStorage.getItem("myAlarmList"));
		});
		</script>
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
				</td>
				<td><%= al.getADate() %></td>
				<% if( al.getAFlag().equals("Y")) { %>
				<td><button onclick="updateAlarm(this, '<%=al.getAid()%>');">미확인</button></td>
				<% } else { %>
				<td>확인</td>
				<% } %>
			</tr>
			<% } %>
			
			</table>
			<script>

			function updateAlarm(obj, alarmNo){
					$.ajax({
						data : { Aid : alarmNo},
						url : "/crojecter/aUpdate.al",
						type : "post",
						async: false,
						success : 
							function(data){ 
							if (data > 0){
								obj.append("확인");
								obj.remove();
								window.location.reload();
							}
							
						}
					});
			}
			
				</script>
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
			
			var result = 0;
			<%-- 
			$(document).ready(function(){
				$.ajax({
					data : { Mid : <%= mid %>},
					url : "/crojecter/aList.al",
					type : "post",
					success : function(data){}
				});
			}); --%>
		</script>


</body>
</html>