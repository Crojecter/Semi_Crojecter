<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.*"%>
<% Member m = (Member)request.getAttribute("member"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- bootstrap css include -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="css/main.css">
	<!-- bootstrap js include -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<style>
		table, tr, td{background:lightyellow; border:solid 3px;}
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" style="background:lightyellow">
		<a href="<%= request.getContextPath()%>/galleryMain.jsp">
		<img src="<%= request.getContextPath()%>/resources/images/icon/LogoImage.png" alt="" style="height:50px"/></a> 
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- 왼쪽 -->&nbsp;&nbsp;&nbsp;
			<ul class="navbar-nav mr-auto">
				<!-- 갤러리 -->
				<li class="galleryLink">
				<h4><a href="<%= request.getContextPath()%>/galleryMain.jsp">갤러리</a> &nbsp;&nbsp;&nbsp;</h4>
				</li>
				<!-- 프로젝트 -->
				<li class="projectLink">
				<h4><a href="<%= request.getContextPath()%>/views/projectBoard/projectPage.jsp">프로젝트</a></h4>
				</li>
			</ul>
			<!-- 오른쪽 -->
			<form class="form-inline my-2 my-lg-0">
				<ul class="navbar-nav mr-auto">
					<!-- 알람 -->
					<li>
					<span data-original-title="읽지않은 알림메세지가  <%= 10%>개 있습니다." data-toggle="tooltip">
					<button type="button" class="btn btn-primary" 
					data-toggle="modal" data-target="#exampleModal" data-whatever="1">
					<img src="<%= request.getContextPath()%>/resources/images/icon/alarm.png" style="height:30px">
					<span class="badge badge-light"> <%= 10%></span>
					<span class="sr-only">unread messages</span>
					</button>
					</span>
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">알람 메세지 목록</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <form>
					          <table>
					            <tr> 
						            <td>작성자</td>
						            <td>내용</td>
						            <td>날짜</td>
						            <td>확인</td>
					          	</tr>
					          	<tr>
						          	<td>관리자</td>
						          	<td><label id="amsg"><span>눈사람도 법인격이 있는건가요</span></label></td>
						          	<td><label id="adate"><span>SYSDATE</span></label></td>
						          	<td><label id="aflag"><span>모름</span></label></td>
					          	</tr>
					          	<tr>
						          	<td>관리자</td>
						          	<td><label id="amsg"><span>눈사람도 법인격이 있는건가요</span></label></td>
						          	<td><label id="adate"><span>SYSDATE</span></label></td>
						          	<td><label id="aflag"><span>모름</span></label></td>
					          	</tr>
					          	<tr>
						          	<td>관리자</td>
						          	<td><label id="amsg"><span>눈사람도 법인격이 있는건가요</span></label></td>
						          	<td><label id="adate"><span>SYSDATE</span></label></td>
						          	<td><label id="aflag"><span>모름</span></label></td>
					          	</tr>
					          	<tr>
						          	<td>관리자</td>
						          	<td><label id="amsg"><span>눈사람도 법인격이 있는건가요</span></label></td>
						          	<td><label id="adate"><span>SYSDATE</span></label></td>
						          	<td><label id="aflag"><span>모름</span></label></td>
					          	</tr>								
					          </table>
					        </form>
					      </div>
					    </div>
					  </div>
					</div>
					
					<script>
						$(document).ready(function(){
							$('[data-toggle="tooltip"]').tooltip(); 
						});
					</script>	
					<!-- 프로필 -->
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="<%= request.getContextPath()%>#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img src="<%= request.getContextPath()%>/resources/images/defaultImg.jpg" style="height: 30px;" class="rounded-circle" alt="Cinque Terre">
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="<%= request.getContextPath()%>/views/payment/payment.jsp">호두충전</a>
						<a class="dropdown-item" href="<%= request.getContextPath()%>myPageLink">마이페이지</a>
						<div class="dropdown-item" onclick='logout();'>로그아웃</div>
						<script>
						function logout(){
							location.href="/crojecter/logout.me";
						}
						</script>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"><img src="<%= request.getContextPath()%>/resources/images/icon/walnut.jpg" alt="" style="height:30px;">: <span>??</span>개</a>
					</div>
					<li>
					<a href="<%= request.getContextPath()%>/views/board/BoardInsert.jsp">
					<img src="<%= request.getContextPath()%>/resources/images/icon/upload.png" alt="" style="height:40px;"></a>
					&nbsp;&nbsp;</li>
				</ul>

				<div class="loginArea">
				<%if ( m == null ) { %>
					<form id="loginForm" action="/myWeb/login.me" method="post">
						<a href="<%= request.getContextPath()%>/views/member/login.jsp">
						<img src="<%= request.getContextPath()%>/resources/images/icon/signIn.png" alt="" style="height:40px;"/> </a>
						<a href="<%= request.getContextPath()%>/views/member/signUp.jsp">
						<img src="<%= request.getContextPath()%>/resources/images/icon/signUp.png" alt="" style="height:40px;"/> </a>
						&nbsp;&nbsp;&nbsp;
					</form>
					<% } else { %>
					<div id="userInfo">
						<label><%= m.getMname() %>님의 방문을 환영합니다.</label>
						<div class="btns" align="right">
							<div id="changeInfo" onclick="changeInfo()">정보수정</div>
							<div id="logoutBtn" onclick='logout()'>로그아웃</div> 
						</div>
						
					</div>
				<% } %>
				</div>
				<!-- 검색 -->
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" style="width:250px;">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
				<img src="<%= request.getContextPath()%>/resources/images/icon/search.png" alt="" style="height:20px;"></button> &nbsp;
			</form>
		</div>
	</nav>
	<!-- 리모컨 -->
	<div style="position: fixed; right: 50%; top: 80%; margin-right: -720px; text-align:center; width: 10%;">
	<button><a href="#top"><img src="<%= request.getContextPath()%>/resources/images/icon/up.png" alt="" style="height:30px;"></a></button><br>
	<button><a href="#bottom"> <img src="<%= request.getContextPath()%>/resources/images/icon/down.png" alt="" style="height:30px;"></a></button>
	</div>
	<a name="bottom"></a>
</body>
</html>