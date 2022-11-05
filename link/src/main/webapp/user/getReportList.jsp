<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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

.container {
	border: solid 2px rgb(179, 207, 249);
	border-radius: 10px;
	background: #ecf4ff;
}
</style>

<script type="text/javascript">

function fncGetList(currentPage) {
	
	if(${user.role=='1'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method", "GET").attr("action", "/serviceCenter/getUserReportList")   //��ü����
				.submit();
		
	}else if (${user.role=='0'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method","post").attr("action","/serviceCenter/getUserReportList/${sessionScope.user.userId}").submit();   //��������
				
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



	<%-- ///////////////////// ä�ÿ� �ʿ��� �ڵ� //////////////////////// --%>
	<%-- ä���� ���� ���� --%>
	<script src="http://192.168.0.74:3000/socket.io/socket.io.js"></script>
	<%-- ä�� js --%>
	<script src="/resources/javascript/chat/chat.js"></script>
	<%-- ä�� css --%>
	<link rel="stylesheet" href="/resources/css/chat/chat.css" type="text/css" media="screen" title="no title">
	<%-- ///////////////////// ä�ÿ� �ʿ��� �ڵ� //////////////////////// --%>
	
	
	
	<jsp:include page="/sideToolbar.jsp" />
	<div class="container">
			
			
	
		<%-- chat.js���� ������ؼ� --%>
			<input type="hidden" id="session_userId" value="${ sessionScope.user.userId }">
			<input type="hidden" id="session_profileImage" value="${ sessionScope.user.profileImage }">
			<input type="hidden" id="session_nickName" value="${ sessionScope.user.nickName }">
		<%-- chat.js���� ������ؼ� --%>
		<%-- ä�� --%>
			<jsp:include page="/chat/chat.jsp" />
		<%-- ä�� --%>
			
			
			
		<c:if test="${user.role == '0'}">
			<div class="page-header text-left">
				<h3 class=" text-info">����������>�Ű���</h3>
			</div>
		</c:if>
		<c:if test="${user.role == '1'}">
			<div class="page-header text-left">
				<h3 class=" text-info">�Ű���</h3>
			</div>
		</c:if>
		<div class="row1">

			<div class=" text-left">
				<p class="text-primary">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>


			<!-- table ���� �˻� Start /////////////////////////////////////-->

			<div class="col-md-6 left" style="margin-left: -14px;">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ȣ</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>����</option>
						</select>
					</div>
					<div class="form-group" style="margin-top: 20px;">
						<label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="�˻���"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">�˻�</button>

					<!-- PageNavigation ���� ������ ���� ������ �κ� -->
					<input type="hidden" id="currentPage" name="currentPage" value="1" />
				</form>
			</div>

		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped"
			style="background-color: #ecf4ff;">
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">����</th>
					<th align="left">�����Ȳ</th>
					<th align="left">�Ű�޴� ID</th>
					<th align="left">�ۼ� ��¥</th>
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
								<img src="/resources/image/uploadFiles/����.png"
									style="width: 15px; height: 15px; display: inline;">
							</c:if>
						</td>
						<c:if test="${getReportList.reportCondition=='1'}">
							<td align="center">ó���Ϸ�</td>
						</c:if>
						<c:if test="${getReportList.reportCondition=='0'}">
							<td align="center">�����</td>
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
		<!-- PageNavigation End... -->
<br/><br/>
	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	<div style="display: flex; justify-content: center;">
		<jsp:include page="../common/pageNavigator_new.jsp" />
	</div>
<br/><br/>

</body>

</html>