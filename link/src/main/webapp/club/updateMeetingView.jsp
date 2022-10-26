<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <!-- addMeetingCss -->
  <link rel="stylesheet" href="/resources/css/addUser.css"> 
  	<!--  	jQuery UI toolTip ��� JS -->
  <!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
  <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <!-- <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
	
	<!-- alert -->
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

	 <!-- Ÿ����Ŀ -->
  	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>	
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body>div.container {
			border: 3px solid #D6CDB7;
			margin-top: 10px;
		}
		
		body {
			background-color: #f0f2f5 !important;
		}
		
		textarea {
			resize: none;
		}
		
		
      
    </style>
    
<script type="text/javascript">


	function fncUpdateMeeting() {

		var title = $("textarea[name='meetingTitle']").val();
		var content = $("textarea[name='meetingContent']").val();
		var date = $("input[name='meetingDate']").val();
		var time = $("input[name='meetingTime']").val();
		var member = $("textarea[name='meetingMaximumMember']").val();
		var place = $("input[name='meetingPlace']").val();
		
		
		if (title == null || title.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '���������� �ʼ��Դϴ�.',
			});
			return;
		}
				
		if( date == null || date.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '������¥�� �ʼ��Դϴ�.',
			});
			return;
		}
		
		if( time == null || time.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '�����ð��� �ʼ��Դϴ�.',
			});
			return;
		}
		
		if( content == null || content.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '���������� �ʼ��Դϴ�.',
			});
			return;
		}
		
		if( member == null || member.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '������ �ʼ��Դϴ�.',
			});
			return;
		}
		
		if( place == null || place.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '������Ҵ� �ʼ��Դϴ�.',
			});
			return;
		}
		
		


		$("form").attr("method", "POST").attr("action", "/club/updateMeeting")
				.submit();
	}


	$(function() {

		$("button.btn.btn-updateMeeting").on("click", function() {
			
			fncUpdateMeeting();
		});
	});	

	$(function() {

		$("button.btn.btn-cancel").bind("click", function() {
			history.go(-1);
		});
	});
	
	
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd' ,
		prevText: '���� ��' ,
		nextText: '���� ��',
        monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
        monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
        dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
        dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
        dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
        showMonthAfterYear: true,
        yearSuffix: '��'
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
	
/* 	var openWin;
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
		
	}) */
	
	//�ڽ�â���� �θ�â���� �� �����ϱ�
	function openChild()
	{
		window.name = "addMeetingView";
		
		window.open("/club/searchPlace.jsp", "searchPlace", "width = 1000, height = 500, top = 100, left = 200, location = no");
	}
	
	
	

</script>
</head>

<body>

	<jsp:include page="/toolbar.jsp"/>
	
	<form>
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">�� �� �� �� �� ��</h2>
					<p class="exTxt">������ �����غ�����...</p>
					<div class="join_form">
					
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						
						<tbody>
							<tr>
								<th><span>�� �� �� ��</span></th>
								<td>
									<textarea class="meetingTitle" id="meetingTitle" name="meetingTitle" maxlength="80" style="width: 280px; height: 50px;">${meeting.meetingTitle }</textarea>
								</td>
							</tr>
							
							<tr>
								<th><span>�� �� �� ¥</span></th>
								<td><input type="text" id="datepicker" name="meetingDate" placeholder="���ӳ�¥�� �ʼ��Դϴ�." style="height: 40px" autocomplete='off' value="${meeting.meetingDate}"></td>
							</tr>
							
							<tr>
								<th><span>�� �� �� ��</span></th>
								<td><input type="text" class="timepicker" id="timepicker" name="meetingTime" placeholder="���ӽð��� �ʼ��Դϴ�." style="height: 40px" autocomplete='off' value="${meeting.meetingTime}"></td>
							</tr>
							
							<tr>
								<th><span>�� �� �� ��</span></th>
								<td>
									<textarea class="meetingContent" id="meetingContent" name="meetingContent" maxlength="500" style="width: 280px; height: 200px;">${meeting.meetingContent}</textarea> 
								</td>
							</tr>
							
							<tr>
								<th><span>�� ��</span>
								<td>
									<textarea class="meetingMaximumMember" id="meetingMaximumMember" name="meetingMaximumMember" maxlength="50" style="width:80px; height: 40px;">${meeting.meetingMaximumMember}</textarea>
								</td>
							</tr>
							
							<tr>
								<th><span>�� �� �� ��</span></th>
								<td><input type="text" id="meetingPlace" name="meetingPlace" placeholder="������Ҵ� �ʼ��Դϴ�." autocomplete='off' value="${meeting.meetingPlace}" onclick="openChild()"></td>
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
		      		<button type="button" class="btn btn-updateMeeting" style="background-color:#f0f2f5; color:#BD76FF; border-color: #BD76FF; border-radius: 10px;">�� &nbsp;��</button>
					<button type="button" class="btn btn-cancel" style="background-color:#f0f2f5; color:#BD76FF; border-color: #BD76FF; border-radius: 10px;">��&nbsp;��</button>
			    </div>
			</div>
			

		
	</body>
</html>
		
		
		
		
			<%-- <div class="form-group">
				<label for="meetingTitle" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingTitle" name="meetingTitle" value="${meeting.meetingTitle}">
				</div>						
			</div>
			
			
		
			<div class="form-group">
				<label for="meetingDate" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ¥</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="meetingDate" name="meetingDate" value="${meeting.meetingDate}">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="meetingTime" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="meetingTime" name="meetingTime" value="${meeting.meetingTime}">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="meetingPlace" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingPlace" name="meetingPlace" value="${meeting.meetingPlace}">
				</div>		
			</div>			
			
			<div class="form-group">
				<label for="meetingContent" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingContent" name="meetingContent" value="${meeting.meetingContent}">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="meetingMaximumMember" class="col-sm-offset-1 col-sm-3 control-label"> �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingMaximumMember" name="meetingMaximumMember" value="${meeting.meetingMaximumMember}">
				</div>		
			</div> --%>
			
			
			
