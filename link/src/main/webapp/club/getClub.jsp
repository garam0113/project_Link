<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<title>모임상세조회</title>

<meta charset="UTF-8">
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
				  title: '정말 모임을 삭제하시겠습니까?',
				  text: "삭제한 모임은 복구가 불가능합니다.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소' ,
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
			//모달창 열기
			$('#approvalModal').modal("show");
			} else {
				
				Swal.fire({
					title: '모임 최대 한도 수를 초과하였습니다.' ,
					text: "결제를 통해 모임 한도를 늘릴 수 있습니다." ,
					icon: 'warning',
					showCancelButton: false,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
				}).then((result) => {
					if(result.value){
					
						self.location="/clubPost/addPayView?payNavigation=1"
					}
				})
			}
		});
		
		$("input[value='신청']").bind("click", function() {
			
			if($.trim($("input[name='joinGreeting']").val()) == '' ){
				Swal.fire({
					icon: 'error' ,
					title: '제목은 필수입니다'
				})
				return;
			}
			
			$("form").attr("accept-charset" , "EUC-KR").submit();
		});
		
		
		$("input[value='취소']").bind("click", function() {
			
			//모달창 닫기
			$('#approvalModal').modal("hide");
		});
		
		$("button[class='close']").bind("click", function() {
			$('#approvalModal').modal("hide");
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
				  title: '정말 모임을 탈퇴하시겠습니까?',
				  text: "탈퇴 시 다시 가입 신청을 해야합니다",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소' ,
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
		
		//alert("123");
/* 		var options = {
			"forcNew" : true
		}; */
		var url = "https://192.168.0.183:4000";

		socket = io.connect(url);

		socket.on("connect", function() {
			//alert("소켓연결 완료");
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
					type : '2',
					clubNo : clubNo
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
									limit : total,
									clubNo : clubNo
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
						var clubNo = $("#no").val();
						var roomName = $(this).parent().attr("id");
						var viewName = $(this).children().val();
						console.log(roomName);
						$.ajax("/liveRest/json/getLive",{
							method : "POST",
							data : JSON.stringify({
								roomName : roomName,
								type : '2',
								clubNo : clubNo
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
			var clubNo = $("#no").val();
			console.log("socket서버에서 받은 Data : "+data);
			if(data != null){
			$.ajax("/liveRest/json/exitLive", {
				method : "POST",
				data : JSON.stringify({
					roomName : data,
					type : '2',
					clubNo : clubNo
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
			/* padding-top: 70px; */
		}
		
		#main {
			background-color: #f0f2f5 !important;
		}
		
		/* main {
			background-color: #f0f2f5 !important;
		} */
		
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
		
		/* .darkover {
			position: sticky;
			top: auto;
			bottom: 0;
			left: 0;
			background: rgba(0, 0, 0, 0.35);
		} */
		
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
			/* margin-bottom: 100px !important; */
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


<body class="blog masonry-style">



	<%-- ///////////////////// 채팅에 필요한 코딩 //////////////////////// --%>
	<%-- 채팅을 위한 소켓 --%>
	<script src="http://192.168.0.74:3000/socket.io/socket.io.js"></script>
	<%-- 채팅 js --%>
	<script src="/resources/javascript/chat/chat.js"></script>
	<%-- 채팅 css --%>
	<link rel="stylesheet" href="/resources/css/chat/chat.css" type="text/css" media="screen" title="no title">
	<%-- ///////////////////// 채팅에 필요한 코딩 //////////////////////// --%>
	
	

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!-- <main role="main"> -->

		<%-- <div id="intro-wrap" data-height="17.35">
			<!-- 상단 검은색 공통 영역 -->
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
		<!-- intro-wrap --> --%>
		
			<div id="main" class="row"><!-- 중간 개별영역 -->
			
			
			
				<%-- chat.js에서 사용위해서 --%>
				<input type="hidden" id="session_userId" value="${ sessionScope.user.userId }">
				<input type="hidden" id="session_profileImage" value="${ sessionScope.user.profileImage }">
				<input type="hidden" id="session_nickName" value="${ sessionScope.user.nickName }">
				<%-- chat.js에서 사용위해서 --%>
				<%-- 채팅 --%>
				<jsp:include page="/chat/chat.jsp" />
				<%-- 채팅 --%>
				
				
				
				<div class="row-content buffer-left buffer-right buffer-bottom" style="background-color: red; width: 1140px; margin-left: 405px;">
				
				
					<!-- 모임 대표이미지 -->				
					<div class="club-image" style="background-color: blue; width: 1140px; height: 550px; overflow: hidden;">
						<a href="/club/getClub?clubNo=${clubNo}">
							<img src="/resources/image/uploadFiles/${club.clubImage}" style="width: 1140px;" name="file" id="clubImage">
						</a>
					</div>
				
					 <!-- 모임버튼 영역 -->			
					<div class="homeBtn_group" style="background-color: yellow;">
						<button type="button" class="homeBtn" style="margin-top: 55px;">
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="clubPostBtn">
							<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="clubMemberBtn">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="live">
							 <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span> 
						</button>
					</div>
					
					
					<div class="form-group" id="btn_group" style="background-color: green;">
						<!-- <button type="button" class="joinLi"></button> -->
						<div class="col-sm-offset-4  col-sm-4 text-center" style="margin-top: -145px; margin-left: 900px; display: flex;">
				      		
				      		<button type="button" class="plain button red cancel" id="club-add-approval">가입신청</button>
							<button type="button" class="plain button red cancel" id="cancel">이&nbsp;전</button>
							
						<c:forEach var="k" begin="0" end="${ fn:length(clubMemberList) - 1}" step="1">
								<c:if test="${ fn:trim(clubMemberList[k].approvalCondition) == '1' }">
									<c:if test="${ fn:trim(clubMemberList[k].user.userId) == fn:trim(sessionScope.user.userId)}">
										<button type="button" class="plain button red cancel" id="deleteApprovalCondition">탈퇴</button>
									</c:if>
								</c:if>				 	
						 	</c:forEach>	
											
						<c:if test="${ fn:trim(sessionScope.user.userId) == fn:trim(club.user.userId) }">
							<button type="button" class="plain button red cancel" id="updateClub">수&nbsp;정</button>
							<button type="button" class="plain button red cancel" id="deleteClub">삭&nbsp;제</button>
						</c:if>
						
						</div>
				    </div>
							
	
					<div class="mainForm" style="display: inline-flex; background-color: olive;">
						<!-- 클럽상세 -->
						<div>
							<form class="form-horizontal" enctype="multipart/form-data" style="width: 470px; background-color: #ffffff; margin-right: 100px; margin-top: 74px; border-radius: 10px; heigth: 90%;">
	
								<div class="col-xs 6 col-md-6" style="display: contents;">
									<div class="row">
										<div class="col-xs-4 col-md-6" style="margin-left: 10px;">
											<strong>모임제목</strong>
										</div>
										<div class="col" style="margin-left: 30px;">${club.clubTitle}</div>
									</div>
	
									<hr />
	
									<div class="row">
										<div class="col-xs-4 col-md-6 " style="margin-left: 10px;">
											<strong>모임설명</strong>
										</div>
										<div class="col" style="margin-left: 30px; height: 100px;">${club.clubDetail}</div>
									</div>
	
									<hr />
	
									<div class="row">
										<div class="col-xs-4 col-md-6 " style="margin-left: 10px;">
											<strong>카테고리</strong>
										</div>
										<div class="col-xs-8 col-md-4" style="margin-left: 15px;">${club.clubCategory}</div>
									</div>
	
									<hr />
	
									<div class="row">
										<div class="col-xs-4 col-md-6 " style="margin-left: 10px;">
											<strong>활동영역</strong>
										</div>
										<div class="col-xs-8 col-md-4" style="margin-left: 15px;">${club.clubArea}</div>
									</div>
	
									<hr />
	
									<div class="row"> 
										<div class="col-s-4 col-md-6 " style="margin-left: 10px;">
											<strong>모임원 수</strong>
										</div>
										<div class="col-xs-8 col-md-4" style="margin-left: 15px;">${clubMemberCount}/${club.clubMaxMember}</div>
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
						
						
							<%-- ${clubMemberList[0].approvalCondition} --%>
					 	
					 	<%-- <c:forEach var="k" begin="0" end="${ fn:length(clubMemberList) - 1}" step="1">
					 		<c:if test="${ clubMemberList[k].approvalCondition == 1 }">
					 			${ clubMemberList[k].user.userId == sessionScope.user.userId }
					 			'버튼'
					 		</c:if>				 	
					 	</c:forEach> --%>
						
						
						
					</div>
				
					<c:forEach var="k" begin="0" end="${ fn:length(clubMemberList) - 1}" step="1">
						<c:if test="${ fn:trim(clubMemberList[k].approvalCondition) == '1' }">
							<c:if test="${ fn:trim(clubMemberList[k].user.userId) == fn:trim(sessionScope.user.userId)}">
								<button type="button" class="plain button red cancel" id="addMeeting" style="margin-top: 80px; margin-left: 860px;">일정생성</button>
							</c:if>
						</c:if>				 	
				 	</c:forEach>
				</div>
				<!-- 버튼 원래 자리 -->
				<%-- 	<div class="form-group" id="btn_group">
						<!-- <button type="button" class="joinLi"></button> -->
					<div class="col-sm-offset-4  col-sm-4 text-center" style="margin-top: -20px;">
			      		
			      		<button type="button" class="plain button red cancel" id="club-add-approval">가입신청</button>
						<button type="button" class="plain button red cancel" id="cancel">이&nbsp;전</button>
						
					<c:if test="${ fn:trim(sessionScope.user.userId) != fn:trim(club.user.userId) }">	
						<button type="button" class="plain button red cancel" id="deleteApprovalCondition">탈퇴</button>
					</c:if>					
					<c:if test="${ fn:trim(sessionScope.user.userId) == fn:trim(club.user.userId) }">				
						<button type="button" class="plain button red cancel" id="updateClub">수&nbsp;정</button>
						<button type="button" class="plain button red cancel" id="deleteClub">삭&nbsp;제</button>
					</c:if>
					
					</div>
			    </div> --%>
				<!-- 모달영역 -->
				<div class="modal fade" id="approvalModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document" style="margin-top: 150px; top: 200px;">
						<div class="modal-content" style="height: 300px; width: 440px;">
							<div class="modal-header">
								<button class="close" type="button" data-dismiss="modal" aria-label="Close">
									<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								</button>
								<h3 class="modal-title" id="exampleModalLabel" style="text-align: center; ">가입신청</h3>
							</div>
						<div class="club-add-approval-view">
							<form name="addApprovalCondition" method="post" action="/club/addApprovalCondition" enctype=multipart/form-data>
								<input type="hidden" name="clubNo" value="${ clubNo }">
								<input type="hidden" name="roomId" value="${ club.roomId }">
								<div class="clubJoinGreeting">
									<input type="text" name="joinGreeting" placeholder="가입인사를 작성해주세요" autocomplete="off" style="margin-top: 10px; margin-left: 45px; height: 130px; width: 365px;">
								</div>
								<div class="modalBtn" style="margin-top: -20px; margin-left: 98px;">
								<input type="button" class="plain button red cancel" value="신청">
								<input type="button" class="plain button red cancel" value="취소">
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
	<!-- </main> -->
	
	
	<div style="height: 500px; overflow: hidden;">
		<div>
			<img src="/resources/image/uploadFiles/footerImage3.jpg" width="100%">
		</div>
		<div class="row" style="position: absolute; top: 100px; left: 100px;">
			<div class="row-content buffer clear-after">
				<section id="top-footer">
					<div class="widget column three"><!-- la class="widget" è forse generata utomaticamente da wp -->
						<h4>Menu</h4>
						<ul class="plain">
							<li><a href="home-01.html">Home</a></li>
							<li><a href="works-3-columns.html">Portfolio</a></li>
							<li><a href="blog-4-columns-masonry.html">Blog</a></li>
							<li><a href="resume.html">Resume</a></li>
							<li><a href="file:///Users/pasqualevitiello/My%20Folder/Job/Envato/PR%20Themeforest/Flattie/Markup/Beetle/contact.html">Contact</a></li>
						</ul>
					</div>
					<div class="widget column three">
						<h4>Archives</h4>
						<ul class="plain">
							<li><a href="#">March 2014</a></li>
							<li><a href="#">April 2014</a></li>
							<li><a href="#">May 2014</a></li>
							<li><a href="#">June 2014</a></li>
							<li><a href="#">July 2014</a></li>
						</ul>
					</div>								
					<div class="widget column three">
						<h4>Widget</h4>
						<p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
					</div>				
					<div class="widget meta-social column three">
						<h4>Follow Us</h4>
						<ul class="inline">
							<li><a href="#" class="twitter-share border-box"><i class="fa fa-twitter fa-lg"></i></a></li>
							<li><a href="#" class="facebook-share border-box"><i class="fa fa-facebook fa-lg"></i></a></li>
							<li><a href="#" class="pinterest-share border-box"><i class="fa fa-pinterest fa-lg"></i></a></li>
						</ul>
					</div>														
				</section><!-- top-footer -->
				<section id="bottom-footer">
					<p class="keep-left">&copy; 2014 <a href="http://mokaine.com/" alt="Mokaine Lab">Mokaine</a>. All Rights Reserved.</p>
					<p class="keep-right">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
				</section><!-- bottom-footer -->			
			</div><!-- row-content -->	
		</div><!-- row -->	
	</div>
	
	
	<script src="https://192.168.0.183:4000/socket.io/socket.io.js"></script>
</body>
</html>