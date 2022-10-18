<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
 -->
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/user/getUserList")
				.submit();
	}

	//============= "검색"  Event  처리 =============	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-default").on("click", function() {
			fncGetUserList(1);
		});
	});

	//============= userId 에 회원정보보기  Event  처리(Click) =============	
	$(function() {

		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("td:nth-child(2)").on("click", function() {
			self.location = "/user/getUser?userId=" + $(this).text().trim();
		});

	});
	/*
	 $(function() {

	 var userId = $("td:nth-child(2)")[1].text().trim();
	
	 console.log(userId);

	 $("#" + userId).on("click", function() {

	 alert("클릭");

	 var recId = $(this).parent().text().trim().replace("차단");

	 console.log("recId 값 : " + recId);
	 })
	 })
	 */
	
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/sideToolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="row">

			<div class=" text-left">
				<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>

			<c:if test="${ empty search.searchKeyword}">
				<div class="col-md-6 left">
					<form class="form-inline" name="detailForm">

						<div class="form-group">
							<select class="form-control" name="searchCondition">
								<option value="0"
									${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID</option>
								<option value="1"
									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
							</select>
						</div>

						<div class="form-group" style="margin-top: 20px;">
							<label class="sr-only" for="searchKeyword">검색어</label> <input
								type="text" class="form-control" id="searchKeyword"
								name="searchKeyword" placeholder="검색어"
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>

						<button type="button" class="btn btn-default">검색</button>

						<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
						<input type="hidden" id="currentPage" name="currentPage" value="" />

					</form>
				</div>
			</c:if>

		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped">

			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">회원 ID</th>
					<th align="left">닉네임</th>
					<th align="left">누적신고횟수</th>
					<th align="left">정지상태</th>
					<th align="left">정지기간</th>
				</tr>
			</thead>

			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="user" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="center">${ i }</td>
						<td align="left" id="${ user.userId }" title="Click : 회원정보 확인"><a>${user.userId}</a>
						</td>
						<td align="left">${user.nickName}</td>
						<td align="left">${ user.reportCount }</td>
						<td align="left">${ fn:trim(user.penaltyType) == 0 ? "-" : ""}
							${ fn:trim(user.penaltyType) == 1 ? "정지" : ""} ${ fn:trim(user.penaltyType) == 2 ? "영구정지" : ""}</td>
						<td align="left">${ !empty user.stopStartDate ? user.stopStartDate : ""}
							- ${ !empty user.stopEndDate ? user.stopEndDate : ""}</td>
						<td>
							<div id="${user.nickName}" title="프로필보기" hidden="dia">
								<div id="ajaxImage"></div>
								<div id="ajaxNickName"></div>
								<div id="ajaxWriting"></div>
								<div>
									<span><button>차단</button>
										<button>팔로우</button></span> <span><button>채팅</button></span>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<!--  table End /////////////////////////////////////-->

	</div>
	<!--  화면구성 div End /////////////////////////////////////-->


	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp" />
	<!-- PageNavigation End... -->

</body>

</html>