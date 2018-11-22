<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.*"
	import="com.kh.alarm.model.vo.*, java.util.*"%>
<% 
	Member m = (Member)session.getAttribute("member"); 
    // 읽지않은 알람갯수 조회용
	ArrayList<Alarm> aList = (ArrayList<Alarm>)request.getAttribute("aList"); 
	System.out.println("Header alist : "+ aList);	
	Alarm al = (Alarm) request.getAttribute("Alarm");
	
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootstrap css include -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- bootstrap js include -->
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 폰트 설정 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">


<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<!-- tagsinput -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap-tagsinput/bootstrap-tagsinput.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap-tagsinput/assets/app.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

<style>
	.sign{
		font-size : 18px;
		font-weight: bold;
		color : black;
		margin-left:5px;
		margin-right:5px;
		font:bolder;
	}
	.sign:hover{
 		color : #30B2A0;
 		font-weight: bold;
	}

</style>

</head>
<body style="position: absolute; width: 100%;">
	<div class="row" style="background: white;">
		<div class="col-md-2">
			
		</div>
		<div class="col-md-8" style="padding-top: 10px;">
			<nav class="navbar navbar-expand-lg navbar-light"
				style="background: white; margin-bottom: 10px;">
				<!-- 로고 -->
			<a href="<%=request.getContextPath()%>/gList.ga"> <img
				src="<%=request.getContextPath()%>/resources/images/icon/LogoImage.png"
				alt="" style="width: 150px;%; height: 50px;" /></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent" 
					 style="padding-left: 20px; padding-right: 0; padding-top: 5px;">
					<div class="col-md-3">
						<!-- 왼쪽 -->
						<ul class="navbar-nav mr-auto" style="list-style: none;">
							<!-- 갤러리 -->
							<li class="galleryLink">
								<h4>
									<a class="sign" style="text-decoration:none" href="<%=request.getContextPath()%>/gList.ga">갤러리</a>
								</h4>
							</li> &nbsp;&nbsp;&nbsp;
							<!-- 프로젝트 -->
							<li class="projectLink">
								<h4>
									<a class="sign" style="text-decoration:none" href="<%=request.getContextPath()%>/pList.pr">프로젝트</a>
								</h4>
							</li>
						</ul>
					</div>
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="row">
						<!-- 오른쪽 -->
						<div class="loginArea">
							<%
								if (m == null) {
							%>
							<form id="loginForm" action="/myWeb/login.me" method="post" style="float:left; padding-top: 5px;">
								<a class="sign" style="text-decoration:none; font-weight: normal;"
									href="<%=request.getContextPath()%>/views/member/login.jsp">
									Sign In</a> <a class="sign" style="text-decoration:none; font-weight: normal;"
									href="<%=request.getContextPath()%>/views/member/signUp.jsp">
									Sign Up</a> &nbsp;&nbsp;&nbsp;
							</form>
							<%
								} else {
							%>
							<ul class="navbar-nav mr-auto" style="list-style: none;">
								<%-- <li class="alert alert-primary" style="height:45px"><%= m.getMname() %>
						(회원번호 : <%= m.getMid() %>)님 환영합니다.</li> &nbsp;&nbsp;&nbsp;
						
						<!-- 알람 -->
						<li> --%>
								<!-- data-toggle="tooltip" title="읽지않은 알림메세지가  개 있습니다."  -->
								<li style="padding: 0 5px;">
									<button type="button" data-target="#myModal"
										onclick="openAlarmList();"
										style="height: auto; background-color: white; border: 0px;">
										<img
											src="<%=request.getContextPath()%>/resources/images/icon/alarm.png"
											style="height: 30px"> <span class="badge badge-light"
											id="countUnreadAlarm"></span>
									</button>
								</li>
								<script>
						$(document).ready(function(){
							$.ajax({
								data : { Mid : <%=m.getMid()%>},
								url : "/crojecter/aRead.al",
								type : "post",
								success : function(data){
									$("#countUnreadAlarm").text(data);
								}
							});
						});
					    
						function openAlarmList() {
							
							// 알람창 크기
							var xPos = ((document.body.clientWidth / 2) - (500 / 2)); 
						    xPos += window.screenLeft;
						    var yPos = ((screen.availHeight / 2) - (300 / 2));
						    window.open('<%=request.getContextPath()%>/aList.al?Mid=<%=m.getMid()%>', 
						    		'알람', 'width=500,height=300,top='+yPos+',left='+xPos
						    		+',toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no');
						}
						
						</script>

								<!-- 프로필 -->
								<li class="nav-item dropdown" style="padding: 0 5px;"><a
									href="<%=request.getContextPath()%>#"
									id="navbarDropdown" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"
									style="height: auto; text-decoration: none"> 
									<% if(m.getMprofile() == null) { %> 
									<img src="<%=request.getContextPath()%>/resources/images/user.png" 
									style="height: 30px;" class="rounded-circle" alt="Cinque Terre"> <% } else { %>
									<img src="<%=request.getContextPath()%>/resources/profileFiles/<%=m.getMprofile()%>" 
									style="height: 30px;" class="rounded-circle" alt="Cinque Terre"> <% }  %>
								</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/views/payment/payment.jsp">호두충전</a>
										<% if(m.getMid() != -1) { %>
										<a class="dropdown-item" 
											href="<%= request.getContextPath()%>/selectPage.my?mid=<%=m.getMid()%>">마이페이지</a>
										<% } else { %>
										<a class="dropdown-item" 
											href="<%= request.getContextPath()%>/mListView.do">관리자페이지</a>
										<% } %>
										<div class="dropdown-item" onclick='logout();'>로그아웃</div>
										<script>
							function logout(){
								location.href="/crojecter/logout.me";
							}
							
							</script>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">
							<img src="<%=request.getContextPath()%>/resources/images/icon/walnut.jpg"
								 alt="" style="height: 30px;">:<%=m.getMhodu()%>개</a>
							</div>
							</li>
							<li style="padding: 0 15px;">
							<!-- 글쓰기 --> 
							<a id="moveInsert"
							   href="<%=request.getContextPath()%>/views/board/galleryboard/galleryInsert.jsp"
							 style="height: auto;"> 
							<script>
							var x = location.href;
							$(function(){
							if(x == "http://localhost:8088/crojecter/pList.pr"){
								$("#moveInsert").attr('href','<%=request.getContextPath()%>/views/board/projectboard/projectInsert.jsp');
							}
							
							});			
							</script> 
							<img src="<%=request.getContextPath()%>/resources/images/icon/upload.png"
								 alt="" style="height: 30px;"></a> &nbsp;&nbsp;
							</li>
						</ul>
							<%
								}
							%>
						</div>
						<!-- 검색 -->
						
						<ul style="list-style: none; ">
							<li>
								<form class="navbar-search pull-left"
									action="<%=request.getContextPath()%>/search.all" method="get">
									<input type="text" class="search-query" placeholder="Search"
										name="keyword" style="width: ">
									<button class="btn my-2 my-sm-0" style="background : white;"
										type="submit">
										<img
											src="<%= request.getContextPath()%>/resources/images/icon/search.png"
											alt="" style="height: 20px;">
									</button>
								</form>
							</li>
						</ul>						
						</div>
					
					</div>
				</div>
			</nav>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>