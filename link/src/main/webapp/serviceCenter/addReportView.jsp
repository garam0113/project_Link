<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<title>�Ű� ���</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="../javascript/calendar.js"></script>

	
	<script type="text/javascript">
	

	function fncAddReport(){
		
		var title = $("input[name=title]").val();		
		var content =$("input[name=content]").val();			
		var checkbox = $("input:checkbox[name=reportReason]:checked").length;
		
		
		
		if(title == null || title.length <1){
				alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
		if(content == null || content.length <1){
				alert("������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
				
		if(checkbox==0){
			alert("�Ű���� �ϳ��� �������ּ���");
			return;
		}
		
		var sum = 0;
	
		for(var i =0 ; i<checkbox; i++){
			var sum2 = parseInt($("input:checkbox[name=reportReason]:checked").val());
			sum += sum+parseInt(sum2);
		}
			
	alert(sum);			
						
		
						
	 	$.ajax({
		url  : "/serviceCenterRest/json/addReport",
		contentType: 'application/json',
		method : "POST",
		dataType: "json",
		data : JSON.stringify ({
			"title":$("#title").val(),
			"content":$("#content").val(),
			"reportImage1":$("#reportImage1").val(),
			"reportImage2":$("#reportImage2").val(),
			"user2":$("#user2").val(),
			"reportSource":$("#reportSource").val(),
			"reportReason": sum,
			"type": $("#type").val()
	
		
		}),
			
		})<!-- ajax ( ReportAdd) �� --> 
		
		
		
		
		
	} //funtion ��
	

	$(function(){

		$("button:contains('���')").bind("click", function(){
		
			fncAddReport();
			
		})
		$("button:contains('�ڷ�')").bind("click", function(){
			
			history.go(-1);
		})
		
		
		
	});
	
	</script>

</head>

<body>


	<!-- form Start /////////////////////////////////////-->
	<div class="container">
		<div></div>
		<div class="page-header text-center">�Ű� ���</div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		   <input type="hidden" name="type" id="type" value="1">
		   <input type="hidden" name="clubPostNo" id="clubPostNo" value="clubPostNo">
		   <input type="hidden" name="clubPostCommentNo" id="clubPostCommentNo" value="clubPostCommentNo">
		   <input type="hidden" name="feed" id="feed" value="feed">
		   <input type="hidden" name="feedComment" id="feedComment" value="feedCommet">
		  <div class="form-group">
		    <label for="title" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="title" name="title" value="title">
		       <span id="helpBlock" class="help-block">
		      	
		      </span>
		    </div>
		    
		  </div>

		  <div class="form-group">
		    <label for="content" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="content" name="content" value="content" >
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="reportImage1" class="col-sm-offset-1 col-sm-3 control-label">�̹���1</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="reportImage1" name="reportImage1" value="reportImage1">
		    </div>
		  </div>
		  	
		    <div class="form-group">
		    <label for="reportImage2" class="col-sm-offset-1 col-sm-3 control-label">�̹���2</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="reportImage2" name="reportImage2" value="reportImage2">
		    </div>
		  </div>
		  
		  
		  	 <div class="form-group">
		    <label for="user2.userId" class="col-sm-offset-1 col-sm-3 control-label">�Ű�޴»��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="user2" name="user2" value="${user02}" readonly/>
		    </div>
		  </div>
		  
		  	<div class="form-group">
		    <label for="reportSource" class="col-sm-offset-1 col-sm-3 control-label">�Ű���ó</label>
		    <div class="col-sm-4">
		    	<c:if test="${reportSource== '1'}">
		      <input type="text" class="form-control" id="reportSource" name="reportSource" value="${reportSource}" readonly/>���ӰԽù�
		     	</c:if>
		    	<c:if test="${reportSource=='2'}">
		      <input type="text" class="form-control" id="reportSource" name="reportSource" value="${reportSource}" readonly/>���ӰԽù����
		     	</c:if>
		     	<c:if test="${reportSource=='3'}">
		      <input type="text" class="form-control" id="reportSource" name="reportSource" value="${reportSource}" readonly/>�ǵ�
		     	</c:if>
		     	<c:if test="${reportSource=='4'}">
		      <input type="text" class="form-control" id="reportSource" name="reportSource" value="${reportSource}" readonly/>�ǵ���
		     	</c:if>
		     	
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="Reason" class="col-sm-offset-1 col-sm-3 control-label">�Ű� ����</label>
		    <div class="col-sm-4" id="Reason">
		        
		      �弳<input type="checkbox"  id="�弳" name="reportReason" value="1" >
		      ����<input type="checkbox"  id="����" name="reportReason" value="2" >
		      ��Ÿ<input type="checkbox"  id="��Ÿ" name="reportReason" value="4" >
		      ����<input type="checkbox"  id="����" name="reportReason" value="8" >
		      
		    </div>
		  </div>
		  

		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >���</button>
			  <button type="button" class="btn btn-primary" >�ڷ�</button>
		    </div>
		  </div>
		</form>
		
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>