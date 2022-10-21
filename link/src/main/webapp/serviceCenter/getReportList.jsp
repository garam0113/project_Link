<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
	width: 1005px;
}
.add6 {
    background-color: white; 
  	color: black; 
  	border: 2px solid #0a6bdf;
  	border-radius : 13px;
}
.add6:hover {
   background-color: #0a6bdf;
  color: white;
}
.container{
	width : 1005px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	$(function() {
		$("td:nth-child(3)").on(
				"click",
				function() {
					self.location = "/serviceCenter/getReport?no="
							+ $(this).parent().find("td:eq(0)").text()

				});

		$("button:contains('뒤로')").bind("click", function() {
			self.location = "/serviceCenter/serviceCenterHome.jsp";
		})

	});
</script>

</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->


	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="row1">

			<div class=" text-left">
				<div class="col-md-3 col-sm-3 col-xs-6"></div>
				<p class="text-primary" style="text-align-last:auto; transform: translate(10px, 75px);">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>


			<!-- table 위쪽 검색 Start /////////////////////////////////////-->

			<div class="col-md-6 text-right"
				style="transform: translate(600px, 0px);">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition"
							style="vertical-align: top;">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>번호</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
						</select> <label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							style="transform: translate(10px, 8px); width: 300px;"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default"
						style="transform: translate(20px, 0px);">검색</button>

					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="1" />
				</form>
			</div>

		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
		<table  style="text-align-last: center;">
			<div class="row2">
				<thead>
					<tr>
						<th align="center">No</th>
						<td />
						<th align="center" class="content">제목</th>
						<td />
						<th align="center">신고처리상태</th>
						<td />
						<th align="center">신고대상ID</th>
						<td />
						<th align="center" width="140">신고접수날짜</th>
					</tr>
				</thead>
				
				</div>
				</table>
				<tbody>
				<table>
					<c:set var="i" value="0" />
					<c:forEach var="getReportList" items="${getReportList}">
						<c:set var="i" value="${i + 1}" />
						<tr class="ct_list_pop">
							<td align="left" id="bb">${getReportList.no}</td>

							<td></td>
							<td align="left">${getReportList.title}</td>
							<td></td>
							<c:if test="${getReportList.reportCondition=='1'}">
								<td align="left" >처리완료</td>
							</c:if>
							<c:if test="${getReportList.reportCondition=='0'}">
								<td align="left" >대기중</td>
							</c:if>
							<td></td>
							<td align="left">${getReportList.user2.userId}</td>
							<td></td>
							<td align="left">${getReportList.regDate}</td>
							<td align="center"></td>

							<td></td>
					</c:forEach>
				</tbody>
		</table>
		<!--  table End /////////////////////////////////////-->
		<!-- PageNavigation Start... -->

		<jsp:include page="../common/pageNavigator_n.jsp" />

		<!-- PageNavigation End... -->

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">

					<table border="0" cellspacing="0" cellpadding="0">
						<tr>


							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="ct_write01"><input type="hidden" id="Quantity"
										name="Quantity" value="1" /></td>
								</tr>
							</table>
							<td width="30"></td>


							<div class="col-md-3 col-sm-3 col-xs-6">

								<button class="add add6"
									style="transform: translate(900px, -70px);">뒤로</button>
							</div>


						</tr>
					</table>

				</td>
			</tr>
		</table>
	</div>
	</div>
	</div>
	<!--  화면구성 div End /////////////////////////////////////-->



</body>

</html>