<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<title>���ӻ���ȸ</title>

<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- ?? -->
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script type="text/javascript">
	
	
	
	$(function () {
		
		$(document).on("click","#deleteClub", function() {
		
			Swal.fire({
				  title: '���� ������ �����Ͻðڽ��ϱ�?',
				  text: "������ ������ ������ �Ұ����մϴ�.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '����',
				  cancelButtonText: '���' ,
				}).then((result) => {
				  if (result.value) {
				    
				    $("form").attr("method", "POST").attr("action", "/club/deleteClub").submit();	    
				  }
				})
		})
	});
	$(function() {
		
		$("#club-add-approval").bind("click", function() {
			
			var totalApprovalConditionCount = $("input[name='totalApprovalConditionCount']").val();
			var joinClubLimit = $("input[name='joinClubLimit']").val();
			
			//alert(totalApprovalConditionCount);
			//alert(joinClubLimit);
			
			if(totalApprovalConditionCount < joinClubLimit) {
			//���â ����
			$('#club-add-approval-modal').modal("show");
			} else {
				
				Swal.fire({
					title: '���� �ִ� �ѵ� ���� �ʰ��Ͽ����ϴ�.' ,
					text: "������ ���� ���� �ѵ��� �ø� �� �ֽ��ϴ�." ,
					icon: 'warning',
					showCancelButton: false,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: 'Ȯ��',
				}).then((result) => {
					if(result.value){
					
						self.location="/clubPost/addPayView?payNavigation=1"
					}
				})
			}
		});
		
		$("input[value='��û']").bind("click", function() {
			
			if($.trim($("input[name='joinGreeting']").val()) == '' ){
				Swal.fire({
					icon: 'error' ,
					title: '������ �ʼ��Դϴ�'
				})
				return;
			}
			
			$("form").attr("accept-charset" , "EUC-KR").submit();
		});
		
		
		$("input[value='���']").bind("click", function() {
			
			//���â �ݱ�
			$('#club-add-approval-modal').modal("hide");
		});
		
		$("button[class='close']").bind("click", function() {
			$('#club-add-approval-modal').modal("hide");
		});
	});
	
	$(function() {
		$("#addMeeting").on("click", function() {
			self.location="/club/addMeetingView.jsp"
		});
	});
	
/* 	$(function() {
		$("#deleteClub").on("click", function() {
			fncDeleteClub();
		});
	}); */
	
	$(function() {
		$("#cancel").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function () {
		
		$(document).on("click","#deleteApprovalCondition", function() {
		
			Swal.fire({
				  title: '���� ������ Ż���Ͻðڽ��ϱ�?',
				  text: "Ż�� �� �ٽ� ���� ��û�� �ؾ��մϴ�",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '����',
				  cancelButtonText: '���' ,
				}).then((result) => {
				  if (result.value) {
				    
				    $("form").attr("method", "POST").attr("action", "/club/deleteApprovalCondition").submit();	    
				  }
				})
		})
	});
	
	
	
	$(function() {

		$("#updateClub").on("click", function() {
			self.location="/club/updateClubView?clubNo="+${ club.clubNo };

		});
	});
	
	$(function() {
		$(".homeBtn").on("click", function() {
			self.location="/club/getClub?clubNo=${clubNo}";
		});
	});
	
	$(function() {
		$(".clubPostBtn").on("click", function() {
			self.location="/clubPost/getClubPostList"
		});
	});
	
	$(function() {
		$(".clubMemberBtn").on("click", function() {
			self.location="/club/getClubMemberList"
		});
	});
		
	$(function() {
		$(".clubChatBtn").on("click", function() {
			self.location="/clubPost/chatRoomList?rommId=${club.roomId}&clubTitle=${club.clubTitle}&clubImage=${club.clubImage}";
		});
	});
		
	
	
	
 	$(function() {
		
		//alert("123");
/* 		var options = {
			"forcNew" : true
		}; */
		var url = "https://192.168.0.183:4000";

		socket = io.connect(url);

		socket.on("connect", function() {
			//alert("���Ͽ��� �Ϸ�");
		});
		
		$(".live").on("click", function() {
			var clubNo = $("#no").val();
			var clubTitle = $("#clubTitle").val();
			var profile = $("#profile").val();
			var nickName = $("#nickName").val();
			var num;
			console.log("profile : "+profile);
			console.log("nickName : "+nickName);
			
			$.ajax("/liveRest/json/getLiveList", {
				type : "POST",
				data : JSON.stringify({
					type : '2'
				}),
				dataType : "json",
				contentType : "application/json",
				headers : {
					"Accept" : "application/json"
				},
				success : function(Data) {
					console.log(Data);
					var roomName = "";
					$.each (Data, function(index, data) {
						roomName += "<div style='margin-top: 10px;' id='"+data.roomName+"'><span style='font-size: larger; font-weight: bold; color: black;'>"
						+(index+1)+". "+data.viewRoomName+"</span><span style='font-size: larger; font-weight: bold;" 
						+"color: black;'>("+data.member+"/"+data.limit+")</span><button type='button'" 
						+"class='joinLive' style=' margin-left: 20px;'><input type='hidden'"
						+"value='"+data.viewRoomName+"'/>����</button></div>";
					})
					swal.fire({
						title : clubTitle+"������ ä�ù�",
						showCancelButton : true,
						cancelButtonText : '���',
						confirmButtonText : 'ä�ù氳��',
						html: "<div id='roomNameList' style='text-align-last: left; margin-left: 70px;'></div>",
					}).then((result) => { 
						var viewName;
						if(result.isConfirmed){
						swal.fire({
							title : "ä�ù氳��",
							html : "<input type='text' id='roomName' class='swal2-input' placeholder='������'>" +
							"<input type='text' id='total' class='swal2-input' placeholder='�ο���'>",
							showCancelButton : true,
							cancelButtonText : '���',
							confirmButtonText : '����',
							preConfirm : () => {
								var total = Swal.getPopup().querySelector('#total').value
								var roomName = Swal.getPopup().querySelector('#roomName').value
							$.ajax("/liveRest/json/addLive", {
						 		type : "POST",
								data : JSON.stringify({
									roomName : clubNo+"_"+clubTitle+":"+roomName,
									type : '2',
									limit : total
								}),
								dataType : "json",
								contentType : "application/json",
								headers : {
									"Accept" : "application/json"
								}, 
								success : function(json) {
									console.log(json);
									var name = clubNo+"_"+clubTitle+":"+roomName;
									socket.emit("info", {
										roomName : name,
										viewName : roomName,
										total : total,
										profile : profile,
										nickName : nickName,
										member : 1
										});
									self.location = "https://192.168.0.183:4040";
								}
							}) 
						}
					})
						}
					})
					$("#roomNameList").append(roomName);
					
					$("button.joinLive").on("click", function() {
						//alert("asdf");
						var roomName = $(this).parent().attr("id");
						var viewName = $(this).children().val();
						console.log(roomName);
						$.ajax("/liveRest/json/getLive",{
							method : "POST",
							data : JSON.stringify({
								roomName : roomName,
								type : '2'
							}),
							dataType : "json",
							contentType : "application/json",
							headers : {
								"Accept" : "application/json"
							},
							success : function (data) {
								console.log(data);
								socket.emit("info", {
									total : data.limit,
									roomName : roomName,
									viewName : viewName,
									profile : profile,
									nickName : nickName,
									member : data.member
								});
								self.location = "https://192.168.0.183:4040";
							}
						})
					})
				} 
			})
		})
		
		socket.on("reRoomName", function(data) {
			console.log("socket�������� ���� Data : "+data);
			if(data != null){
			$.ajax("/liveRest/json/exitLive", {
				method : "POST",
				data : JSON.stringify({
					roomName : data,
					type : '2'
				}),
				dataType : "json",
				contentType : "application/json",
				headers : {
					"Accept" : "application/json"
				},
				success : function(Data) {
					console.log(Data);
				}
			})
			}
		})
		
	})
	

	
	</script>

	<style>
		body {
			padding-top: 70px;
		}
		
		#main {
			background-color: #f0f2f5 !important;
		}
		
		main {
			background-color: #f0f2f5 !important;
		}
		
		.plain.button.red.cancel{
		   background-color: white;
		   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
		   border-radius: 10px;
		   margin: 1rem;
		   padding: 5px;
		   width: 75px !important;
		   color: #5F0080 !important;
		   font-size: 16px !important;
		   text-align: center;
		   border: solid 2px;
		}
		
		.plain.button.red.cancel:hover{
		   background-color: #5F0080;
		   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
		   border-radius: 10px;
		   margin: 1rem;
		   padding: 5px;
		   width: 75px !important;
		   color: white !important;
		   font-size: 16px !important;
		}
		
		.darkover {
			position: sticky;
			top: auto;
			bottom: 0;
			left: 0;
			background: rgba(0, 0, 0, 0.35);
		}
		
		.club-wrap {
			width: 100%;
			margin: 10px auto;
			position: relative;
		}
		
		.club-wrap img {
			width: 100%;
			vertical-align: middle;
			filter: brightness(1.1);
			/* margin-left: 450px; */
			/* margin-top: -23px;
			height: 0%; */
		}
	
		.row-content.buffer, .row-content.buffer-left {
			padding-left: 0% !important;
		}
		
		.row-content.buffer, .row-content.buffer-right {
			padding-right: 0% !important;
		}
		
		row-content.buffer, .row-content.buffer-bottom {
			padding-bottom: 10% !important;
		}
		
		element.style {
			margin-bottom: 100px !important;
		}
		
		
		.modal { 
			position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.2); top:0; left:0; display:none; margin-top: 350px;
		}
			
		.modal_content{
			width:400px; height:200px;
			background:#fff; border-radius:10px;
			position:relative; top:50%; left:50%;
			margin-top:-100px; margin-left:-200px;
			text-align:center;
			box-sizing:border-box; padding:74px 0;
			line-height:23px; cursor:pointer;
		}
		
		.modal-backdrop {
			position: static !important;
		
		}
		
		a {
			/* color: #333 !important; */
		}
		
		
	</style>



</head>


<body class="blog masonry-style" style="background: #EBEDF0;">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<main role="main">

		<div id="intro-wrap" data-height="17.35">
			<!-- ��� ������ ���� ���� -->
			<div id="intro" class="preload darken">
				<!-- <div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);"> -->
				<div class="intro-item">

					<div class="club-wrap">

						<div class="club-image">
							<a href="/club/getClub?clubNo=${clubNo}"><img
								src="/resources/image/uploadFiles/${club.clubImage}"
								width="800" height="300" name="file" id="clubImage"></a>
						</div>
						</div>
					</div>
				</div>
				<!-- intro -->
			</div>
		<!-- intro-wrap -->
		
			<div id="main" class="row"><!-- �߰� �������� -->
				<div class="row-content buffer-left buffer-right buffer-bottom">
					<div class="homeBtn_group">
						<button type="button" class="homeBtn" style="margin-top: 17px;">
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span> 
						</button>
						
						<button type="button" class="clubPostBtn">
							<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="clubMemberBtn">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="clubChatBtn">
							<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="live">
							 <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span> 
						</button>
					</div>					
		

				<div class="mainForm" style="display: inline-flex;">
					<!-- Ŭ���� -->
					<div>
						<form class="form-horizontal" enctype="multipart/form-data" style="width: 470px; background-color: #ffffff; margin-right: 100px; margin-top: 74px; border-radius: 10px; heigth: 90%;">

							<div class="col-xs 6 col-md-6" style="display: contents;">
								<div class="row">
									<div class="col-xs-4 col-md-6" style="margin-left: 10px;">
										<strong>��������</strong>
									</div>
									<div class="col" style="margin-left: 30px;">${club.clubTitle}</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-xs-4 col-md-6 " style="margin-left: 10px;">
										<strong>���Ӽ���</strong>
									</div>
									<div class="col" style="margin-left: 30px; height: 100px;">${club.clubDetail}</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-xs-4 col-md-6 " style="margin-left: 10px;">
										<strong>ī�װ�</strong>
									</div>
									<div class="col-xs-8 col-md-4" style="margin-left: 15px;">${club.clubCategory}</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-xs-4 col-md-6 " style="margin-left: 10px;">
										<strong>Ȱ������</strong>
									</div>
									<div class="col-xs-8 col-md-4" style="margin-left: 15px;">${club.clubArea}</div>
								</div>

								<hr />

								<div class="row"> 
									<div class="col-s-4 col-md-6 " style="margin-left: 10px;">
										<strong>���ӿ� ��</strong>
									</div>
									<div class="col-xs-8 col-md-4" style="margin-left: 15px;">${clubMemberCount}/${club.clubMaxMember}</div>
								</div>

							</div>

						</form>

					</div>
					<!-- Ŭ���� -->

					<!-- �޷¿��� -->
					<div class="calendarArea">

						<jsp:include page="/club/calendar.jsp" />

					</div>
					<!-- �޷� ���� -->
				</div>
					<button type="button" class="plain button red cancel" id="addMeeting" style="margin-top: 80px; margin-left: 860px;">��������</button>
				</div>
				
				<div class="form-group" id="btn_group">
					<!-- <button type="button" class="joinLi"></button> -->
				<div class="col-sm-offset-4  col-sm-4 text-center" style="margin-top: -140px;">
		      		
		      		<button type="button" class="plain button red cancel" id="club-add-approval">���Խ�û</button>
					<button type="button" class="plain button red cancel" id="cancel">��&nbsp;��</button>
					
				<c:if test="${ fn:trim(sessionScope.user.userId) != fn:trim(club.user.userId) }">	
					<button type="button" class="plain button red cancel" id="deleteApprovalCondition">Ż��</button>
				</c:if>					
				<c:if test="${ fn:trim(sessionScope.user.userId) == fn:trim(club.user.userId) }">				
					<button type="button" class="plain button red cancel" id="updateClub">��&nbsp;��</button>
					<button type="button" class="plain button red cancel" id="deleteClub">��&nbsp;��</button>
				</c:if>
				
				</div>
		    </div>
				
				
			
			<!-- ��޿��� -->
			<div class="modal fade" id="club-add-approval-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document" style="margin-top: 150px; top: 200px;">
					<div class="modal-content" style="height: 300px; width: 440px;">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							</button>
							<h3 class="modal-title" id="exampleModalLabel">���Խ�û</h3>
						</div>
					<div class="club-add-approval-view">
						<form name="addApprovalCondition" method="post" action="/club/addApprovalCondition" enctype=multipart/form-data>
							<input type="hidden" name="clubNo" value="${ clubNo }">
							<input type="hidden" name="roomId" value="${ club.roomId }">
							<div class="clubJoinGreeting">
								<input type="text" name="joinGreeting" placeholder="�����λ縦 �ۼ����ּ���" style="margin-top: 10px; margin-left: 10px; height: 130px; width: 365px;">
							</div>
							<div class="modalBtn" style="margin-top: -20px; margin-left: 98px;">
							<input type="button" class="plain button red cancel" value="��û">
							<input type="button" class="plain button red cancel" value="���">
							</div>
						</form>
					</div>
					</div>
				</div>
			
			</div>
			
			<input type="hidden" id="totalApprovalConditionCount" name="totalApprovalConditionCount" value="${totalApprovalConditionCount}">
			<input type="hidden" id="joinClubLimit" name="joinClubLimit" value="${sessionScope.user.joinClubLimit}">
		
		
					<input type="hidden" id="clubTitle" value="${club.clubTitle}">
					<input type="hidden" id="nickName" value="${sessionScope.user.nickName }">
					<input type="hidden" id="profile" value="${sessionScope.user.profileImage }">
					<input type="hidden" id="no" value="${clubNo}">
					<input type="hidden" id="total" value="${clubMemberCount}">
			</div>	
	</main>
	<script src="https://192.168.0.183:4000/socket.io/socket.io.js"></script>
</body>
</html>