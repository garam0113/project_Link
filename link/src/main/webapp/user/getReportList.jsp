<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<body>
<script type="text/javascript">

function fncGetList(currentPage) {
	
	if(${user.role=='1'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method", "GET").attr("action", "/user/getReportList")   //��ü����
				.submit();
		
	}else if (${user.role=='0'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method","post").attr("action","/user/getReportList/${sessionScope.user.userId}").submit();   //��������
				
    }
}
	$(function() {
		$("td:nth-child(3)").on(
				"click",
				function() {
					self.location = "/user/getReport?no="+ $(this).parent().find("td:eq(0)").text()
							});

		$("button:contains('�ڷ�')").bind("click", function() {
			self.location = "/uesr/serviceCenterHome.jsp";
		})

	});
</script>

</head>
	<!-- ToolBar Start /////////////////////////////////////-->
		
<jsp:include page="/sideToolbar.jsp" />

	<!-- ToolBar End /////////////////////////////////////-->
<body>  
	<div class="container">
		<div class="row1">

			<div class=" text-left">
				<div class="col-md-3 col-sm-3 col-xs-6"></div>
				<p class="text-primary" style="text-align-last:auto; transform: translate(10px, 75px);">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>


			<!-- table ���� �˻� Start /////////////////////////////////////-->

			<div class="col-md-6 text-right"
				style="transform: translate(600px, 0px);">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition"
							style="vertical-align: top;">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ȣ</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>����</option>
						</select> <label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="�˻���"
							style="transform: translate(10px, 8px); width: 300px;"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="custom-btn btn-13" style="transform: translate(20px, 0px); width: 70px; height :20px;">�˻�</button>

					<!-- PageNavigation ���� ������ ���� ������ �κ� -->
					<input type="hidden" id="currentPage" name="currentPage" value="1" />
				</form>
			</div>

		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
			<table   style="text-align-last: center; background-color:white;">
				<div class="row2">
			  <thead class="bg-primary text-white">
					<tr class = "head" id ="head" >
						<th align="center">No</th>
						<td />
						<th align="center" class="content">����</th>
						<td />
						<th align="center">�����Ȳ</th>
						<td />
						<th align="center">�Ű�޴� ID</th>
						<td />
						<th align="center" width="140">�ۼ� ��¥</th>
					</tr>
				</thead>
				
				
				<tbody>
			
					<c:set var="i" value="0" />
					<c:forEach var="getReportList" items="${getReportList}">
						<c:set var="i" value="${i + 1}" />
						<tr class="ct_list_pop">
							<td align="center" id="bb">${getReportList.no}</td>
							<td></td>
							<td align="center" class="content">${getReportList.title}	
							<c:if test="${getReportList.reportImage1 !=null || getReportList.reportImage2 != null}">
							<img src="/resources/image/uploadFiles/����.png" style="width:15px; height:15px; display: inline;">
							</c:if>	
							</td>
							<td></td>
							<c:if test="${getReportList.reportCondition=='1'}">
								<td align="center" >ó���Ϸ�</td>
							</c:if>
							<c:if test="${getReportList.reportCondition=='0'}">
								<td align="center" >�����</td>
							</c:if>
							<td></td>
							<td align="center">${getReportList.user2.userId}</td>
							<td>
							<input type="hidden" name="order" id="order" value="${search.order}">
							</td>
							<td align="left">${getReportList.regDate}</td>
							

							
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

								<button class="custom-btn btn-13" style= "transform: translate(957px, -90px); margin-left::20px; ">
									�ڷ�</button>
							</div>


						</tr>
					</table>

				</td>
			</tr>
		</table>
	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->



</body>

</html>