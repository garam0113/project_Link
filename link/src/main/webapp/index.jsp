<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Aerial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>LINK</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
					<header id="header">
						<h1>서로를 연결하는</h1>
						<p>두근거리는 &nbsp;&bull;&nbsp; 서로의 &nbsp;&bull;&nbsp; 만남</p>
						<nav>
							<ul>
								<li><a href="/feed/getFeedList" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
								<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
								<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
							</ul>
						</nav>
					</header>

				<!-- Footer -->
					<footer id="footer">
						<span class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>.</span>
					</footer>

			</div>
		</div>
		<script>
			window.onload = function() { document.body.classList.remove('is-preload'); }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
	</body>
</html>