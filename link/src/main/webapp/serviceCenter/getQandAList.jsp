<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>Q&A ���</title>
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


<!-- Bootstrap Dropdown Hover CSS -->


<!-- Bootstrap Dropdown Hover JS -->



<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
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
		


<%-- 		$("td:contains('��� ���Դϴ�.')").bind("click", function() {
			if (${empty user}){
			 alert("�����ڸ� �� �� �ֽ��ϴ�."); 
			alert($(this).parent().find("input[name='userId']").val());
			 self.location ="/serviceCenter/getQandAList"; 
			
				}
			
			if (${!empty user}){
				
				if((${sessionScope.user.userId} == $(this).parent().find("input[name='userId']").val()) || (${sessionScope.user.userId}=="admin1")){
					self.location = "/serviceCenter/getQandA?qandANo="
						+ $(this).parent().find("td:eq(0)").text()
					
				}else{
					alert("�����ڸ� �� �� �ֽ��ϴ�.");
					self.location ="/serviceCenter/getQandAList";	
				}
				
			
				} 
		})	 --%>
			
$("td:contains('��� ���Դϴ�.')").bind("click", function() {
	+ $(this).parent().find("td:eq(0)").text()
	
})
		$("button:contains('���')").bind("click", function() {
			if(${empty user}){
			alert("�α��� �� �̿� �����մϴ�.")
			self.location="/user/login.jsp";
			}
			
			if(${!empty user }){
				
			self.location = "../serviceCenter/addQandAView.jsp";
			}
		})
		
		
	
		$("button:contains('�ڷ�')").bind("click", function() {
			self.location = "../serviceCenter/serviceCenterHome.jsp";
		})
		
		
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

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/sideToolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->


	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
			
		<div class="row1">

			<div class=" text-left">
				<div class="col-md-3 col-sm-3 col-xs-6"> 
									</div>
				<p class="text-primary" style="text-align-last: end;">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>


			<!-- table ���� �˻� Start /////////////////////////////////////-->
				
				<div class="col-md-6 text-right" style= "transform: translate(600px, 0px);">
					<form class="form-inline" name="detailForm" method="post">
						
						<div class="form-group">
							<select class="form-control" name="searchCondition" style="vertical-align: top;">
								<option value="0"
									${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ȣ</option>
								<option value="1"
									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>����</option>
							</select>

							<label class="sr-only" for="searchKeyword" style="vertical-align: top;">�˻���</label> <input
								type="text" class="form-control" id="searchKeyword"
								name="searchKeyword" placeholder="�˻���"
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>

						<button type="button" class="btn btn-default" style="vertical-align: top;">�˻�</button>

						<!-- PageNavigation ���� ������ ���� ������ �κ� -->
						<input type="hidden" class="currentPage" id="currentPage" name="currentPage" value="1" />
					</form>
				</div>
				

			</div>
			<!-- table ���� �˻� Start /////////////////////////////////////-->
			

			<!--  table Start /////////////////////////////////////-->
			<table class="table table-hover table-striped"  style="text-align-last: center;">
				<div class="row2">
				<thead>
					<tr>
						<th align="center">No</th>
						<td />
						<th align="center" class="content">����</th>
						<td />
						<th align="center">�����Ȳ</th>
						<td />
						<th align="center">�ۼ���</th>
						<td />
						<th align="center" width ="100">�ۼ� ��¥</th>
					</tr>
				</thead>

				

					<c:set var="i" value="0" />
					<c:forEach var="getQandAList" items="${getQandAList}">
						<c:set var="i" value="${i + 1}" />
						<tr class="ct_list_pop">
							<td align="left" id="bb">${getQandAList.qandANo}</td>

							<td></td> 
							<c:if test="${getQandAList.qandAOpenCondition=='1'}">
							<td align="left" >
								${getQandAList.qandATitle}  </td>
							</c:if>
							<c:if test="${getQandAList.qandAOpenCondition=='0'}">
							<td align="left">��� ���Դϴ�.</td>
				 			 </c:if>
								
							<td></td>

							
							<c:if test="${getQandAList.qandACondition=='1'}">
							<td align="left" >ó���Ϸ�</td>
				 			 </c:if>
				  			<c:if test="${getQandAList.qandACondition=='0'}">
								<td align="left">�����</td>
							  </c:if>
							<td></td>
							<td align="left" >${getQandAList.userId.nickName}</td>
								
							<td><input type="hidden" name="userId" id="userId" value="${getQandAList.userId.userId}"></td>
							<td align="left" >${getQandAList.qandARegDate}</td>
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
							
									<div class="col-md-3 col-sm-3 col-xs-6"> 
									  <button class="add add5" style= "transform: translate(1000px, 0px);">���</button>
									</div>
							
									<div class="col-md-3 col-sm-3 col-xs-6"> 
									  <button class="add add6" style= "transform: translate(1000px, 0px);">�ڷ�</button>
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


	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp" />
	<!-- PageNavigation End... -->
</body>

</html>