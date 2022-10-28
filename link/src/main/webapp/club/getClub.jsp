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
	<script src="https://192.168.0.183:4000/socket.io/socket.io.js"></script>
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<style>
	body {
		padding-top : 70px;
	}
	
	#main {
		background-color: #f0f2f5 !important;
	}
	
	main {
		background-color: #f0f2f5 !important;
	}
	
	#btn_group button{
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
		color: #BD76FF;
    	border-color: #BD76FF;
    	background-color: #f0f2f5;
	}
	a {
    	color: #bd76ff;
    	text-decoration: underline;
	}
	
	.darkover {
    position: sticky;
    top: auto;
    bottom: 0;
    left: 0;
    background: rgba(0,0,0,0.35);
	}
	
	.club-wrap {
			width : 100%;
			margin: 10px auto;
			position: relative;
	}
	
	.club-wrap img {
			width: 100%;
			vertical-align: middle;
			filter: brightness(1.1);
	}
	
	.club-text {
			
			position: absolute;
			top: 50%;
			left: 50%;
			width: 100%;
			transform: translate(-50%, -50%);
			font-size: 20px;
			text-align: center;
			
	}
	
	.h2-color {
		color: yellow;
	}
	
	.p-color {
		color: yellow;
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

		$("button.btn.btn-delete").on("click", function() {
			alert("������?");
			fncDeleteClub();
			
		});
	});
	
	$(function() {

		$("button.btn.btn-cancel").bind("click", function() {
			history.go(-1);
		});
	});
	
	//�˾� ����
	var openWin;
	function popup() {
		var url = "/club/applyClub.jsp";
		var name = "applyClub";
		var option = "width = 500, height = 350, top = 50, left = 50, location = no, scrollbars = no"
		
		openWin = window.open(url, name, option);
	} 
	
	$(function() {

		$("button.btn.btn-update").on("click", function() {
			self.location="/club/updateClubView?clubNo="+${ club.clubNo };

		});
	});
	
	$(function() {
		$("button.btn.btn-addApproval").on("click", function() {
			self.location="/club/applyClub.jsp"
			//popup();
		});
	}); 
	
	$(function() {
		var options = {
				"forcNew" : true
		};
		var url = "https://192.168.0.183:4000";
		
		socket = io.connect(url, options);
		
		socket.on("connect", function() {
			//alert("���Ͽ��� �Ϸ�");
		});
		
		$(".live").on("click", function() {
			console.log($("#addName").val());
			console.log($("#total").val());
			console.log($("#nickName").val());
			console.log($("#profile").val());
			if(socket == undefined){
			//	alert("������ ����Ǿ� ���� �ʽ��ϴ�.");
				return;
			}
			socket.emit("name", $("#addName").val());
			socket.emit("total", $("#total").val());
			socket.emit("nickName", $("#nickName").val());
			socket.emit("profile", $("#profile").val());
			$("form").attr("method", "POST").attr("action", "/live/addLive").submit();
		})
	})

	
	  
	
	</script>	 

</head>


<body class="blog masonry-style">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

		<main role="main">
		
			<div id="intro-wrap" data-height="17.35"><!-- ��� ������ ���� ���� -->
				<div id="intro" class="preload darken">					
					<!-- <div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);"> -->
					<div class="intro-item">
					
						<div class="club-wrap">
						
							<div class="club-image">
								<a href="/club/getClub?clubNo=${clubNo}"><img src="/resources/image/uploadFiles/${club.clubImage}" width="1500" height="300" name="file" id="clubImage"></a>
							</div>
							
							<div class="club-text">
							<h2 class="h2-color"><a href="/club/getClub?clubNo=${clubNo}"></a>CLUB</h2>
							<p class="p-color">Make good memories with the members...</p>
							</div>							
						</div>
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
			
		
			<div id="main" class="row"><!-- �߰� �������� -->
			
				<div class="row-content buffer-left buffer-right buffer-bottom">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px; margin-left: 176px;">
						<li data-group="advertising">
							<a href="/club/getMeetingList" style="color: #BD76FF;">��������</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList" style="color: #BD76FF;">���ӰԽù�</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList" style="color: #BD76FF;">���ӿ�</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/chatRoomList" style="color: #BD76FF;">����ä��</a>
						</li>
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">����</a>
						</li> --%>
					</ul>
		
		<button type="button" class="live">���� ȭ��ä��</button>
			
			
		<form class="form-horizontal" enctype="multipart/form-data">
		
		<div class="row">
			<div class="col-xs-4 col-md-6"><strong>�� �� �� ��</strong></div>
 			<div class="col-xs-8 col-md-4">${club.clubTitle}</div>
		</div>
		
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� �� �� ��</strong></div>
			<div class="col-xs-8 col-md-8">${club.clubDetail}</div>
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
		
		<hr/>
		
		<div class="row">
			<div class="col-s-4 col-md-6 "><strong>���ӿ� ��</strong></div>
			<div class="col-xs-8 col-md-4">${clubMemberCount}/${club.clubMaxMember}</div>
		</div>
		
		
			<div class="form-group" id="btn_group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		
		      		<button type="button" class="btn btn-addApproval">��&nbsp;��&nbsp;��&nbsp;û</button>
					<button type="button" class="btn btn-cancel">��&nbsp;��</button>			
					<button type="button" class="btn btn-update"  >��&nbsp;��</button>
					<!-- ����� ���� ���� ��ư -->
					<!-- <button type="button" class="btn btn-default" id="openModalBtn" data-togle="modal" data-target="#exampleModal" data-whatever="@mdo">��&nbsp;��</button> -->
				
					<button type="button" class="btn btn-delete"  >��&nbsp;��</button>
					
					<!-- ��� ���� -->
		<%-- 			<div id="exampleModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class = "modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
									<h4 class="modal-title" id="exampleModalLabel">���� ����</h4>
								</div>
								
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label for="recipient-name" class="control-label">���� ����</label>
											<input type="text" class="form-control" id="clubTitle" value="${club.clubTitle}">
										</div>
										
										<div class="form-group">
											
										</div>
									</form>
									
								</div>
								
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">�� ��</button>
									<button type="button" class="btn btn-default" id="closeModalBtn">���</button>
								</div> 
							</div>
						</div>
					</div>	 --%>	
					
					
						<input type="hidden" id="addName" value="${clubNo}${club.clubTitle}">
						<input type="hidden" id="total" value="${clubMemberCount}">
						<input type="hidden" id="nickName" value="${user.nickName }">
						<input type="hidden" id="profile" value="${user.profileImage }">
		    </div>
			</div>	
			</form>		
			</div>
	</div>
	
		</main>
</body>
</html>