<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<title>q&a 등록</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="../javascript/calendar.js"></script>

	
	<script type="text/javascript">
	
	//=====기존Code 주석 처리 후  jQuery 변경 ======//
	function fncAddNotice(){

		
	
		
		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/addQandA").submit();
	} //funtion AddNotice 끝
	

	$(function(){
				
		$("button:contains('등록')").bind("click", function(){
			
			fncAddNotice();
		});

		$("button:contains('뒤로')").bind("click", function(){
			
			history.go(-1);
		})
		
		
	});
	
	</script>

</head>

<body>


	<!-- form Start /////////////////////////////////////-->
	<div class="container">
		<div></div>
		<div class="page-header text-center">q&A 등록</div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="qandATitle" class="col-sm-offset-1 col-sm-3 control-label">제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="qandATitle" name="qandATitle">
		       <span id="helpBlock" class="help-block">
		      	
		      </span>
		    </div>
		    
		  </div>

		  <div class="form-group">
		    <label for="qandAContent" class="col-sm-offset-1 col-sm-3 control-label">내 용</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="qandAContent" name="qandAContent" >
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="qandAImage1" class="col-sm-offset-1 col-sm-3 control-label">이미지1</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="qandAImage1" name="qandAImage1" >
		    </div>
		  </div>	
		    <div class="form-group">
		    <label for="qandAImage2" class="col-sm-offset-1 col-sm-3 control-label">이미지2</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="qandAImage2" name="qandAImage2" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >등록</button>
			  <button type="button" class="btn btn-primary" >뒤로</button>
		    </div>
		  </div>
		</form>
		
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>