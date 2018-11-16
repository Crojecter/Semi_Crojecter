<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.notice.model.vo.*" %>
<%
	ArrayList<Notice> noticeList = (ArrayList<Notice>)request.getAttribute("noticeList");
	System.out.println("jsp noticeList"+ noticeList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항  페이지입니다.</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
		<h2>공지사항 페이지</h2><br />
			<div class="outer">
		<br>
		<div class="tableArea">
		<% System.out.println("Mid : "+ m.getMid()); %>
		<% if(noticeList != null){ %>
			<table align="center" id="noticeList" style="background:lightblue">
			<tr id="noticeTR">
				<th id="noticeTH" width="10px"></th>
				<th id="noticeTH" width="300px">제목</th>
				<th id="noticeTH" width="150px">날짜</th>
				<th id="noticeTH" width="50px">조회수</th>
			</tr>
			<% for(Notice n : noticeList){ %>
			<tr id="noticeTR">				
				<td><input type="hidden" value="<%= n.getBid() %>"/></td>
				<td id="noticeTD"><%= n.getBtitle() %></td>
				<td id="noticeTD"><%= n.getBdate() %></td>
				<td id="noticeTD"><%= n.getBcount() %></td>
			</tr>
			<% } %>
	
			</table>
		<% } else { %>
				현재 공지사항이 없습니다.
		<% } %>
		</div>
		<% if(m != null && m.getMname().equals("관리자")){ %>
		<!-- 인라인 호출방식 -->
		<button onclick="location.href='<%= request.getContextPath() %>/board/noticeInsert.jsp'">작성하기</button>
		<% } %>

		<a name="bottom"></a>
		<script>
		$(function(){
			$("#noticeList td").mouseenter(function(){				
				$(this).parent().css({"background":"purple", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"lightgray"});
			}).click(function(){
				var bid = $(this).parent().children().eq(0).val();
				location.href="<%=request.getContextPath()%>/nSelectOne.no?bid=" + bid;				
			});
		});
		//
		</script>
				<!-- 리모컨 -->
		<div style="position: fixed; right: 50%; top: 80%; margin-right: -720px; text-align:center; width: 10%;">
		<button><a href="#top"><img src="<%= request.getContextPath()%>/resources/images/icon/up.png" alt="" style="height:30px;"></a></button><br>
		<button><a href="#bottom"> <img src="<%= request.getContextPath()%>/resources/images/icon/down.png" alt="" style="height:30px;"></a></button>
		</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>