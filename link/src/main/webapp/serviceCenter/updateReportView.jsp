<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
    
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="The Page Description">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<%-- ALERT --%>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
   <%-- ALERT --%>


<title>�Ű��� ó��</title>
	
	
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>	
<script type="text/javascript">
	
	function fncUpdateReport(){

		alert($($("form")[0]));
		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/updateReport").submit();
		
		if(sock) {

			   var Msg = "service,"+$("#user1").val()+","+$("#no").val()+",�� �Ű� ó���Ǿ����ϴ�."
			   sock.send(Msg);


}
	
	$(function(){
		
		$("button:contains('ó��')").bind("click", function(){
			fncUpdateReport();
		});
		
		$("button:contains('�ڷ�')").bind("click", function(){
			window.history.back(-1);
		});

	})
	

</script>
<style>
.row {
	margin-left : 0px !important;
	   display: initial !important;
}
body{
background-color: #EBEDF0 !important;
}
textarea {
	resize: none;
	border: none;
    outline: none;
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

.input{
	width:auto;
	height:auto;
	margin-right: 70px;
}

</style>
</head>
<jsp:include page="/toolbar.jsp" />
<div class="page-header" align="center" style="transform: translate(-316px, 38px);">
  <h2>�Ű� ó���ϱ�</h2>
</div>
	
		<div class="container" style="margin-top: 37px;">
			<!--  table Start /////////////////////////////////////-->
		<form>	<table>
			
				<div class="row2">
				<thead>
				</thead>
				</div>
				</tbody>
					 <tr class = "body" id ="body" >
				<th style="text-align-last: center;"></th>
						<td align="left" style="display:flex; height: 50px;">${report.no}�� �Ű�
						<input type="hidden" name="no" id="no" value="${report.no}">
						</td>
					</tr>
								 
					<tr class = "content" id ="content" >
						<th style="text-align-last: center;">����</th>
						<td style="display: flex; height: 40px; width: 900px;">						
						${report.title}
						<input type="hidden" id="title" name="title" value="${report.title}">
						<input type="hidden" id="user1" name="user1.userId" value="${report.user1.userId}">
						</td> 
					</tr>
					<tr>
						<th></th>
						<td align="left" name ="reportRegDate" id="reportRegDate" style="display: flex; height: 40px;">${report.regDate }</td>
					</tr>
					<tr >
						<th style="text-align-last: center;">����</th>
						<td style="display: flex; min-height : 300px; max-height: 800px; width: 100%">
						${report.content}
						<input type="hidden" id="content" name="content" value="${report.content}">
						</td>
					</tr>
					<tr>
					 	<th style="text-align-last: center;"> �Ű� ��ó</th>
					 	<td align="left" name ="reportRegDate" id="reportRegDate" style="display: flex; height: 70px;">
					 		<c:if test="${report.reportSource== '1'}"> 
					 		<input type="text" class="" value="���ӰԽù�" style="width: 150px;" disabled />
		     				<input type="hidden" id="reportSource" name="reportSource" value="1">
		     				 <a href="/clubPost/getClubPost?clubNo=${report.club.clubNo}&clubPostNo=${report.clubPost.clubPostNo}" 
		     				 style="transform: translate(-150px, 30px);"> 
		     						${report.clubPost.clubPostNo} Ŭ���Խù� ��ȣ </a>	
		     						
		     						
		     				</c:if>
		     				<c:if test="${report.reportSource=='2'}"> 
							<input type="text" class="" value="���ӰԽù����" style="width: 150px;" disabled />
		     		 		<input type="hidden" id="reportSource" name="reportSource" value="2">
		     		 	<a href="/clubPost/getClubPost?clubNo=${report.club.clubNo}&clubPostNo=${report.clubPost.clubPostNo}" 
		     				 style="transform: translate(-150px, 30px);"> 
		     						${report.clubPost.clubPostNo} Ŭ���Խù� ��ȣ </a>
		     		 		</c:if>
		     		 		<c:if test="${report.reportSource=='3'}">
							<input type="text" class="" value="�ǵ�" style="width: 150px;" disabled />
		     				 <input type="hidden" id="reportSource" name="reportSource" value="3">
		     				 
		     				 <a href="/feed/getFeed?feedNo=${report.feed.feedNo}" style="transform: translate(-150px, 30px);"> 
		     				 ${report.feed.feedNo} ��° �ǵ� </a>
		     				</c:if>
		     				<c:if test="${report.reportSource=='4'}">
							<input type="text" class="" value="�ǵ���" style="width: 150px;" disabled />
		     				 <input type="hidden" id="reportSource" name="reportSource" value="4">
		     				  <a href="/feed/getFeed?feedNo= ${report.feedComment.feedNo}" style="transform: translate(-150px, 30px);"> 
		     				 ${report.feedComment.feedNo} ��° �ǵ� </a>
		     				 </c:if>
		     			</td>
		     			<td style="display:flex; margin-left :200px; margin-top : -70px;"><strong>�Ű�޴� �г��� &nbsp;&nbsp;</strong>
		     			 ${report.user2.nickName}
		     			</td>
					</tr>
					<tr  style="margin-top:20px;" >
						<th style="text-align-last: center;">�Ű� ����</th>
						<td style="display:flex;   margin-top:20px;">
						<input type="checkbox" id="�弳" name="reportReason" value="1" style="margin-left:55px">�弳
						<input type="checkbox" id="����" name="reportReason" value="2" style="margin-left:30px">����
						<input type="checkbox" id="��Ÿ" name="reportReason" value="4" style="margin-left:30px">��Ÿ
						<input type="checkbox" id="����" name="reportReason" value="8" style="margin-left:30px">������ �߾�
						</td>
						
					</tr>
					<tr>
						<th style="text-align-last: center;"></th>
					</tr>
				</table></form>
			<!--  table End /////////////////////////////////////-->
	

		
						
									<div> 
									
 									 <button class="custom-btn btn-13" style= "transform: translate(400px,0px); ">
									   ó��</button> 

									
								<button class="custom-btn btn-13" style= "transform: translate(400px, 0px); ">
									�ڷ�</button>
									</div>
				
			</div>


</body>

</html>