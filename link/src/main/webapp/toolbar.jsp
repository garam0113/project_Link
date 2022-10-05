<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("a:contains('회원가입')").on("click", function() {
			self.location = "/user/addUser"
		});
	});
	
	$(function() {
		$("a:contains('로그인')").on("click", function() {
			self.location = "/user/login"
		});
	});
</script>

<div class="navbar  navbar-inverse navbar-fixed-top">

	<div class="container">

		<a class="navbar-brand" href="/mian.jsp">Link</a>

		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#target">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<!-- toolBar Button End //////////////////////// -->

		<!--  dropdown hover Start -->
		<div class="collapse navbar-collapse" id="target"
			data-hover="dropdown"
			data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">

			<!-- Tool Bar 를 다양하게 사용하면.... -->
			<ul class="nav navbar-nav">

				<!--  회원관리 DrowDown -->
				<c:if test="${sessionScope.user.role == 'admin'}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>회원관리</span>
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">

							<li><a href="#">회원정보조회</a></li>

							<li class="divider"></li>
							<li><a href="#">etc...</a></li>
						</ul></li>
				</c:if>

				<!-- 판매상품관리 DrowDown  -->
				<c:if test="${sessionScope.user.role == 'admin'}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>판매상품관리</span>
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">판매상품등록</a></li>
							<li><a href="#">판매상품관리</a></li>
							<li class="divider"></li>
							<li><a href="#">etc..</a></li>
						</ul></li>
				</c:if>

				<!-- 구매관리 DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>카테고리</span>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">전체</a></li>
						<li><a href="#">전자제품</a></li>
						<li><a href="#">가전제품</a></li>
						<li><a href="#">스포츠용품</a></li>
						<li><a href="#">꽃/식물/정원</a></li>
						<li><a href="#">식품/과자/음료</a></li>
						<li><a href="#">기타</a></li>
						<li><a href="#">미분류</a></li>

						<!-- <li><a href="#">최근본상품</a></li> -->
						<li class="divider"></li>
						<li><a href="#">etc..</a></li>
					</ul></li>

				<li><a href="#">etc...</a></li>
			</ul>

			<c:if test="${! empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">내정보관리</a></li>
					<li><a href="#">로그아웃</a></li>
				</ul>
			</c:if>

			<c:if test="${ empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</c:if>
		</div>
		<!-- dropdown hover END -->

	</div>
</div>
