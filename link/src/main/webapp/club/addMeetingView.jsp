<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">  
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <!-- addMeetingCss -->
  <link rel="stylesheet" href="/resources/css/addUser.css">
  	<!--  	jQuery UI toolTip 사용 JS -->
  <!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script> -->
  <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <!-- <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
  
  <!-- 타임피커 -->
  	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
    
	<script type="text/javascript">



	function fncAddMeeting() {

		////////////////////////////////////////////////////
		//document.detailForm.action = '/addProduct.do';
		///////////////////////////////////////////////////


		$("form").attr("method", "POST").attr("action", "/club/addMeeting")
				.submit();
	}


	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			
			fncAddMeeting();
		});
	});	

	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});
	
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd' ,
		prevText: '이전 달' ,
		nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
	})
	
	$(function(){
		$("#datepicker").datepicker();
	});
	
	
	$(document).ready(function(){
		$("#timepicker").timepicker({
			timeFormat: 'HH:mm' ,
			interval: 30,
			startTime: '00:00' ,
			dynamic: false,
			dropdown: true,
			scrollbar: true
		});
	});
	
	
	
	
	var openWin;
	function popup() {
		var url = "/club/searchPlace.jsp";
		var name = "searchPlace";
		var option = "width = 1000, height = 500, top = 100, left = 200, location = no"
		openWin = window.open(url, name, option);
	}
	
	$(function() {
		$("#searchPlace").on("click", function() {
			popup();
		});
		
	})
	
	</script>
	
	
	<style>
	  body>div.container {
			border: 3px solid #D6CDB7;
			margin-top: 10px;
		}
      
      
  </style>


</head>

<body>
	<form>
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">모 임 일 정 등 록</h2>
					<p class="exTxt">새로운 일정을 등록해보세요...</p>
					<div class="join_form">
					
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						
						<tbody>
							<tr>
								<th><span>모 임 일 정 제 목</span></th>
								<td><input style="height: 40px;" type="text" id="meetingTitle" name="meetingTitle" placeholder="모임일정제목은 필수입니다." autocomplete='off'>
								</td>
							</tr>
							
							<tr>
								<th><span>모 임 날 짜</span></th>
								<td><input type="text" id="datepicker" name="meetingDate" placeholder="모임날짜는 필수입니다." style="height: 40px" autocomplete='off'></td>
							</tr>
							
							<tr>
								<th><span>모 임 시 간</span></th>
								<td><input type="text" class="timepicker" id="timepicker" name="meetingTime" placeholder="모임시간은 필수입니다." style="height: 40px" autocomplete='off'></td>
							</tr>
							
							<tr>
								<th><span>일 정 내 용</span></th>
								<td><input type="text" id="meetingContent" name="meetingContent" placeholder="일정내용은 필수입니다." style="height: 40px" autocomplete='off'></td>
							</tr>
							
							<tr>
								<th><span>정 원</span>
								<td><input type="text" id="meetingMaximumMember" name="meetingMaximumMember" placeholder="모임일정 정원을 입력하세요" autocomplete='off'></td>
							</tr>
							
							<tr>
								<th><span>모 임 장 소</span></th>
								<td><input type="text" id="meetingPlace" name="meetingPlace" placeholder="모임장소는 필수입니다." autocomplete='off'></td>
								
							<tr>
								<th></th>
								<td><button type="button" class="btn btn-default" id="searchPlace">장소검색</button></td>
							</tr>
								
							
						</tbody>	
		
				
			
				</table>
				</div>
				</div>
				</div>
				</div>
			</form>
				
				<div class="form-group">
					<div class="col-sm-offset-4  col-sm-4 text-center">
			      		<button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
						<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
			    	</div>
				</div>
					
	</body>
</html>




<!-- <div class="form-group">
				<label for="meetingTitle" class="col-sm-offset-1 col-sm-3 control-label">모 임 일 정 제 목</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingTitle" name="meetingTitle" placeholder="모임일정제목은 필수입니다">
				</div>					
			</div>
			
			
		
		 	<div class="form-group">
				<label for="meetingDate" class="col-sm-offset-1 col-sm-3 control-label">모 임 날 짜</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="meetingDate" name="meetingDate" placeholder="모임날짜는 필수입니다.">
					<p><input type="text" id="datepicker" name="meetingDate" placeholder="모임날짜는 필수입니다." height="150px"></p> 
				</div>		
			</div>
			
			<div class="form-group">
				<label for="meetingTime" class="col-sm-offset-1 col-sm-3 control-label">모 임 시 간</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="meetingTime" name="meetingTime" placeholder="모임시간은 필수입니다.">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="meetingContent" class="col-sm-offset-1 col-sm-3 control-label">일 정 내 용</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingContent" name="meetingContent" placeholder="일정내용은 필수입니다.">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="meetingMaximumMember" class="col-sm-offset-1 col-sm-3 control-label"> 정 원</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingMaximumMember" name="meetingMaximumMember" placeholder="정원을 입력해주세요.">
				</div>		
			</div>
			
			
			<div class="form-group">
				<label for="meetingPlace" class="col-sm-offset-1 col-sm-3 control-label">모 임 장 소</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingPlace" name="meetingPlace" placeholder="모임장소는 필수입니다.">
				</div>		
			</div> -->