<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="The Page Description">
	
	<title>Feed</title>
	
	<link href="/resources/css/feed/getFeedList.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	
	<%-- SUMMER NOTE --%>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<%-- SUMMER NOTE --%>
	
	<%-- ALERT --%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<%-- ALERT --%>
	
	<%-- BOOTSTRAP ICON --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<%-- BOOTSTRAP ICON --%>
		
	
	<script type="text/javascript">
	
	function formatDate(date) {
	    
	    var d = new Date(date),
	    
	    month = '' + (d.getMonth() + 1) , 
	    day = '' + d.getDate(), 
	    year = d.getFullYear();
	    
	    if (month.length < 2) month = '0' + month; 
	    if (day.length < 2) day = '0' + day; 
	    
	    return [year, month, day].join('-');
	    
	}
	
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/feedRest/json/uploadImage",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
	
	$(function(){
		
	<%-- 피드 폼에서 아이디에 호버시 --%>
		
		$(document).on("click", ".feedProfileImage", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).parents(".feedCover").siblings(".feedName").text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		$(document).on("click", ".feedName", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		<%-- 피드 폼에서 아이디에 호버시 --%>
		
		<%-- 작성자 아이디에 호버시 --%>
		
		$(document).on("click", ".sessionProfileImage", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).parents(".addFormImage").siblings(".addFormName").text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		$(document).on("click", ".addFormName", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		<%-- 작성자 아이디에 호버시 --%>
		
		<%-- 알람 모달창 --%>
		
		$(document).on("click", ".alarmImg", function(event) {
			var sessionUser = '${sessionScope.user.userId}';

			$.ajax(
					{
						url : "/serviceCenterRest/json/getPushList",
						method : "POST",
						data : JSON.stringify ({
							userId : sessionUser
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							var alarm = data.alarm;
							var alarmCount = data.alarmCount;
							var addHtml = 	"<div>총 알림 갯수" +
												"<div>" + alarmCount + "</div>" +
											"</div>";
							
							$.each(alarm, function(index, item){
								addHtml += 	"<div>알림 내용" + 
												"<div>" + item.content + "</div>" + 
											"</div>"
							}) // each close
							
							$(".alarmModalBody").html(addHtml);
							
						}
					}	
					
			) // ajax close
			
		})
		
		<%-- 알람 모달창 --%>
		
				
		<%-- SEARCH BY HASHTAG --%>
		
		$(document).on("click", ".searchByHashtag", function(event){
			event.stopPropagation();
			
			var searchKeyword = $(this).text().trim();
			$("#searchKeyword").val(searchKeyword);
			
			console.log($("#searchKeyword").val());
			$("#searchForm").attr("method", "POST").attr("action","/feed/getFeedList").submit();
		})
		
		
		<%-- 무한 스크롤 --%>
		
		$(window).scroll(function() {
			console.log(($("#pageFlag").val()));
			if($("#pageFlag").val() == "true") {
			
				if((Math.ceil($(window).scrollTop() + $(window).height())) >= ( $(document).height() )) {
					
					console.log("무한 스크롤");
					
					var maxHeight = $(document).height();
					var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
					
					var sessionUser = $("#userId").val();
					
					console.log("서치키워드 : " + $("#searchKeyword").val());
					
					$.ajax(
							{
								url : "/feedRest/json/getFeedList",
								method : "POST",
								data : JSON.stringify ({
									userId : sessionUser,
									currentPage : parseInt($("#currentPage").val()) + 1,
									searchKeyword : $("#searchKeyword").val()
								}),
								contentType: 'application/json',
								dataType : "json",
								header : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								}, // header end
								
								success : function(data, status) {
									

									var addHtml = "";
									
									$.each(data, function(index, item) {
										

										console.log("무한 스크롤 정보 성공" + item.content + "\n");
										
										addHtml +=
										'<div class="showFeedForm">' +
										'<form class="feedForm">' +
										'<div class="feedHeader">' +
										'<div class="feedLeft">' + 
										'<div class="feedInner">' + 
										'<div class="feedCover">' +
										'<img class="feedProfileImage" src="/resources/image/uploadFiles/' + item.user.profileImage + '" />' + 
										'</div>' +
										'<div class="feedName">' +
										item.user.nickName +
										'</div>' +
										'</div>' + 
										'<div class="feedDate">'
										
										if(item.updateDate != null) {
											addHtml += formatDate(item.updateDate) + '</div></div>';
										} else {
											addHtml += formatDate(item.regDate) + '</div></div>';
										}
										
										
										if(sessionUser == item.user.userId) {
											addHtml += '<div class="udIcon">' +
														'<span class="glyphicon glyphicon-trash btn_delete" aria-hidden="true" ></span>' +
														'</div>'
										}
										
										addHtml += '</div>';
										
										if(item.content != null) {
											addHtml += '<div class="feedContent">' + 
														'<div class="feedLetter">' + 
														item.content +
														'</div>'
										}
										
										if(item.video != null) {
											addHtml += '<div class="feedVideo">' +
														'<iframe width="560" height="315" src="http://' + item.video + '"></iframe>' +
														'</div>'
										}
										
										
										if(item.image1 != null) {
											addHtml += '<div class="feedImage">' +
													'<div id="carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" class="carousel slide" data-ride="carousel">' +
													'<ol class="carousel-indicators">' +
														'<li data-target="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" data-slide-to="0" class="active"></li>'
														
											if(item.image2 != null) {
												addHtml += '<li data-target="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" data-slide-to="1"></li>';
											}
														
											if(item.image3 != null) {
												addHtml += '<li data-target="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" data-slide-to="2"></li>';
											}
											
											if(item.image4 != null) {
												addHtml += '<li data-target="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" data-slide-to="3"></li>';
											}		
														
											addHtml += '</ol>' +
												'<div class="carousel-inner" role="listbox">' +
												'<div class="item active">' +
												'<img src="/resources/image/uploadFiles/' + item.image1 + '" alt="' + item.image1 + '">' +
												'</div>'
												
											if(item.image2 != null) {
												addHtml += '<div class="item">' +
															'<img src="/resources/image/uploadFiles/' + item.image2 + '" alt="' + item.image2 + '">' +
															'</div>'
											}
														
											if(item.image3 != null) {
												addHtml += '<div class="item">' +
															'<img src="/resources/image/uploadFiles/' + item.image3 + '" alt="' + item.image3 + '">' +
															'</div>'
											}
											
											if(item.image4 != null) {
												addHtml += '<div class="item">' +
															'<img src="/resources/image/uploadFiles/' + item.image4 + '" alt="' + item.image4 + '">' +
															'</div>'
											}
																
											addHtml += '</div>' +
														'<a class="left carousel-control carousel_prev" href="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" role="button" data-slide="prev">' +
														'	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>' +
														'	<span class="sr-only">Previous</span>' +
														'</a>' +
														'<a class="right carousel-control carousel_next" href="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" role="button" data-slide="next">' +
														'	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>' +
														'	<span class="sr-only">Next</span>' +
														'</a>' +
													'</div></div>'
										}
											
										addHtml += '</div>';
										
										if(item.hashtag != null) {
											addHtml += '<div class="hashtagContent">' +
													item.hashtag +
													'</div>'
										}
											
										addHtml += '<input type="hidden" name="reportSource" value="3">' +
											'<input type="hidden" name="sourceNumber" value="' + item.feedNo + '">' +
											'<input type="hidden" name="user2" value="' + item.user.userId + '">' +
											'<input type="hidden" name="source" value="0">' +
											'<input type="hidden" name="feedNo" value="' + item.feedNo + '"> ' +
											'<input type="hidden" id="userId" name="userId" value="' + sessionUser + '">' +
											'<input type="hidden" name="openCondition" value="3">' +
											'<section class="row section lastBar">' +
											'	<div class="row">' +
											'		<div class="col-xs-2"></div>'
										
										if(item.checkHeart == 0) {
											addHtml += '<div class="col-xs-2">' +
															'<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" aria-hidden="true"/>' +
														'</div>'
										} else {
											addHtml += '<div class="col-xs-2">' +
															'<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" aria-hidden="true"/>' +
														'</div>'
										}
											
										addHtml += '<div class="col-xs-1 likeCount">' +
														item.heartCount +
													'</div>' +
													'<div class="col-xs-2 comment">' +
													'	<img src="/resources/image/uploadFiles/comment2.jpg" aria-hidden="true"/>' +
													'</div>' +
													'<div class="col-xs-1 commentCount">' +
														item.commentCount +
													'</div>' +
													'<div class="col-xs-2 report">' +
													'	<img src="/resources/image/uploadFiles/report.jpg" aria-hidden="true"/>' +
													'</div>' +
													'<div class="col-xs-2"></div>' +
													'</div>' +
												'</section>' +
											'</form>' +
										'</div>'
										
									}) // each close
									
									console.log(addHtml);
									$(addHtml).appendTo($("div.six:last"));
									$("#currentPage").val( parseInt($("#currentPage").val()) + 1 );
									
									if(addHtml == "") {
										$("#pageFlag").val(false);
									}
									
								} // success close
								
							} // ajax inner close
							
					) // ajax close
					
				} // scroll if close
			
			} // pageFlag close;
		
		}); // window scroll event close
		
		<%-- 무한 스크롤 --%>
		
		
		
		<%-- SUMMER NOTE WEB LOADING --%>
		$('#summernote').summernote({
			toolbar: [
                // [groupName, [list of button]]
                ['Insert', ['picture', 'video']],
            ],
            
            disableResizeEditor: true,
			height: 200,                 	// 에디터 높이
			minHeight: null,             	// 최소 높이
			maxHeight: null,             	// 최대 높이
			focus: true,                 	// 에디터 로딩후 포커스를 맞출지 여부
			placeholder: '오늘 하루는 어떤가요?',			
			
			callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
           			// 파일 업로드(다중업로드를 위해 반복문 사용)
					for (var i = files.length - 1; i >= 0; i--) {
			            uploadSummernoteImageFile(files[i],
			            this);
		            		
					}
          		}
            }
		
		});
		
		<%-- SUMMER NOTE WEB LOADING --%>
		
		<%-- GET_FEED --%>
		$(document).on("click", ".feedForm", function(event) {
			event.stopPropagation();
			var feedNumber = $(this).children("input[name='feedNo']").val();
			
			if($(event.target).hasClass("comment") || $(event.target).hasClass("commentImg")) {
				
				return false;
			}
			
			location.href="/feed/getFeed?feedNo=" + feedNumber;
		})
		<%-- GET_FEED --%>
		
		<%-- ADD_FEED --%>
		$(document).on("click", ".addFeed", function(event){
			event.stopPropagation();
			
			console.log($(".note-editable").html());
			
			if($(".note-editable").html() == "<p><br></p>") {
				Swal.fire({
					  title: '내용을 입력하세요',
					  width: 400,
					  icon: 'warning',
					  timer : 500,
					  showConfirmButton : false,
				})
			} else {
				$(this.form).attr("method", "POST").attr("accept-charset", "EUC-KR").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
				
				if(sock) {
					var Msg = "가 피드를 작성했습니다.";
					
					sock.send(Msg);
				}
			}
		});
		<%-- ADD_FEED --%>
		
		<%-- UPDATE_FEED --%>
		$(document).on("click", ".btn_update", function(event){
			event.stopPropagation();
			// console.log("피드 수정 버튼");
			// console.log($(this).parents(".feedForm").html())
			
			// $(this).parent().parents(".feedForm").attr("method", "GET").attr("action", "/feed/updateFeed").submit();
			
			alert($(this).parents(".feedHeader").siblings(".feedContent").find(".feedLetter").html().trim())
			
			$(".updateCover").html($(this).parents(".udIcon").siblings(".feedLeft").find(".feedCover").html().trim())
			$(".updateFormName").html($(this).parents(".udIcon").siblings(".feedLeft").find(".feedName").html().trim())
			$(".updateFeedDate").html($(this).parents(".udIcon").siblings(".feedLeft").find(".feedDate").html().trim())
			$("#updateFeedForm textarea").html($(this).parents(".feedHeader").siblings(".feedContent").html())
			
			
			$('#updateModal').modal();
		});
		
		$(document).on("click", ".btn_updateFeed", function(event) {
			console.log("수정하기");
			$("#updateFeedForm").attr("method", "GET").attr("accept-charset", "EUC-KR").attr("action", "/feed/updateFeed").submit();
		})
		<%-- UPDATE_FEED --%>
		
		<%-- DELETE_FEED --%>
		$(document).on("click", ".btn_delete", function(event){
			event.stopPropagation();
			console.log("피드 삭제 버튼");
			console.log( $(this).parent().parents(".feedForm").html());
			
			Swal.fire({
				  title: '글을 삭제하시겠습니까?',
				  text: "삭제하시면 다시 복구시킬 수 없습니다.",
				  width: 500,
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소'
			}).then((result) => {
				if (result.value) {
		       		//"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
					// $(".feedForm").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
					$(this).parent().parents(".feedForm").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
					
					if(sock) {
						var Msg = "가 피드를 삭제했습니다.";
						
						sock.send(Msg);
					}
				}
			})
		});
		<%-- DELETE_FEED --%>
		
		<%-- ADD_FEED_HEART --%>
		$(document).on("click", ".feedLike", function(event){
			event.stopPropagation();
			console.log($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 좋아요");
			
			var html = $(this);
			var sessionUser = $(this).parents(".feedForm").children("input[name='userId']").val();
			var feedNo = $(this).parents(".feedForm").children("input[name='feedNo']").val();
			var content = $(this).parents(".feedForm").children(".feedContent").text().trim();
			
			$.ajax(
					{
						url : "/feedRest/json/addFeedHeart",
						method : "POST",
						data : JSON.stringify ({
							source : 0,
							sourceNo : feedNo,
							userId : sessionUser
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							console.log("피드 좋아요 성공 : " + data);

							$(html).parents(".row").children(".likeCount").text(data);
							$(html).parent().html('<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" />');
							
							if(sock) {
								var Msg = "가 피드 좋아요를 눌렀습니다.";
								
								sock.send(Msg);
							}
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<%-- ADD_FEED_HEART --%>
		
		<%-- DELETE_FEED_HEART --%>
		$(document).on("click", ".feedDislike", function(event){
			event.stopPropagation();
			console.log($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 시러요");
			
			var html = $(this);
			var sessionUser = $(this).parents(".feedForm").children("input[name='userId']").val();
			var feedNo = $(this).parents(".feedForm").children("input[name='feedNo']").val();
			var content = $(this).parents(".feedForm").children(".feedContent").text().trim();
			
			$.ajax(
					{
						url : "/feedRest/json/deleteFeedHeart",
						method : "POST",
						data : JSON.stringify ({
							source : 0,
							sourceNo : $(this).parents(".feedForm").children("input[name='feedNo']").val(),
							userId : sessionUser
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							console.log("피드 시러요 성공 : " + data);
							
							$(html).parents(".row").children(".likeCount").text(data);
							$(html).parent().html('<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" />');
							
							if(sock) {
								var Msg = "가 피드 좋아요 취소 했습니다.";
								
								sock.send(Msg);
							}
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<%-- DELETE_FEED_HEART --%>
		
		<%-- CAROUSEL 침범 방지 --%>
		$(document).on("click", ".carousel-control", function(event) {
			event.stopPropagation();
		})
		<%-- CAROUSEL 침범 방지 --%>
		
		<%-- CALL REPORT --%>
		$(document).on("click", ".report", function(event) {
			event.stopPropagation();
			
			// $(this).parent().parents(".feedForm").attr("method", "POST").attr("action", "/serviceCenter/addReport").submit();
			// $(".modal-content").load("/loginModal");
			var reportedUser = $(this).parents(".lastBar").siblings("input[name='user2']").val();
			var feedNo = $(this).parents(".lastBar").siblings("input[name='feedNo']").val();
			
			$('#reportModal .modal-content').load("/serviceCenter/addReport?reportSource=3&user2=" + reportedUser + "&sourceNumber=" + feedNo);
			$('#reportModal').modal();

			//	window.open('/serviceCenter/addReportView.jsp',  '_blank', 'width=200,height=200,resizeable,scrollbars');
		})	// .report evenet close
		<%-- CALL REPORT --%>
		
	})
	
	
	
	</script>

<!------------------------------ CSS ------------------------------>

<style type="text/css">

	
  
</style>

<!------------------------------ CSS ------------------------------>


	
</head>

<body>

	<jsp:include page="/toolbar.jsp" />

	<main role="main">

		<div id="main">
		
			<section class="row section">
			<div class="container">
			
				<div class="row-content buffer even clear-after">
					<div class="column three">
						<button class="btn btn-primary searchPlace" type="button" onclick="window.open('http://localhost:5005/', '_blank', 'width=800, height=600, location =no,status=no, toolbar=no, scrollbars=no'); return false;">주변검색</button>
							
						<%-- 검색 --%>
						<form id="searchForm" method="POST" action="/feed/getFeedList" accept-charset="euc-kr">
							
							<input type="text" id="searchKeyword" placeholder="검색" name="searchKeyword" value="${search.searchKeyword}">
							
						</form>
						<%-- 검색 --%>
						
					</div>
					
					<div class="column six">
						<div class="post-area clear-after addFeedForm">
							<form id="addForm">
							
							<c:if test="${!empty sessionScope.user}">
							
								<article role="main">
								
								<div class="addHeader">
									<div class="addHeaderInner">
										<div class="addFormImage">
											<img class="sessionProfileImage" src="/resources/image/uploadFiles/${sessionScope.user.profileImage}" />
										</div>
										
										<div class="addFormName">
											${sessionScope.user.nickName}
										</div>
									</div>
									
									<div>
										<button class="btn btn-primary addFeed" type="button">SUBMIT</button>
									</div>
									
								</div>
								
								<div class="addBody">
									
									<textarea id="summernote" name="fullContent"></textarea>
								</div>
								
								</article>
								
							</c:if>
		
							<input type="hidden" name="openCondition" value="3">
							
							</form>
						</div>

						<c:set var="i" value="0"></c:set>
						<c:forEach var="feed" items="${feedList}">
							<c:set var="i" value="${i + 1}"></c:set>

							<c:if test="${fn:trim(feed.deleteCondition) eq '0' and fn:trim(feed.reportCondition) eq '0'}">

								<div class="showFeedForm">
									<form class="feedForm">
										<div class="feedHeader">
											<div class="feedLeft">
												<div class="feedInner">
													<div class="feedCover">
														<img class="feedProfileImage" src="/resources/image/uploadFiles/${feed.user.profileImage}" />
													</div>
													<div class="feedName">
														${feed.user.nickName}
													</div>
												</div>
												
												<div class="feedDate">
													<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
													<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
												</div>
											</div>
												
											<c:if test="${sessionScope.user.userId eq feed.user.userId}">
											
											<div class="udIcon">
												<%-- 수정 버튼 --%>
												<%-- <span class="glyphicon glyphicon-paperclip btn_update" aria-hidden="true"></span> --%>
												<%-- 수정 버튼 --%>
											
												<%-- 삭제 버튼 --%>
												<span class="glyphicon glyphicon-trash btn_delete" aria-hidden="true" ></span>
												<%-- 삭제 버튼 --%>
											</div>
												
											</c:if>
										</div>
										<div class="feedContent">
											<div class="feedLetter">
												${feed.content}
											</div>
											
											<c:if test="${!empty feed.video}">
											<div class="feedVideo">
												<iframe width="560" height="315" src="http://${feed.video}"></iframe>
											</div>
											</c:if>
											
											<%-- 이미지 --%>
											
											<c:if test="${!empty feed.image1}">
											<div class="feedImage">
												<div id="carousel-example-generic${i}" class="carousel slide" data-ride="carousel">
													<ol class="carousel-indicators">
														<li data-target="#carousel-example-generic${i}" data-slide-to="0" class="active"></li>
														
														<c:if test="${!empty feed.image2}">
															<li data-target="#carousel-example-generic${i}" data-slide-to="1"></li>
														</c:if>
														<c:if test="${!empty feed.image3}">
															<li data-target="#carousel-example-generic${i}" data-slide-to="2"></li>
														</c:if>
														<c:if test="${!empty feed.image4}">
															<li data-target="#carousel-example-generic${i}" data-slide-to="3"></li>
														</c:if>
													</ol>
												
													<!-- Wrapper for slides -->
													<div class="carousel-inner" role="listbox">
														<div class="item active">
															<img src="/resources/image/uploadFiles/${feed.image1}" alt="${feed.image1}">
														</div>
														
														<c:if test="${!empty feed.image2}">
															<div class="item">
																<img src="/resources/image/uploadFiles/${feed.image2}" alt="${feed.image2}">
															</div>
																<c:if test="${!empty feed.image3}">
																	<div class="item">
																		<img src="/resources/image/uploadFiles/${feed.image3}" alt="${feed.image3}">
																	</div>
																	<c:if test="${!empty feed.image4}">
																		<div class="item">
																			<img src="/resources/image/uploadFiles/${feed.image4}" alt="${feed.image4}">
																		</div>
																	</c:if>
																</c:if>														
														</c:if>
													</div>
		
													<!-- Controls -->
													<a class="left carousel-control carousel_prev" href="#carousel-example-generic${i}" role="button" data-slide="prev">
														<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
														<span class="sr-only">Previous</span>
													</a>
													<a class="right carousel-control carousel_next" href="#carousel-example-generic${i}" role="button" data-slide="next">
														<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
														<span class="sr-only">Next</span>
													</a>
												</div>
											</div>
											</c:if>
											
											<%-- 이미지 --%>
											
										</div>
										
										<c:if test="${!empty feed.hashtag}">
											<div class="hashtagContent">
												
												<c:set var="text" value="${fn:split(feed.hashtag, '#')}"/>
												tag : 
												<c:forEach var="textValue" items="${text}" varStatus="varStatus">
													<span class="searchByHashtag">
														#${textValue}
													</span>
												</c:forEach>
												
											</div>
										</c:if>
										
										<%-- 피드 댓글 신고 --%>
										<input type="hidden" name="reportSource" value="3">
										<input type="hidden" name="sourceNumber" value="${feed.feedNo}">
										<input type="hidden" name="user2" value="${feed.user.userId}">
										<%-- 피드 댓글 신고 --%>
										
										<input type="hidden" name="source" value="0">
										<input type="hidden" name="feedNo" value="${feed.feedNo}">
										<input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}">
										<input type="hidden" name="openCondition" value="3">

										<!-- 피드 좋아요 댓글수 신고 -->
										<section class="row section lastBar">
											<div class="row">
												<%-- 여백 --%>
												<div class="col-xs-2"></div>
												<%-- 여백 --%>
											
												<c:if test="${feed.checkHeart eq 0}">
													<div class="col-xs-2">
														<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" aria-hidden="true"/>
													</div>
												</c:if>
												<c:if test="${feed.checkHeart ne 0}">
													<div class="col-xs-2">
														<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" aria-hidden="true"/>
													</div>
												</c:if>
												
												<div class="col-xs-1 likeCount">
													${feed.heartCount}
												</div>
												
												<div class="col-xs-2 comment">
													<img src="/resources/image/uploadFiles/comment2.jpg" class="commentImg" aria-hidden="true" data-toggle="modal" data-target="#myModal"/>
												</div>
												
												<div class="col-xs-1 commentCount">
													 ${feed.commentCount}
												</div>
												
												<!-- 신고 아이콘 -->
												<div class="col-xs-2 report">
													<img src="/resources/image/uploadFiles/report.jpg" aria-hidden="true"/>
												</div>
												<!-- 신고 아이콘 -->
												
												<%-- 여백 --%>
												<div class="col-xs-2"></div>
												<%-- 여백 --%>
												
											</div>
										</section>
										<!-- 피드 좋아요 댓글수 신고 -->

									</form>

								</div>

							</c:if>
							
						</c:forEach>

					</div>
					
					<div class="column three">
					
					
                    <div class="alarmHead" >
						
							<img class="alarmImg" alt="" src="/resources/image/uploadFiles/alarm.png" aria-hidden="true" data-toggle="modal" data-target="#alarmModal"/><span class="badge">${alarmCount}</span>

                    </div>
					
					<script type="text/javascript" charset="utf-8" src="/resources/javascript/myHome/followListForFeed.js"></script>
					
						<div class="tabs1">
							<input id="all-follow" type="radio" name="tab_item-follow" checked>
						    <label class="tab_item-follow" for="all-follow">Follow</label>
						    <input id="programming-follow" type="radio" name="tab_item-follow">
						    <label class="tab_item-following" for="programming-follow">Follower</label>
						    
							 <div class="tab_content-follow" id="all-follow_content" >
							     <div class="col-md-4" id="fll">
												 		<br />
								</div>
							</div>		
								 <div class="tab_content-follow" id="programming-follow_content">
							    	 <div class="col-md-4" id="fl">
												 		<br />
									</div>
								</div>
						</div>
						
					</div>
					
					<%-- 현재 페이지 --%>
					<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}">
					<input type="hidden" id="pageFlag" value=true>
					<%-- 현재 페이지 --%>
					
				</div>

			</div>
			</section>

		</div>
		
	<!-- COMMENT Modal -->
	<div class="modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						title
					</h4>
				</div>
				<div class="modal-body">여기는 내용</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						Close
					</button>
					<button type="button" class="btn btn-primary">
						Save changes
					</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 알림 Modal -->
	<div class="modal fade" id="alarmModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						알림
					</h4>
				</div>
				<div class="modal-body alarmModalBody">여기는 알람모달</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						Close
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 신고 Modal -->
	<div class="modal fade" id="reportModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						Close
					</button>
				</div>
			</div>
		</div>
	</div>

	</main>
	
</body>
</html>
