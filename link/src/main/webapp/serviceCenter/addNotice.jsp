<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">
<head>

	<title>�������� Ȯ��</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
		
		$("button:contains('Ȯ��')").bind("click", function(){
			self.location = "/serviceCenter/getNoticeList";
		});
		
		$("button:contains('�߰����')").bind("click", function(){
			self.location = "../serviceCenter/addNoticeView.jsp";
		})
		
		$("button:contains('����')").bind("click", function(){
			self.location = "../serviceCenter/updateNoticeView.jsp";
		})
		
		$("button:contains('����')").bind("click", function(){
		self.location = "../serviceCenter/deleteNotice";
		})
	});
	
	</script>
<style>
.row {
	margin-left : 0px !important;
	   display: initial !important;
}
.body{
background-color: #EBEDF0 !important;
}
textarea {
	resize: none;
}

.noticeTitle {
	width: 500px;
	height: 50px;
}

.content {
	margin-top: -30px;
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

</style>
</head>

<%-- ���̺� ���� --%>
<jsp:include page="/toolbar.jsp" />
<div class="page-header" align="center" style="transform: translate(-316px, 38px);">
  <h2>�������� Ȯ���ϱ�</h2>
</div>
	
		<div class="container" style="margin-top: 37px;">
			<!--  table Start /////////////////////////////////////-->
			<table style="width:880px; box-shadow: rgb(0 0 0 / 30%) 0px 19px 38px, rgb(0 0 0 / 22%) 0px 15px 12px; background-color:aliceblue;">
				<div class="row2">
				<thead>
				</thead>
				</div>
				</tbody>
					 <tr class = "body" id ="body" >
					<input type="hidden" name="noticeNo" id="noticeNo" value="${notice.noticeNo}">
					</tr>
							<tr class = "title" id ="title">
						<th style="text-align-last: center;">����</th>
					<td style="display: flex; min-height : 40px; max-height: 80px; width: 700px; background-color:white; margin-bottom: 30px;
						background: white;  border: 1px solid white;  border-radius: 15px;  box-shadow: 0 0 10px rgb(0 0 0 / 20%);">					
						${notice.noticeTitle}	
						<input type="hidden" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}">
						
						</td> 
					</tr>
					<tr>
						<th></th>
						<td align="left" name ="noticeRegDate" id="noticeRegDate" style="display: flex; height: 40px;">${notice.noticeRegDate }</td>
						<td align="left" style="transform: translateX(-370px);" style="display: flex; height: 40px;">${notice.userId.nickName}</td>
						
					</tr>
					<tr >
						<th style="text-align-last: center;">����</th>
						<td style="display: flex; min-height : 150px; max-height: 800px; width: 700px; background-color:white; margin-bottom: 30px;
						background: white;  border: 1px solid white;  border-radius: 15px;  box-shadow: 0 0 10px rgb(0 0 0 / 20%);">
						${notice.noticeContent}
						<input type="hidden" id="noticeContent" name="noticeContent" value="${notice.noticeContent}">
						</td>
					</tr>
					<tr >
			<%--			<th style="text-align-last: center;">÷������</th>
						<c:if test="${notice.noticeImage1 == null && notice.noticeImage2 ==null }">
							<td>÷������ ����</td>
						</c:if>
						<td><c:if test="${notice.noticeImage1 != null || notice.noticeImage1 ==' ' }">
						<img src="/resources/image/uploadFiles/${notice.noticeImage1}" 
						style="vertical-align: sub; display: inline-block; width:250px; height:250px; 
						cursor:pointer;" onclick="window.open('/resources/image/uploadFiles/${notice.noticeImage1}','asdfo8or','scrollbars=yes,width=417,height=385,top=10,left=20');">
						
						</c:if>
						<c:if test="${notice.noticeImage2 != null }">
						<img src="/resources/image/uploadFiles/${notice.noticeImage2}" 
						style="vertical-align: sub; display: inline-block; width:250px; height:250px; margin-left: 70px; 
						cursor:pointer;" onclick="window.open('/resources/image/uploadFiles/${notice.noticeImage2}','asdfo8or','scrollbars=yes,width=417,height=385,top=10,left=20');">
						
						</c:if> 
						</td>
						
						
					</tr>--%>
					<tr >
						<th style="text-align-last: center;"></th>
					</tr>
			</table>
			<!--  table End /////////////////////////////////////-->
	

		
						
									<div> 
								
 									 <button class="custom-btn btn-13" style= "transform: translate(680px,0px); ">
									   ����</button> 
									 <button class="custom-btn btn-13" style= "transform: translate(680px,0px); ">
									   ����</button> 
									 <button class="custom-btn btn-13" style= "transform: translate(680px, 0px); ">
										Ȯ��</button>
										<button class="custom-btn btn-13" style= "transform: translate(680px, 0px); ">
										�߰����</button>	
									</div>
				
			</div>


</body>

</html>