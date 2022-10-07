<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<title>모임일정상세조회</title>

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
	
	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			self.location="/purchase/addPurchaseView?prod_no=${product.prodNo}"
		});
	});
	
	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function() {

		$("button.btn.btn-waring").on("click", function() {
			self.location="/club/updateMeetingView.jsp"
		});
	});
	
	
	
	</script>	

</head>

<body>
		
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">모임일정상세조회</h3>
	    </div>
	
	
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>모 임 일 정 번 호</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>모 임 일 정 제 목</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingTitle}</div>		
		</div>
			
		
		<hr/>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>일 정 날 짜 </strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>일 정 시 간</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingTime}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>일 정 활 동 영 역</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingPlace}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모 임 일 정 설 명</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingContent}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>정 원</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingMaximumMember}</div>
		</div>
		
		<hr/>
		
		
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >구&nbsp;매</button>
					<a class="btn btn-primary btn" href="#" role="button">이&nbsp;전</a>
					<button type="button" class="btn btn-waring"  >수&nbsp;정</button>
					
		    </div>
			</div>			
	</div>
</body>
</html>