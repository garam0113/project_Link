<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script type="text/javascript">
/*window.onload=function() {
		var meetingNo = $("#meetingNo").val();
		console.log("dd"+$("#meetingNo").val());
		
		$.ajax({
			url : "/myHomeRest/json/getMeetingMemberList", // 어디로 갈거니? // 갈 때 데이터
			type : "POST", // 타입은 뭘 쓸거니?
			datatype : "json",
			 data		:  JSON.stringify({searchKeyword:userId}),
			contentType : "application/json",
			success : function(data) { // 갔다온 다음 결과값
					// 나오면 파일을 찾았다는 것
			//	alert(data);  // [object Object],[object Object],[object Object]
				
			// 데이터를 확인하고 싶을 때.
			//	let str = JSON.stringify(data); // <> parse()
			//	alert(str); 
           console.log(data.list[0].meetingNo);
				$.each(data.list, function(index, item) { // 데이터 =item
					var value = item.meetingNo;
					      
					
				
				});
			},
			error : function() {
				alert('error');			
			}
			
		});
		
		
	};*/

</script>
</head>
<body>
<div id='calendar'></div>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		headerToolbar : { // 헤더에 표시할 툴 바
			start : 'prev next today',
			center : 'title',
			end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		 events: [
			    { // this object will be "parsed" into an Event Object
			      title: meetingNo, // 제목
			      start: '2022-10-01', // 시작일자
			
			    }
			  ],

		titleFormat : function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		selectable : true, // 달력 일자 드래그 설정가능
		droppable : true,
		editable : true,
		nowIndicator: true, // 현재 시간 마크
		locale: 'ko' // 한국어 설정
	});
	calendar.render();
});


</script>
<input type="hidden" name="meetingNo" id="meetingNo" value="${participant.meetingNo}">



</body>
</html>