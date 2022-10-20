<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>Q&A 목록</title>
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
}

thead {
	border: 1px solid #bcbcbc;
	align
	=
	center;
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
	 	border-radius : 13px;
}

.add5:hover {
	background-color: #f44336;
	color: white;
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
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
function fncGetList(currentPage) {

	if(${search.order=='2'}){
	$("#currentPage").val(currentPage)
	$("form").attr("method", "GET").attr("action", "/serviceCenter/getQandAList")   //전체보기
			.submit();
	}
	else if(${search.order=='3'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/serviceCenter/getQandAList")   //나만보기
				.submit();
	}	
}

	$(function() {


		$("td:contains('비밀글입니다.')").bind("click", function() {
			if (${empty user}){
			 alert("관계자만 볼 수 있습니다."); 			
				}
			

		})	
			

		$("button:contains('등록')").bind("click", function() {
			if(${empty sessionScope.user.userId}){
			alert("로그인 후 이용 가능합니다.");
			self.location="/user/login.jsp";
			}
			
			if(${!empty sessionScope.user.userId }){
				
			self.location = "/serviceCenter/addQandAView.jsp";
			}
		})
		
		
	
		$("button:contains('뒤로')").bind("click", function() {
			self.location = "/serviceCenter/serviceCenterHome.jsp";
		})
		
		
<%-- 		$("button:contains('검색')").bind("click", function() {
			
			$.ajax({
				
				url : "/serviceCenterRest/json/getQandAList",
				method : "POST",
				data : JSON.stringify ({
					currentPage : ($(".currentPage").val())
				}),
				dataType :"json",
				contentType: "application/json",
				success : function(JSONData, status){
					
					
					alert("성공");
				}
				
			})
			
			
			
		}) --%>
		

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
				<form class="form-inline" name="detailForm" method="post">
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
		<table class="table table-hover table-striped"
			style="text-align-last: center;">
			<div class="row2">
				<thead>
					<tr>
						<th align="center">No</th>
						<td />
						<th align="center" class="content">제목</th>
						<td />
						<th align="center">진행상황</th>
						<td />
						<th align="center">작성자</th>
						<td />
						<th align="center" width="140">작성 날짜</th>
					</tr>
				</thead>

				<c:set var="i" value="0" />
				<c:forEach var="getQandAList" items="${getQandAList}">
					<c:set var="i" value="${i + 1}" />
					<tr class="ct_list_pop">
						<td align="left" id="bb">${getQandAList.qandANo}</td>
						<td></td>
						<%-- 관리자 --%>
						<c:if test="${ user.role == '1' }">
							<td align="left"><a
								href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
									${getQandAList.qandATitle} </a></td>
						</c:if>
						<%--관리자 끝 --%>
						<%-- 비회원--%>
						<c:if test="${ user.role== null }">
							<c:if test="${getQandAList.qandAOpenCondition=='1'}">
								<td align="left"><a
									href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
										${getQandAList.qandATitle} </a></td>
							</c:if>

							<c:if test="${getQandAList.qandAOpenCondition=='0'}">
								<td align="left">비밀글입니다.</td>
							</c:if>
						</c:if>
						<%--비회원 끝 --%>
						<%--회원--%>
						<c:if test="${ user.role =='0' }">
							<%--세션 아이디 비교 OK --%>
							<td align="left">
							<c:if test="${sessionScope.user.userId == getQandAList.userId.userId}">
									
									<a href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
										${getQandAList.qandATitle} </a>	
							</c:if>
							<%--세션 아이디비교 OK 끝 --%>
							<%--세션 아이디비교  NO --%>
							<c:if test="${sessionScope.user.userId != getQandAList.userId.userId}">
									<c:if test="${getQandAList.qandAOpenCondition=='1'}">
								<a href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
										${getQandAList.qandATitle} </a>
							</c:if>
							
									<c:if test="${getQandAList.qandAOpenCondition=='0'}">
								비밀글입니다.
									</c:if>
							
							</td>	
							</c:if>
							<%--세션 아이디비교 NO 끝 --%>
						</c:if>

						<%--히원  --%>
						<td></td>
						<c:if test="${getQandAList.qandACondition=='1'}">
							<td align="left">처리완료</td>
						</c:if>
						<c:if test="${getQandAList.qandACondition=='0'}">
							<td align="left">대기중</td>
						</c:if>
						<td></td>
						<td align="left">${getQandAList.userId.nickName}</td>
							
						<td><input type="hidden" name="order" id="order"
							value="${search.order}">
							<input type="hidden" name="userId" id="userId"
							value="${getQandAList.userId.userId}"></td>
						<td align="left">${getQandAList.qandARegDate}</td>
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
								<button class="add add5"
									style="transform: translate(900px, -70px);">등록</button>
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