<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="The Page Description">
<style type="text/css">
@
-ms-viewport {
	width: device-width;
}
</style>
<title>LINK</title>

<link rel="stylesheet" href="/resources/css/layers.min.css" media="screen">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="/resources/css/style.css" media="screen">

<%-- BOOTSTRAP ICON --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<%-- BOOTSTRAP ICON --%>

<%-- SUMMER NOTE --%>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<%-- SUMMER NOTE --%>

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->

<%-- alert --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<%-- SOCKET IO --%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<%-- SOCKET IO --%>

<script type="text/javascript"></script>

<script>
		var sock = null;

		$(document).ready(function () {
			connectWs();
		});

		function connectWs() {

			sock = new SockJS("<c:url value="/echo"/>");
			
			sock.onopen = function () {
				console.log('open');

			};

			sock.onmessage = onMessage;

			sock.onclose = function () {
				console.log('close');
			};

		};

		function getContextPath() {
			var hostIndex = location.href.indexOf(location.host) + location.host.length;

			return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
		};
		
		function onMessage(evt){
			var data = evt.data;
		    
		    const Toast = Swal.mixin({
		    	  toast: true,
		    	  position: 'bottom-end',
		    	  showConfirmButton: false,
		    	  timer: 10000,
		    	  timerProgressBar: true,
		    	  didOpen: (toast) => {
		    	    toast.addEventListener('mouseenter', Swal.stopTimer)
		    	    toast.addEventListener('mouseleave', Swal.resumeTimer)
		    	  }
		    	})

		    	Toast.fire({
					icon: 'info',
					title: data
		    	})
		    
		};	
	
</script>


<script>
			
			$(function () {
				
				$(document).on("click",".clubNav", function() {
					
					Swal.fire({
						title: '로그인 후 이용해주세요' ,
						text: "로그인 창으로 이동합니다" ,
						showCancelButton: false,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: '확인', 
					}).then((result) => {
						if(result.value) {
							self.location="/user/login.jsp"	
						}
					})
				})
			});
			
</script>

</head>

<style>
header {
	display: flex;
}

/* SCROLL */
body.page {
	overflow-y: scroll !important;
}

body.page::-webkit-scrollbar {
	display: none !important;
}

body.swal2-shown {
	padding-right: 0px !important;
}

/* SCROLL */
header {
	overflow-y: scroll !important;
}

header::-webkit-scrollbar {
	display: none !important;
}

/* SCROLL */

/* SCROLL */
</style>

</head>

<body class="page">

	<header role="banner" class="transparent light">
		<div class="row">
			<div class="nav-inner row-content buffer-left buffer-right even clear-after">
				<div id="brand">
					<h1 class="reset">
						<!--<img src="img/logo.png" alt="logo">-->
						<a href="/main.jsp"><img src="/resources/image/uploadFiles/link_logo3.png" width="120px" height="48px"></a>
					</h1>
				</div>
				<!-- brand -->

				<nav>
					<ul class="reset" role="navigation">
						<li class="menu-item"><a href="/main.jsp">Home</a></li>
						<li class="menu-item"><a href="/feed/getFeedList">Feed</a></li>

						<c:if test="${! empty sessionScope.user }">
							<li class="menu-item"><a href="/club/getClubList">Club</a></li>
						</c:if>

						<c:if test="${ empty sessionScope.user }">
							<li class="menu-item"><a href="#" class="clubNav" onclick="clubNav();">Club</a></li>
						</c:if>

						<li class="menu-item"><a href="/myHome/getMyHome?userId=${sessionScope.user.userId}">MyHome</a></li>
						<li class="menu-item"><a href="/serviceCenter/serviceCenterHome">ServiceCenter</a></li>
						<c:if test="${ empty sessionScope.user }">
							<li class="menu-item"><a href="/user/login">로그인</a></li>
						</c:if>
						<c:if test="${!empty sessionScope.user }">
							<li class="menu-item"><a href="/user/logout?userId=${sessionScope.user.userId}">로그아웃</a></li>
							<c:if test="${fn:trim(sessionScope.user.role) == '0' }">
								<li class="menu-item"><a href="/user/getUser?userId=${sessionScope.user.userId}">내정보보기</a></li>

							</c:if>
							<c:if test="${fn:trim(sessionScope.user.role) == '1' }">
								<li class="menu-item"><a href="/user/getUserList">관리자페이지</a></li>
							</c:if>


						</c:if>

					</ul>

				</nav>

			</div>
			<!-- row-content -->
		</div>
		<%--
		
		<c:if test="${!empty sessionScope.user }">
			<div class="alarmHead" >
							
				<img class="alarmImg" alt="" src="/resources/image/uploadFiles/alarm.png" aria-hidden="true" data-toggle="modal" data-target="#alarmModal"/>
				<span class="badge">
					<c:if test="${empty alarmCount }">
					0
					</c:if>
					<c:if test="${!empty alarmCount }">
					${alarmCount}
					</c:if>
				</span>
			
			</div>
		</c:if>
		
		--%>
		<!-- row -->
	</header>