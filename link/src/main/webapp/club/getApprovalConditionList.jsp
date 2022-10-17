<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>������Ȳ����Ʈ</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip ��� JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	 
 	 <style>
	body {
		padding-top : 70px;
	}
	
	.thumbnail {
			display: flex;
			height : 100%;
		}
		
		.thumbnail img { 
			min-height:200px; height:150px;
		 }
	
	</style>

	<script type="text/javascript">
	
	function fncUpdateMemberRole() {
		
		$("form").attr("method", "POST").attr("action", "/club/updateMemberRole")
		alert("���ӿ� ���� ȭ��")
		.submit();
	}
	
		
	})
	
	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			self.location="/club/getApprovalCondition"
			
		});
	});
	
	
	
	</script>	
</head>

<body>
		
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>������Ȳ����Ʈ</h3>
	    </div>
	    
		  <c:set var="i" value="0" />
		  <c:forEach var="i" items="${approvalConditionList}">
			<div class="col-xs-4 col-md-4">
			<div class="thumbnail" style="">
			  <%-- <td align="left"><a href="/club/getClub?clubNo=${i.clubNo}">${i.clubNo}</a> --%>
			  <img src="/resources/image/uploadFiles/${i.clubImage}" alt=".">
			  <div class="caption">
			  	<p>${i.clubTitle}</p>
			  	<p>${i.clubArea}</p>
			  	<p>�����ο� : ${i.currentMember}</p>
			  	<p>�ִ��ο� : ${i.clubMaxMember}</p>
			  	<p>��û��Ȳ : ${i.approvalCondition}</p>
			  	<p><a href="/club/getClub?clubNo=${i.clubNo}" class="btn btn-success" role="button">���Ӻ���</a></p>
			
			</div>
			</div>
			</div>
          </c:forEach>


	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
	
	
</body>

</html>