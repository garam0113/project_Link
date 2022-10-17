<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<title>모임상세조회</title>

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
	
	</style>

	<script type="text/javascript">
	
	function fncDeleteClub() {
		
		$("form").attr("method", "POST").attr("action", "/club/deleteClub")
			.submit();
	}
	
	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			alert("눌리나?");
			fncDeleteClub();
			
		});
	});
	
	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function() {

		$("button.btn.btn-warning").on("click", function() {
			self.location="/club/updateClubView.jsp"
		});
	});
	
	$(function() {

		$("button.btn.btn-success").on("click", function() {
			alert("안녕하세요");
			self.location="/club/applyClub.jsp"
		});
	});
	
	
	
	
	</script>	

</head>

<body class="portfilio">
		
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="js/plugins.js"></script>
	<script src="js/beetle.js"></script>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	

		<main role="main">
			<div id="intro-wrap" class="full-height" data-height="27.778"><!-- 상단 검은색 공통 영역 -->
				<div id="intro" class="preload darken more-button">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>Club</h2>
							<p>For me, the camera is a sketch book, an instrument of intuition and spontaneity.</p>
						</div><!-- caption -->	
						<!-- <div class="photocaption">
							<h4>A shot by <a href="http://madebyvadim.com/" target="blank" alt="Vadim Sherbakov">Vadim Sherbakov</a></h4>
						</div>photocaption -->											
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
			
			
		</main>
		
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
		
		
		
	
			
			
		<form class="form-horizontal" enctype="multipart/form-data">
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>모 임 제 목</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubTitle}</div>
		</div>
		
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모 임 설 명</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모 임 이 미 지</strong></div>
			<img src="/resources/image/uploadFiles/${club.clubImage}" width="300" height="300" name="file" id="clubImage">
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모 임 카 테 고 리</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubCategory}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모 임 활 동 영 역</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubArea}</div>
		</div>
		
		
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >삭&nbsp;제</button>
					<a class="btn btn-primary btn" href="#" role="button">이&nbsp;전</a>
					<button type="button" class="btn btn-warning"  >수&nbsp;정</button>
					<button type="button" class="btn btn-success">가&nbsp;입&nbsp;신&nbsp;청</button>
					
		    </div>
			</div>	
			</form>		
			</div>
	</div>
</body>
</html>