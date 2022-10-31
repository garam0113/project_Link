<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<title>모임상세조회</title>

	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://192.168.0.183:4000/socket.io/socket.io.js"></script>
   
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
	
	#main {
		background-color: #f0f2f5 !important;
	}
	
	main {
		background-color: #f0f2f5 !important;
	}
	
	.plain.button.red.cancel{
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
	
	.plain.button.red.cancel:hover{
	   background-color: #5F0080;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 65px !important;
	   color: white !important;
	   font-size: 16px !important;
	}
	

	a {
    	color: #bd76ff;
    	text-decoration: underline;
	}
	
	.darkover {
    position: sticky;
    top: auto;
    bottom: 0;
    left: 0;
    background: rgba(0,0,0,0.35);
	}
	
	.club-wrap {
			width : 100%;
			margin: 10px auto;
			position: relative;
	}
	
	.club-wrap img {
			width: 100%;
			vertical-align: middle;
			filter: brightness(1.1);
	}
	
	.club-text {
			
			position: absolute;
			top: 50%;
			left: 50%;
			width: 100%;
			transform: translate(-50%, -50%);
			font-size: 20px;
			text-align: center;
			
	}
	
	.h2-color {
		color: yellow;
	}
	
	.p-color {
		color: yellow;
	}
	
	.row-content.buffer, .row-content.buffer-left {
    	padding-left: 0% !important;
	}
	
	.row-content.buffer, .row-content.buffer-right {
    padding-right: 0% !important;
	}
	
	row-content.buffer, .row-content.buffer-bottom {
    padding-bottom: 10% !important;
	}
	
	
	element.style {
    	margin-bottom: 100px !important;
	}
		
	</style>
	
	<!-- ?? -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	
	<script type="text/javascript">
	
	function fncDeleteClub() {
		
		Swal.fire({
			  title: '정말 모임을 삭제하시겠습니까?',
			  text: "삭제한 모임은 복구가 불가능합니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'delete'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      'Deleted!',
			      'Your file has been deleted.',
			      'success'
			    )
			    
			    $("form").attr("method", "POST").attr("action", "/club/deleteClub")
				.submit();	    
			  }
			})
	}
	
	$(function() {
		$("#addMeeting").on("click", function() {
			self.location="/club/addMeetingView.jsp"
		});
	});
	
	$(function() {

		$("#deleteClub").on("click", function() {
			fncDeleteClub();
			
		});
	});
	
	$(function() {

		$("#cancel").bind("click", function() {
			history.go(-1);
		});
	});
	
	//팝업 띄우기
	var openWin;
	function popup() {
		var url = "/club/applyClub.jsp";
		var name = "applyClub";
		var option = "width = 500, height = 350, top = 50, left = 50, location = no, scrollbars = no"
		
		openWin = window.open(url, name, option);
	} 
	
	$(function() {

		$("#updateClub").on("click", function() {
			self.location="/club/updateClubView?clubNo="+${ club.clubNo };

		});
	});
	
	$(function() {
		$("#addApproval").on("click", function() {
			//self.location="/club/applyClub.jsp"
			popup();
		});
	}); 
	
	$(function() {
		var options = {
				"forcNew" : true
		};
		var url = "https://192.168.0.183:4000";
		
		socket = io.connect(url, options);
		
		socket.on("connect", function() {
			//alert("소켓연결 완료");
		});
		
		$(".live").on("click", function() {
			console.log($("#addName").val());
			console.log($("#total").val());
			console.log($("#nickName").val());
			console.log($("#profile").val());
			if(socket == undefined){
			//	alert("서버가 연결되어 있지 않습니다.");
				return;
			}
			socket.emit("name", $("#addName").val());
			socket.emit("total", $("#total").val());
			socket.emit("nickName", $("#nickName").val());
			socket.emit("profile", $("#profile").val());
			self.location = "https://192.168.0.183:4040"; 
		})
	})

	
	  
	
	</script>	 

</head>


<body class="blog masonry-style">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

		<main role="main">
		
			<div id="intro-wrap" data-height="17.35"><!-- 상단 검은색 공통 영역 -->
				<div id="intro" class="preload darken">					
					<!-- <div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);"> -->
					<div class="intro-item">
					
						<div class="club-wrap">
						
							<div class="club-image">
								<a href="/club/getClub?clubNo=${clubNo}"><img src="/resources/image/uploadFiles/${club.clubImage}" width="1500" height="300" name="file" id="clubImage"></a>
							</div>
							
							<div class="club-text">
							<h2 class="h2-color"><a href="/club/getClub?clubNo=${clubNo}"></a>CLUB</h2>
							<p class="p-color">Make good memories with the members...</p>
							</div>							
						</div>
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
			
		
			<div id="main" class="row"><!-- 중간 개별영역 -->
				<div class="row-content buffer-left buffer-right buffer-bottom">
					<ul class="inline cats filter-options" style="font-size: 40px; margin-left: 310px;">
						<li data-group="advertising">
							<a href="/club/getClub?clubNo=${clubNo }" style="color: #BD76FF;">모임</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList" style="color: #BD76FF;">모임게시물</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList" style="color: #BD76FF;">모임원</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/chatRoomList" style="color: #BD76FF;">모임채팅</a>
						</li>
					</ul>
		
		<button type="button" class="live">모임 화상채팅</button>
		
		
		<div class="mainForm" style="display: inline-flex;">
		<!-- 클럽상세 -->	
		<div>	
		<form class="form-horizontal" enctype="multipart/form-data" style="width:443px;">
		
		<div class="col-xs 6 col-md-6" style="display: contents;">
		<div class="row">
			<div class="col-xs-4 col-md-6"><strong>모 임 제 목</strong></div>
 			<div class="col-xs-8 col-md-4">${club.clubTitle}</div>
		</div>
		
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-6 "><strong>모 임 설 명</strong></div>
			<div class="col-xs-8 col-md-8">${club.clubDetail}</div>
		</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-6 "><strong>모 임 카 테 고 리</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubCategory}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-6 "><strong>모 임 활 동 영 역</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubArea}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-s-4 col-md-6 "><strong>모임원 수</strong></div>
			<div class="col-xs-8 col-md-4">${clubMemberCount}/${club.clubMaxMember}</div>
		</div>
		
		</div>
		
		</form>
		
		</div> <!-- 클럽상세 -->
		
		
		<!-- 달력영역 -->
		<div class="calendarArea">
		
		<jsp:include page="/club/calendar.jsp" />
		
		</div>
		<!-- 달력 영역 -->
		
		
		</div>

		<button type="button" class="plain button red cancel" id="addMeeting" style="margin-top: 134px; margin-left: 877px;">일정생성</button>
		
		
		</div>
		
			<div class="form-group" id="btn_group">
				<div class="col-sm-offset-4  col-sm-4 text-center" style="margin-top: -151px;">
		      		
		      		<button type="button" class="plain button red cancel" id="addApproval">가입신청</button>
					<button type="button" class="plain button red cancel" id="cancel">이&nbsp;전</button>			
					<button type="button" class="plain button red cancel" id="updateClub">수&nbsp;정</button>
					<button type="button" class="plain button red cancel" id="deleteClub">삭&nbsp;제</button>
					
					
						<input type="hidden" id="addName" value="${clubNo}${club.clubTitle}">
						<input type="hidden" id="total" value="${clubMemberCount}">
						<input type="hidden" id="nickName" value="${user.nickName }">
						<input type="hidden" id="profile" value="${user.profileImage }">
		    </div>
			</div>	
			</div>
	
	
	
		</main>
</body>
</html>