<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		
	 <!-- jQuery UI toolTip 사용 CSS-->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip 사용 JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	 
 	 <!-- alert -->
  	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
 	 
 	 <style>
	body {
		padding-top : 70px;
	}
	
	.plain1.button.red.cancel{
	   background-color: white;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 65px !important;
	   color: #5F0080 !important;
	   font-size: 16px !important;
	   text-align: center;
	   border: solid 2px;
	}
	
	.plain1.button.red.cancel:hover{
	   background-color: #5F0080;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 65px !important;
	   color: white !important;
	   font-size: 16px !important;
	}   
	
	td {
		text-align: center;
		font-size: medium;
		vertical-align: middle;
		background-color: #f0f2f5 !important;
	}
	
	#main {
		background-color: #EBEDF0 !important;
	}
	
	main {
		background-color: #EBEDF0 !important;
	}
	
	.darkover {
	    position: static;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    background: rgba(0,0,0,0.35);
	}
	
	</style>
	
	<!-- ?? -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script type="text/javascript">
	
	function fncUpdateMemberRole() {
		
		$("form").attr("method", "POST").attr("action", "/club/updateMemberRole")
		alert("모임원 수정 화면")
		.submit();
	}
	
	function refreshMemList(){
		location.reload();
	}
	
	//닉네임, 프로필사진 클릭시 해당 유저의 마이홈피로 이동
	function getMyHomeGo(userId){
		location.href = "/myHome/getYourHome?userId="+userId;
	}

	
	//추방 그냥 컨트롤러
	 $(function() {
		$("#banMember").on("click", function() {
			//alert("모임원을 추방합니다 : ");
			
			$("form").attr("method", "POST").attr("action", "/club/deleteClubMember").submit();
		 });


			//추방 그냥 컨트롤러	
			
		$(function() {	
			$(document).on("click", "#banMember", function(){
			var clubUserNo = $(this).val();
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
					refreshMemList();
			}); //모임원 추방 
	 	});
	 
	 
			
			$(function() {
				
				$(".updateApprovalConditionBtn").on("click", function() {
					//alert("모임원을 승인합니다 : ");
					
					var totalClubMemberCount = $("input[name='totalClubMemberCount']").val();
					var clubMaxMember = $("input[name='clubMaxMember']").val();
					
				//	alert(totalClubMemberCount);
				//	alert(clubMaxMember);
					
					if(totalClubMemberCount >= clubMaxMember) {
							
						Swal.fire({
							title: '모임원 한도 초과입니다.' ,
							text: "결제를 통해 모임원 한도를 늘릴 수 있습니다." ,
							icon: 'warning',
							schowCancelButton: false ,
							confirmButtonColor: '#3085d6',
							cancelButtonColor: '#d33',
							confirmButtonText: '확인',
						}).then((result) => {
							if(result.value){
							
								self.location="/clubPost/addPayView?clubNo=${clubNo}"
							}
						})
						
						} else{
							
							$("form").attr("method", "POST").attr("action", "/club/updateApprovalCondition").submit();							
						}
					});
					
			});
				
			$(document).on("click", ".updateApprovalConditionBtn", function(){
				//alert('승인');
				var clubUserNo = $(this).val();
				var approvalCondition = $(this).attr('approvalCondition');
 				//alert(clubUserNo);
				//alert(approvalCondition);
				$.ajax("/clubRest/json/updateApprovalCondition",
						{
							method : "POST" ,
							data : JSON.stringify({
								clubUserNo : clubUserNo ,
								approvalCondition : approvalCondition
							}) ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status) {
								alert(status);
							} // end of success
						}); // end of ajax
						refreshMemList();
				}); // end of 승인
			});

	
	
	$(function() {

		$("#cancel").bind("click", function() {
			history.go(-1);
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
			openWin.document.getElementById("userId").value = $(this).attr("userId");
		});
	});
	
	
	//홈버튼
	$(function() {
		$(".homeBtn").on("click", function() {
			self.location="/club/getClub?clubNo="+${clubNo};
		});
	});
	
	$(function() {
		$(".clubPostBtn").on("click", function() {
			self.location="/clubPost/getClubPostList"
		});
	});
	
	$(function() {
		$(".clubMemberBtn").on("click", function() {
			self.location="/club/getClubMemberList"
		});
	});
	

	</script>
</head>

	
	<body class="blog masonry-style" style="background: #EBEDF0;">
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<jsp:include page="/toolbar.jsp" />
	
	<!-- <main role="main">
		
			<div id="intro-wrap" data-height="20">상단 검은색 공통 영역
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>CLUB MEMBER LIST</h2>
							<p>Manage the members of the club...</p>
						</div>
					</div>								
				</div>intro
			</div>intro-wrap -->
			
		
			<div id="main" class="row"><!-- 중간 개별영역 -->
			
				<div class="row-content buffer-left buffer-right buffer-bottom" style="margin-top: 130px; padding-bottom: 20%;">
					
				<div class="homeBtn_group">
						<button type="button" class="homeBtn" style="margin-top: 17px;">
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span> 
						</button>
						
						<button type="button" class="clubPostBtn">
							<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="clubMemberBtn">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="live">
							 <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span> 
						</button>
				</div>
		

	<div class="container">
	
		<div class="form_txtInput" style="margin-top: 50px;">
			<h2 class="sub_tit_txt">${club.clubTitle}의 모임원 </h2>
		</div>
	
		<input type="hidden" id="totalClubMemberCount" name="totalClubMemberCount" value="${totalClubMemberCount}">
		<input type="hidden" id="clubMaxMember" name="clubMaxMember" value="${club.clubMaxMember}">
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	  		  <div class="row">
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <!-- <input type="hidden" id="currentPage" name="currentPage" value=""/> -->
				  
				  <div class="form-group" id="btn_group" style="float: right; margin: 0px;">
				  
					<!--  <div class="col-sm-offset-4  col-sm-4 text-center"> -->
						
						<c:if test="${ fn:trim(sessionScope.user.userId) == fn:trim(club.user.userId) }">
							<button type="button" class="plain1 button red cancel" id="updateMemberRole">직책수정</button>
						</c:if>
						<button type="button" class="plain1 button red cancel" id="cancel">이&nbsp;전</button>
		  			</div>
				</div>	
	    	
	
	
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
	
	<div class="listForm" style="margin-top: 35px; box-shadow:rgb(0 0 0 / 30%) 0px 7px 9px, rgb(0 0 0 / 22%) 0px 4px 5px; border-radius: 10px;" >	
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">프로필사진</th>	
            <th align="left" >회원 ID</th>
            <th align="left">회원 닉네임</th>
            <th align="left">모임직책</th>
            <th align="left">마지막 접속시간</th>
            <th align="left">모임가입날짜</th>
            <th align="left">승인상태</th>
	            <c:if test="${ fn:trim(sessionScope.user.userId) == fn:trim(club.user.userId) }">
		            <th align="left">직책수정</th>
		            <th align="left">추방</th>
		            <th align="left">승인/거절</th>
		            <th align="left">Max</th>
		        </c:if>
          	</tr>
          	
        </thead>
       
		<tbody>
		<tr>
		  <c:forEach var="i" items="${clubMemberList}">
			<tr>
			<td align="center">
			<a href="/myHome/getYourHome?userId=${i.user.userId}"><img src="/resources/image/uploadFiles/${i.user.profileImage}" width="100" height="100"></a>
			<%-- <img src="/resources/image/uploadFiles/${i.user.profileImage}" width="100" height="100"> --%>
			
			</td>
			
			  <td >${i.user.userId}</td>
			  <td align="left">${i.user.nickName}</td>
			  <%-- <td align="center">${i.memberRole}</td> --%>
			  <td align="left">${ fn:trim(i.memberRole) == 0 ? "모임원" : ""} ${ fn:trim(i.memberRole) == 1 ? "모임부대표" : ""} ${fn:trim(i.memberRole) == 2 ? "모임대표" : ""}</td>
			  <td align="left">${i.logoutDate}</td>
			  <td align="left">${i.joinRegDate}</td>
			  <td align="left">${ fn:trim(i.approvalCondition) == 0 ? "승인대기" : ""} ${ fn: trim(i.approvalCondition) == 1 ? "승인완료" : ""}</td> 
<%-- 			  <td align="center">${i.approvalCondition}</td> --%>
				<c:if test="${ fn:trim(sessionScope.user.userId) == fn:trim(club.user.userId) }">
			  		<td align="left"><button value="${i.clubUserNo}" memberRole="${i.memberRole}" userId="${i.user.userId}">전달</button></td>
			  	
			  		<td align="left"><button value="${i.clubUserNo}" id="banMember">추방</button></td>
			  		<td align="left"><button value="${i.clubUserNo}" approvalCondition = "${i.approvalCondition}" id="updateApprovalCondition" class="updateApprovalConditionBtn">승인</button></td>
					<td>${i.club.clubMaxMember}</td>
				</c:if>
			</tr>
          </c:forEach>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
	</div>
	</div>
	</div>
	<!-- </main> -->
</body>

</html>