<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="The Page Description">
		<style type="text/css">@-ms-viewport{width: device-width;}</style>
		<title>Beetle - Home page</title>
		<link rel="stylesheet" href="/resources/css/layers.min.css" media="screen">
		<link rel="stylesheet" href="/resources/css/font-awesome.min.css" media="screen">
		<link rel="stylesheet" href="/resources/css/style.css" media="screen">
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		
		<%-- SOCKET IO --%>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
		<%-- SOCKET IO --%>
		
		<script>
			var sock = null;
	
			$(document).ready(function () {
				connectWs();
			});
	
			function connectWs() {
	
				sock = new SockJS('http://localhost:8080/echo');
	
				sock.onopen = function () {
					console.log('open');
	
				};
	
				sock.onmessage = onMessage;
	
				sock.onclose = function () {
					console.log("체크" + sock);
					console.log('close');
				};
	
			};
	
			function getContextPath() {
				var hostIndex = location.href.indexOf(location.host) + location.host.length;
	
				return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
			};
			
			function onMessage(evt){
			    var data = evt.data;
			    // toast
			    let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
			    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
			    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
			    toast += "<span aria-hidden='true'>&times;</span></button>";
			    toast += "</div> <div class='toast-body'>" + data + "</div></div>";
			    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
			    $(".toast").toast({"animation": true, "autohide": false});
			    $('.toast').toast('show');
			};	
		
		</script>
		
	</head>

</head>

<body class="page">

   <header role="banner" class="transparent light">
      <div class="row">
         <div
            class="nav-inner row-content buffer-left buffer-right even clear-after">
            <div id="brand">
               <h1 class="reset">
                  <!--<img src="img/logo.png" alt="logo">-->
                  <a href="/main.jsp">Link</a>
               </h1>
            </div>
            <!-- brand -->
            <a id="menu-toggle" href="#"><i class="fa fa-bars fa-lg"></i></a>
            <nav>
               <ul class="reset" role="navigation">
                  <li class="menu-item"><a href="/main.jsp">Home</a></li>
                  <li class="menu-item"><a href="/feed/getFeedList">Feed</a></li>
                  <li class="menu-item"><a href="/">Live</a></li>
                  <li class="menu-item"><a href="/club/getClubList">Club</a></li>
                  <li class="menu-item"><a
                     href="/myHome/getMyHome?userId=${sessionScope.user.userId}">MyHome</a></li>
                  <li class="menu-item"><a
                     href="/serviceCenter/serviceCenterHome.jsp">ServiceCenter</a></li>
                  <c:if test="${ empty sessionScope.user }">
                     <li class="menu-item"><a href="/user/login">로그인</a></li>
                  </c:if>
                  <c:if test="${!empty sessionScope.user }">
                     <li class="menu-item"><a
                        href="/user/logout?userId=${sessionScope.user.userId}">로그아웃</a></li>
                     <c:if test="${fn:trim(sessionScope.user.role) == '0' }">
                        <li class="menu-item"><a
                           href="/user/getUser?userId=${sessionScope.user.userId}">내정보보기</a></li>
                     </c:if>
                     <c:if test="${fn:trim(sessionScope.user.role) == '1' }">
                        <li class="menu-item"><a href="/user/getUserList">관리자페이지</a></li>
                     </c:if>
                     
                     <%-- 실시간 알림 --%>
                     <c:if test="${!empty sessionScope.user}">
                        <li class="menu-item"><a href="/push/getPushList">알림</a></li>
                     </c:if>
                     <%-- 실시간 알림 --%>
                     
                  </c:if>
               </ul>
            </nav>
         </div>
         <!-- row-content -->
      </div>
      <!-- row -->
   </header>