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
		
	 <!-- jQuery UI toolTip 사용 CSS-->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip 사용 JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	 
 	 <style>
	body {
		padding-top : 70px;
	}
	
	#btn_group button{
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	
	td {
		text-align: center;
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
	
	function fncDeleteClub() {
		
		$("form").attr("method", "POST").attr("action", "/club/deleteClub")
		.submit();
	}
	
	function refreshMemList(){
		location.reload();
	}
	
	$(function() {

		$("button.btn.btn-danger").on("click", function() {
			alert("모임을 삭제하시겠습니까?");
			fncDeleteClub();
		});
	});
	
	//추방 그냥 컨트롤러
	 $(function() {
		$("#banMember").on("click", function() {
			alert("모임원을 추방합니다 : ");
			$("form").attr("method", "POST").attr("action", "/club/deleteClubMember").submit();
		}); 
		
		$(function() {
			$("#updateApprovalCondition").on("click", function() {
				//alert("모임원을 승인합니다 : ");
				$("form").attr("method", "POST").attr("action", "/club/updateApprovalCondition").submit();
		});
		
		
			//추방 그냥 컨트롤러	
			$(document).on("click", "#banMember", function(){
			//alert('추방');
			var clubUserNo = $(this).val();
			//alert(clubUserNo);
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
		
			
			
			/* $(function() {
				$("#banMember").on("click", function(e){
					var clubUserNo = $(this).val();
					$("banMember").off(e);
				$.ajax({
					url : "/clubRest/json/deleteClubMember",
					type : "POST",
					datatype : "json"
					data : JSON.stringify({
						clubUserNo : clubUserNo
					}),
					
					contentType : "application/json",
					success : function(data) {
						console.log(data.clubMemberList);
						
					}
					
				})
					
				})
			}) */
			

		
				
			$(document).on("click", "#updateApprovalCondition", function(){
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

	
	
	$(function() {

		$("button.btn.btn-primary").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function() {

		$("button.btn.btn-warning").on("click", function() {
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
	 });
	</script>
</head>

	
	<body class="blog masonry-style">
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<jsp:include page="/toolbar.jsp" />
	
	<main role="main">
		
			<div id="intro-wrap" data-height="27.778"><!-- 상단 검은색 공통 영역 -->
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>CLUB MEMBER LIST</h2>
							<p>Manage the members of the club...</p>
						</div>
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
			
		
			<div id="main" class="row"><!-- 중간 개별영역 -->
			
				<div class="row-content buffer-left buffer-right buffer-bottom">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px;">
						<li data-group="advertising">
							<a href="/club/getMeetingList">모임 일정</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList">모임 게시물</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList">모임원</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/chatRoomList">모임 채팅</a>
						</li>
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">결제</a>
						</li> --%>
					</ul>

		

	<div class="container">
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <!-- <input type="hidden" id="currentPage" name="currentPage" value=""/> -->
				  
				  <div class="form-group" id="btn_group" style="float: right; margin: 0px;">
				  
					<!--  <div class="col-sm-offset-4  col-sm-4 text-center"> -->
										
						<button type="button" class="btn btn-success btn" id="updateMemberRole">직&nbsp;책&nbsp;수&nbsp;정</button>
						<button type="button" class="btn btn-primary">이&nbsp;전</button>
						<button type="button" class="btn btn-warning"  >모&nbsp;임&nbsp;수&nbsp;정</button>
						<button type="button" class="btn btn-danger"  >삭&nbsp;제</button>
		  			</div>
				</div>	
	    	
	
	
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
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
            <th align="left">직책수정</th>
            <th align="left">추방</th>
            <th align="left">승인/거절</th>
            <th align="left">Max</th>
          </tr>
        </thead>
       
		<tbody>
		<tr>
		  <c:forEach var="i" items="${clubMemberList}">
			<tr>
			<td align="center"><img src="/resources/image/uploadFiles/${i.user.profileImage}" width="100" height="100"></td>
			  <td >${i.user.userId}</td>
			  <td align="left">${i.user.nickName}</td>
			  <td align="center">${i.memberRole}</td>
			  <td align="left">${i.logoutDate}</td>
			  <td align="left">${i.joinRegDate}</td>
			  <td align="center">${i.approvalCondition}</td>
			  <%-- <td><center>${i.approvalCondition}</center></td> --%>
			  <td align="left"><button value="${i.clubUserNo}" memberRole="${i.memberRole}">전달</button>
			  <td align="left"><button value="${i.clubUserNo}" id="banMember">추방</button>
			  <td align="left"><button value="${i.clubUserNo}" approvalCondition = "${i.approvalCondition}" id="updateApprovalCondition">승인</button>
			  <td>${i.club.clubMaxMember}</td>
			  <c:if test="${i.memberRole}== 0">
			  	모임원
			  </c:if>
			</tr>
          </c:forEach>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  

 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	<%-- <jsp:include page="../common/pageNavigator_new2.jsp"/> --%>
	</div>
	</div>
	</div>
	</main>
</body>

</html>