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

	<title>Q&A Ȯ��</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
$(function(){
		
		$("button:contains('Ȯ��')").bind("click", function(){
			self.location = "/serviceCenter/getQandAList";
		});
			
		$("button:contains('����')").bind("click", function(){
		self.location = "../serviceCenter/deleteQandA";
		})
	});
	
</script>
<style>
.row {
	margin-left : 0px !important;
	 display: initial !important;
	resize: none;
}
textarea {
	resize: none;
}
body{
background-color: #EBEDF0 !important;
}
.qandATitle {
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

<body>

	<jsp:include page="/toolbar.jsp" />
	<!-- form Start /////////////////////////////////////-->
	<div class="page-header" align="center"
		style="transform: translate(-316px, 38px);">
		<h2>Q&A Ȯ��</h2>
	</div>
	<div class="container">
	<table>
				<div class="row2">
				<thead>
				</thead>
				</div>
				</tbody>
					 <tr class = "body" id ="body" >
						<th style="text-align-last: center;"></th>
						<td align="left">
						<input type="hidden" name="qandANo" id="qandANo" value="${qandA.qandANo}">
						</td>
					</tr>
					<tr class = "title" id ="title">
					<th style="text-align-last: center;">����</th>
					<td style="display: flex; min-height : 40px; max-height: 80px; width: 700px; background-color:white; margin-bottom: 30px;
						background: white;  border: 1px solid white;  border-radius: 15px;  box-shadow: 0 0 10px rgb(0 0 0 / 20%);">		
						${qandA.qandATitle}
							<input type="hidden" id="qandATitle" name="qandATitle" value="${qandA.qandATitle}">
					</td>	
					</tr>
					<tr>
						<th></th>
						<td align="left" name ="qandARegDate" id="qandARegDate" style="display: flex; height: 40px;">${qandA.qandARegDate }</td>
						<td align="left" style="transform: translateX(-370px);" style="display: flex; height: 40px;"><strong>${qandA.userId.nickName}</strong></td>
						
					</tr>
					<tr >
						<th style="text-align-last: center;">����</th>
						<td style="display: flex; min-height : 150px; max-height: 800px; width: 700px; background-color:white; margin-bottom: 30px;
						background: white;  border: 1px solid white;  border-radius: 15px;  box-shadow: 0 0 10px rgb(0 0 0 / 20%);">
								${qandA.qandAContent}
						<input type="hidden" id="qandAContent" name="qandAContent" value="${qandA.qandAContent}">
						</td>
					</tr>
					<tr >
						<th style="text-align-last: center;">÷������</th>
						<c:if test="${qandA.qandAImage1 == null && qandA.qandAImage2 ==null }">
							<td>÷������ ����</td>
						</c:if>
						<td><c:if test="${qandA.qandAImage1 != null }">
						${qandA.qandAImage1}
						
						</c:if>
						<c:if test="${qandA.qandAImage2 != null }">
						<br/> ${qandA.qandAImage2}
						</c:if>
						</td>
						
						
					</tr>
					<tr >
						<th style="text-align-last: center;"></th>
					</tr>
			</table>
			<!--  table End /////////////////////////////////////-->
	

		
						
									<div> 
								
									 <button class="custom-btn btn-13" style= "transform: translate(680px,0px); ">
									   ����</button> 
									 <button class="custom-btn btn-13" style= "transform: translate(680px, 0px); ">
										Ȯ��</button>

									</div>
				
			</div>


</body>
</html>
