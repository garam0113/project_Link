<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<title>���ӻ���ȸ</title>

	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<style>
	body {
		padding-top : 70px;
	}
	
	#btn_group button{
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	
	
	</style>
	
	<!-- ?? -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script type="text/javascript">
	
	function fncDeleteClub() {
		
		$("form").attr("method", "POST").attr("action", "/club/deleteClub")
			.submit();
	}
	
	$(function() {

		$("button.btn.btn-danger").on("click", function() {
			alert("������?");
			fncDeleteClub();
			
		});
	});
	
	$(function() {

		$("button.btn.btn-primary").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function() {

		$("button.btn.btn-warning").on("click", function() {
			self.location="/club/updateClubView.jsp"
		});
	});
	
	$(function() {

		$("button.btn.btn-success").on("click", function() {
			alert("�ȳ��ϼ���");
			self.location="/club/applyClub.jsp"
		});
	});
	
	
	
	
	</script>	

</head>


<body class="blog masonry-style">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

		<main role="main">
		
			<div id="intro-wrap" data-height="27.778"><!-- ��� ������ ���� ���� -->
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>CLUB</h2>
							<p>Make good memories with the members...</p>
						</div>
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
			
		
			<div id="main" class="row"><!-- �߰� �������� -->
			
				<div class="row-content buffer-left buffer-right buffer-bottom">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px;">
						<li data-group="advertising">
							<a href="/club/getMeetingList">���� ����</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList">���� �Խù�</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList">���ӿ�</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/chatRoomList">���� ä��</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">����</a>
						</li>
					</ul>
		
		
		
	
			
			
		<form class="form-horizontal" enctype="multipart/form-data">
		
		<div class="row">
			<div class="col-xs-4 col-md-6"><strong>�� �� �� ��</strong></div>
 			<div class="col-xs-8 col-md-4">${club.clubTitle}</div>
		</div>
		
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� �� �� �� ��</strong></div>
			<img src="/resources/image/uploadFiles/${club.clubImage}" width="300" height="300" name="file" id="clubImage">
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-6 "><strong>�� �� ī �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubCategory}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-6 "><strong>�� �� Ȱ �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${club.clubArea}</div>
		</div>
		
		
			<div class="form-group" id="btn_group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		
		      		<button type="button" class="btn btn-success">��&nbsp;��&nbsp;��&nbsp;û</button>
					<button type="button" class="btn btn-primary">��&nbsp;��</button>			
					<button type="button" class="btn btn-warning"  >��&nbsp;��</button>
					<button type="button" class="btn btn-danger"  >��&nbsp;��</button>
					
		    </div>
			</div>	
			</form>		
			</div>
	</div>
	
		</main>
</body>
</html>