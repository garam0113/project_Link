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
	} //funtion  끝
	

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
		 <input type="hidden" id="userId" name="qandA.userId" value ="${SessionScope.user.userId}">
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

			<div class="col-sm-4">
				<input multiple="multiple" type="file" name="image"
					class="ct_input_g" style="width: 200px; height: 19px"
					maxLength="13" />

			</div>
			<span id="helpBlock" class="help-block"> <strong
				class="text-danger">사진은 2장까지 가능합니다.</strong>
			</span>
			
			<div class="form-group">
		    <label for="qandAOpenCondition" class="col-sm-offset-1 col-sm-3 control-label">공개여부</label>
		    <div class="col-sm-4">
		      <input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="0" >나만 보기
		      <input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="1">전체 보기
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