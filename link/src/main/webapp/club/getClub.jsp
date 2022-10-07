<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<title>모임상세조회</title>

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
			alert("모임을 삭제하시겠습니까?");
			deleteClub();
			
		});
	});
	
	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function() {

		$("button.btn.btn-waring").on("click", function() {
			self.location="/club/updateClubView.jsp"
		});
	});
	
	
	
	</script>	

</head>

<body>
		
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">모임상세조회</h3>
	    </div>
	
	
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>모 임 번 호</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>모 임 제 목</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubTitle}</div>		
		</div>
			
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모 임 설 명</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모 임 이 미 지</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubImage}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모 임 카 테 고 리</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubCategory}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모 임 활 동 영 역</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubArea}</div>
		</div>
		
		
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >삭&nbsp;제</button>
					<a class="btn btn-primary btn" href="#" role="button">이&nbsp;전</a>
					<button type="button" class="btn btn-waring"  >수&nbsp;정</button>
					
		    </div>
			</div>			
	</div>
</body>
</html>