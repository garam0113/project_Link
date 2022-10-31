<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<title>모임상세조회</title>

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
	
	function fncDeleteClub() {
		Swal.fire({
			  title: '정말 모임을 삭제하시겠습니까?',
			  text: "삭제한 모임은 복구가 불가능합니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'delete'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      'Deleted!',
			      'Your file has been deleted.',
			      'success'
			    )
			    $("form").attr("method", "POST").attr("action", "/club/deleteClub")
				.submit();	    
			  }
			})
	}
	
	$(function() {
		
		$("#club-add-approval").bind("click", function() {
			//모달창 열기
			$('#club-add-approval-modal').modal("show");
		});
		
		$("input[value='신청']").bind("click", function() {
			
			$("form").attr("accept-charset" , "EUC-KR").submit();
		});
		
		$("input[value='취소']").bind("click", function() {
			
			//모달창 닫기
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
	
	$(function() {
		$("#deleteClub").on("click", function() {
			fncDeleteClub();
		});
	});
	
	$(function() {
		$("#cancel").bind("click", function() {
			history.go(-1);
		});
	});
	
	//팝업 띄우기
	var openWin;
	function popup() {
		var url = "/club/applyClub.jsp";
		var name = "applyClub";
		var option = "width = 500, height = 350, top = 50, left = 50, location = no, scrollbars = no"
		
		openWin = window.open(url, name, option);
	} 
	
	$(function() {

		$("#updateClub").on("click", function() {
			self.location="/club/updateClubView?clubNo="+${ club.clubNo };

		});
	});
	
	$(function() {
		$("#addApproval").on("click", function() {
			popup();
		});
	}); 
	
 	$(function() {
		
		//alert("123");
		var options = {
			"forcNew" : true
		};
		var url = "https://192.168.0.183:4000";

		socket = io.connect(url, options);

		socket.on("connect", function() {
			alert("소켓연결 완료");
		});
		
		$(".live").on("click", function() {
			var clubNo = $("#no").val();
			var clubTitle = $("#clubTitle").val();
			var profile = $("#profile").val();
			var nickName = $("#nickName").val();
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
						+"value='"+data.viewRoomName+"'/>입장</button></div>";
					})
					swal.fire({
						title : clubTitle+"모임의 채팅방",
						showCancelButton : true,
						cancelButtonText : '취소',
						confirmButtonText : '채팅방개설',
						html: "<div id='roomNameList' style='text-align-last: left; margin-left: 70px;'></div>",
					}).then((result) => { 
						var viewName;
						if(result.isConfirmed){
						swal.fire({
							title : "채팅방개설",
							html : "<input type='text' id='roomName' class='swal2-input' placeholder='방제목'>" +
							"<input type='text' id='total' class='swal2-input' placeholder='인원수'>",
							showCancelButton : true,
							cancelButtonText : '취소',
							confirmButtonText : '개설',
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
										nickName : nickName
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
									roomName : roomName,
									viewName : viewName,
									profile : profile,
									nickName : nickName
								});
								self.location = "https://192.168.0.183:4040";
							}
						})
					})
				} 
			})
		})
		
		socket.on("reRoomName", function(data) {
			console.log("socket서버에서 받은 Data : "+data);
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
		   padding: 0px;
		   width: 65px !important;
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
		   padding: 0px;
		   width: 65px !important;
		   color: white !important;
		   font-size: 16px !important;
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
			position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.2); top:0; left:0; display:none;
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
		
		
		
		
	</style>



</head>


<body class="blog masonry-style">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<main role="main">

		<div id="intro-wrap" data-height="17.35">
			<!-- 상단 검은색 공통 영역 -->
			<div id="intro" class="preload darken">
				<!-- <div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);"> -->
				<div class="intro-item">

					<div class="club-wrap">

						<div class="club-image">
							<a href="/club/getClub?clubNo=${clubNo}"><img
								src="/resources/image/uploadFiles/${club.clubImage}"
								width="1500" height="300" name="file" id="clubImage"></a>
						</div>

						<div class="club-text">
							<h2 class="h2-color">
								<a href="/club/getClub?clubNo=${clubNo}"></a>CLUB
							</h2>
							<p class="p-color">Make good memories with the members...</p>
						</div>
					</div>
				</div>
			</div>
			<!-- intro -->
		</div>
		<!-- intro-wrap -->
		
			<div id="main" class="row"><!-- 중간 개별영역 -->
				<div class="row-content buffer-left buffer-right buffer-bottom">
					<ul class="inline cats filter-options" style="font-size: 40px; margin-left: 310px;">
						<li data-group="advertising">
							<a href="/club/getClub?clubNo=${clubNo }" style="color: #BD76FF;">모임</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList" style="color: #BD76FF;">모임게시물</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList" style="color: #BD76FF;">모임원</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/chatRoomList?roomId=${ club.roomId }" style="color: #BD76FF;">모임채팅</a>
						</li>
					</ul>
		
				<button type="button" class="live">모임 화상채팅</button>


				<div class="mainForm" style="display: inline-flex;">
					<!-- 클럽상세 -->
					<div>
						<form class="form-horizontal" enctype="multipart/form-data"
							style="width: 443px;">

							<div class="col-xs 6 col-md-6" style="display: contents;">
								<div class="row">
									<div class="col-xs-4 col-md-6">
										<strong>모 임 제 목</strong> <button type="button" class="plain button red cancel" id="club-add-approval">가신2</button>
									</div>
									<div class="col-xs-8 col-md-4">${club.clubTitle}</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-xs-4 col-md-6 ">
										<strong>모 임 설 명</strong>
									</div>
									<div class="col-xs-8 col-md-8">${club.clubDetail}</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-xs-4 col-md-6 ">
										<strong>모 임 카 테 고 리</strong>
									</div>
									<div class="col-xs-8 col-md-4">${club.clubCategory}</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-xs-4 col-md-6 ">
										<strong>모 임 활 동 영 역</strong>
									</div>
									<div class="col-xs-8 col-md-4">${club.clubArea}</div>
								</div>

								<hr />

								<div class="row"> 
									<div class="col-s-4 col-md-6 ">
										<strong>모임원 수</strong>
									</div>
									<div class="col-xs-8 col-md-4">${clubMemberCount}/${club.clubMaxMember}</div>
								</div>

							</div>

						</form>

					</div>
					<!-- 클럽상세 -->

					<!-- 달력영역 -->
					<div class="calendarArea">

						<jsp:include page="/club/calendar.jsp" />

					</div>
					<!-- 달력 영역 -->
				</div>
					<button type="button" class="plain button red cancel" id="addMeeting" style="margin-top: 134px; margin-left: 877px;">일정생성</button>
				</div>
				
			
			<!-- 모달영역 -->
			<div class="modal fade" id="club-add-approval-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							</button>
							<h3 class="modal-title" id="exampleModalLabel">가입신청</h3>
						</div>
					<div class="club-add-approval-view">
						<form name="addApprovalCondition" method="post" action="/club/addApprovalCondition" enctype=multipart/form-data>
							<input type="hidden" name="clubNo" value="${ clubNo }">
							<input type="hidden" name="roomId" value="${ club.roomId }">
							<div class="clubJoinGreeting">
								<input type="text" name="joinGreeting" placeholder="가입인사를 작성해주세요">
							</div>
							<input type="button" class="plain button red cancel" value="신청">
							<input type="button" class="plain button red cancel" value="취소">
						</form>
					</div>
					</div>
				</div>
			
			</div>
		
		
					<input type="hidden" id="clubTitle" value="${club.clubTitle}">
					<input type="hidden" id="nickName" value="${sessionScope.user.nickName }">
					<input type="hidden" id="profile" value="${sessionScope.user.profileImage }">
					<input type="hidden" id="no" value="${clubNo}">
					<input type="hidden" id="total" value="${clubMemberCount}">
			<div class="form-group" id="btn_group">

					<!-- <button type="button" class="joinLi"></button> -->
				<div class="col-sm-offset-4  col-sm-4 text-center" style="margin-top: -140px;">
		      		
		      		<!-- <button type="button" class="plain button red cancel" id="addApproval">가입신청</button> -->
					<button type="button" class="plain button red cancel" id="cancel">이&nbsp;전</button>			
					<button type="button" class="plain button red cancel" id="updateClub">수&nbsp;정</button>
					<button type="button" class="plain button red cancel" id="deleteClub">삭&nbsp;제</button>
				</div>
					
		    </div>
			</div>	
	</main>
	<script src="https://192.168.0.183:4000/socket.io/socket.io.js"></script>
</body>
</html>