<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>Q&A ���</title>
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
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
function fncGetList(currentPage) {

	if(${search.order=='2'}){
	$("#currentPage").val(currentPage)
	$("form").attr("method", "GET").attr("action", "/serviceCenter/getUserQandAList")   //��ü����
			.submit();
	}
	else if(${search.order=='3'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/serviceCenter/getUserQandAList")   //��������
				.submit();
	}	
}

	$(function() {


		$("td:contains('��б��Դϴ�.')").bind("click", function() {
			if (${empty user}){
			 alert("�����ڸ� �� �� �ֽ��ϴ�."); 			
				}
			

		})	
			
/* 
		$("button:contains('���')").bind("click", function() {
			if(${empty sessionScope.user.userId}){
			alert("�α��� �� �̿� �����մϴ�.");
			self.location="/user/login.jsp";
			}
			
			if(${!empty sessionScope.user.userId }){
				
			self.location = "/user/addQandAView.jsp";
			}
		})
		
		
	
		$("button:contains('�ڷ�')").bind("click", function() {
			self.location = "/user/serviceCenterHome.jsp";
		})
		 */
		
<%-- 		$("button:contains('�˻�')").bind("click", function() {
			
			$.ajax({
				
				url : "/serviceCenterRest/json/getQandAList",
				method : "POST",
				data : JSON.stringify ({
					currentPage : ($(".currentPage").val())
				}),
				dataType :"json",
				contentType: "application/json",
				success : function(JSONData, status){
					
					
					alert("����");
				}
				
			})
			
			
			
		}) --%>
		

	});
</script>

</head>
<!-- ToolBar Start /////////////////////////////////////-->

<!-- ToolBar End /////////////////////////////////////-->
<body style="background-color: #EBEDF0;">
	<jsp:include page="/sideToolbar.jsp" />
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<c:if test="${user.role == '0'}">
			<div class="page-header text-left">
				<h3 class=" text-info">����������>��Q&A</h3>
			</div>
		</c:if>
		<c:if test="${user.role == '1'}">
			<div class="page-header text-left">
				<h3 class=" text-info">Q&A</h3>
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
				<tr class="head" id="head">
					<th align="center">No</th>
					<th align="left">����</th>
					<th align="left">�����Ȳ</th>
					<th align="left">�ۼ���</th>
					<th align="left">�ۼ� ��¥</th>
				</tr>
			</thead>

			<tbody>
				<c:set var="i" value="0" />
				<c:forEach var="getQandAList" items="${getQandAList}">
					<c:set var="i" value="${i + 1}" />
					<tr class="ct_list_pop">
						<td align="left" id="bb">${getQandAList.qandANo}</td>
						<%-- ������ --%>
						<c:if test="${ user.role == '1' }">
							<td align="left"><a
								href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">

									${getQandAList.qandATitle} </a> <c:if
									test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png"
										style="width: 15px; height: 15px; display: inline;">
								</c:if></td>
						</c:if>
						<%--������ �� --%>
						<%-- ��ȸ��--%>
						<c:if test="${ user.role== null }">
							<c:if test="${getQandAList.qandAOpenCondition=='1'}">
								<td align="left"><a
									href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
										${getQandAList.qandATitle} </a> <c:if
										test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
										&nbsp;<img src="/resources/image/uploadFiles/����.png"
											style="width: 15px; height: 15px; display: inline;">
									</c:if></td>
							</c:if>

							<c:if test="${getQandAList.qandAOpenCondition=='0'}">
								<td><img src="/resources/image/uploadFiles/�ڹ���.jpg"
									style="width: 15px; height: 15px; display: inline;">
									��б��Դϴ�. <c:if
										test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png"
											style="width: 15px; height: 15px; display: inline;">
									</c:if></td>
							</c:if>
						</c:if>
						<%--��ȸ�� �� --%>
						<%--ȸ��--%>
						<c:if test="${ user.role =='0' }">
							<%--���� ���̵� �� OK --%>
							<td align="left"><c:if
									test="${sessionScope.user.userId == getQandAList.userId.userId}">

									<a
										href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
										${getQandAList.qandATitle} <c:if
											test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png"
												style="width: 15px; height: 15px; display: inline;">
										</c:if>
									</a>
								</c:if> <%--���� ���̵�� OK �� --%> <%--���� ���̵��  NO --%> <c:if
									test="${sessionScope.user.userId != getQandAList.userId.userId}">
									<c:if test="${getQandAList.qandAOpenCondition=='1'}">
										<a
											href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
											${getQandAList.qandATitle} <c:if
												test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png"
													style="width: 15px; height: 15px; display: inline;">
											</c:if>
										</a>
									</c:if>

									<c:if test="${getQandAList.qandAOpenCondition=='0'}">
										<img src="/resources/image/uploadFiles/�ڹ���.jpg"
											style="width: 15px; height: 15px; display: inline;">
								��б��Դϴ�.
									</c:if>
									<c:if
										test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png"
											style="width: 15px; height: 15px; display: inline;">
									</c:if>

								</c:if></td>
						</c:if>

						<%--���� ���̵�� NO �� --%>

						<%--����  --%>
						<c:if test="${getQandAList.qandACondition=='1'}">
							<td align="left">ó���Ϸ�</td>
						</c:if>
						<c:if test="${getQandAList.qandACondition=='0'}">
							<td align="left">�����</td>
						</c:if>
						<td align="left">${getQandAList.userId.nickName}</td>

						<td align="left">${getQandAList.qandARegDate}</td>
						<td><input type="hidden" name="order" id="order"
							value="${search.order}"> <input type="hidden"
							name="userId" id="userId" value="${getQandAList.userId.userId}"></td>
				</c:forEach>

			</tbody>
		</table>
		<!--  table End /////////////////////////////////////-->
		<!-- PageNavigation Start... -->


		<!-- PageNavigation End... -->
		<br /> <br />
	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	<div style="display: flex; justify-content: center;">
		<jsp:include page="../common/pageNavigator_new.jsp" />
	</div>
<br/><br/>

</body>

</html>