<%@ page contentType="text/html; charset=UTF-8" %>
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
	
	<link href="/resources/css/feed/getFeed.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<%-- SUMMER NOTE --%>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<%-- SUMMER NOTE --%>
	
	<%-- ALERT --%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<%-- ALERT --%>
	
	<%-- ICON --%>
	<script src="https://kit.fontawesome.com/ebd5a092f1.js"></script>
	<%-- ICON --%>
	
	<script type="text/javascript">
	
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
	
	function formatDate(date) {
	    
	    var d = new Date(date),
	    
	    month = '' + (d.getMonth() + 1) , 
	    day = '' + d.getDate(), 
	    year = d.getFullYear();
	    
	    if (month.length < 2) month = '0' + month; 
	    if (day.length < 2) day = '0' + day; 
	    
	    return [year, month, day].join('-');
	    
	}
	
	function fncAddReport(){
		
		var title = $("textarea[name=title]").val();		
		var content =$("textarea[name=content]").val();			
		var checkbox = $("input:checkbox[name=reportReason]:checked").length;
		
		if(title == null || title.length <1){
          	Swal.fire({
                icon: 'error',
                title: '신고 제목은 필수입니다.',
            });
				return;
			}
		if(content == null || content.length <1){
			Swal.fire({
                icon: 'error',
                title: '신고 내용은 필수입니다.',
                text: '가능한 상세히 적어주세요.',
            });
				return;
			}
				
		if(checkbox==0){
			Swal.fire({
                icon: 'error',
                title: '신고 사유는 필수입니다.',
                text: '1개 이상 클릭해주세요.',
            });
			return;
		}
		
						
		  Swal.fire({
	          title: '정말로 신고하시겠습니까?',
	          text: "다시 되돌릴 수 없습니다. 신중하세요.",
	          icon: 'warning',
	          showCancelButton: true,
	          confirmButtonColor: '#3085d6',
	          cancelButtonColor: '#d33',
	          confirmButtonText: '신고',
	          cancelButtonText: '취소'
	      }).then((result) => {
	          if (result.isConfirmed) {
	             AddReport()
	          }
	      })
	      
	 }
	 
	function AddReport(){	
	
		var sum = 0;
		var checkbox = $("input:checkbox[name=reportReason]:checked").length;
				
		for(var i =0 ; i<checkbox; i++){
			var sum2 = parseInt($("input:checkbox[name=reportReason]:checked").val());
			sum += sum+parseInt(sum2);			
		}
		
		var no = $("#No").val();
		
	 	$.ajax({
		url  : "/serviceCenterRest/json/addReport?clubNo=0&clubPostNo=0",
			//url  : "/serviceCenterRest/json/addReport?clubNo="+clubNo,
		contentType: 'application/json',
		method : "POST",
		dataType: "json",
		data : JSON.stringify ({
			"title":$("#title").val(),
			"content":$("#content").val(),
		<%--	"file": image, --%>
			"user1":$("#user1").val(),
			"user2":$("#user2").val(),
			"reportSource":$("#reportSource").val(),
			"reportReason": sum,
			"type": $("#type").val(),
			"no" :no,
				
		 success: function(){
			 window.close();
		 }
		}),
			
		})<!-- ajax ( ReportAdd) 끝 --> 
		
	
	} //funtion 끝

	$(function(){
		
		<%-- SUMMER NOTE WEB LOADING --%>
		$('#summernote').summernote({
			toolbar: [
                // [groupName, [list of button]]
                ['Insert', ['picture', 'video']],
            ],
            
            disableResizeEditor: true,
			height: 600,                 // 에디터 높이
			minHeight: null,             // 최소 높이
			maxHeight: null,             // 최대 높이
			focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
			lang : 'ko-KR',
	        
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
		
		<%-- 댓글에서 아이디 혹은 사진에 호버시 --%>
		
		$(document).on("click", ".comment-author img", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
					{
						url : "/userRest/json/getUser",
						method : "POST",
						data : JSON.stringify ({
							nickName : $(this).siblings("cite").text().trim()
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
		
		$(document).on("click", "cite", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
					{
						url : "/userRest/json/getUser",
						method : "POST",
						data : JSON.stringify ({
							nickName : $(this).text()
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
		
		<%-- 댓글에서 아이디 혹은 사진에 호버시 --%>
		
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
		
		<%-- 무한 스크롤 --%>
			
			$(window).scroll(function() {
				console.log(($("#pageFlag").val()));
				if($("#pageFlag").val() == "true") {
				
					if((Math.ceil($(window).scrollTop() + $(window).height())) >= ( $(document).height() )) {
						
						console.log("무한 스크롤");
						
						var maxHeight = $(document).height();
						var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
						
						var sessionUser = $("#userId").val();
						
						$.ajax(
								{
									url : "/feedRest/json/getFeedCommentList",
									method : "POST",
									data : JSON.stringify ({
										userId : sessionUser,
										feedNo : ${feed.feedNo},
										currentPage : parseInt($("#currentPage").val()) + 1
									}),
									contentType: 'application/json',
									dataType : "json",
									header : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									}, // header end
									
									success : function(data, status) {
										
										console.log("성공요");
										
										var addHtml = "";
										
										$.each(data, function(index, item) {
											
											addHtml += '<div class="single-comment" style="margin-left: ' + 25 * item.depth + 'px;">' +
														'<div class="comment-author">' +
														'<img src="/resources/image/uploadFiles/' + item.user.profileImage + '" class="avatar" alt="">' +
														'		<cite>' + item.user.nickName + '</cite>' +
														'		<span class="says">says</span>' +
														'</div>' +
														'<div class="comment-meta">' +
														'	<time datetime="' + item.commentRegDate + '">' + item.commentRegDate + '</time> / '
														if(item.depth < 2) {
															addHtml += '<a class="btn_createRecomment">Reply</a>'
														}
														
														if(sessionUser == item.user.userId) {
															addHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>' +
																		' &nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment" aria-hidden="true"></span>'
														}
														
														addHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign commentReport" aria-hidden="true"></span>'
																
														if(item.heartCondition != 0) {
															addHtml += '<div class="heartPosition">' +
																		'<img class="deleteCommentHeart" src="/resources/image/uploadFiles/heart.jpg" />' +
																		'<div class="heartCountPosition">' +
																		item.commentHeartCount +
																		'</div>' +
																		'</div>'
														} else {
															addHtml += '<div class="heartPosition">' +
																		'<img class="addCommentHeart" src="/resources/image/uploadFiles/no_heart.jpg" />' +
																		'<div class="heartCountPosition">' +
																		item.commentHeartCount +
																		'</div>' +
																		'</div>'
														}
														
														addHtml += '</div>'
														
														if(item.reportCondition == 0) {
															addHtml += '<p class="commentContent">' + item.commentContent + '</p>'
														} else {
															addHtml += '<p class="commentContent">관리자에 의해 삭제된 댓글입니다.</p>'
														}
														
														addHtml += '<form class="commentInfo">' +
																	'<input type="hidden" name="reportSource" value="4">' +
																	'<input type="hidden" name="sourceNumber" value="' + item.feedCommentNo + '">' +
																	'<input type="hidden" name="user2" value="' + item.user.userId + '">' +
																	'<input type="hidden" name="source" value="1">' +
																	'<input type="hidden" name="userId" value="' + sessionUser + '">' +
																	'<input type="hidden" name="feedNo" value="' + ${feed.feedNo} + '">' +
																	'<input type="hidden" name="feedCommentNo" value="' + item.feedCommentNo + '">' +
																	'<input type="hidden" name="parent" value="' + item.parent + '">' +
																	'<input type="hidden" name="depth" value="' + item.depth + '">' +
																	'<input type="hidden" name="sequence" value="' + item.sequence + '">' +
																	'</form>' +
																	'<div class="btn_recommentCheck" style="display: none;">' +
																	'<textarea name="commentContent" placeholder="작성"></textarea>' +
																	'<button class="btn btn-primary btn_addRecomment" type="button">SUBMIT</button>' +
																	'</div>' +
																	'</div>' +
																	'</li>' +
																	'</ul>' +
																	'</div>'
											
										}) // each close
										
										if(addHtml == "") {
											$("#pageFlag").val(false);
										} else {
											$(addHtml).appendTo($(".comment:last"));
											$("#currentPage").val( parseInt($("#currentPage").val()) + 1 );
											
										}
										
									} // success close
										
								} // ajax inner close
						
						) // ajax close
						
					} // 무한 스크롤 조건 if문 종료
					
				} // flag 확인 close
					
			}) // 스크롤 이벤트 종료
						
			
			// 댓글 달기
			
			$(document).on("click", ".btn_addComment", function(event) {
				event.stopPropagation();
				
				var sessionUser = $(this).siblings("input[name='userId']").val();
				var changePoint = $(this).parents("#feedInfo").siblings(".comment-section").find(".comment");
				var commentCount = $(this).parents(".section").find(".commentCount");
				var htmlSequence = $(this).siblings("input[name='sequence']");
				
				var content =  $(this).siblings("textarea[name='commentContent']").val();
				
				console.log("댓글 수 : " + $(this).parents(".section").find(".commentCount").text().trim());
				console.log("댓글 작성자 : " + $(this).siblings("input[name='userId']").val());
				console.log("피드 번호 : " + $(this).siblings("input[name='feedNo']").val());
				console.log("내용 : " + $(this).siblings("textarea[name='mainCommentContent']").val());
				console.log("부모 번호 : " + $(this).siblings("input[name='parent']").val());
				console.log("깊이 : " + $(this).siblings("input[name='depth']").val());
				console.log("시퀀시 : " + $(this).siblings("input[name='sequence']").val());
				
				var cPage = $("#currentPage").val();
				var feedNumber = $(this).siblings("input[name='feedNo']").val();
				var feedWriter = $(this).parents("#feedInfo").find("input[name='user2']").val();
				
				if(content == "") {
					Swal.fire({
						  title: '내용을 입력하세요',
						  width: 400,
						  icon: 'warning',
						  timer : 500,
						  showConfirmButton : false,
					})
					
					return false;
				} else {
					
					$.ajax(
							{
								url : "/feedRest/json/addFeedComment",
								method : "POST",
								data : JSON.stringify ({
									userId : $(this).siblings("input[name='userId']").val(),
									feedNo : $(this).siblings("input[name='feedNo']").val(),
									commentContent : $(this).siblings("textarea[name='mainCommentContent']").val(),
									parent : $(this).siblings("input[name='parent']").val(),
									depth : $(this).siblings("input[name='depth']").val(),
									sequence : parseInt($(this).siblings("input[name='sequence']").val()),
									currentPage : cPage
								}),
								contentType: 'application/json',
								dataType : "json",
								header : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								}, // header end
								
								success : function(data, status) {
									
									$(this).siblings("input[name='sequence']").val($("input[name='sequence']").val() + 1);
									
									var changeHtml = "";
									
									$.each(data, function(index, item) {
										
										var depth = parseInt(item.depth) * 25; 
										
										changeHtml += '<div class="single-comment" style="margin-left: ' + depth + 'px;">' +
										'<div class="comment-author">' +
										'<img src="/resources/image/uploadFiles/' + item.user.profileImage + '" class="avatar" alt="">' +
										'<cite>' + item.user.nickName + '</cite>' +
										'<span class="says"> says</span>' +
										'</div>' +
										'<div class="comment-meta">' +
										'<time datetime="' + item.commentRegDate + '" + >' + item.commentRegDate + '</time> / ';
										
										if(item.depth < 2) {
											changeHtml += '<a class="btn_createRecomment">Reply</a>'
										}
										
										if(sessionUser == item.user.userId) {
											changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>'
											changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment" aria-hidden="true"></span>'
										}
										
										changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>'
										
										if(item.heartCondition == 0) {
											changeHtml +=	'<div class="heartPosition">' +
															'	<img class="addCommentHeart" src="/resources/image/uploadFiles/no_heart.jpg" />' +
															'	<div class="heartCountPosition">' +
															item.commentHeartCount + 
															'	</div>' +
															'</div>'
										} else {
											changeHtml +=	'<div class="heartPosition">' + 
															'	<img class="deleteCommentHeart" src="/resources/image/uploadFiles/heart.jpg" />' +
															'	<div class="heartCountPosition">' +
															item.commentHeartCount + 
															'	</div>' +
															'</div>'
										}
										
										changeHtml += '</div>' + 
											'<p class="commentContent">' + item.commentContent + '</p>' +
											'<div class="commentInfo">' +
											'<input type="hidden" name="source" value="1">' +
											'<input type="hidden" name="userId" value="' + sessionUser + '">' +
											'<input type="hidden" name="feedNo" value="' + ${feed.feedNo} + '">' +
											'<input type="hidden" name="feedCommentNo" value="' + item.feedCommentNo + '">' +
											'<input type="hidden" name="parent" value="' + item.parent + '">' +
											'<input type="hidden" name="depth" value="' + item.depth + '">' +
											'<input type="hidden" name="sequence" value="' + item.sequence + '">' +
											'</div>' +
											'<div class="btn_recommentCheck" style="display: none;" >' +
											'<textarea style="width:427px; resize:none;" name="commentContent" placeholder="작성"></textarea>' +
											'<button class="btn btn-primary btn_addRecomment" type="button">SUBMIT</button>' +
											'</div>' +
											'</div>'
										
									}) // $.each close 
									
									console.log(changeHtml);
									$(changePoint).html(changeHtml);
									$(commentCount).text( parseInt( $(commentCount).text() ) + 1 );
									$(htmlSequence).val( parseInt($(htmlSequence).val()) + 1);
									$("textarea[name='mainCommentContent']").val('');
									
									if(sock) {
										var Msg = "feedComment," + feedWriter + "," + feedNumber + ", 가 댓글을 작성했습니다.";

										sock.send(Msg);
									}
									
								} // success end
								
							} // ajax inner close
							
					) // ajax close
				
				} // 유효성 검사
				
			}); // btn_addComment event close
			
			// 피드 수정
			
			$(document).on("click", "#updateFeed", function(event) {
				event.stopPropagation();
				console.log("피드 수정");
				
				$('#updateModal').modal();
			})
			
			
			$(document).on("click", ".btn_updateFeed", function(event) {
				console.log("수정하기");
				$("#updateFeedForm").attr("method", "POST").attr("accept-charset", "EUC-KR").attr("action", "/feed/updateFeed").submit();
			})

			
			
			// 피드 삭제
			
			$(document).on("click", "#deleteFeed", function(event) {
				event.stopPropagation();
				console.log("피드 삭제");
				
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
						$("form").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
						
					}
				})
				
			})
			
			
			
			// Reply 버튼 클릭 -> 대댓글 작성 공간 생성
			
			$(document).on("click", ".btn_createRecomment", function(event){	
				event.stopPropagation();
				
				var view = $(this).parents(".single-comment").find(".btn_recommentCheck");
		
				if ($(view).css('display') == 'none') {
					
					$(view).show();
					
				} else {
					
					$(view).hide();
					
				}
				
			}); // btn_createRecomment event close
			
			
			
			// 대댓글 작성
			
			$(document).on("click", ".btn_addRecomment", function(event){
				event.stopPropagation();
				
				console.log($(this).parents().siblings(".commentInfo").find("input[name='userId']").val()) 
				console.log($(this).parents(".comment-section").siblings("#feedInfo").find("input[name='sequence']").val());
				console.log($(this).prev().val())
				
				var feedNumber = parseInt($(this).parents().siblings(".commentInfo").find("input[name='feedNo']").val())
				var parentValue = parseInt($(this).parents().siblings(".commentInfo").find("input[name='feedCommentNo']").val())
				var depthValue = parseInt($(this).parents().siblings(".commentInfo").find("input[name='depth']").val()) + 1;
				var sequenceValue = parseInt($(this).parents().siblings(".commentInfo").find("input[name='sequence']").val()) + 1;
				var content = $(this).prev().val();
				var commentCount = $(this).parents(".comment-section").siblings(".lastBar").find(".commentCount")
				
				var changePoint = $(this).parents(".comment");
				var sessionUser = $(this).parents().siblings(".commentInfo").find("input[name='userId']").val();
				
				var htmlSequence = $(this).parents(".comment-section").siblings("#feedInfo").find("input[name='sequence']");
				var cPage = $("#currentPage").val();
				
				var feedWriter = $(this).parents().siblings("#feedInfo").find("input[name='user2']").val();
				
				if(content == "" || content == " ") {
					swal.fire("내용을 입력하세요");
					return false;
				}
				
				$.ajax(
						{
							url : "/feedRest/json/addFeedComment",
							method : "POST",
							data : JSON.stringify ({
								userId : sessionUser,
								feedNo : feedNumber,
								commentContent :content,
								parent : parentValue,
								depth : depthValue,
								sequence : sequenceValue,
								currentPage : cPage
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								var changeHtml = "";
								
								$.each(data, function(index, item) {
									
									var depth = parseInt(item.depth) * 25; 
									
									changeHtml += '<div class="single-comment" style="margin-left: ' + depth + 'px;">' +
									'<div class="comment-author">' +
									'<img src="/resources/image/uploadFiles/' + item.user.profileImage + '" class="avatar" alt="">' +
									'<cite>' + item.user.nickName + '</cite>' +
									'<span class="says"> says</span>' +
									'</div>' +
									'<div class="comment-meta">' +
									'<time datetime="' + item.commentRegDate + '" + >' + item.commentRegDate + '</time> / ';
									
									if(item.depth < 2) {
										changeHtml += '<a class="btn_createRecomment">Reply</a>'
									}
									
									if(sessionUser == item.user.userId) {
										changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>'
										changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment" aria-hidden="true"></span>'
									}
									
									changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>'
									
									if(item.heartCondition == 0) {
										changeHtml +=	'<div class="heartPosition">' +
														'	<img class="addCommentHeart" src="/resources/image/uploadFiles/no_heart.jpg" />' +
														'	<div class="heartCountPosition">' +
														item.commentHeartCount + 
														'	</div>' +
														'</div>'
									} else {
										changeHtml +=	'<div class="heartPosition">' + 
														'	<img class="deleteCommentHeart" src="/resources/image/uploadFiles/heart.jpg" />' +
														'	<div class="heartCountPosition">' +
														item.commentHeartCount + 
														'	</div>' +
														'</div>'
									}
									
									changeHtml += '</div>' + 
										'<p class="commentContent">' + item.commentContent + '</p>' +
										'<div class="commentInfo">' +
										'<input type="hidden" name="source" value="1">' +
										'<input type="hidden" name="userId" value="' + sessionUser + '">' +
										'<input type="hidden" name="feedNo" value="' + ${feed.feedNo} + '">' +
										'<input type="hidden" name="feedCommentNo" value="' + item.feedCommentNo + '">' +
										'<input type="hidden" name="parent" value="' + item.parent + '">' +
										'<input type="hidden" name="depth" value="' + item.depth + '">' +
										'<input type="hidden" name="sequence" value="' + item.sequence + '">' +
										'</div>' +
										'<div class="btn_recommentCheck" style="display: none;" >' +
										'<textarea style="width:427px; resize:none;" name="commentContent" placeholder="작성"></textarea>' +
										'<button class="btn btn-primary btn_addRecomment" type="button">SUBMIT</button>' +
										'</div>' +
										'</div>'
									
								}) // $.each close 
								
								// console.log(changeHtml);
								$(changePoint).html(changeHtml);
								$(content).text( parseInt( $(content).text() ) + 1 );
								$(htmlSequence).val( parseInt($(htmlSequence).val()) + 1);
								
								$(commentCount).text(parseInt( $(commentCount).text() ) + 1);
								
								if(sock) {
									var Msg = "feedComment," + feedWriter + "," + feedNumber + ", 가 댓글을 작성했습니다.";
									console.log(Msg);
									sock.send(Msg);
								}
								
							} // success end
							
						} // $.ajax inner close
						
				) // $.ajax close
			
			}); // .btn_addRecomment event close
			
			
			
			// 댓글 수정 화면 띄우기 
			
			$(document).on("click", ".updateCommentView", function(event) {
				event.stopPropagation();
		
				console.log("피드 번호 : " + ${feed.feedNo} + " 댓글 번호 : " + $(this).parent().siblings(".commentInfo").find("input[name='feedCommentNo']").val());
				
				var changePoint = $(this).parent().siblings(".commentContent");
				var commentNo = $(this).parent().siblings(".commentInfo").find("input[name='feedCommentNo']").val();
				var sessionUser = $(this).parent().siblings(".commentInfo").find("input[name='userId']").val();
				var depth = $(this).parent().siblings(".commentInfo").find("input[name='depth']").val();
				
				var cPage = $("#currentPage").val();
				
				if($(this).parents(".single-comment").next(".single-comment").find("input[name='depth']").val() > $(this).parents(".single-comment").find("input[name='depth']").val() ) {
					
					Swal.fire({
						  title: '수정 불가능 합니다',
						  width: 500,
						  icon: 'warning',
						  timer : 500,
						  showConfirmButton : false,
					})
					
					return false;
				}
				
				$.ajax (
						
						{
							url : "/feedRest/json/getFeedComment",
							method : "POST",
							data : JSON.stringify ({
								feedNo : ${feed.feedNo},
								feedCommentNo : commentNo,
								currentPage : cPage
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								var width = 427 - (parseInt(depth) * 50);
								
								var changeHtml = "<textarea style='width:" + width + "px; resize:none;' name='commentContent'>" + data.commentContent + "</textarea>" +
													"<button class='btn btn-primary updateFeedComment' type='button'>UPDATE</button>" + 
													"<button class='btn btn-primary cancel' name='updateCommentCancel' type='button'>CANCEL</button>";
													
								$(changePoint).html(changeHtml);
								
								
								
								// 댓글 수정 클릭시 이벤트 걸기
													
								$(document).on("click", ".updateFeedComment", function(){
									
									var wantComment = $(this).prev().val();
									var changePoint = $(this).parents(".comment");
									
									$.ajax(
												{
													url : "/feedRest/json/updateFeedComment",
													method : "POST",
													data : JSON.stringify ({
														feedNo : ${feed.feedNo},
														feedCommentNo : commentNo,
														commentContent : wantComment
													}),
													contentType: 'application/json',
													dataType : "json",
													header : {
														"Accept" : "application/json",
														"Content-Type" : "application/json"
													}, // header end
													
													success : function(data, status) {
														
														var changeHtml = "";
														
														$.each(data, function(index, item) {
															
															var depth = parseInt(item.depth) * 25; 
															
															changeHtml += '<div class="single-comment" style="margin-left: ' + depth + 'px;">' +
															'<div class="comment-author">' +
															'<img src="/resources/image/uploadFiles/' + item.user.profileImage + '" class="avatar" alt="">' +
															'<cite>' + item.user.nickName + '</cite>' +
															'<span class="says"> says</span>' +
															'</div>' +
															'<div class="comment-meta">' +
															'<time datetime="' + item.commentRegDate + '" + >' + item.commentRegDate + '</time> / ';
															
															if(item.depth < 2) {
																changeHtml += '<a class="btn_createRecomment">Reply</a>'
															}
															
															if(sessionUser == item.user.userId) {
																changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>'
																changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment" aria-hidden="true"></span>'
															}
															
															changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>'
															
															if(item.heartCondition == 0) {
																changeHtml +=	'<div class="heartPosition">' +
																				'	<img class="addCommentHeart" src="/resources/image/uploadFiles/no_heart.jpg" />' +
																				'	<div class="heartCountPosition">' +
																				item.commentHeartCount + 
																				'	</div>' + 
																				'</div>'
															} else {
																changeHtml +=	'<div class="heartPosition">' + 
																				'	<img class="deleteCommentHeart" src="/resources/image/uploadFiles/heart.jpg" />' +
																				'	<div class="heartCountPosition">' +
																				item.commentHeartCount + 
																				'	</div>' +
																				'</div>'
															}
															
															changeHtml += '</div>' + 
																'<p class="commentContent">' + item.commentContent + '</p>' +
																'<div class="commentInfo">' +
																'<input type="hidden" name="source" value="1">' +
																'<input type="hidden" name="userId" value="' + sessionUser + '">' +
																'<input type="hidden" name="feedNo" value="' + ${feed.feedNo} + '">' +
																'<input type="hidden" name="feedCommentNo" value="' + item.feedCommentNo + '">' +
																'<input type="hidden" name="parent" value="' + item.parent + '">' +
																'<input type="hidden" name="depth" value="' + item.depth + '">' +
																'<input type="hidden" name="sequence" value="' + item.sequence + '">' +
																'</div>' +
																'<div class="btn_recommentCheck" style="display: none;" >' +
																'<textarea style="width:427px; resize:none;" name="commentContent" placeholder="작성"></textarea>' +
																'<button class="btn btn-primary btn_addRecomment" type="button">SUBMIT</button>' +
																'</div>' +
																'</div>'
															
														}) // $.each close 
														
														console.log(changeHtml);
														$(changePoint).html(changeHtml);
														
													} // success close
													
												} // ajax inner close
													
									) // updateFeedComment ajax close;
									
								}) // updateFeedComment event close
								
							} // success close
							
						} // updateCommentView ajax close
						
				) // ajax close
				
			}) // updateCommentView event close
			
			
			// 댓글 수정 화면에서 cancel을 눌렀을 경우
			
			$(document).on("click", "button[name='updateCommentCancel']", function(event) {
				
				var sessionUser = '${sessionScope.user.userId}';
				
				$.ajax(
						{
							url : "/feedRest/json/getFeedCommentList",
							method : "POST",
							data : JSON.stringify ({
								userId : sessionUser,
								feedNo : ${feed.feedNo},
								currentPage : parseInt($("#currentPage").val()),
								checkComment : 1
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								console.log("성공요");
								
								var addHtml = "";
								
								$.each(data, function(index, item) {
									
									var depth = parseInt(item.depth) * 25; 
									
									addHtml += '<div class="single-comment" style="margin-left: ' + depth + 'px;">' +
												'<div class="comment-author">' +
												'<img src="/resources/image/uploadFiles/' + item.user.profileImage + '" class="avatar" alt="">' +
												'		<cite>' + item.user.nickName + '</cite>' +
												'		<span class="says">says</span>' +
												'</div>' +
												'<div class="comment-meta">' +
												'	<time datetime="' + item.commentRegDate + '">' + item.commentRegDate + '</time> / '
												if(item.depth < 2) {
													addHtml += '<a class="btn_createRecomment">Reply</a>'
												}
												
												if(sessionUser == item.user.userId) {
													addHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>' +
																' &nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment" aria-hidden="true"></span>'
												}
												
												addHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign commentReport" aria-hidden="true"></span>'
														
												if(item.heartCondition != 0) {
													addHtml += '<div class="heartPosition">' +
																'<img class="deleteCommentHeart" src="/resources/image/uploadFiles/heart.jpg" />' +
																'<div class="heartCountPosition">' +
																item.commentHeartCount +
																'</div>' +
																'</div>'
												} else {
													addHtml += '<div class="heartPosition">' +
																'<img class="addCommentHeart" src="/resources/image/uploadFiles/no_heart.jpg" />' +
																'<div class="heartCountPosition">' +
																item.commentHeartCount +
																'</div>' +
																'</div>'
												}
												
												addHtml += '</div>'
												
												if(item.reportCondition == 0) {
													addHtml += '<p class="commentContent">' + item.commentContent + '</p>'
												} else {
													addHtml += '<p class="commentContent">관리자에 의해 삭제된 댓글입니다.</p>'
												}
												
												addHtml += '<form class="commentInfo">' +
															'<input type="hidden" name="reportSource" value="4">' +
															'<input type="hidden" name="sourceNumber" value="' + item.feedCommentNo + '">' +
															'<input type="hidden" name="user2" value="' + item.user.userId + '">' +
															'<input type="hidden" name="source" value="1">' +
															'<input type="hidden" name="userId" value="' + sessionUser + '">' +
															'<input type="hidden" name="feedNo" value="' + ${feed.feedNo} + '">' +
															'<input type="hidden" name="feedCommentNo" value="' + item.feedCommentNo + '">' +
															'<input type="hidden" name="parent" value="' + item.parent + '">' +
															'<input type="hidden" name="depth" value="' + item.depth + '">' +
															'<input type="hidden" name="sequence" value="' + item.sequence + '">' +
															'</form>' +
															'<div class="btn_recommentCheck" style="display: none;">' +
															'<textarea name="commentContent" placeholder="작성"></textarea>' +
															'<button class="btn btn-primary btn_addRecomment" type="button">SUBMIT</button>' +
															'</div>' +
															'</div>' +
															'</li>' +
															'</ul>' +
															'</div>'
									
								}) // each close
								
								$("li.comment").html(addHtml);
								
							} // success close
								
						} // ajax inner close
				
				) // ajax close
				
			})
			
			
			
			// 댓글 삭제
			
			$(document).on("click", ".deleteComment", function(event) {
				event.stopPropagation();
				
				console.log("[삭제 요청] 피드 번호 : " + ${feed.feedNo} + " 댓글 번호 : " + $(this).parent().siblings(".commentInfo").find("input[name='feedCommentNo']").val());
				
				var commentNo = $(this).parent().siblings(".commentInfo").find("input[name='feedCommentNo']").val();
				var wantComment = $(this).prev().val();
				var changePoint = $(this).parents(".comment");
				var sessionUser = $(this).parent().siblings(".commentInfo").find("input[name='userId']").val();
				var commentCount = $(this).parents(".section").find(".commentCount");
				var htmlSequence = $(this).parents(".comment-section").siblings("#feedInfo").find("input[name='sequence']");
				
				Swal.fire({
					  title: '댓글을 삭제하시겠습니까?',
					  text: "삭제하시면 다시 복구시킬 수 없습니다.",
					  width: 500,
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '삭제',
					  cancelButtonText: '취소'
				}).then((result) => {
					
					if($(this).parents(".single-comment").next(".single-comment").find("input[name='depth']").val() > 0) {
						
						Swal.fire({
							  title: '댓글이 있어 삭제할 수 없습니다.',
							  width: 500,
							  icon: 'warning',
							  timer : 500,
							  showConfirmButton : false,
						})
						
						return false;
					}
					
					
					if (result.value) {
						$.ajax(
								{
									url : "/feedRest/json/deleteFeedComment",
									method : "POST",
									data : JSON.stringify ({
										userId : sessionUser,
										feedNo : ${feed.feedNo},
										feedCommentNo : commentNo,
										commentContent : wantComment,
										currentPage : $("#currentPage").val()
									}),
									contentType: 'application/json',
									dataType : "json",
									header : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									}, // header end
									
									success : function(data, status) {
		
										var changeHtml = "";
										
										$.each(data, function(index, item) {
											
											var depth = parseInt(item.depth) * 25; 
											
											changeHtml += '<div class="single-comment" style="margin-left: ' + depth + 'px;">' +
											'<div class="comment-author">' +
											'<img src="/resources/image/uploadFiles/' + item.user.profileImage + '" class="avatar" alt="">' +
											'<cite>' + item.user.nickName + '</cite>' +
											'<span class="says"> says</span>' +
											'</div>' +
											'<div class="comment-meta">' +
											'<time datetime="' + item.commentRegDate + '" + >' + item.commentRegDate + '</time> / ';
											
											if(item.depth < 2) {
												changeHtml += '<a class="btn_createRecomment">Reply</a>'
											}
											
											if(sessionUser == item.user.userId) {
												changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>'
												changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment" aria-hidden="true"></span>'
											}
											
											changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>'
											
											if(item.heartCondition == 0) {
												changeHtml +=	'<div class="heartPosition">' +
																'	<img class="addCommentHeart" src="/resources/image/uploadFiles/no_heart.jpg" />' +
																'	<div class="heartCountPosition">' +
																item.commentHeartCount + 
																'	</div>' +
																'</div>'
											} else {
												changeHtml +=	'<div class="heartPosition">' + 
																'	<img class="deleteCommentHeart" src="/resources/image/uploadFiles/heart.jpg" />' +
																'	<div class="heartCountPosition">' +
																item.commentHeartCount + 
																'	</div>' +
																'</div>'
											}
											
											changeHtml += '</div>' + 
												'<p class="commentContent">' + item.commentContent + '</p>' +
												'<div class="commentInfo">' +
												'<input type="hidden" name="source" value="1">' +
												'<input type="hidden" name="userId" value="' + sessionUser + '">' +
												'<input type="hidden" name="feedNo" value="' + ${feed.feedNo} + '">' +
												'<input type="hidden" name="feedCommentNo" value="' + item.feedCommentNo + '">' +
												'<input type="hidden" name="parent" value="' + item.parent + '">' +
												'<input type="hidden" name="depth" value="' + item.depth + '">' +
												'<input type="hidden" name="sequence" value="' + item.sequence + '">' +
												'</div>' +
												'<div class="btn_recommentCheck" style="display: none;" >' +
												'<textarea style="width:427px; resize:none;" name="commentContent" placeholder="작성"></textarea>' +
												'<button class="btn btn-primary btn_addRecomment" type="button">SUBMIT</button>' +
												'</div>' +
												'</div>'
											
										}) // $.each close 
										
										console.log(changeHtml);
										$(changePoint).html(changeHtml);
										$(commentCount).text( parseInt( $(commentCount).text() ) - 1 );
										$(htmlSequence).val( parseInt($(htmlSequence).val()) - 1);
		
									} // success close
									
								} // ajax inner close
									
						) // deleteComment ajax close;
						
					}
					
				}) // swal fire 종료
				
			}) // deleteComment event close
			
			
			
			// 댓글 좋아요 
			
			$(document).on("click", ".addCommentHeart", function(event){
				
				event.stopPropagation();
				console.log($(this).parent().parent().siblings(".commentInfo").find("input[name='feedCommentNo']").val());
				var commentNo = $(this).parent().parent().siblings(".commentInfo").find("input[name='feedCommentNo']").val();
				var changePoint = $(this).parent().parents(".comment");
				var sessionUser = $(this).parent().parent().siblings(".commentInfo").find("input[name='userId']").val();
				
				console.log(commentNo);
				
				$.ajax(
						{
							url : "/feedRest/json/addFeedCommentHeart",
							method : "POST",
							data : JSON.stringify ({
								feedCommentNo : commentNo,
								userId : sessionUser,
								currentPage : parseInt($("#currentPage").val())
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								console.log("조아요");
								
								var changeHtml = "";
								
								$.each(data, function(index, item) {
									
									var depth = parseInt(item.depth) * 25; 
									
									changeHtml += '<div class="single-comment" style="margin-left: ' + depth + 'px;">' +
									'<div class="comment-author">' +
									'<img src="/resources/image/uploadFiles/' + item.user.profileImage + '" class="avatar" alt="">' +
									'<cite>' + item.user.nickName + '</cite>' +
									'<span class="says"> says</span>' +
									'</div>' +
									'<div class="comment-meta">' +
									'<time datetime="' + item.commentRegDate + '" + >' + item.commentRegDate + '</time> / ';
									
									if(item.depth < 2) {
										changeHtml += '<a class="btn_createRecomment">Reply</a>'
									}
									
									if(sessionUser == item.user.userId) {
										changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>'
										changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment" aria-hidden="true"></span>'
									}
									
									changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>'
									
									if(item.heartCondition == 0) {
										changeHtml +=	'<div class="heartPosition">' +
														'	<img class="addCommentHeart" src="/resources/image/uploadFiles/no_heart.jpg" />' +
														'	<div class="heartCountPosition">' +
														item.commentHeartCount + 
														'	</div>' +
														'</div>'
									} else {
										changeHtml +=	'<div class="heartPosition">' + 
														'	<img class="deleteCommentHeart" src="/resources/image/uploadFiles/heart.jpg" />' +
														'	<div class="heartCountPosition">' +
														item.commentHeartCount + 
														'	</div>' +
														'</div>'
									}
									
									changeHtml += '</div>' + 
										'<p class="commentContent">' + item.commentContent + '</p>' +
										'<div class="commentInfo">' +
										'<input type="hidden" name="source" value="1">' +
										'<input type="hidden" name="userId" value="' + sessionUser + '">' +
										'<input type="hidden" name="feedNo" value="' + ${feed.feedNo} + '">' +
										'<input type="hidden" name="feedCommentNo" value="' + item.feedCommentNo + '">' +
										'<input type="hidden" name="parent" value="' + item.parent + '">' +
										'<input type="hidden" name="depth" value="' + item.depth + '">' +
										'<input type="hidden" name="sequence" value="' + item.sequence + '">' +
										'</div>' +
										'<div class="btn_recommentCheck" style="display: none;" >' +
										'<textarea style="width:427px; resize:none;" name="commentContent" placeholder="작성"></textarea>' +
										'<button class="btn btn-primary btn_addRecomment" type="button">SUBMIT</button>' +
										'</div>' +
										'</div>'
									
								}) // $.each close 
								
								console.log(changeHtml);
								$(changePoint).html(changeHtml);
								
							} // success close
							
						} // ajax inner close
						
				) // ajax close
				
			}) // .addCommentHeart event close
			
			
			
			// 댓글 싫어요
			
			$(document).on("click", ".deleteCommentHeart", function(event) {
				
				event.stopPropagation();
				
				var commentNo = $(this).parent().parent().siblings(".commentInfo").find("input[name='feedCommentNo']").val();
				var changePoint = $(this).parent().parents(".comment");
				var sessionUser = $(this).parent().parent().siblings(".commentInfo").find("input[name='userId']").val();
				
				console.log(commentNo);
				
				$.ajax(
						{
							url : "/feedRest/json/deleteCommentHeart",
							method : "POST",
							data : JSON.stringify ({
								feedCommentNo : commentNo,
								userId : sessionUser,
								currentPage : parseInt($("#currentPage").val())
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								var changeHtml = "";
								
								$.each(data, function(index, item) {
									
									var depth = parseInt(item.depth) * 25; 
									
									changeHtml += '<div class="single-comment" style="margin-left: ' + depth + 'px;">' +
									'<div class="comment-author">' +
									'<img src="/resources/image/uploadFiles/' + item.user.profileImage + '" class="avatar" alt="">' +
									'<cite>' + item.user.nickName + '</cite>' +
									'<span class="says"> says</span>' +
									'</div>' +
									'<div class="comment-meta">' +
									'<time datetime="' + item.commentRegDate + '" + >' + item.commentRegDate + '</time> / ';
									
									if(item.depth < 2) {
										changeHtml += '<a class="btn_createRecomment">Reply</a>'
									}
									
									if(sessionUser == item.user.userId) {
										changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>'
										changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment" aria-hidden="true"></span>'
									}
									
									changeHtml += ' &nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>'
									
									if(item.heartCondition == 0) {
										changeHtml +=	'<div class="heartPosition">' +
														'	<img class="addCommentHeart" src="/resources/image/uploadFiles/no_heart.jpg" />' +
														'	<div class="heartCountPosition">' +
														item.commentHeartCount + 
														'	</div>' +
														'</div>'
									} else {
										changeHtml +=	'<div class="heartPosition">' + 
														'	<img class="deleteCommentHeart" src="/resources/image/uploadFiles/heart.jpg" />' +
														'	<div class="heartCountPosition">' +
														item.commentHeartCount + 
														'	</div>' +
														'</div>'
									}
									
									changeHtml += '</div>' + 
										'<p class="commentContent">' + item.commentContent + '</p>' +
										'<div class="commentInfo">' +
										'<input type="hidden" name="source" value="1">' +
										'<input type="hidden" name="userId" value="' + sessionUser + '">' +
										'<input type="hidden" name="feedNo" value="' + ${feed.feedNo} + '">' +
										'<input type="hidden" name="feedCommentNo" value="' + item.feedCommentNo + '">' +
										'<input type="hidden" name="parent" value="' + item.parent + '">' +
										'<input type="hidden" name="depth" value="' + item.depth + '">' +
										'<input type="hidden" name="sequence" value="' + item.sequence + '">' +
										'</div>' +
										'<div class="btn_recommentCheck" style="display: none;" >' +
										'<textarea style="width:427px; resize:none;" name="commentContent" placeholder="작성"></textarea>' +
										'<button class="btn btn-primary btn_addRecomment" type="button">SUBMIT</button>' +
										'</div>' +
										'</div>'
									
								}) // $.each close 
								
								console.log(changeHtml);
								$(changePoint).html(changeHtml);
								
							} // success close
							
						} // ajax inner close
						
				) // ajax close
				
			}) // .deleteCommentHeart event close
			
			
			
			// 피드 좋아요
			
			$(document).on("click", ".feedLike", function(event) {
				
				event.stopPropagation();
				
				var sessionUser = $(this).parents(".section").siblings("#feedInfo").find("input[name='userId']").val();
				var feedNumber = $(this).parents(".section").siblings("#feedInfo").find("input[name='feedNo']").val();
				var changePointCount = $(this).parent().siblings(".likeCount");
				var changePointHeart = $(this).parent();
				
				$.ajax(
						{
							url : "/feedRest/json/addFeedHeart",
							method : "POST",
							data : JSON.stringify ({
								userId : sessionUser,
								source : 0,
								sourceNo : feedNumber,
								feedNo : feedNumber
							}),
							contentType : 'application/json',
							dataType : 'json',
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								$(changePointCount).text( parseInt($(changePointCount).text().trim()) + 1 );
								$(changePointHeart).html( '<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" width="30" height="30" style="margin-top : 0px;" />' );
							}
							
						} // ajax inner close
				
				) // ajax close
				
			}); // .feedLike event close
			
			
			// 피드 싫어요
			
			$(document).on("click", ".feedDislike", function(event) {
				
				event.stopPropagation();
				
				var sessionUser = $(this).parents(".section").siblings("#feedInfo").find("input[name='userId']").val();
				var feedNumber = $(this).parents(".section").siblings("#feedInfo").find("input[name='feedNo']").val();
				var changePointCount = $(this).parent().siblings(".likeCount");
				var changePointHeart = $(this).parent();
				
				$.ajax(
						{
							url : "/feedRest/json/deleteFeedHeart",
							method : "POST",
							data : JSON.stringify ({
								userId : sessionUser,
								source : 0,
								sourceNo : feedNumber,
								feedNo : feedNumber
							}),
							contentType : 'application/json',
							dataType : 'json',
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								$(changePointCount).text( parseInt($(changePointCount).text().trim()) - 1 );
								$(changePointHeart).html( '<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" width="30" height="30" style="margin-top : 0px;" />' );
							}
							
						} // ajax inner close
				
				) // ajax close
				
			}); // .feedDislike event close
			
			
			
			// 피드 신고
			
			$(document).on("click", ".report", function(event) {
				
				// $(this).parents(".section").siblings("#feedInfo").attr("method", "POST").attr("action", "/serviceCenter/addReport").submit();
				
				var reportedUser = $(this).parents(".lastBar").siblings("#feedInfo").find("input[name='user2']").val();
				var feedNo = $(this).parents(".lastBar").siblings("#feedInfo").find("input[name='feedNo']").val();
				
				console.log(reportedUser + "  " + feedNo);
				
				$("#user2").val(reportedUser);
				$("#No").val(feedNo);
				$("#reportSource").val(3);
				$(".reportSourceDivSource").val("피드");
				
				$('#reportModal').modal();
				
			}) // .report evenet close
			
			
			
			// 댓글 신고
			
			$(document).on("click", ".commentReport", function(event) {
				
				// $(this).parents(".comment-meta").siblings(".commentInfo").attr("method", "POST").attr("action", "/serviceCenter/addReport").submit();
				
				var reportedUser = $(this).parents(".comment-meta").siblings(".commentInfo").find("input[name='user2']").val();
				var feedCommentNo = $(this).parents(".comment-meta").siblings(".commentInfo").find("input[name='feedCommentNo']").val();
				
				console.log(reportedUser + "  " + feedCommentNo);
				
				$("#user2").val(reportedUser);
				$("#No").val(feedCommentNo);
				$("#reportSource").val(4);
				$(".reportSourceDivSource").val("피드댓글");
				
				$('#reportModal').modal();
				
			}) // .report evenet close
			
			$(document).on("click", "button:contains('등록')", function(event) {
				event.stopPropagation();
				
				fncAddReport();
			})
			
		}) // jquery end
	
	</script>
	
	<style>
	

	
	.main{
		height:100vh;
		width:100%;  
		display:flex;
		align-items:center;
		justify-content:center;
		text-align:center;
	}
	
	h3{
		text-align:center;
		text-transform: uppercase;
		color: #F1FAEE; 
		font-size: 4rem;
		margin-top: 15px !important;
		margin-bottom: 15px !important;
	}

	.roller{
		height: 3.125rem;
    	line-height: 3.9rem;
		position: relative;
		overflow: hidden; 
		width: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		color: #1D3557;
	}

	#spare-time{
		font-size: 1rem;
		letter-spacing: 1rem;
		margin-top: 0;
		color: #A8DADC;
	}

	.roller #rolltext {
		position: absolute;
		top: 0;
		animation: slide 10s infinite;  
	}

	@keyframes slide {
		0%{
			top:0;
		}
		25%{
			top: -4rem;    
		}
		50%{
			top: -8rem;
		}
		72.5%{
			top: -12.25rem;
		}
	}

@media screen and (max-width: 600px){
	h3{
		text-align:center;
		text-transform: uppercase;
		color: #F1FAEE; 
		font-size: 1.125rem !important;
	}
  
	.roller{
		height: 2.6rem; 
		line-height: 2.125rem;  
	}
  
	.roller #rolltext {  
		animation: slide-mob 10s infinite;  
	}

	@keyframes slide-mob {
		0%{
			top:0;
		}
		25%{
			top: -2.125rem;    
		}
		50%{
			top: -4.25rem;
		}
		72.5%{
			top: -6.375rem;
		}
	}


	
		
		
	</style>

</head>

<body class="single single-post">

	<jsp:include page="/toolbar.jsp" />

	<div id="main">

		<section class="row section">
		<div class="container">
			<div class="row-content buffer even clear-after">
			
				<div id="post-nav">
					<ul class="clear-after reset plain">
						<li id="prev-items" class="post-nav">
							<a href="#" onClick="javascript:history.go(-1); return false">
								<i class="fa fa-chevron-left"></i>
								<span class="label">Prev</span>
							</a>
						</li> 
					</ul>
				</div>
				
				<div class="column three">
					
					<button class="btn btn-primary searchPlace" type="button" onclick="window.open('http://192.168.0.21:5005/', '_blank', 'width=800, height=600, location =no,status=no, toolbar=no, scrollbars=no'); return false;">주변검색</button>
						
					<h3>오늘은:
						<div class="roller">
						<span id="rolltext">내가<br/>
											너와<br/>
											만나다<br/>
											LINK<br/>
					</div>
					</h3>
					
				</div>
				
				<div class="column six">

					<!-- 피드 내용 -->
					<div class="post-area clear-after">
					
						<div class="feedHeader">
							<div class="feedLeft">
								<div class="feedInner">
									<div class="feedCover">
										<img class="feedProfileImage" src="/resources/image/uploadFiles/${feed.user.profileImage}"/>
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
								<span class="glyphicon glyphicon-paperclip btn_update" id="updateFeed" aria-hidden="true"></span>
								<%-- 수정 버튼 --%>
							
								<%-- 삭제 버튼 --%>
								<span class="glyphicon glyphicon-trash btn_delete" id="deleteFeed" aria-hidden="true" ></span>
								<%-- 삭제 버튼 --%>
							</div>
							
							</c:if>
						</div>
							
						<div class="feedContent">
						
						<c:if test="${!empty feed.video}">
							<iframe width="560" height="315" src="http://${feed.video}"></iframe>
						</c:if>
						
						<%-- 이미지 --%>
						
							<c:if test="${!empty feed.image1}">
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
							</c:if>
							
							
							<%-- 이미지 --%>
												
							<p>${feed.content}</p>
							
						</div>
							
					</div>
					<!-- 피드 내용 -->
					
					<!-- 피드 해시태그 -->
					<c:if test="${!empty feed.hashtag}">
						<div class="hashtagContent">
							
							<c:set var="text" value="${fn:split(feed.hashtag, '#')}"/>
							
							<c:forEach var="textValue" items="${text}" varStatus="varStatus">
								<span class="searchByHashtag">
									#${textValue}
								</span>
							</c:forEach>
							
						</div>
					</c:if>
					<!-- 피드 해시태그 -->
					
					<!-- 피드 좋아요 댓글수 신고 -->
					<section class="row section lastBar">
						<div class="row">
						
							<%-- 여백 --%>
							<div class="col-xs-2"></div>
							<%-- 여백 --%>
							
							<c:if test="${feed.checkHeart eq 0}">
								<div class="col-xs-2">
									<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" width="30" height="30" style="margin-top : 0px;" />
								</div>
							</c:if>
							<c:if test="${feed.checkHeart ne 0}">
								<div class="col-xs-2">
									<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" width="30" height="30" style="margin-top : 0px;" />
								</div>
							</c:if>
							
							<div class="col-xs-1 likeCount">
								${feed.heartCount}
							</div>
							
							<div class="col-xs-2 comment">
								<img src="/resources/image/uploadFiles/comment2.jpg" aria-hidden="true"/>
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
					
					<form id="feedInfo" style="margin-top:50px;">
						<!-- 댓글 관련 hidden -->
						
						<%-- 피드 신고 --%>
						<input type="hidden" name="reportSource" value="3">
						<input type="hidden" name="sourceNumber" value="${feed.feedNo}">
						<input type="hidden" name="user2" value="${feed.user.userId}">
						<%-- 피드 신고 --%>
						
						<input type="hidden" name="source" value="0">
						<input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}">
						<input type="hidden" name="feedNo" value="${feed.feedNo}">
						
						<input type="hidden" name="parent" value="0">
						<input type="hidden" name="depth" value="0">
						<input type="hidden" name="sequence" value="${feed.commentCount}">
						<textarea name="mainCommentContent" placeholder="댓글작성"></textarea>
						<button class="btn btn-primary btn_addComment" type="button">SUBMIT</button>
						<!-- 댓글 관련 hidden -->
					</form>
					
					<div class="comment-section">
						<ul class="comment-list plain">
							<li class="comment">
							
								<c:set var="i" value="0"></c:set>
								<c:forEach var="comment" items="${commentList}">
								<c:set var="i" value="${i + 1}"></c:set>
										
								<div class="single-comment" style="margin-left:<c:out value='${25 * comment.depth}'/>px;">
								
									<div class="comment-author">
										
											<img src="/resources/image/uploadFiles/${comment.user.profileImage}" class="avatar" alt="">
											<cite>${comment.user.nickName}</cite>
											<span class="says">says</span>
										
									</div><!-- comment-author -->
									
									
									
									<div class="comment-meta">
										<time datetime="${comment.commentRegDate}">${comment.commentRegDate}</time> / <c:if test="${comment.depth lt 2}"><a class="btn_createRecomment">Reply</a></c:if>
										<c:if test="${sessionScope.user.userId eq comment.user.userId}">
											<!-- 수정 버튼 -->
											&nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>
											<!-- 수정 버튼 -->
											
											<!--  삭제 버튼 -->
											&nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment" aria-hidden="true"></span>
											<!--  삭제 버튼 -->
										</c:if>
											<!--  신고 버튼 -->
											&nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign commentReport" aria-hidden="true"></span>
											<!--  신고 버튼 -->
										<c:if test="${comment.heartCondition ne 0}">
											<div class="heartPosition">
												<img class="deleteCommentHeart" src="/resources/image/uploadFiles/heart.jpg" />
												
												<div class="heartCountPosition">
													${comment.commentHeartCount}
												</div>
											</div>
										</c:if>
										<c:if test="${comment.heartCondition eq 0}">
											<div class="heartPosition">
												<img class="addCommentHeart" src="/resources/image/uploadFiles/no_heart.jpg" />
												
												<div class="heartCountPosition">
													${comment.commentHeartCount}
												</div>
											</div>
										</c:if>
									</div><!-- comment-meta -->
									
									<c:if test="${fn:trim(comment.reportCondition) ne 0}">
										<p class="commentContent">관리자에 의해 삭제된 댓글입니다.</p>
									</c:if>
									
									<c:if test="${fn:trim(comment.reportCondition) eq 0}">
										<p class="commentContent">${comment.commentContent}</p>
									</c:if>
									
									<!-- 대댓글 관련 hidden -->
			
									<form class="commentInfo">
									
										<%-- 피드 댓글 신고 --%>
										<input type="hidden" name="reportSource" value="4">
										<input type="hidden" name="sourceNumber" value="${comment.feedCommentNo}">
										<input type="hidden" name="user2" value="${comment.user.userId}">
										<%-- 피드 댓글 신고 --%>
									
										<input type="hidden" name="source" value="1">
										<input type="hidden" name="userId" value="${sessionScope.user.userId}">
										<input type="hidden" name="feedNo" value="${feed.feedNo}">
										<input type="hidden" name="feedCommentNo" value="${comment.feedCommentNo}">
										
										<input type="hidden" name="parent" value="${comment.parent}">
										<input type="hidden" name="depth" value="${comment.depth}">
										<input type="hidden" name="sequence" value="${comment.sequence}">
										
									</form>
							
									<!-- 대댓글 관련 hidden -->
								
									<div class='btn_recommentCheck' style="display: none;">
										<textarea name='commentContent' placeholder='작성'></textarea>
										<button class="btn btn-primary btn_addRecomment" type="button">SUBMIT</button>
									</div>
								
								</div><!-- single-comment -->
								
								</c:forEach>
							</li>
						</ul>
					</div><!-- comment-section -->
					
					
				</div>
				
				<div class="column three"></div>
				
				
				<script type="text/javascript" charset="utf-8" src="/resources/javascript/myHome/followListForFeed.js"></script>

							<div class="tabs1">
								<input id="all-follow" type="radio" name="tab_item-follow" checked>
								<label class="tab_item-follow" for="all-follow">팔로우</label>
								
								<input id="programming-follow" type="radio" name="tab_item-follow">
								<label class="tab_item-following" for="programming-follow">팔로워</label>

								<div class="tab_content-follow" id="all-follow_content">
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
				
				
				
				<%-- 현재 페이지 --%>
				<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}">
				<input type="hidden" id="pageFlag" value=true>
				<%-- 현재 페이지 --%>
				
			</div>
		</div>
		</section>
	</div>
	
		<!-- 신고 Modal -->
		<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<!-- form Start /////////////////////////////////////-->
					<form class="form-horizontal" enctype="multipart/form-data" id="reportForm">
						
						<div class="reportTitleCover">
							<div class="reportTitleTitle">
								제목
							</div>
							<div class="reportTitle">
							
								<textarea class="title" id="title" name="title" maxlength="66" placeholder="신고 제목을 입력해주세요"></textarea>

							</div>

							<!--  화면구성 div end /////////////////////////////////////-->

						</div>
						
						<div class="reportContentCover">
							<div class="reportContentTitle">
								내용
							</div>
							
							<div class="reportContent">
								<textarea class="content" id="content" name="content" placeholder="신고 내용을 입력해주세요." maxlength="500"></textarea>
							</div>
						</div>
						
						<div class="reportSourceDiv">
							신고받는 ID
							<input type="text" class="reportSourceDivId" id="user2" name="user2" value="" readonly />
							신고 출처
							<input type="text" class="reportSourceDivSource" value="피드" disabled />
						</div>
						
						<input type="hidden" name="type" id="type" value="1">
						<input type="hidden" name="user1" id="user1" value="${sessionScope.user.userId}">
						<input type="hidden" id="reportSource" name="reportSource" value="">
						<input type="hidden" name="no" id="No" value="" />
						
						<div class="reportModalReason">

							<input type="checkbox" id="욕설" name="reportReason" value="1" >
								욕설
							<input type="checkbox" id="광고" name="reportReason" value="2" >
								광고
							<input type="checkbox" id="기타" name="reportReason" value="4" >
								기타
							<input type="checkbox" id="성적" name="reportReason" value="8" >
							성적인 발언

						</div>
						
					</form>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Close
						</button>
						
						<button type="button" class="btn btn-default add add5">등록</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 수정 Modal -->
		<div class="modal fade" id="updateModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
				
					<form id="updateFeedForm">
						
						<!-- 피드 내용 -->
						<div class="post-area clear-after">
						
							<article role="main">
								<div class="updateModalHeader">
									<div class="updateModalLeft">
										<div class="updateModalInner">
											<div class="updateCover">
												<img class="updateFeedProfileImage" src="/resources/image/uploadFiles/${feed.user.profileImage}" />
											</div>
												
											<div class="updateFormName">
												${feed.user.nickName}
											</div>
										</div>
										
										<div class="updateFeedDate">
											<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
											<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
										</div>
									</div>
								</div>
								
								<textarea id="summernote" name="fullContent">${feed.fullContent}</textarea>
								
							</article>
	
						</div>
						
						<!-- 댓글 관련 hidden -->
						<input type="hidden" name="source" value="0">
						<input type="hidden" name="openCondition" value="3">
						<input type="hidden" name="userId" value="${sessionScope.user.userId}">
						<input type="hidden" name="feedNo" value="${feed.feedNo}">
						
						<!-- 댓글 관련 hidden -->
					</form>
					
					<div class="modal-footer">
						<button class="btn btn-primary btn_updateFeed" type="button">
							UPDATE
						</button>
						<button type="button" class="btn btn-default btn_updateFeedCancel" data-dismiss="modal">
							Close
						</button>
					</div>
				</div>
			</div>
		</div>
	
</body>
</html>