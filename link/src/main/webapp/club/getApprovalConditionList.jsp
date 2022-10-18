<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>가입현황리스트</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip 사용 JS-->
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
		alert("모임원 수정 화면")
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
		
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>가입현황리스트</h3>
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
			  	<p>현재인원 : ${i.currentMember}</p>
			  	<p>최대인원 : ${i.clubMaxMember}</p>
			  	<p>신청현황 : ${i.approvalCondition}</p>
			  	<p><a href="/club/getClub?clubNo=${i.clubNo}" class="btn btn-success" role="button">모임보기</a></p>
			
			</div>
			</div>
			</div>
          </c:forEach>


	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
	
	
</body>

</html>