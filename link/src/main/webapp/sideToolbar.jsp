<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

<script type="text/javascript">
	$(function() {
		$("#myPage").on("click", function() {
			self.location = "/user/getUser?userId=${user.userId}";
		});

		$("#updatePage").on("click", function() {
			self.location = "/user/updateUser?userId=${user.userId}";
		}); 

		$("#myReport").on("click", function() {
			$("form").attr("method","post").attr("action","/serviceCenter/getUserReportList/${sessionScope.user.userId}").submit();
		
		});

		$("#myQA").on("click", function() {
			$("form").attr("method","post").attr("action","/serviceCenter/getUserQandAList/${sessionScope.user.userId}").submit();
		 
		});

		$('#userPage').on("click", function() {
			
			self.location = "/user/getUserList";
		});

		$("#report").on("click", function() {
			location.href = "/serviceCenter/getUserReportList";
		});
		
		$("#QA").on("click", function() {
			location.href = "/serviceCenter/getUserQandAList";
			 
		});
		$("#stop2").on("click", function() {
			self.location = "/user/getUserList?searchKeyword=2";
		});

		$("#stop1").on("click", function() {
			self.location = "/user/getUserList?searchKeyword=1";
		});

	});
	
	$(function () {
		
		$(document).on("click",".clubNav", function() {
			
			Swal.fire({
				title: '로그인 후 이용해주세요' ,
				text: "로그인 창으로 이동합니다" ,
				showCancelButton: false,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인', 
			}).then((result) => {
				if(result.value) {
					return;	
				}
			})
		})
	});
	
	$(function() {
		$('#login').on('click', function(event) {
			event.stopPropagation();
			$('#modalLogin').modal();
		})
		/*  $('#ml').on("click", function(event) {
			event.stopPropagation();
			$('.modal.fade.login').modal('hide');
		})  */
	}); 
</script>

 <meta charset="EUC-KR" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Link</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html" style="font-size: larger; color: white; font-weight: bold;">LINK</a>
            <div style="display: flex;">
            <div style="margin-left: 585px;"><a href="/" style="font-size: larger; color: white; font-weight: bold;">HOME</a></div>
            <div style="margin-left: 25px;"><a href="/feed/getFeedList" style="font-size: larger; color: white; font-weight: bold;">FEED</a></div>
            <c:if test="${! empty sessionScope.user }">
            <div style="margin-left: 25px;"><a href="/club/getClubList" style="font-size: larger; color: white; font-weight: bold;">CLUB</a></div>
            </c:if>
            <c:if test="${ empty sessionScope.user }">
            <div style="margin-left: 25px;"><a href="#" class="clubNav" onclick="clubNav();" style="font-size: larger; color: white; font-weight: bold;">CLUB</a></div>
            </c:if>
            <div style="margin-left: 25px;"><a href="/myHome/getMyHome?userId=${sessionScope.user.userId}" style="font-size: larger; color: white; font-weight: bold;">MYHOME</a></div>
            <div style="margin-left: 25px;"><a href="/serviceCenter/serviceCenterHome.jsp" style="font-size: larger; color: white; font-weight: bold;">SERVICECENTER</a></div>
            <c:if test="${ empty sessionScope.user }">
            <div style="margin-left: 25px;"><a href="#" id='login' style="font-size: larger; color: white; font-weight: bold;">로그인</a></div>
            </c:if>
            <c:if test="${!empty sessionScope.user }">
            <div style="margin-left: 25px;"><a href="/user/logout?userId=${sessionScope.user.userId}" style="font-size: larger; color: white; font-weight: bold;">로그아웃</a></div>
            </c:if>
            <c:if test="${fn:trim(sessionScope.user.role) == '0' }">
            <div style="margin-left: 25px;"><a href="/user/getUser?userId=${sessionScope.user.userId}" style="font-size: larger; color: white; font-weight: bold;">내정보보기</a></div>
            </c:if>
             <c:if test="${fn:trim(sessionScope.user.role) == '1' }">
            <div style="margin-left: 25px;"><a href="/user/getUserList" style="font-size: larger; color: white; font-weight: bold;">관리자페이지</a></div>
            </c:if>
            </div>
            <!-- Sidebar Toggle-->
            <!-- Navbar Search-->
            <!-- Navbar-->
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu" style="text-align: center; font-size: larger; color: white; font-weight: bold;">
                    <c:if test="${ fn:trim(user.role) == '0' }">
                    <div id='myPage' style="margin-top: 35px;">내정보보기</div>
                    <div id='updatePage' style="margin-top: 20px;">내정수정</div>
                    <div id='myReport' style="margin-top: 20px;">내신고내역</div>
                    <div id='myQA' style="margin-top: 20px;">내Q&A</div> 
                    </c:if>
                    <c:if test="${ fn:trim(user.role) == '1' }">
                    <div id='userPage' style="margin-top: 35px;">회원목록</div>
                    <div id='report' style="margin-top: 20px;">신고내역</div>
                    <div id='QA' style="margin-top: 20px;">관리자Q&A</div>
                    <div id="stop1" style="margin-top: 20px;">정지회원</div>
                    <div id="stop2" style="margin-top: 20px;">영구회원</div>
                    </c:if>
                    </div>
                </nav>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body> 
 
<%-- <body class="portfolio">
	<jsp:include page="/toolbar.jsp" />
	
	<!-- main -->
<form>
<br/><br/>
<input type="hidden" class="currentPage" id="currentPage" name="currentPage" value="1" />
	<c:if test="${ fn:trim(user.role) == '0' }">
		<div id="main" class="row"style="background-color: #EBEDF0;">
			<div class="row-content buffer clear-after" style="margin-bottom: -100px;">
				<ul class="inline cats filter-options">
					<li data-group="advertising">내정보보기</li>
					<li data-group="fun">내보정수정</li>
					<li data-group="infographics">내 신고내역</li>
					<li data-group="lightbox">내 Q&A</li>
				</ul>
			</div>
			<!-- row-content -->
		</div>
		<!-- row -->
	</c:if>

	<c:if test="${ fn:trim(user.role) == '1' }">
		<div id="main" class="row" style="background-color: #EBEDF0;">
			<div class="row-content buffer clear-after" style="margin-bottom: -100px;">
				<ul class="inline cats filter-options">
					<li data-group="icons">회원정보수정</li>
					<li data-group="infographics">신고내역조회</li>
					<li data-group="lightbox">관리자 Q&A</li>
					<li data-group="lightbox" id="stop2">영구정지회원</li>
					<li data-group="lightbox" id="stop1">정지회원</li>
				</ul>
			</div>
			<!-- row-content -->
		</div>
		<!-- row -->
	</c:if>
</form>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
</body> --%>

</html>