<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

<script type="text/javascript">
	$(function() {
		$("li:contains('내정보보기')").on("click", function() {
			self.location = "/user/getUser?userId=${user.userId}";
		});

		$("li:contains('내정보수정')").on("click", function() {
			self.location = "/user/updateUser?userId=${user.userId}";
		});

		$("li:contains('차단리스트')").on("click", function() {
		});

		$("li:contains('신고내역')").on("click", function() {
		});

		$("li:contains('Q&A')").on("click", function() {
		});

		$("li:contains('회원정보수정')").on("click", function() {
			self.location = "/user/getUserList";
		});

		$("li:contains('신고내역조회')").on("click", function() {
		});

		$("#stop2").on("click", function() {
			self.location = "/user/getUserList?searchKeyword=2";
		});

		$("#stop1").on("click", function() {
			self.location = "/user/getUserList?searchKeyword=1";
		});

	});
</script>
</head>

<body class="portfolio">
	<jsp:include page="/toolbar.jsp" />
	<main role="main">
		<div id="intro-wrap" class="topbar" data-height="13.222">
			<div id="intro" class="preload darken">
				<div class="intro-item">
					<div class="caption">
						<h2>MyPage</h2>
					</div>
					<!-- caption -->
				</div>
			</div>
			<!-- intro -->
		</div>
		<!-- intro-wrap -->
	</main>
	<!-- main -->

	<c:if test="${ user.role == '0' }">
		<div id="main" class="row">
			<div class="row-content buffer clear-after">
				<ul class="inline cats filter-options">
					<li data-group="advertising">내정보보기</li>
					<li data-group="fun">내정보수정</li>
					<li data-group="icons">차단리스트</li>
					<li data-group="infographics">신고내역</li>
					<li data-group="lightbox">Q&A</li>
				</ul>
			</div>
			<!-- row-content -->
		</div>
		<!-- row -->
	</c:if>

	<c:if test="${ user.role == '1' }">
		<div id="main" class="row">
			<div class="row-content buffer clear-after">
				<ul class="inline cats filter-options">
					<li data-group="icons">회원정보수정</li>
					<li data-group="infographics">신고내역조회</li>
					<li data-group="lightbox">Q&A</li>
					<li data-group="lightbox" id="stop2">영구정지회원</li>
					<li data-group="lightbox" id="stop1">정지회원</li>
				</ul>
			</div>
			<!-- row-content -->
		</div>
		<!-- row -->
	</c:if>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
</body>

</html>