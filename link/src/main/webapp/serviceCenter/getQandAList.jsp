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

.head {
	background-color: #5F0080;
   background-image: linear-gradient(315deg, #BD76FF  0%, #5F0080 74%);
	border: 1px solid #bcbcbc;
	align = center;
}


.content {

	width: 500px;
}

.custom-btn {
  margin: 5px;
  width: 80px;
  height: 30px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  border: none !important;
  box-shadow:none !important;
  outline: none;
}
.btn-13 {
  background-color: #5F0080;
  background-image: linear-gradient(315deg, #BD76FF  50%, #5F0080 74%);
  border: none;
  z-index: 1;
}
.btn-13:after {
  position: absolute;
  content: "";
  width: 100%;
  height: 0;
  bottom: 0;
  left: 0;
  z-index: -1;
  border-radius: 5px;
   background-color: #5F0080;
  background-image: linear-gradient(315deg, #BD76FF 50%, #5F0080 74%);
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
  transition: all 0.3s ease;
}
.btn-13:hover { <%-- �۾��� --%>
  color: #fff;
}
.btn-13:hover:after {
  top: 0;
  height: 100%;
}
.btn-13:active {
  top: 2px;
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
.darkover {
    	position: sticky !important;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    width:1800px;
 	   background: rgba(0,0,0,0.35);
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
		$("form").attr("method", "POST").attr("action", "/serviceCenter/getQandAList")   //��������
				.submit();
	}	
}

	$(function() {


		$("td:contains('��б��Դϴ�.')").bind("click", function() {
			if (${empty user}){
			 alert("�����ڸ� �� �� �ֽ��ϴ�."); 			
				}
			

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
		<jsp:include page="/toolbar.jsp" />
					<div id="intro-wrap" data-height="15">
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/);">
						<div class="caption">
							
						
						</div><!-- caption -->					
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
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
								<option value="0"
									${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ȣ</option>
								<option value="1"
									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>����</option>
							</select>

							<label class="sr-only" for="searchKeyword" style="color:#BD76FF;">�˻���</label> <input
								type="text" class="form-control" id="searchKeyword" width="200px"
								name="searchKeyword" placeholder="�˻���" style="transform: translate(10px, 8px); width:300px; "
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>

						<button type="button" class="custom-btn btn-13" style="transform: translate(20px, 0px); width: 40px; height :30px;">�˻�</button>

						<!-- PageNavigation ���� ������ ���� ������ �κ� -->
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
					</form>
				</div>


		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
		<table   style="text-align-last: center;">
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
						<td align="left" id="bb">${getQandAList.qandANo}</td>
						<td></td>
						<%-- ������ --%>
						<c:if test="${ user.role == '1' }">
							<td align="left"><a
								href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
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
									href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
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
									
									<a href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
										${getQandAList.qandATitle} <c:if test="${getQandAList.qandAImage1 !=null || getQandAList.qandAImage2 != null}">
									&nbsp;<img src="/resources/image/uploadFiles/����.png" style="width:15px; height:15px; display: inline;">
									</c:if>	</a>	
							</c:if>
							<%--���� ���̵�� OK �� --%>
							<%--���� ���̵��  NO --%>
							<c:if test="${sessionScope.user.userId != getQandAList.userId.userId}">
									<c:if test="${getQandAList.qandAOpenCondition=='1'}">
								<a href="/serviceCenter/getQandA?qandANo=${getQandAList.qandANo}">
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
							<td align="left">ó���Ϸ�</td>
						</c:if>
						<c:if test="${getQandAList.qandACondition=='0'}">
							<td align="left">�����</td>
						</c:if>
						<td></td>
						<td align="left">${getQandAList.userId.nickName}</td>
							
						<td><input type="hidden" name="order" id="order"
							value="${search.order}">
							<input type="hidden" name="userId" id="userId"
							value="${getQandAList.userId.userId}"></td>
						<td align="left">${getQandAList.qandARegDate}</td>
					
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
								  <button class="custom-btn btn-13" style= "transform: translate(900px, -90px); ">
									   ���</button> 
									
									<button class="custom-btn btn-13" style= "transform: translate(900px, -90px); ">
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