<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<link rel="icon" href="favicon.ico">
		<link rel="apple-touch-icon" href="/resources/image/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="76x76" href="/resources/imageimg/apple-touch-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="120x120" href="/resources/imageimg/apple-touch-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="152x152" href="/resources/imageimg/apple-touch-icon-152x152.png">	
		
		<!-- MyKey -->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDtYM84InYYv2cSOImZRZz9mIqZFEpfL9A&callback=initMap&v=weekly" defer></script>
							
	</head>

	<body class="page">

		<header role="banner" class="transparent light">
			<div class="row">
				<div class="nav-inner row-content buffer-left buffer-right even clear-after">
					<div id="brand">
						<h1 class="reset"><!--<img src="img/logo.png" alt="logo">--><a href="/main.jsp">Link</a></h1>
					</div><!-- brand -->
					<a id="menu-toggle" href="#"><i class="fa fa-bars fa-lg"></i></a>
					<nav>
						<ul class="reset" role="navigation">
							<li class="menu-item">
								<a href="/main.jsp">Home</a>
							</li>
							<li class="menu-item">
								<a href="/feed/getFeedList">Feed</a>
							</li>
							<li class="menu-item">
								<a href="/">Live</a>
							</li>
							<li class="menu-item"><a href="/club/getClubList">Club</a></li>
							<li class="menu-item">
								<a href="/myHome/getMyHome?userId=${user.userId}">MyHome</a>
							</li>
							<li class="menu-item"><a href="/serviceCenter/serviceCenterHome.jsp">ServiceCenter</a></li>
							<c:if test="${ empty user }">
							<li class="menu-item"><a href="/user/login">로그인</a></li>
							<li class="menu-item"><a href="/user/addUser">회원가입</a></li>
							</c:if>
							<c:if test="${! empty user }">
							<li class="menu-item"><a href="/user/logout?userId=${user.userId}">로그아웃</a></li>
							<li class="menu-item"><a href="/user/getUser?userId=${user.userId}">내정보보기</a></li>
							</c:if>
						</ul>
					</nav>
				</div><!-- row-content -->	
			</div><!-- row -->	
		</header>
