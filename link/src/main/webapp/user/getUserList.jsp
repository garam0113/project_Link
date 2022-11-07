<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
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

/* .container {
	border: solid 2px rgb(179, 207, 249);
	border-radius: 10px;
	background: #ecf4ff;
} */

/* button:hover {
	border-style: hidden;
	background-color: #5F0080;
	color: white;
	border-radius: 10px;
	font-weight: bold;
	border: solid 2px white;
}

button {
	background-color: white;
	border: solid 2px #5F0080;
	border-radius: 20px; 
	color:;
}	 */
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
	function enterkey() {
		if (window.event.keyCode == 13) {
			$("#currentPage1").val(currentPage)
			$("#form1").attr("method", "POST").attr("action",
					"/user/getUserList").submit();
		}
	}

	function fncGetUserList(currentPage) {
		$("#currentPage1").val(currentPage)
		$("#form1").attr("method", "POST").attr("action", "/user/getUserList")
				.submit();
	}

	//============= "�˻�"  Event  ó�� =============	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-default").on("click", function() {
			fncGetUserList(1);
		});
	});

	//============= userId �� ȸ����������  Event  ó��(Click) =============	
	$(function() {

		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("td:nth-child(2)").on("click", function() {
			self.location = "/user/getUser?userId=" + $(this).text().trim();
		});

	});
	/*
	 $(function() {

	 var userId = $("td:nth-child(2)")[1].text().trim();
	
	 console.log(userId);

	 $("#" + userId).on("click", function() {

	 alert("Ŭ��");

	 var recId = $(this).parent().text().trim().replace("����");

	 console.log("recId �� : " + recId);
	 })
	 })
	 */
</script>

</head>
	<!-- ToolBar Start /////////////////////////////////////-->
<body style=" background-color: whitesmoke;">
	<jsp:include page="/sideToolbar.jsp" />


	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" style="margin-top: 82px; margin-left: 310px; zoom: 1.2;">
<div class="page-header text-left" style="zoom: 1.2;">
				<h3 class=" text-info" style="font-weight: bold;">ȸ�����</h3>
			</div>
		<div class="row">

			<div class=" text-left" style="font-weight: bold;">
				<p class="text-primary" style="margin-left: 0px;">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>

			<div class="col-md-6 left">
				<form class="form-inline" id="form1" style="display: flex;">
				
					<c:if 
						test="${ (search.searchKeyword != '1') and (search.searchKeyword != '2')}">

						<div class="form-group">
							<select class="form-control" name="searchCondition" style="width: 75px;">
								<option value="0"
									${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
								<option value="1"
									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>�г���</option>
							</select> 
						</div>
 
						<div class="form-group" style="margin-left: 10px;"> 
							<label class="sr-only" for="searchKeyword">�˻���</label> <input
								type="text" class="form-control" id="searchKeyword"
								name="searchKeyword" placeholder="�˻���" onkeyup="enterkey()"
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>

						<button type="button" class="btn btn-default" style="margin-left: 10px;">�˻�</button>

						<!-- PageNavigation ���� ������ ���� ������ �κ� -->
					</c:if>
					<c:if
						test="${ (search.searchKeyword == '1') or (search.searchKeyword == '2')}">
					</c:if>
					<input type="hidden" id="currentPage1" name="currentPage" value="1" />

				</form>
			</div>


		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
		<div>
		<table class="table table-hover table-striped" style="background-color: #ecf4ff; width: 1200px;">

			<thead>
				<tr>
					<th align="center" style="text-align: center;">No</th>
					<th align="center" style="text-align: center;">ȸ�� ID</th>
					<th align="center" style="text-align: center;">�г���</th>
					<th align="center" style="text-align: center;">�����Ű�Ƚ��</th>
					<th align="center" style="text-align: center;">��������</th>
					<th align="center" style="text-align: center;">�����Ⱓ</th>
				</tr>
			</thead>

			<tbody>

				<c:set var="i" value="0" /> 
				<c:forEach var="user" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="center">${ i }</td>
						<td align="center" id="${ user.userId }" title="Click : ȸ������ Ȯ��"><a href='#'>${user.userId}</a>
						</td>
						<td align="center">${user.nickName}</td>
						<td align="center">${ user.reportCount }</td>
						<td align="center">${ fn:trim(user.penaltyType) == 0 ? "-" : ""}
							${ fn:trim(user.penaltyType) == 1 ? "����" : ""} ${ fn:trim(user.penaltyType) == 2 ? "��������" : ""}</td>
						<td align="center">${ !empty user.stopStartDate ? user.stopStartDate : ""}
							- ${ !empty user.stopEndDate ? user.stopEndDate : ""}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		</div>
		<!--  table End /////////////////////////////////////-->
<br/><br/>
	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->

<div style="display: flex; justify-content: center;">
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp" />
	<!-- PageNavigation End... -->
</div>
</body>

</html>