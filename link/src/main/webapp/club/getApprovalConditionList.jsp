<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>모임리스트</title>
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
	
	</style>

	<script type="text/javascript">
	
	function fncUpdateMemberRole() {
		
		$("form").attr("method", "POST").attr("action", "/club/updateMemberRole")
		alert("모임원 수정 화면")
		.submit();
	}
	
	$(function(){
		$()
		
		
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
	       <h3>가입현황모임리스트</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >모임 제목</th>
            <th align="left">모임 상세설명</th>
            <th align="left">모임 카테고리</th>
            <th align="left">현재 가입인원 수 </th>
            <th align="left">최대 모임원 수</th>
            <th align="left">모임 활동영역</th>
            <th align="left">모임 이미지</th>
          </tr>
        </thead>
       
		<tbody>
		<tr>
		${myClubList}
		  <c:set var="i" value="0" />
		  <c:forEach var="i" items="${myClubList}">
			<tr>
			  <td align="left"><a href="/club/getClub?clubNo=${i.clubNo}">${i.clubNo}</a>
			  <td align="left">${i.clubTitle}</td>
			  <td align="left">${i.clubDetail}</td>
			  <td align="left">${i.clubCategory}</td>
			  <td align="left">${i.currentMember}</td>
			  <td align="left">${i.clubMaxMember}</td>
			  <td align="left">${i.clubArea}</td>
			  <td align="left">${i.clubImage}</td>	
			</tr>
          </c:forEach>
        </tr>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
	
	
</body>

</html>