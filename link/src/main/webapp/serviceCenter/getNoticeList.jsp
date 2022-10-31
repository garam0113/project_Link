<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>

<html>

<head>
<title>공지사항 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>


	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="The Page Description">


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
.row {
	margin-left : 0px !important;
	    display: inherit;
}
body{
background-color: #EBEDF0 !important;
	padding-top: -90px;
}
.head {
	background-color: #5F0080; 
   background-image: linear-gradient(315deg, #5F0080  30%, #BD76FF 74%);
	border: 1px solid #bcbcbc;
	align = center;
}

.content {

	width: 500px;
}

.btn-13 {
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background-color: white;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  border: solid 2px;
  box-shadow:none !important;
  outline: none;
  box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
  border-radius: 10px;
  padding: 10px;
  color: #5F0080 !important;
  font-size: 16px !important;
  text-align: center;
}

.btn-13:hover { 
   background-color: #5F0080;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;
   color: white !important;
   font-size: 16px !important;
   text-align: center;
   border: solid 2px;
}

.waviy {
  position: relative;
}
.waviy span {
  position: relative;
  display: inline-block;
  font-size: 5px;
  color: #5F0080;
  text-transform: uppercase;
  animation: flip 1s infinite;
  animation-delay: calc(.2s * var(--i))
}
@keyframes flip {
  0%,80% {
    transform: rotateY(360deg) 
  }
}


</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

	function fncGetList(currentPage) {
		
		$("#currentPage").val(currentPage)
		$("form").attr("method", "GET").attr("accept-charset","EUC-KR").attr("action", "/serviceCenter/getNoticeList")
				.submit();
	}


	$(function() {
		$("td:nth-child(3)").on(
				"click",
				function() {
					self.location = "/serviceCenter/getNotice?noticeNo="
							+ $(this).parent().find("td:eq(0)").text()

				});

		$("button:contains('등록')").bind("click", function() {
			self.location = "/serviceCenter/addNoticeView.jsp";
		})
		
		$("button:contains('뒤로')").bind("click", function() {
			self.location = "/serviceCenter/serviceCenterHome.jsp";
		})
		

	});
</script>

</head>
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/toolbar.jsp" />

	<!-- ToolBar End /////////////////////////////////////-->
<body>  


<div class="page-header" align="center" style="transform: translate(-395px, 149px);">
  <h1 >공지사항 리스트</h1>
</div>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
			
		<div class="row1">

			<div class=" text-left">
				<div class="col-md-3 col-sm-3 col-xs-6"> 
									</div>
				<p class="text" style="text-align-last:end; transform: translate(-44px, 22px);">전체 ${resultPage.totalCount } 건수, 현재
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

							<label class="sr-only" for="searchKeyword">검색어</label> <input
								type="text" class="form-control" id="searchKeyword" width="200px"
								name="searchKeyword" placeholder="검색어" style="transform: translate(10px, 8px); width:300px;"
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>

						<button type="button" class="custom-btn btn-13" style="transform: translate(20px, 0px); width: 70px; height :20px;">검색</button>

						<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
					</form>
				</div>
				

			</div>
			<!-- table 위쪽 검색 Start /////////////////////////////////////-->
			

			<!--  table Start /////////////////////////////////////-->
			<table   style="text-align-last: center; background-color:white;">
				<div class="row2">
				<thead class="bg-primary text-white">
					<tr class = "head" id ="head" >
						<th align="center">No</th>
						<td />
						<th align="center" class="content">제목</th>
						<td />
						<th align="center">작성자</th>
						<td />
						<th align="center" width ="140px">작성 날짜</th>
						<td />
						<th align="center" width ="100">조회수</th>
					</tr>
				</thead>
				</div>
				
				

					<c:set var="i" value="0" />
					<c:set var="ymd" value="<%=new java.util.Date()%>"/>
					<c:forEach var="getNoticeList" items="${getNoticeList}">
						<c:set var="i" value="${i + 1}" />
						<tr class="ct_list_pop">
							<td align="left" id="bb">
							${getNoticeList.noticeNo}</td>
							<td></td>
							
							<td align="left" class="content2" >
							<fmt:formatDate value="${getNoticeList.noticeRegDate}" pattern="dd" var ="startDate" />
							<fmt:formatDate value="${ymd}" pattern="dd" var ="nowDate" />
							<fmt:formatNumber value="${startDate}" type="number" var ="startDate1"/>
							<fmt:formatNumber value="${startDate+3}" type="number" var ="endDate1"/>
							<div class="waviy">
							<c:if test="${endDate1>nowDate && startDate1 < endDate1}" >
							<strong>
							<span style="--i:1">N</span>
							<span style="--i:2">E</span>
							<span style="--i:3">W</span>
							<span style="--i:4">!</span>
							</strong>
							</c:if>
								${getNoticeList.noticeTitle}	
							<c:if test="${getNoticeList.noticeImage1 !=null || getNoticeList.noticeImage2 != null}">
							<img src="/resources/image/uploadFiles/파일.png" style="width:15px; height:15px; display: inline;">
							</c:if>	
								</div>
							</td>
							<td></td>

							<td align="left" >${getNoticeList.userId.nickName}</td>

							<td></td>
							<td align="left" width ="140px">${getNoticeList.noticeRegDate}</td>
							<td></td>
							<td align="left" >${getNoticeList.noticeCount}</td>
							

							
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
									<c:if test="${ user.role == '1' }">
									
									  <button class="custom-btn btn-13" style= "transform: translate(950px, -90px); ">
									   등록</button> 
									</c:if>
									<button class="custom-btn btn-13" style= "transform: translate(957px, -90px); margin-left::20px; ">
									뒤로</button>
									</div>
								


							</tr>
						</table>

					</td>
				</tr>
			</table>
			</div>

	<!--  화면구성 div End /////////////////////////////////////-->


</body>

</html>