<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
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
  
  
  <!-- 데이트피커 -->
  <link rel="stylesheet" href="datepicker.css">
<script src="datepicker.js"></script>
  
  <!-- alert -->
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  
  
  
  <!-- 타임피커 -->
  	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
    
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=390f3e2d16d538c1e7aa03b9ebdded3c&libraries=services"></script>
    
	<script type="text/javascript">

	$(function() {
		$("#locate").click(function() {
			navigator.geolocation.getCurrentPosition(function(position){ //좌표 추출
				var geocoder = new kakao.maps.services.Geocoder();
				var callback = function(result, status) {
					if(status == kakao.maps.services.Status.OK) {
						var locate = result[0].address_name;
					}
				}
			
				geocoder.coord2RegionCode(position.coords.longitude, position.coords.latitude, callback); //현재위치 좌표 가져오기
			});
			
		});
		
	});

	function fncAddMeeting() {

		var title = $("textarea[name='meetingTitle']").val();
		var content = $("textarea[name='meetingContent']").val();
		var date = $("input[name='meetingDate']").val();
		var time = $("input[name='meetingTime']").val();
		var member = $("textarea[name='meetingMaximumMember']").val();
		var place = $("input[name='meetingPlace']").val();
		
		
		if (title == null || title.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '일정제목은 필수입니다.',
			});
			return;
		}
				
		if( date == null || date.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '일정날짜는 필수입니다.',
			});
			return;
		}
		
		if( time == null || time.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '일정시간은 필수입니다.',
			});
			return;
		}
		
		if( content == null || content.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '일정내용은 필수입니다.',
			});
			return;
		}
		
		if( member == null || member.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '정원은 필수입니다.',
			});
			return;
		}
		
		if( place == null || place.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '모임장소는 필수입니다.',
			});
			return;
		}


		$("form").attr("method", "POST").attr("action", "/club/addMeeting").submit();
	}


	$(function() {

		$("#addMeeting").on("click", function() {
			
			fncAddMeeting();
		});
	});	

	$(function() {

		$("#cancel").bind("click", function() {
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
	
	
	
	//잠시 주석!
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
		
	});
	
	
	//자식창에서 부모창으로 값 전달하기
	function openChild()
	{
		window.name = "addMeetingView";
		
		window.open("/club/searchPlace.jsp", "searchPlace", "width = 1000, height = 500, top = 100, left = 200, location = no");
	}
	

	
	
	</script>
	
	
	<style>
	  body>div.container {
			border: 3px solid #D6CDB7;
			/* margin-top: 10px; */
		}
		
		textarea {
			resize: none;
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
      
  </style>

	

</head>

<body style="background: #EBEDF0;  position: relative; height: 1950px;">

	<jsp:include page="/toolbar.jsp"/>


	<form style="background: red; margin-left: 390px; width: 1140px;">
		<div class="wrap wd668" style="background-color: #f0f2f5; margin-left: 0px;">
			<div class="container" style="background-color: white; width: 1140px; padding-left: 0px; padding-right: 0px;">
	
				<div>
					<img src="/resources/image/uploadFiles/${ club.clubImage }" style="width: 100%; height: 700px; margin-top: 14px;">
				</div>
				
				<div class="form_txtInput" style="margin-top: 150px; padding-left: 315px; margin-top: -50px;">
					<h2 class="sub_tit_txt">모임일정등록</h2>
					<p class="exTxt">새로운 일정을 등록해보세요...</p>
					<div class="join_form">
					
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						
						<tbody>
							<tr>
								<th><span>일 정 제 목</span></th>
								<td><textarea class="meetingTitle" id="meetingTitle" name="meetingTitle" value="" maxlength="80" placeholder="일정 제목을 입력해주세요." style="width: 280px; height: 50px;"></textarea>
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
								<td><textarea class="meetingContent" id="meetingContent" name="meetingContent" maxlength="500" placeholder="일정 내용을 입력해주세요." style="width: 280px; height: 200px;"></textarea>
								</td>
							</tr>
							
							<tr>
								<th><span>정 원</span>
								<td>
									<textarea class="meetingMaximumMember" id="meetingMaximumMember" name="meetingMaximumMember" maxlength="50" style="width:80px; height: 40px;"></textarea>
								</td>
							</tr>
							
							<tr>
								<th><span>모 임 장 소</span></th>
								<td><input type="text" id="meetingPlace" name="meetingPlace" placeholder="모임장소는 필수입니다." autocomplete='off' onclick="openChild()"></td>
							<tr>
								<th></th>
								<!-- <td><button type="button" value="장소 검색" onclick="openChild()">장소검색</button></td> -->
								
							
								
							
						</tbody>	
		
				
			
				</table>
				</div>
				</div>
				</div>
				</div>
			</form>
				
				<div class="form-group">
					<div class="col-sm-offset-6  col-sm-6 text-center" style="margin-left: 24%;">
			      		<button type="button" class="plain button red cancel" id="addMeeting">등 &nbsp;록</button>
						<button type="button" class="plain button red cancel" id="cancel">취&nbsp;소</button>
			    	</div>
				</div>
				
		<br><br><br><br><br><br><br><br><br><br><br><br>
		
		<!-- footer start -->
		<jsp:include page="/footer.jsp" />
		<!-- footer end -->
					
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