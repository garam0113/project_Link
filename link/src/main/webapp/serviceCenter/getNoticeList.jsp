<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>공지사항 목록</title>
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


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
	
}

thead {
	border: 1px solid #bcbcbc;
	align = center;
}

.content {
	width: 500px;
}

.add {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 11px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
}
.add5 {
    background-color: white; 
  	color: black; 
  	border: 2px solid #f44336;
}
.add5:hover {
   background-color: #f44336;
  color: white;
}
.add6 {
    background-color: white; 
  	color: black; 
  	border: 2px solid #0a6bdf;
}
.add6:hover {
   background-color: #0a6bdf;
  color: white;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	$(function() {
		$("td:nth-child(3)").on(
				"click",
				function() {
					self.location = "/serviceCenter/getNotice?noticeNo="
							+ $(this).parent().find("td:eq(0)").text()

				});

		$("button:contains('등록')").bind("click", function() {
			self.location = "../serviceCenter/addNoticeView.jsp";
		})
		
		$("button:contains('뒤로')").bind("click", function() {
			self.location = "../serviceCenter/serviceCenterHome.jsp";
		})

	});
</script>

</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/sideToolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->


	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
			
		<div class="row1">

			<div class=" text-left">
				<div class="col-md-3 col-sm-3 col-xs-6"> 
									</div>
				<p class="text-primary" style="text-align-last: end;">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>


			<!-- table 위쪽 검색 Start /////////////////////////////////////-->
				
				<div class="col-md-6 text-right" style= "transform: translate(600px, 0px);">
					<form class="form-inline" name="detailForm">
						
						<div class="form-group">
							<select class="form-control" name="searchCondition" style="vertical-align: top;">
								<option value="0"
									${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>번호</option>
								<option value="1"
									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
							</select>

							<label class="sr-only" for="searchKeyword" style="vertical-align: top;">검색어</label> <input
								type="text" class="form-control" id="searchKeyword"
								name="searchKeyword" placeholder="검색어"
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>

						<button type="button" class="btn btn-default" style="vertical-align: top;">검색</button>

						<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
					</form>
				</div>
				

			</div>
			<!-- table 위쪽 검색 Start /////////////////////////////////////-->
			

			<!--  table Start /////////////////////////////////////-->
			<table class="table table-hover table-striped"  style="text-align-last: center;">
				<div class="row2">
				<thead>
					<tr>
						<th align="center">No</th>
						<td />
						<th align="center" class="content">제목</th>
						<td />
						<th align="center">작성자</th>
						<td />
						<th align="center">작성 날짜</th>
						<td />
						<th align="center" width ="100">조회수</th>
					</tr>
				</thead>

				

					<c:set var="i" value="0" />
					<c:forEach var="getNoticeList" items="${getNoticeList}">
						<c:set var="i" value="${i + 1}" />
						<tr class="ct_list_pop">
							<td align="left" id="bb">${getNoticeList.noticeNo}</td>

							<td></td>
							<td align="left" >
								${getNoticeList.noticeTitle}</td>
							<td></td>

							<td align="left" >${getNoticeList.userId.nickName}</td>

							<td></td>
							<td align="left" >${getNoticeList.noticeRegDate}</td>
							<td></td>
							<td align="left" >${getNoticeList.noticeCount}</td>
							<td align="center" ></td>

							<td></td>
					</c:forEach>
				</tbody>

			</table>
			<!--  table End /////////////////////////////////////-->


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
								<c:if test="${user.userId=='admin1'}">
									<div class="col-md-3 col-sm-3 col-xs-6"> 
									  <button class="add add5" style= "transform: translate(1000px, 0px);">등록</button>
									</div>
								</c:if>
									<div class="col-md-3 col-sm-3 col-xs-6"> 
									  <button class="add add6" style= "transform: translate(1000px, 0px);">뒤로</button>
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


	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp" />
	<!-- PageNavigation End... -->
</body>

</html>