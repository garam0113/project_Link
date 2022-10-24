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

  window.onload=function() {
	var calendarId = $("#CalendarId").val();
	var result_var = null;	
	
	console.log(calendarId);
	
	$.ajax({
		url : "/clubRest/json/getMeetList", // 어디로 갈거니? // 갈 때 데이터
		type : "POST", // 타입은 뭘 쓸거니?
		datatype : "json",
		 data		:  JSON.stringify({searchKeyword:calendarId}),
		contentType : "application/json",
		success : function(JSONData, status) { 
			   	
	              result_val = new Array;		
				  console.log(result_val);
		 
				$.each(JSONData, function(index, item) { // 데이터 =item
				    
					//alert(item);
					console.log(item);
                    result_val.push(item);                      
				
				});
			    
			 	var calendarEl = document.getElementById('calendar');
			    var calendar = new FullCalendar.Calendar(calendarEl, {
			      initialView: 'dayGridMonth',
			      headerToolbar: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek,timeGridDay'
			      },
			      
			      events:  result_val
			    
			    
			    });
			  
			    calendar.render();
		
		}, 
		
		
			/* 	var calendarEl = document.getElementById('calendar');
			    var calendar = new FullCalendar.Calendar(calendarEl, {
			      initialView: 'dayGridMonth',
			      headerToolbar: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek,timeGridDay'
			      },
			      
			      events:  result_val
			    
			    
			    });
			  
			    calendar.render();
		
		},
		
		customButtons: {
			add_event: {
				text: '일정추가',
				click: function(){
					$('#writeModal').show();
					
					$("#frm").submit(function() {
						$.ajax({
							url: "/club/addMeetingView.jsp" ,
							type: "post" ,
							dataType : "json" ,
							data: $(this).serializeArray(),
							success:function(res){
								calendar.addEvent({
									title: res.title ,
									start: res.startDay,
									end: res.endDay,
									allDay: true
								});
								alert('일정이 추가되었습니다!');
							},
							error: function(xhr, status, error) {
								alert(status+","+error);
							}
						});
					});
				}
				
			}
		}
 */		
		
		error : function(){
		
			var calendarEl = document.getElementById('calendar');
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      initialView: 'dayGridMonth',
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay'
		      },
		             	     	  
		    
		    });
		  
		    calendar.render();
			
			
		}
		
	});
		
  };
	


	 

 
</script>

<input type="hidden" name="CalendarId" id="CalendarId" value="${club.clubNo}">





</body>
</html>