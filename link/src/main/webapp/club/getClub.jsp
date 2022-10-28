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
	
	#btn_group button{
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
		color: #BD76FF;
    	border-color: #BD76FF;
    	background-color: #f0f2f5;
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
	
	</style>
	
	<!-- ?? -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	
	<script type="text/javascript">
	
	function fncDeleteClub() {
		
		$("form").attr("method", "POST").attr("action", "/club/deleteClub")
			.submit();
	}
	
	$(function() {

		$("button.btn.btn-delete").on("click", function() {
			alert("눌리나?");
			fncDeleteClub();
			
		});
	});
	
	$(function() {

		$("button.btn.btn-cancel").bind("click", function() {
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

		$("button.btn.btn-update").on("click", function() {
			self.location="/club/updateClubView?clubNo="+${ club.clubNo };

		});
	});
	
	$(function() {
		$("button.btn.btn-addApproval").on("click", function() {
			self.location="/club/applyClub.jsp"
			//popup();
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
			$("form").attr("method", "POST").attr("action", "/live/addLive").submit();
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
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px; margin-left: 176px;">
						<li data-group="advertising">
							<a href="/club/getMeetingList" style="color: #BD76FF;">모임일정</a>
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
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">결제</a>
						</li> --%>
					</ul>
		
		<button type="button" class="live">모임 화상채팅</button>
			
			
		<form class="form-horizontal" enctype="multipart/form-data">
		
		<div class="row">
			<div class="col-xs-4 col-md-6"><strong>모 임 제 목</strong></div>
 			<div class="col-xs-8 col-md-4">${club.clubTitle}</div>
		</div>
		
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모 임 설 명</strong></div>
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
		
		
			<div class="form-group" id="btn_group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		
		      		<button type="button" class="btn btn-addApproval">가&nbsp;입&nbsp;신&nbsp;청</button>
					<button type="button" class="btn btn-cancel">이&nbsp;전</button>			
					<button type="button" class="btn btn-update"  >수&nbsp;정</button>
					<!-- 모달을 열기 위한 버튼 -->
					<!-- <button type="button" class="btn btn-default" id="openModalBtn" data-togle="modal" data-target="#exampleModal" data-whatever="@mdo">수&nbsp;정</button> -->
				
					<button type="button" class="btn btn-delete"  >삭&nbsp;제</button>
					
					<!-- 모달 영역 -->
		<%-- 			<div id="exampleModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class = "modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
									<h4 class="modal-title" id="exampleModalLabel">모임 수정</h4>
								</div>
								
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label for="recipient-name" class="control-label">모임 제목</label>
											<input type="text" class="form-control" id="clubTitle" value="${club.clubTitle}">
										</div>
										
										<div class="form-group">
											
										</div>
									</form>
									
								</div>
								
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">수 정</button>
									<button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
								</div> 
							</div>
						</div>
					</div>	 --%>	
					
					
						<input type="hidden" id="addName" value="${clubNo}${club.clubTitle}">
						<input type="hidden" id="total" value="${clubMemberCount}">
						<input type="hidden" id="nickName" value="${user.nickName }">
						<input type="hidden" id="profile" value="${user.profileImage }">
		    </div>
			</div>	
			</form>		
			</div>
	</div>
	
		</main>
</body>
</html>