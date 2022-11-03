<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>Q&A ���</title>
<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="The Page Description">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> <%--������ �׺���̼� css --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
.row {
	margin-left : 0px !important;
	   display: initial !important;
}
body {
	margin-top: 76px;
	padding-top: -75px;
	background-color: #EBEDF0 !important;
    margin-top: -54px !important;
}

.head {
	background-color: #5F0080;
    background-image: linear-gradient(315deg, #5F0080  30%, #BD76FF 74%);
	border: 1px solid #bcbcbc;
	align = center;
}
.page-header{
	border-bottom:0px !important;
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

	if(${search.order=='2'}){
	$("#currentPage").val(currentPage)
	$("form").attr("method", "GET").attr("action", "/serviceCenter/getQandAList")   //��ü����
			.submit();
	}
	else if(${search.order=='3'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/serviceCenter/getQandAList/${sessionScope.user.userId}")   //��������
				.submit();
	}	
}

	$(function() {


		$("td:contains('��б��Դϴ�.')").bind("click", function() {
			if (${empty user}){
			 alert("�����ڸ� �� �� �ֽ��ϴ�."); 			
				}	

		})
		
		$("button:contains('�˻�')").bind("click", function() {	
		  fncGetList(1);
		})
		
		$("button:contains('���')").bind("click", function() {
			if(${empty sessionScope.user.userId}){
			alert("�α��� �� �̿� �����մϴ�.");
			self.location="/user/login.jsp";
			}
			
			if(${!empty sessionScope.user.userId }){
				
			self.location = "/serviceCenter/addQandAView.jsp";
			}
		})
		
		
	
		$("button:contains('�ڷ�')").bind("click", function() {
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
  <h1 >Q&A ����Ʈ</h1>
</div>

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
			
		<div class="row1">

			<div class=" text-left">
				<div class="col-md-3 col-sm-3 col-xs-6"> 
									</div>
				<p class="text" style="text-align-last:end; transform: translate(-44px, 22px);">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>


			<!-- table ���� �˻� Start /////////////////////////////////////-->

			<div class="col-md-6 text-right" style= "transform: translate(600px, 0px);">
					<form class="form-inline" name="detailForm">
						
						<div class="form-group">
							<select class="form-control" name="searchCondition" style="vertical-align: top;">
								<option value="1"
									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>����</option>
							</select>

							<label class="sr-only" for="searchKeyword" style="color:#BD76FF;">�˻���</label> <input
								type="text" class="form-control" id="searchKeyword" width="200px"
								name="searchKeyword" placeholder="�˻���" style="transform: translate(10px, 8px); width:300px; "
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>

							<button type="button" class="custom-btn btn-13" style="transform: translate(20px, 0px); width: 70px; height :26px;">�˻�</button>

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
						<th align="center">�ۼ���</th>
						<td />
						<th align="center" width="140">�ۼ� ��¥</th>
					</tr>
				</thead>

				<c:set var="i" value="0" />
				<c:forEach var="getQandAList" items="${getQandAList}">
					<c:set var="i" value="${i + 1}" />
					<tr class="ct_list_pop">
						<td align="left" id="bb" style="vertical-align: middle;">${i}
						<input type="hidden" id="qandANo" name="qandANo" value="${getQandAList.qandANo }">
						</td>
						<td></td>
						<%-- ������ --%>
						<c:if test="${ user.role == '1' }">
							<td align="left"><a
								href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}" style="color: black;">
								
									${getQandAList.qandATitle} </a>
									<c:if test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png" style="width:15px; height:15px; display: inline;">
									</c:if>	
									
									</td>
						</c:if>
						<%--������ �� --%>
						<%-- ��ȸ��--%>
						<c:if test="${ user.role== null }">
							<c:if test="${getQandAList.qandAOpenCondition=='1'}">
								<td align="left"><a
									href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}" style="color: black;">
										${getQandAList.qandATitle} </a>
										<c:if test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
										&nbsp;<img src="/resources/image/uploadFiles/����.png" style="width:15px; height:15px; display: inline;">
										</c:if>	
										</td>
							</c:if>

							<c:if test="${getQandAList.qandAOpenCondition=='0'}">
								<td >
								<img src="/resources/image/uploadFiles/�ڹ���.jpg" style="width:15px; height:15px; display: inline;">
								��б��Դϴ�.
								<c:if test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png" style="width:15px; height:15px; display: inline;">
									</c:if>	
								
								</td>
							</c:if>
						</c:if>
						<%--��ȸ�� �� --%>
						<%--ȸ��--%>
						<c:if test="${ user.role =='0' }">
							<%--���� ���̵� �� OK --%>
							<td align="left">
							<c:if test="${sessionScope.user.userId == getQandAList.userId.userId}">
									
									<a href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}" style="color: black;">
										${getQandAList.qandATitle} <c:if test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png" style="width:15px; height:15px; display: inline;">
									</c:if>	</a>	
							</c:if>
							<%--���� ���̵�� OK �� --%>
							<%--���� ���̵��  NO --%>
							<c:if test="${sessionScope.user.userId != getQandAList.userId.userId}">
									<c:if test="${getQandAList.qandAOpenCondition=='1'}">
								<a href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}" style="color: black;">
										${getQandAList.qandATitle} 
										<c:if test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png" style="width:15px; height:15px; display: inline;">
									</c:if>	</a>
							</c:if>
							
									<c:if test="${getQandAList.qandAOpenCondition=='0'}">
									<img src="/resources/image/uploadFiles/�ڹ���.jpg" style="width:15px; height:15px; display: inline;">
								��б��Դϴ�.
									</c:if>
									<c:if test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png" style="width:15px; height:15px; display: inline;">
									</c:if>								
								
							</c:if></c:if>
							
							</td>
							<%--���� ���̵�� NO �� --%>
						
						<%--����  --%>
						<td></td>
						<c:if test="${getQandAList.qandACondition=='1'}">
							<td align="left" style="vertical-align: middle;">ó���Ϸ�</td>
						</c:if>
						<c:if test="${getQandAList.qandACondition=='0'}">
							<td align="left" style="vertical-align: middle;">�����</td>
						</c:if>
						<td></td>
						<td align="left" style="vertical-align: middle;">${getQandAList.userId.nickName}</td>
							
						<td><input type="hidden" name="order" id="order"
							value="${search.order}">
							<input type="hidden" name="userId" id="userId"
							value="${getQandAList.userId.userId}"></td>
						<td align="left" style="vertical-align: middle;">${getQandAList.qandARegDate}</td>
					
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
							<c:if test="${ user.role == 0 || user.role == 1 }">
								    <button class="custom-btn btn-13" style= "transform: translate(950px, -90px); ">
									   ���</button> 
									</c:if>
											<button class="custom-btn btn-13" style= "transform: translate(970px, -90px); margin-left::20px; ">
									�ڷ�</button>
							</div>


						</tr>
					</table>

				</td>
			</tr>
		</table>
	</div>
	</div>
	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->



</body>

</html>