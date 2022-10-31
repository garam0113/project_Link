<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->

<style>
body {
	padding-top: 50px;
}
</style>

<script type="text/javascript">

function fncGetList(currentPage) {
	
	if(${user.role=='1'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method", "GET").attr("action", "/serviceCenter/getUserReportList")   //전체보기
				.submit();
		
	}else if (${user.role=='0'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method","post").attr("action","/serviceCenter/getUserReportList/${sessionScope.user.userId}").submit();   //나만보기
				
    }
}
	/* $(function() {
		$("td:nth-child(2)").on(
				"click",
				function() {
					self.location = "/serviceCenter/getReport?no="+ $(this).parent().find("td:eq(0)").text()
							});

	}); */
</script>

</head>
<!-- ToolBar Start /////////////////////////////////////-->


<!-- ToolBar End /////////////////////////////////////-->
<body style="background-color: #EBEDF0;">
	<jsp:include page="/sideToolbar.jsp" />
	<div class="container">
		<c:if test="${user.role == '0'}">
			<div class="page-header text-left">
				<h3 class=" text-info">내정보보기>신고내역</h3>
			</div>
		</c:if>
		<c:if test="${user.role == '1'}">
			<div class="page-header text-left">
				<h3 class=" text-info">신고내역</h3>
			</div>
		</c:if>
		<div class="row1">

			<div class=" text-left">
				<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>


			<!-- table 위쪽 검색 Start /////////////////////////////////////-->

			<div class="col-md-6 left" style=" margin-left: -14px;">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>번호</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
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
					<input type="hidden" id="currentPage" name="currentPage" value="1" />
				</form>
			</div>

		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped"
			style="background-color: white; border-width: thick; border: 3px solid #ddd; border-radius: 10px;">
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">제목</th>
					<th align="left">진행상황</th>
					<th align="left">신고받는 ID</th>
					<th align="left">작성 날짜</th>
				</tr>
			</thead>


			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="getReportList" items="${getReportList}">
					<c:set var="i" value="${i + 1}" />
					<tr>
						<td align="center" id="bb">${getReportList.no}</td>
						<td align="center" class="content">${getReportList.title}<c:if
								test="${getReportList.reportImage1 !=null || getReportList.reportImage2 != null}">
								<img src="/resources/image/uploadFiles/파일.png"
									style="width: 15px; height: 15px; display: inline;">
							</c:if>
						</td>
						<c:if test="${getReportList.reportCondition=='1'}">
							<td align="center">처리완료</td>
						</c:if>
						<c:if test="${getReportList.reportCondition=='0'}">
							<td align="center">대기중</td>
						</c:if>
						<td align="center">${getReportList.user2.userId}</td>
						<td align="left">${getReportList.regDate}</td>
						<td><input type="hidden" name="order" id="order"
							value="${search.order}"></td>
				</c:forEach>
			</tbody>
		</table>
		<!--  table End /////////////////////////////////////-->
		<!-- PageNavigation Start... -->

		<jsp:include page="../common/pageNavigator_n.jsp" />

		<!-- PageNavigation End... -->

	</div>
	<!--  화면구성 div End /////////////////////////////////////-->



</body>

</html>