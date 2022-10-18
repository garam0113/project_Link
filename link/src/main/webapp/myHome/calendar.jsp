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


</script>
</head>
<body>
<div id='calendar'></div>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth', // �ʱ� �ε� �ɶ� ���̴� Ķ���� ȭ��(�⺻ ����: ��)
		headerToolbar : { // ����� ǥ���� �� ��
			start : 'prev next today',
			center : 'title',
			end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		 events: [
			    { // this object will be "parsed" into an Event Object
			      title: 'title', // ����
			      start: '2022-10-01', // ��������
			
			    }
			  ],

		titleFormat : function(date) {
			return date.date.year + '�� ' + (parseInt(date.date.month) + 1) + '��';
		},
		//initialDate: '2021-07-15', // �ʱ� ��¥ ���� (�������� ������ ���� ��¥�� ���δ�.)
		selectable : true, // �޷� ���� �巡�� ��������
		droppable : true,
		editable : true,
		nowIndicator: true, // ���� �ð� ��ũ
		locale: 'ko' // �ѱ��� ����
	});
	calendar.render();
});
window.onload=function() {
	var userId = $("#userId").val();
	console.log(userId);
	$.ajax({
		url : "/myHomeRest/json/getMeetingMemberList", // ���� ���Ŵ�? // �� �� ������
		type : "POST", // Ÿ���� �� ���Ŵ�?
		datatype : "json",
		 data		:  JSON.stringify({searchKeyword:userId}),
		contentType : "application/json",
		success : function(data) { 
				console.log(data);
		
       				$.each(data, function(index, item) { // ������ =item
				var value = item.meetingNo;
				      
				
			
			});
		},
		error : function() {
			alert('error');			
		}
		
	});
	
	
};

</script>
<input type="hidden" name="userId" id="userId" value="${user.userId}">



</body>
</html>