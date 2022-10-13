<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>모임원리스트</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <!-- <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->
    <!-- Bootstrap Dropdown Hover JS -->
   <!-- <script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->
	
	 <!-- jQuery UI toolTip 사용 CSS-->
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
	
	function fncDeleteClub() {
		
		$("form").attr("method", "POST").attr("action", "/club/deleteClub")
		.submit();
	}
	
	$(function() {

		$("button.btn.btn-danger").on("click", function() {
			alert("모임을 삭제하시겠습니까?");
			fncDeleteClub();
		});
	});
	
	
	$(function() {
		$("input[value='추방']").bind("click", function() {
			alert("모임원을 추방합니다 : ");
			$("form").attr("method", "POST").attr("action", "/club/deleteClubMember").submit();
		});
		
		
		
		$(document).on("click", "input[value='추방']", function(){
			alert('추방');
			var clubUserNo = $("#clubUserNo2").val();
			alert(clubUserNo);
			$.ajax("/clubRest/json/deleteClubMember",
					{
						method : "POST" ,
						data : JSON.stringify({
							clubUserNo : clubUserNo
						}) ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						dataType : "json",
						success : function(JSONData, status){
							alert(status);
						} // end of success  
					}); //end of ajax
			}); //모임원 추방
		

	
	
	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function() {

		$("button.btn.btn-waring").on("click", function() {
			self.location="/club/updateClubView.jsp"
		});
	});
	
	var openWin;
	function popup() {
		var url = "/club/updateMemberRoleView.jsp";
		var name = "updateMemberRoleView";
		var option = "width = 800, height = 300, top = 100, left = 200, location = no"
		openWin= window.open(url, name, option);
	}

	$(function() {
		$("#updateMemberRole").on("click", function() {
			popup();
		});
		$("button:contains('전달')").on("click", function() {
			openWin.document.getElementById("clubUserNo").value = $(this).val();
			openWin.document.getElementById("memberRole").value = $(this).attr("memberRole") ;
		});
		
	});
	
	});
	
	</script>	
	
</head>

<body>
		

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>모임원리스트</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
 		    <div class="col-md-6 text-left">
		    	<%-- <p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p> --%>
		    </div> 
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				  <div class="form-group">
					<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-danger"  >삭&nbsp;제</button>
					<a class="btn btn-primary btn" href="#" role="button">이&nbsp;전</a>
					<button type="button" class="btn btn-waring"  >모&nbsp;임&nbsp;수&nbsp;정</button>
					<button type="button" class="btn btn-success btn" id="updateMemberRole">직&nbsp;책&nbsp;수&nbsp;정</button>
		  			</div>
				</div>	
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원 ID</th>
            <th align="left">회원 닉네임</th>
            <th align="left">모임직책</th>
            <th align="left">마지막 접속시간</th>
            <th align="left">모임가입날짜</th>
            <th align="left">승인상태</th>
            <th align="left">직책수정</th>
            <th align="left">추방</th>
          </tr>
        </thead>
       
		<tbody>
		<tr>

		  <c:set var="i" value="0" />
		  <c:forEach var="i" items="${clubMemberList}">
		  <input type="hidden" name="clubUserNo" value="${clubUserNo}">
			<%-- <c:set var="i" value="${ i+1 }" /> --%>
			<tr>
			<td align="center">${i.clubUserNo}</td>
			  <td align="left">${i.user.userId}</td>
			  <td align="left">${clubUser.nickName}</td>
			  <td align="left">${i.memberRole}</td>
			  <td align="left">${i.user.logoutDate}</td>
			  <td align="left">${i.joinRegDate}</td>
			  <td align="left">${i.approvalCondition}</td>
			  <!-- <td align="left"><button type="button" class="btn btn-success btn" id="updateMemberRole">직&nbsp;책&nbsp;수&nbsp;정</button> -->
			  <td align="left"><button value="${i.clubUserNo}" memberRole="${i.memberRole}">전달</button>
			  <input type="hidden" id="clubUserNo2" name="clubUserNo2" value="${i.clubUserNo}">
			  <td align="left"><input type="button" value="추방">
			</tr>
          </c:forEach>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	<%-- <jsp:include page="../common/pageNavigator_new2.jsp"/> --%>
	
	
</body>

</html>