<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="The Page Description">
		
		<style type="text/css">@-ms-viewport{width: device-width;}</style>
		
		<title>모임 게시물 상세보기</title>
		
		<!-- 사용자 정의 css -->
		<link rel="stylesheet" href="/resources/css/clubPost/clubPost.css" type="text/css" media="screen" title="no title">
		<link rel="stylesheet" href="/resources/css/chat/chat.css" type="text/css" media="screen" title="no title"><!-- 채팅 css -->

		<!-- 공통 css는 toolbar.jsp include 받아서 쓰고있다 -->
		
		<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css'>
		
		<!--  ///////////////////////// jQuery CDN, bootstrap CDN ////////////////////////// -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		
		
		<!--  font -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
		
		
		
		<!-- Swal 쓰기위한 cdn -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		
		
	
		<!-- 템플릿에 있던 코드 -->
		<!-- <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script> -->
		<script src="/resources/javascript/plugins.js"></script>
		<script src="/resources/javascript/beetle.js"></script>
		
		
		
		<!-- 프로필 이미지 클릭시 dialog 나온다 -->
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
		
		
		
		<!-- include summernote css/js -->
		<link href="/resources/summernote/summernote-lite.css" rel="stylesheet">
		<script src="/resources/summernote/summernote-lite.js"></script>
		
		<script type="text/javascript">
		$(function(){
			
			
			
			///////////////////////////////////////// textarea ////////////////////////////////////////////////
			
			
			
			<%-- 댓글등록 버튼 클릭시 버튼 숨기고 게시물의 댓글을 등록할 수 있는 textarea 보여진다 --%>
			$("input[value='댓글등록']").bind("click", function(){
				//alert("게시물 댓글 등록");
				
				// 댓글작성 textarea와 등록 취소 버튼 보이기
				$(this).parent().next().removeAttr("style");
				
				// 댓글등록 버튼 숨기기
				$(this).parent().attr("style", "display: none");
			});
			
			<%-- 취소하기 버튼 클릭시 게시물의 댓글을 등록할 수 있는 textarea 숨기고 댓글등록 버튼 보여진다 --%>
			$("input[value='취소하기']").bind("click", function(){
				//alert("게시물 댓글 취소");
				
				// 댓글작성란 textarea에 있는 내용 지우기
				$(this).prev().prev().val("");
				
				// 게시물 댓글등록 버튼 보이기
				$(this).parent().parent().prev().removeAttr("style");
				
				// 댓글취소 버튼 숨기기
				$(this).parent().parent().attr("style", "display: none");
			});

			<%-- 댓글의 댓글을 등록할 수 있는 textarea 보여진다 --%>
			$(document).on("click", ".reply.add", function(){
				//alert('대댓글 등록');
				
				// display : none을 제거하여 댓글작성란이 보이게한다
				$(".clear-after-comment-add").attr("style", "display: none");
				$(".clear-after-comment-update").attr("style", "display: none");

				// display : none을 제거하여 댓글작성란이 보이게한다
				$(this).parent().parent().parent().parent().next().removeAttr("style");
			}); // end of 등록

			<%-- 해당 댓글을 수정할 수 있는 입력텍스트 보여진다 --%>
			$(document).on("click", ".reply.update", function(){
				//alert('대댓글 수정');
				
				// display : none을 하여 등록란 수정란을 다 닫는다
				$(".clear-after-comment-add").attr("style", "display: none");
				$(".clear-after-comment-update").attr("style", "display: none");

				// display : none을 제거하여 댓글작성란이 보이게한다
				$(this).parent().parent().parent().parent().parent().children("div:eq(2)").removeAttr("style");
				
				// 기존 댓글내용
				var content = $(this).parent().parent().parent().parent().children("p").text();
				//alert( content );
				
				// 기존 댓글내용을 수정란에 출력
				$(this).parent().parent().parent().parent().parent().children("div:eq(2)").find("textarea").val(content );
			});
			
			<%-- 댓글의 수정, 댓글의 댓글 등록을 취소한다 --%>
			$(document).on("click", ".plain.button.red.cancle", function(){
				//alert('대댓글 취소');
				
				// 댓글을 지운다
				$(this).siblings("textarea").val("");
				
				// 댓글 작성란을 숨긴다
				$(this).parent().parent().attr("style", "display: none");
			});
			
			
			
			///////////////////////////////////////// clubPost ////////////////////////////////////////////////
			
			
			
			<%-- 모임 게시물 수정 --%>
			$(".clubPost-header-update").bind("click", function(){
				//alert("모임게시물 수정");
				//$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
				
				var clubNo = $("#clubNo").val();
				var clubPostNo = $("#clubPostNo").val();
				
				// 기존 데이터 가져와서 넣기
				$.ajax( "/clubPostRest/json/getClubPost",
						{
							method : "POST",
							data : JSON.stringify({
										clubNo : clubNo,
										clubPostNo : clubPostNo
							}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								//alert(status);
								//alert(JSONData.clubPostTitle);
								//alert(JSONData.clubPostContent);
								
								$("input[name='clubPostTitle']").val(JSONData.clubPostTitle);
								
								// 이렇게 가져와야 summernote에서 수정 가능한 형태로 들어간다
								$('#summernote').summernote('pasteHTML', JSONData.clubPostContent);
								//$(".note-editable").summernote('pasteHTML', JSONData.clubPostContent);
								
								
							}//end of success
						});// end of ajax
								
				// 모달창 열기
				$('#club-post-update-modal').modal("show");
			});
			
			
			<%-- 모임 게시물 삭제 --%>
			$("#club-post-delete").bind("click", function(){
				
				Swal.fire({
					  title: '정말 삭제하시겠습니까?',
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '삭제',
					  cancelButtonText: '취소',
					}).then((result) => {
					  if (result.isConfirmed) {
					    Swal.fire(
					      '삭제완료',
					      '댓글이 삭제되었습니다',
					      'success'
					    )
					    
					    clubPostdeleteFnc();
					  }//end of if
					})// end of swal
			});
			
			<%-- 모임 게시물 신고 --%>
			$(".clubPost-header-report").bind("click", function(){
				//alert("모임게시물 신고");
				event.stopPropagation();
				$("form[name='clubPostReport']").attr("method", "post").attr("action", "/serviceCenter/addReport" ).submit();
			});

			<%-- 모임 게시물 좋아요 또는 좋아요취소 --%>
			$(".clubPost-header-heart").bind("click", function(){
				//alert("모임게시물 좋아요");
				$.ajax( "/clubPostRest/json/updateClubPost",
						{
							method : "POST",
							data : JSON.stringify({
										clubNo : ${ clubPost.getClubPost.clubNo },
										clubPostNo : ${ clubPost.getClubPost.clubPostNo }
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								$(".clubPost-header-heart").children().remove();
								$(".clubPost-header-heartCount").text("");

								var heartDisplay = "";
								
								// 로그인한 회원이 좋아요하면 게시물번호를 안했으면 0을 리턴한다
								if(JSONData.heartCondition == 0){
									heartDisplay = "<img src='/resources/image/uploadFiles/no_heart.jpg' height='70' width='70'>";
								}else{
									heartDisplay = "<img src='/resources/image/uploadFiles/heart.jpg' height='70' width='70'>";
								}
								
								$(".clubPost-header-heart").append( heartDisplay );
								$(".clubPost-header-heartCount").text( JSONData.clubPostHeartCount );
								
								if(sock) {
									var Msg = "하트 좋아요";
									sock.send(Msg);
								}
							}
						});
			}); // end of 하트
			
			
			
			///////////////////////////////////////// commentList ////////////////////////////////////////////////
			
			

			<%-- 모임 게시물 댓글리스트 가져온다 --%>
			$(document).on("click", ".recommentList", function(){
				//alert("댓글 개수 클릭시 해당 댓글의 댓글리스트 가져온다");
				var clubPostCommentNo = $(this).parent().parent().parent().attr("commentNo");
				var clubPostNo = ${ clubPost.getClubPost.clubPostNo };
				var clickCondition = $(".children.plain"+clubPostCommentNo).attr("clubCondition");
				var depth = $(this).parent().parent().parent().attr("depth");

				if( clickCondition == 1 ){
					// 해당 댓글의 대댓글 리스트 숨기기
					$(".children.plain"+clubPostCommentNo).attr("clubCondition", "0");
					$(".children.plain"+clubPostCommentNo).empty();
					return;
				}
				
				$.ajax( "/clubPostRest/json/getClubPostCommentList",
						{
							method : "POST",
							data : JSON.stringify({
										clubPostCommentNo : clubPostCommentNo,
										clubPostNo : clubPostNo,
										depth : depth
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								//alert(status);
								var totalDisplay = "";
								var parentTag = "";
								$.each( JSONData, function( index, el ){
									//alert( "댓글 번호 : " + el.clubPostCommentNo );
									//alert( "댓글 게시물 번호 : " + el.clubPostNo );
									//alert( "댓글 작성자 아이디 : " + el.user.userId );
									//alert( "댓글 작성자 프로필이미지 : " + el.user.profileImage );
									//alert( "댓글 작성자 닉네임 : " + el.user.nickName );
									//alert( "댓글 수 : " + el.commentCount );
									//alert( "댓글 내용 : " + el.commentContent );
									//alert( "댓글 등록날짜 : " + el.commentRegDate );
									//alert( "댓글 수정날짜 : " + el.commentUpdateDate );
									//alert( "댓글 좋아요 수 : " + el.commentHeartCount );
									//alert( "댓글 신고여부 : " + el.reportCondition );
									//alert( "댓글 삭제여부 : " + el.deleteCondition );
									//alert( "댓글 부모번호 : " + el.parent );
									//alert( "댓글 깊이 : " + el.depth );
									//alert( "댓글 순서 : " + el.sequence );
									//alert( "댓글 해당 유저의 좋아요여부 : " + el.heartCondition );
									
									<%-- 하트컨디션이 댓글번호면 좋아요/0이면 좋아요 안했다 --%>
									var heart = el.heartCondition != 0 ? 'heart.jpg' : 'no_heart.jpg';
									
									var iconString = "";
									
									if('${ sessionScope.user.userId }' == el.user.userId ){
										//alert('true');
									 	<%-- 해당 댓글 수정 --%>
									 	iconString = "<a class='reply update'>"
												 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-paperclip updateCommentView' aria-hidden='true' style='font-size: 25px;'></span>"
													+"</a>"
													<%-- 해당 댓글 삭제 --%>
												 	+"<a href='#' class='reply delete'>"
												 		<%-- 해당 댓글 작성자 또는 해당 게시물 작성자 또는 모임대표 또는 관리자 --%>
												 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-trash deleteComment comment' aria-hidden='true' style='font-size: 25px;'></span>"
													+"</a>"																		 		
								 	}else{
								 		//alert('false');
										<%-- 해당 댓글 신고 --%>
										iconString = "<a href='#' class='reply report'>"
												 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true' style='font-size: 25px;'></span>"
												 	+"</a>"
								 	}
									
									var display = "<div class='comment-parent'>"
														+"<li class='recomment'>"
															+"<div id='recomment-body' class='single-comment"+el.clubPostCommentNo+"' depth='2' commentNo='"+el.clubPostCommentNo+"' revUserId='"+el.user.userId+"'>"
																+"<div class='comment-author' style='float: left;'>"
																	+"<cite><a href='#'><img class='profileImage' src='/resources/image/uploadFiles/"+el.user.profileImage+"' alt=''></a></cite>"
																	+"<cite><a href='#'>"+el.user.nickName+"</a></cite>"
																	+"<span class='says'>says:</span>"
																+"</div>"
															
															
															
																+"<div class='comment-meta' style='display: inline-block; padding-left: 30px;'>"
																	+"<time datetime='2013-03-23 19:58'>"+el.commentRegDate+"</time>"
																	+"<div class='comment body'>"
						
																		+"<div class='comment-heart-"+el.clubPostCommentNo+"'>"
																			+"<a class='reply heartCondition'>"
																				<%-- 하트컨디션이 댓글번호면 좋아요/0이면 좋아요 안했다 --%>
																	 			+"<img src='/resources/image/uploadFiles/"+heart+"' height='40' width='40'>"
																	 		+"</a>"
																		 +"</div>"
																		 																	 
																		 +"<div>"
																		 	<%-- 해당 댓글의 좋아요 수 --%>
																		 	+"<span class='commentHeartCount"+el.clubPostCommentNo+"' style='font-size: 30px;'>"+el.commentHeartCount+"</span>"																
																		 	<%-- 해당 댓글의 댓글 등록 --%>
																		 	+"<a class='reply add'>"
																		 		<%-- +"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-plus-sign' aria-hidden='true' style='font-size: 25px;'></span>" --%>
																		 	+"</a>"
																		 	+iconString
																		+"</div>"
																		
																	+"</div>"
																	
																+"</div>"
																<%-- class='comment-meta --%>
															
																+"<p>"+el.commentContent+"</p>"
															
																+"<c:if test='"+el.commentCount+">0'>"
																		+"<div class='comment-author'>"
																			+"<cite>"
																				+"<a class='recommentList'>댓글 "+el.commentCount+"개</a>"
																			+"<cite>"
																		+"</div>"
																+"</c:if>"
															+"</div>"
															<%-- class='single-comment --%>
														
														
															+"<div class='clear-after-comment-add"+el.clubPostCommentNo+"' commentTextArea='"+el.clubPostCommentNo+"' style='display: none;'>"
																+"<form class='comment-form-add'>"
																+"<textarea class='plain buffer' placeholder='댓글작성란'></textarea>"
																+"<input class='plain button red add' value='등록완료'>"
																+"<input class='plain button red cancle' value='취소'>"
																+"</form>"						
															+"</div>"
															
															+"<div class='clear-after-comment-update"+el.clubPostCommentNo+"' commentTextArea='"+el.clubPostCommentNo+"' style='display: none;'>"
																+"<form class='comment-form-update'>"
																+"<textarea class='plain buffer'></textarea>"
																+"<input class='plain button red update' value='수정완료'>"
																+"<input class='plain button red cancle' value='취소'>"
																+"</form>"						
															+"</div>"
															
	
															<%-- +"<div class='recomment-header'>"
																+"<div class='recomment-header-space'></div>"
																+"<div class='recomment-header-body'>"
																	+"<ul class='children plains"+el.clubPostCommentNo+"' clubCondition='0'>"
																	+"</ul>"
																+"</div>"
															+"</div>" --%>
														
														+"</li>"
													
													+"</div>";
													<%-- comment-parent --%>
													
													
													
													
									//alert( display );

									$(".children.plain"+el.parent).attr("clubCondition", "1");
									
									// 대댓글리스트 가져오기 전에 등록한 대댓글을 지운다
									$(".children.plain"+el.parent).children("div:eq(0)").remove();
									
									// for문이 끝나고 전체 리스트를 넣어주기 위해
									totalDisplay += display;
									parentTag = el.parent;
									
								});

								//alert( totalDisplay );
								// 대댓글리스트 전체를 가져온다
								$(".children.plain"+parentTag).append( totalDisplay );
								

							} // end of success
						}); // end of ajax
			}); // end of recommentList
			
			
			
			///////////////////////////////////////// comment ////////////////////////////////////////////////
			
			
			
			<%-- 해당 게시물에 댓글 등록 --%>
			$(document).on("click", ".plain.button.red.add", function(){
				//alert('댓글 등록완료');
				var clubPostNo = ${ clubPost.getClubPost.clubPostNo };
				var commentContent = $(this).prev().val();
				var depth = $(this).parent().parent().prev().attr("depth");
				var clubPostCommentNo = $(this).parent().parent().prev().attr("commentNo");
				
				if( depth <= 0 ){
					//alert("게시물의 댓글 등록!");
					depth = 0;
				}
				
				if( clubPostCommentNo <= 0 ){
					//alert("게시물의 댓글 등록");
					clubPostCommentNo = 0;
				}
				
				//alert( "게시물번호 : " + clubPostNo );
				//alert( "댓글내용 : " + commentContent );
				//alert( "등록할 댓글의 깊이 : " + depth );
				//alert( "등록할 부모댓글 번호 : " + clubPostCommentNo );

				// 댓글작성 textarea 데이터 지우기
				$(this).prev().val("");
				// 작성란, 등록 취소버튼 숨기기
				$(this).parent().parent().attr("style", "display: none");
				// 게시물의 댓글등록 버튼 보이기
				$(this).parent().parent().prev().removeAttr("style");
				
				$.ajax( "/clubPostRest/json/addClubPostComment",
						{
							method : "POST",
							dataType : "JSON",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								clubPostNo : clubPostNo,
								commentContent : commentContent,
								clubPostCommentNo : clubPostCommentNo,
								depth : depth
							}),
							success : function(JSONData, status) {
								//alert(status);
								//alert(JSONData);
								//alert(JSONData.user.userId);
								//alert(JSONData.user.profileImage);
								//alert(JSONData.user.nickName);
								//alert(JSONData.clubPostCommentNo);
								//alert(JSONData.commentContent);
								//alert(JSONData.commentRegDate);
								//alert(JSONData.commentUpdateDate);
								//alert(JSONData.commentCount);
								//alert(JSONData.commentHeartCount);
								//alert(JSONData.heartCondition);
								
								//alert(JSONData);
								
								var depth = JSONData.depth;
								//alert( depth == 0 ? '게시물 댓글 등록' : '댓글의 댓글 등록' );
								
								var display = "<div class='comment-parent'>";
								var addComment = "";
								var addRecommentCss = "";
									
								if( depth == 0 ){
									display += "<li class='comment'><div id='comment-body' class='single-comment"+JSONData.clubPostCommentNo+"' depth='1' commentNo='"+JSONData.clubPostCommentNo+"' revUserId='"+JSONData.user.userId+"'>";
									addComment += "class='glyphicon glyphicon-plus-sign'";
									addRecommentCss += "depth";
								}else if( depth == 1 ){
									display += "<li class='recomment'><div class='single-comment"+JSONData.clubPostCommentNo+"' depth='1' commentNo='"+JSONData.clubPostCommentNo+"' revUserId='"+JSONData.user.userId+"'>";
								}
								
								
								
								display += 
													"<div class='comment-author' style='float: left;'>"
														+"<cite><a href='#'><img class='profileImage' src='/resources/image/uploadFiles/"+JSONData.user.profileImage+"' alt=''></a></cite>"
														+"<cite><a href='#'>"+JSONData.user.nickName+"</a></cite>"
														+"<span class='says'>says:</span>"
													+"</div>"
													
													

													+"<div class='comment-meta' style='display: inline-block; padding-left: 30px;'>"
														+"<time datetime='2013-03-23 19:58'>"+JSONData.commentRegDate+"</time>"														
														+"<div class='comment body'>"

															+"<div class='comment-heart-"+JSONData.clubPostCommentNo+"'>"
																+"<a class='reply heartCondition'>"
														 			+"<img src='/resources/image/uploadFiles/no_heart.jpg' height='40' width='40'>"
														 		+"</a>"
															 +"</div>"
															 
															 +"<div>"
															 <%-- 해당 댓글의 좋아요 수 --%>
															 	+"<span class='commentHeartCount"+JSONData.clubPostCommentNo+"' style='font-size: 30px;'>0</span>"																
															 	<%-- 해당 댓글의 댓글 등록 --%>
															 	+"<a class='reply add'>"
															 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span "+addComment+" aria-hidden='true' style='font-size: 25px;'></span>"
															 	+"</a>"
															 	<%-- 해당 댓글 수정 --%>
															 	+"<a class='reply update'>"
															 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-paperclip updateCommentView' aria-hidden='true' style='font-size: 25px;'></span>"
																+"</a>"
																<%-- 해당 댓글 삭제 --%>
															 	+"<a href='#' class='reply delete'>"
															 		<%-- 해당 댓글 작성자 또는 해당 게시물 작성자 또는 모임대표 또는 관리자 --%>
															 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-trash deleteComment comment' aria-hidden='true' style='font-size: 25px;'></span>"
																+"</a>"
															+"</div>"
															
														+"</div>"
														
													+"</div>"
													
													+"<p>"+JSONData.commentContent+"</p>"
													
													<%-- 댓글 등록시 추가 대댓글 등록시는 안 추가 --%>
													+"<div class='comment-author'>"
														+"<cite>"
															+"<a class='recommentList'><b class='recomment_count'></b></a>"
														+"<cite>"
													+"</div>"
													
												+"</div>"
												<%-- class='single-comment' --%>
												
												+"<div class='clear-after-comment-add"+JSONData.clubPostCommentNo+"' commentTextArea='"+JSONData.clubPostCommentNo+"' style='display: none;'>"
													+"<form class='comment-form-add'>"
													+"<textarea class='plain buffer' placeholder='댓글작성란'></textarea>"
													+"<input class='plain button red add' value='등록완료'>"
													+"<input class='plain button red cancle' value='취소'>"
													+"</form>"						
												+"</div>"
												
												
												+"<div class='clear-after-comment-update"+JSONData.clubPostCommentNo+"' commentTextArea='"+JSONData.clubPostCommentNo+"' style='display: none;'>"
													+"<form class='comment-form-update'>"
													+"<textarea class='plain buffer'></textarea>"
													+"<input class='plain button red update' value='수정완료'>"
													+"<input class='plain button red cancle' value='취소'>"
													+"</form>"						
												+"</div>"
												
												
												+"<div class='recomment-header "+addRecommentCss+"'>"
													+"<div class='recomment-header-space'></div>"
													+"<div class='recomment-header-body'>"
														+"<ul class='children plain"+JSONData.clubPostCommentNo+"' clubCondition='0'>"
														+"</ul>"
													+"</div>"
												+"</div>"
												<%-- 대댓글 리스트 class='recomment-header' --%>

												+"<br>"
											+"</li>"
											
										+"</div>";
										<%-- class='comment-parent' --%>
										
										//게시물 댓글 개수 증가
										$("b[class='comment_count']").text( parseInt ($("b[class='comment_count']").text()) + 1 );
											
								if( depth == 0 ){
									//alert( "게시물의 댓글등록" );
									$(".comment-list.plain").append( display );
								}else if( depth == 1 ){
									//alert( "댓글의 댓글등록" );
									$(".children.plain"+clubPostCommentNo).append( display );
									var commentCount = $(".children.plain"+clubPostCommentNo).parent().parent().parent().children(".single-comment"+clubPostCommentNo).find(".recomment_count").text();
									//alert(commentCount);
									if( commentCount == '' ){
										//alert('여기로 오나?');
										//var displayComment = "댓글 <b class='recomment_count'>1</b>개";
										//$(".children.plain"+clubPostCommentNo).parent().parent().parent().children(".single-comment"+clubPostCommentNo).find(".recommentList").empty();
										//$(".children.plain"+clubPostCommentNo).parent().parent().parent().children(".single-comment"+clubPostCommentNo).find(".recommentList").append( displayComment );
									}else{
										$(".children.plain"+clubPostCommentNo).parent().parent().parent().children(".single-comment"+clubPostCommentNo).find(".recomment_count").text( parseInt(commentCount) + 1 );
									}
									
								}
								//alert( display );
							}// end of success

				});// end of ajax
			}); // end of 등록

			<%-- 해당 댓글을 수정한다 --%>
			$(document).on("click", "input[value='수정완료']", function(){
				//alert('댓글 수정완료');
				var commentContent = $(this).prev().val();
				var clubPostCommentNo = $(this).parent().parent().attr("commentTextArea");
				var divClassName = $(this).parent().parent().attr("class");
				//alert( "댓글내용 : " + commentContent );
				//alert( "해당댓글의번호 : " + clubPostCommentNo );
				//alert( divClassName );
				
				$.ajax( "/clubPostRest/json/updateClubPostComment",
						{
							method : "POST",
							data : JSON.stringify({
										clubPostCommentNo : clubPostCommentNo,
										commentContent : commentContent
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								//alert(status);
								$("."+divClassName).attr("style", "display: none");
								$("."+divClassName).prev().prev().find("p").text( JSONData.commentContent );
							} // end of success
						}); // end of ajax
			}); // end of 수정완료

			<%-- 해당 댓글을 삭제한다 --%>
			$(document).on("click", ".glyphicon.glyphicon-trash.deleteComment.comment", function(){
				
				Swal.fire({
					  title: '정말 삭제하시겠습니까?',
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '삭제',
					  cancelButtonText: '취소',
					}).then((result) => {
					  if (result.isConfirmed) {
					    Swal.fire(
					      '삭제완료',
					      '댓글이 삭제되었습니다',
					      'success'
					    )
					    
					    var clubPostCommentNo = $(this).parent().parent().parent().parent().parent().attr("commentNo");
						var className = $(this).parent().parent().parent().parent().parent().attr("class");
						//var depth = $(this).parent().parent().parent().parent().parent().attr("depth");
						//alert( clubPostCommentNo );
						//alert( "삭제할 클래스명 : " + className );
						//alert( depth );
						
						$("."+className).next().remove();
						$("."+className).next().remove();
						$("."+className).next().remove();
						$("."+className).next().remove();//이거는 <br>태그 지우는것
						
						$("."+className).remove();
					    
						$.ajax( "/clubPostRest/json/deleteClubPostComment",
								{
									method : "POST",
									data : JSON.stringify({
												clubPostCommentNo : clubPostCommentNo,
												clubPostNo : ${ clubPost.getClubPost.clubPostNo }
											}),
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									dataType : "json",
									success : function(JSONData, status){
										//alert(status);
										//alert(JSONData.clubPostCommentCount);
										//alert(JSONData.commentCount);
										//alert(JSONData.parent);

										// 삭제된것도 가져와서 댓글개수 변경 안해도 된다
										
										// 게시물 댓글개수 수정
										//$(".comment_count").text( JSONData.clubPostCommentCount );
										
										// 게시물 댓글의 댓글개수 수정
										//$("div .single-comment"+JSONData.parent).find("b").text( JSONData.commentCount );
										
										
									} // end of success
								}); // end of ajax
								
								
								
					  }//end of swal if문
					})//end of swal
				
				
			}); // end of 삭제

			<%-- 해당 댓글을 좋아요 또는 좋아요 취소한다 --%>
			$(document).on("click", ".reply.heartCondition", function(){
				//alert("댓글 좋아요");
				var clubPostCommentNo = $(this).parent().parent().parent().parent().attr("commentNo");
				//alert( clubPostCommentNo );
				var commentHeartCountClassName = $(this).parent().parent().parent().parent().find("span:eq(1)").attr("class");
				//alert( commentHeartCountClassName );
				var heartImageClassName = $(this).parent().parent().parent().parent().find("div:eq(3)").attr("class");
				//alert( heartImageClassName );
				
				$.ajax( "/clubPostRest/json/updateClubPostComment",
						{
							method : "POST",
							data : JSON.stringify({
										clubPostCommentNo : clubPostCommentNo,
										heartCondition : 1
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								//alert(status);
								//alert(JSONData.heartCondition);
								//alert(JSONData.commentHeartCount);

								$("."+heartImageClassName).children().empty();
								$("."+commentHeartCountClassName).text("");

								var heartDisplay = "";
								if(JSONData.heartCondition == 0){
									heartDisplay = "<a class='reply heartCondition'><img src='/resources/image/uploadFiles/no_heart.jpg' height='40' width='40'></a>";
								}else{
									heartDisplay = "<a class='reply heartCondition'><img src='/resources/image/uploadFiles/heart.jpg' height='40' width='40'></a>";
								}
								
								$("."+heartImageClassName).append( heartDisplay );
								$("."+commentHeartCountClassName).text( JSONData.commentHeartCount );
							}
						});
			}); // end of 댓글좋아요
			
			<%-- 모임 게시물 댓글 신고 --%>
			$(document).on("click", ".reply.report", function(event) {
				//alert("댓글 신고");
				var clubPostCommentNo = $(this).parent().parent().parent().parent().attr("commentNo");
				var revUserId = $(this).parent().parent().parent().parent().attr("revUserId");
				
				$("#sourceNumber").val( clubPostCommentNo );
				$("#revUserId").val( revUserId );
				
				event.stopPropagation();
				
				$("form[name='commentReport']").attr("method", "post").attr("action", "/serviceCenter/addReport" ).submit();
				
			}) // .report evenet close
			
			
			
			///////////////////////////////////////// MyHome ////////////////////////////////////////////////
			
			

			<%-- 프로필사진 클릭시 해당유저 마이홈피로 이동 --%>
			//$(document).on("click", ".clubPost-header-profile", function(){
				//location.href = "/myHome/getYourHome?userId="+$(this).attr("userId");
			//});//end of 마이홈피 이동

			<%-- 닉네임 클릭시 해당유저 마이홈피로 이동 --%>
			$(document).on("click", ".clubPost-header-nickName", function(){
				location.href = "/myHome/getYourHome?userId="+$(this).attr("userId");
			});//end of 마이홈피 이동
			
			
		});
		</script>
		
		<script type="text/javascript">
			$(function () {
				// summernote
				textEdit();
				
				$("#summernoteUpdate").bind("click", function(){
					//alert("게시물 수정완료");
					
					if( $.trim($("input[name='clubPostTitle']").val()) == '' ){
						Swal.fire({
							  icon: 'error',
							  title: '제목은 필수입니다'
							})
							return;
					}
					
					if( $("input[name='clubPostTitle']").val().length > 40 ){
						Swal.fire({
							  icon: 'error',
							  title: '제목은 40자까지 가능합니다'
							})
							return;
					}
					
					if( $("#summernote").val().match("img") == null && $("#summernote").val().match("iframe") == null ){
						Swal.fire({
							  icon: 'error',
							  title: '이미지나 동영상 1개 필수입니다'
							})
							return;
					}
					
					if( $("#summernote").val().length > 1000 ){
						Swal.fire({
							  icon: 'error',
							  title: '내용이 너무 깁니다'
							})
							return;
					}
					
					/* $("form[name='summernoteUpdateClubPost']").attr("method", "post").attr("enctype", "multipart/form-data")
					.attr("action", "/clubPost/updateClubPost?clubPostNo="+${ clubPost.getClubPost.clubPostNo }+"&clubPostTitle="+$("input[name='clubPostTitle']").val()
					+"&clubPostContent="+$("#summernote").val()).attr("accept-charset", "EUC-KR").submit(); */
					
					//self.location="/clubPost/updateClubPost?clubPostNo="+${ clubPost.getClubPost.clubPostNo }+"&clubPostTitle="+$("input[name='clubPostTitle']").val()+"&clubPostContent="+$("#summernote").val()
					
					// 모달창 닫기
					$('#club-post-update-modal').modal("hide");
					
					// 게시물 제목
					var title = $("input[name='clubPostTitle']").val();
					
					// 게시물 내용
					var content = $("#summernote").val();
					
					// 게시물 번호
					var clubPostNo = $("#clubPostNo").val();

					$.ajax( "/clubPostRest/json/updateClubPostSummernote",
						{
							method : "POST",
							data : JSON.stringify({
										clubPostTitle : title,
										clubPostContent : content,
										clubPostNo : clubPostNo
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								//alert(status);
								//alert(JSONData.clubPostTitle);
								//alert(JSONData.clubPostContent);
								
								$(".clubPost-body-title").text(JSONData.clubPostTitle);
								
								$(".clubPost-body-content").empty();
								
								tmp = JSONData.clubPostContent.substring(3, JSONData.clubPostContent.length - 4 );
								//alert("앞 뒤 p태그 자른 string : " + content);
								var content = tmp.split("</p><p>");
								for (var i = 0; i < content.length; i++) {
									$(".clubPost-body-content").append( content[i] );
								}
								
								// 모달창 닫기
								$('#club-post-update-modal').modal("hide");
								
							}//end of success
						});//end of ajax
				});
				
				$("#summernoteCancle").bind("click", function(){
					//alert('수정완료 이전으로');
					
					// 제목과 내용 초기화
					$("input[name='clubPostTitle']").val("");
					// summernote는 불러오고 나서 F12번으로 textArea 클릭해서 class명 다시 지정해줌
					$(".note-editable").text("");
					$("#summernote").val("");
					
					// 모달창 닫기
					$('#club-post-update-modal').modal("hide");
				});
				
				$("button[class='close']").bind("click", function(){
					//alert('수정완료 이전으로');
					
					// 제목과 내용 초기화
					$("input[name='clubPostTitle']").val("");
					// summernote는 불러오고 나서 F12번으로 textArea 클릭해서 class명 다시 지정해줌
					$(".note-editable").text("");
					$("#summernote").val("");
					
					// 모달창 닫기
					$('#club-post-update-modal').modal("hide");
				});
			});
			function clubPostdeleteFnc(){
				$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
			}
		</script>
		
		<script>
			function textEdit(){
			    jsonArray = [];
				$('#summernote').summernote({
	                disableResizeEditor: true,
	                minHeight : 400,
	                maxHeight : 700,
	                focus : true,
	                lang : 'ko-KR',
	                toolbar : [
	  	              ["style", ["style"]],
		              ["font", ["bold", "underline", "clear"]],
		              ["fontname", ["fontname"]],
		              ["para", ["ul", "ol", "paragraph"]],
		              ["table", ["table"]],
		              ["insert", ["link", "picture", "video"]],
		              ["view", ["fullscreen", "codeview"]],
		              ['highlight', ['highlight']]
		            ],
	                //콜백 함수
	                callbacks : {
	                	onImageUpload : function(files, editor, welEditable) {
	               	 		// 파일 업로드(다중업로드를 위해 반복문 사용)
	               	 		for (var i = files.length - 1; i >= 0; i--) {
	                			uploadSummernoteImageFile(files[i], this);
	                		}
	                	}
	                }//end of callbacks
	            });//end of summernote

				function uploadSummernoteImageFile(file, el) {
					var data = new FormData();
					data.append("file",file);
						$.ajax({
							url: '/clubPostRest/json/uploadSummernoteImageFile',
							type: "POST",
							enctype: 'multipart/form-data',
							data: data,
							cache: false,
							contentType : false,
							processData : false,
							success : function(data) {
								//alert(data.responseCode);
								//alert(data.url);
								//alert("업로드 하였습니다");
								$(el).summernote('editor.insertImage', data.url);
								//jsonArray.push(json["url"]);
								//jsonFn(jsonArray);
							}
						});
				}//end of uploadSummernoteImageFile
				
				function jsonFn(jsonArray){
					//console.log(jsonArray);
				}

			};//end of textEdit
		</script>
		
		
			
		<script type="text/javascript">
		//클럽버튼 펑션입니다.
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
		
	
	$(function(){
		//소켓서버에 접속시킨다.
		/* let socket = io("http://192.168.0.74:3000/clubchat", { // clubchat 네임스페이스
			cors: { origin: "*" },
			path: '/socket.io',
			query: {
				userId : $("#session_userId").val(),
				profileImage : $("#session_profileImage").val(),
				nickName : $("#session_nickName").val(),
				roomId : '74a6518c-7620-4f6c-b59d-ec66fa8a4008',
			}
		}); */
	});
		</script>
		
	</head>

	<body class="single single-post">
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
		
	<!-- 모임채팅 -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	<script src="http://192.168.0.74:3000/socket.io/socket.io.js"></script>
		
		<!-- 채팅 javascript -->
		<script src="/resources/javascript/chat/chat.js"></script>
		
		<%-- <jsp:include page="/chat/chat.jsp" /> --%>
	

		<main role="main" style="background: #EBEDF0;">



			<div id="main" class="row" style="background: #EBEDF0;">
				<div class="row-content buffer-left buffer-right buffer-bottom clear-after">
				<!-- <div class="row-content buffer-left buffer-right buffer-bottom"> -->
	
					<form name="clubPostReport" method="post" action="/serviceCenter/addReport">
						<%-- 모임게시물 신고 --%>
						<input type="hidden" name="reportSource" value="1">
						<input type="hidden" name="sourceNumber" value="${ clubPost.getClubPost.clubPostNo }">
						<input type="hidden" name="userId" value="${ clubPost.getClubPost.user.userId }">
						<input type="hidden" name="clubNo" value="${ clubPost.getClubPost.clubNo }">
						<%-- 모임게시물 신고 --%>
					</form>
					
					<form name="commentReport" method="post" action="/serviceCenter/addReport">
						<%-- 모임게시물 댓글 신고 --%>
						<input type="hidden" name="reportSource" value="2">
						<input type="hidden" name="sourceNumber" id="sourceNumber" value="">
						<input type="hidden" name="userId" id="revUserId" value="">
						<input type="hidden" name="clubPostNo" value="${ clubPost.getClubPost.clubPostNo }">
						<input type="hidden" name="clubNo" value="${ clubPost.getClubPost.clubNo }">
						<%-- 모임게시물 댓글 신고 --%>
					</form>
					
					<%-- chat.js에서 사용위해서 --%>
						<input type="hidden" id="session_userId" value="${ sessionScope.user.userId }">
						<input type="hidden" id="session_profileImage" value="${ sessionScope.user.profileImage }">
						<input type="hidden" id="session_nickName" value="${ sessionScope.user.nickName }">
					<%-- chat.js에서 사용위해서 --%>
		
		
				
					<!-- 채팅 이미지 start -->
					<div>
						<img id="chat-icon" src="/resources/image/uploadFiles/chat_image.jpg" height="80px" width="80px">
					</div>
					<!-- 채팅 이미지 end -->
		
					<!-- 채팅 start -->
					<div id="allChat" style="display: none;">
						<!-- 채팅 상단 툴바 start -->
						<div id="allChat-toolbar">
							<div>
								<!-- 로고 -->
								<span id="allChat-toobar-title">LINK</span>
								<!-- 뒤로가기 -->
								<span id="allChat-toobar-back" class="chat-toolbar-back" style="display: none;"><img src="/resources/image/uploadFiles/back5.png" height="60px" width="60px"></span>
							</div>
							<div></div>
							<div>
								<!-- 닫기 -->
								<span id="allChat-toolbar-close" class="chat-toolbar-back">X</span>
							</div>
						</div>
						<!-- 채팅 상단 툴바 end -->
						<!-- 채팅 body start -->
						<div id="chat-body">
							<!-- 채팅 list start -->
							<div id="chat-list-content">
								<!-- 채팅 사이드바 -->
								<div id="chat-body-sidebar">
									<img class="chat-img-sidebar people-users" style="box-shadow: rgba(102, 051, 102, 0.3) 0px 9px 38px, rgba(95, 0, 128, 0.3) 0px 5px 12px;" src="/resources/image/uploadFiles/people.jpg">
									<img class="chat-img-sidebar people-user" src="/resources/image/uploadFiles/one_user.jpg">
								</div>
								<!-- 모임 채팅과 1:1 채팅 리스트 start -->
								<div id="chat-list-one-content">
									<div id="club-chat-list">
										<c:if test="${ fn:length(roomList) > 0 }">
										<c:forEach var="i" begin="0" end="${ fn:length(roomList) - 1 }" step="1">
											<div class="chat-content chat-content-onechat" roomId="${ roomList[i].roomId }" namespace="clubchat">
												<div><img class="chat-img-main" src="/resources/image/uploadFiles/${ roomList[i].clubImage }"></div>
												<div>${ roomList[i].clubTitle }</div>
											</div>
										</c:forEach>
										</c:if>
									</div>
									<div id="user-chat-list" style="display: none;">
										<c:if test="${ fn:length(getChat) > 0 }">
										<c:forEach var="i" begin="0" end="${ fn:length(getChat) - 1 }" step="1">
											<div class="chat-content chat-content-onechat" roomId="${ getChat[i].roomId }" namespace="userchat">
												
												<c:choose>
													<c:when test="${ getChat[i].user.nickName != sessionScope.user.nickName }">
														<div><img class="chat-img-main" src="/resources/image/uploadFiles/${ getChat[i].user.profileImage }"></div>
														<div>${ getChat[i].user.nickName }</div>
													</c:when>
													<c:otherwise>
														<div><img class="chat-img-main" src="/resources/image/uploadFiles/${ getChat[i].user2.profileImage }"></div>
														<div>${ getChat[i].user2.nickName }</div>
													</c:otherwise>
												</c:choose>
												
											</div>
										</c:forEach>
										</c:if>
									</div>
								</div>
								<!-- 모임 채팅과 1:1 채팅 리스트 end -->
							</div>
							<!-- 채팅 list end -->
							
							<!-- 채팅방 start -->
							<div id="chat-room-content" style="display: none;">
								<div id="chat-room">
									<div id="chatLog">
										<%-- <div style="display: grid; grid-template-columns: 1fr 6fr;">
											<div><img src="/resources/image/uploadFiles/robin.jpg" height="50px" width="50px" style="border-radius: 100px;"></div>
											<div>
												<div>닉네임</div>
												<div style="position: relative; height: auto; background-color: red;">
													<img src="/resources/image/uploadFiles/no_heart.jpg" style="vertical-align: middle;">
													<div style="text-align: center; position: absolute; top: 3%; left: 5%; right: 13%;">루피 조로 나미 우솝 상디 쵸파 로빈 프랭키 브룩 메세지가 나오는 공간입니다 많이 나오면 어떻게 될까요? 루피 조로 나미 우솝 상디 쵸파 로빈 프랭키 브룩 가 나 다 라 마 바 사 아 자 차 카 타 파 하 1ㅏ 2ㅏ 3ㅏ 4ㅏ 5ㅏ 6 ㅏ7 ㅏ8 ㅏ9 10</div>
												</div>
											</div>
											<div>
												<div>로빈</div>
												<div>
													<div>루피 조로 나미 우솝 상디 쵸파 로빈 프랭키 브룩 메세지가 나오는 공간입니다 많이 나오면 어떻게 될까요? 루피 조로 나미 우솝 상디 쵸파 로빈 프랭키 브룩 가 나 다 라 마 바 사 아 자 차 카 타 파 하 1ㅏ 2ㅏ 3ㅏ 4ㅏ 5ㅏ 6 ㅏ7 ㅏ8 ㅏ9 10</div>
												</div>
											</div>
										</div> --%>
									</div>
								</div>
								<!-- 채팅 메세지 전송 start -->
								<form action="" id="sendForm">
								<div id="input-chatLog">
									<div><input type="text" name="message" autocomplete="off"></div>
									<div><button id="chat_send_button">전송</button></div>
								</div>
								</form>
								<!-- 채팅 메세지 전송 end -->
							</div>
							<!-- 채팅방 end -->
							
						</div>
						<!-- 채팅 body end -->						
					</div>
					<!-- 채팅 end -->
				
				
				
				
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
						
						<button type="button" class="live">
							 <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span> 
						</button>
					</div>			
					

					<div class="post-area clear-after" style="background: white;">
						<article role="main">
							
							<h5><time datetime="2013-11-09" class="club-post-time">
							<c:choose>
								<c:when test="${ !empty clubPost.getClubPost.clubPostUpdateDate }">${ clubPost.getClubPost.clubPostUpdateDate }(수정 됨)</c:when>
								<c:otherwise>${ clubPost.getClubPost.clubPostRegDate }</c:otherwise>
							</c:choose>
							</time></h5>
							
							<div class="clubPost-header">
								<%-- 게시물 등록 회원 프로필 사진 --%>
								<div class="clubPost-header-profile" userId="${ clubPost.getClubPost.user.userId }">
									<img class="profileImage dl" profileImage="${ clubPost.getClubPost.user.profileImage }" nickName="${ clubPost.getClubPost.user.nickName }" src="/resources/image/uploadFiles/${ clubPost.getClubPost.user.profileImage }">
									<b id="${ clubPost.getClubPost.user.nickName }"></b>
								</div>
							
								<%-- 게시물 등록 회원 닉네임 --%>
								<div class="clubPost-header-nickName" userId="${ clubPost.getClubPost.user.userId }">${ clubPost.getClubPost.user.nickName }</div>
								
								<div class="clubPost-header-space"></div>
								
								<%-- 해당 회원이 좋아요한 여부에 따라 하트색 변화 --%>
								<div class="clubPost-header-heart">
									<a>
									<c:choose>
										<c:when test="${ clubPost.getClubPost.heartCondition == 0}"><img src="/resources/image/uploadFiles/no_heart.jpg" height="70" width="70"></c:when>
										<c:otherwise><img src="/resources/image/uploadFiles/heart.jpg" height="70" width="70"></c:otherwise>
									</c:choose>
									</a>
								</div>
								
								<%-- 게시물 좋아요 수 --%>
								<div class="clubPost-header-heartCount">${ clubPost.getClubPost.clubPostHeartCount }</div>
								
								<%-- 게시물 수정 --%>
								<c:if test="${ clubPost.getClubPost.user.userId == sessionScope.user.userId }">
									<div class="clubPost-header-update">
										<a>
											<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>
										</a>
									</div>
								</c:if>
								
								<%-- 해당 게시물 작성자 또는 해당 모임대표 또는 관리자 게시물 삭제 가능 --%>
								<c:if test="${ clubPost.getClubPost.user.userId == sessionScope.user.userId || clubPost.getClubPost.clubRole == '2' || sessionScope.user.role == '1' }">
									<div class="clubPost-header-delete">
										<a>
											<span class="glyphicon glyphicon-trash deleteComment" id="club-post-delete" aria-hidden="true"></span>
										</a>
									</div>
								</c:if>
								
								<%-- 해당 게시물 작성자 이외의 회원 신고 가능 --%>
								<c:if test="${ clubPost.getClubPost.user.userId != sessionScope.user.userId }">
									<div class="clubPost-header-report">
										<a>
											<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
										</a>
									</div>
								</c:if>
							</div>
							
							<div class="clubPost-body">
							
								<br><br>
								
								<%-- id는 프로필 이미지 클릭했을 때 나오는 다이얼로그 나오는 위치이다 --%>
								<div class="clubPost-body-title" id="${ clubPost.getClubPost.user.userId }">${ clubPost.getClubPost.clubPostTitle }</div>
								
								<br><br>
								
								<div class="clubPost-body-content">
									<p>${ clubPost.getClubPost.clubPostContent }</p>
								</div>
							</div>
													
						</article>

					</div><!-- post-area -->
					
					
					<div>
						<input class="plain button red" value="댓글등록">
					</div>
					<div id="post-comment" class="clear-after" style="display: none;">
						<h3 id="reply-title"></h3>
						<form class="comment-form">
							<br><br>
							<textarea class="plain buffer" placeholder="댓글 등록란"></textarea>
							<input class="plain button red add" id="replyadd" value="댓글 등록하기">
							<input class="plain button red cancle" value="취소하기">
						</form>						
					</div><!-- post-comment -->	
					
					
					
					
					
					<div class="comment-section">
						<h3 id="comments">
							<c:choose>
								<c:when test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">댓글 <b class="comment_count">${ clubPost.getClubPost.clubPostCommentCount }</b>개</c:when>
							</c:choose>
						</h3>
						<ul class="comment-list plain">
							<%-- 해당 게시물에 댓글이 있을때만 for문을 돈다 --%>
							<li class="comment">
								<c:if test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">
									<c:forEach var="i" begin="0" end="${ clubPost.getClubPost.clubPostCommentCount - 1 }" step="1">
										<c:if test="${ clubPost.getClubPost.clubPostNo == clubPost.getClubPostCommentList[i].parent }">
											<div class="comment-parent">
												<div id="comment-body" class="single-comment${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" depth="1" commentNo="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" revUserId="${ clubPost.getClubPostCommentList[i].user.userId }">
													<div style="float: left;" class="comment-author">
														<cite><a href="#"><img class="profileImage" src="/resources/image/uploadFiles/${ clubPost.getClubPostCommentList[i].user.profileImage }" alt=""></a></cite>
														<cite><a href="#">${ clubPost.getClubPostCommentList[i].user.nickName }</a></cite>
														<span class="says">says:</span>
													</div><!-- comment-author -->
													<div class="comment-meta" style="display: inline-block; padding-left: 30px;">
														<c:choose>
															<c:when test="${ empty clubPost.getClubPostCommentList[i].commentUpdateDate }"><time datetime="2013-03-23 19:58">${ clubPost.getClubPostCommentList[i].commentRegDate }</time></c:when>
															<c:otherwise><time datetime="2013-03-23 19:58">${ clubPost.getClubPostCommentList[i].commentUpdateDate }(수정됨)</time></c:otherwise>
														</c:choose>
														
														<%-- 해당 댓글의 해당 유저의 좋아요 여부에 따라 이미지 변한다 --%>
														<div class="comment body">
															<div class="comment-heart-${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
															 	<a class="reply heartCondition">
														 			<!-- 하트컨디션이 댓글번호면 좋아요/0이면 좋아요 안했다 -->
														 			<img src="/resources/image/uploadFiles/${ clubPost.getClubPostCommentList[i].heartCondition != 0 ? 'heart.jpg' : 'no_heart.jpg' }" height="40" width="40">
																 </a>
															 </div>
															 <div>
																<%-- 해당 댓글의 좋아요 수 --%>
																 <span class="commentHeartCount${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="font-size: 30px;">${ clubPost.getClubPostCommentList[i].commentHeartCount }</span>
																
																<%-- 해당 댓글의 댓글 등록 --%>
																 <a class="reply add">
																 	&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-plus-sign" aria-hidden="true" style="font-size: 25px;"></span>
																 </a>
																 <%-- 해당 댓글 수정 --%>
																 <a class="reply update">
																 	<c:if test="${ clubPost.getClubPostCommentList[i].user.userId == sessionScope.user.userId }">
																 		&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true" style="font-size: 25px;"></span>
																 	</c:if>
																 </a>
																 <%-- 해당 댓글 삭제 --%>
																 <a href="#" class="reply delete">
																 <%-- 해당 댓글 작성자 또는 해당 게시물 작성자 또는 모임대표 또는 관리자 --%>
																 <c:if test="${ clubPost.getClubPostCommentList[i].user.userId == sessionScope.user.userId || clubPost.getClubPost.user.userId == sessionScope.user.userId
																 || fn:trim(sessionScope.clubUser.memberRole) == '2' || sessionScope.user.role == '1' }">
																  	&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment comment" aria-hidden="true" style="font-size: 25px;"></span>
																  </c:if>
																  </a>
																 <%-- 해당 댓글 신고 --%>
																  <a href="#" class="reply report">
																  	<c:if test="${ clubPost.getClubPostCommentList[i].user.userId != sessionScope.user.userId }">
																  		&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" style="font-size: 25px;"></span>
																  	</c:if>
																  </a>
															 </div>
														 </div>
													</div><!-- comment-meta -->
													<p>${ clubPost.getClubPostCommentList[i].commentContent }</p>
													<div class="comment-author">
													<c:choose>
														<c:when test="${ clubPost.getClubPostCommentList[i].commentCount > 0 }">
															<cite>
																<a class="recommentList">댓글 <b class="recomment_count">${ clubPost.getClubPostCommentList[i].commentCount }</b>개</a>
															<cite>
														</c:when>
														<c:otherwise>
															<cite>
																<a class="recommentList"><b class="recomment_count"></b></a>
															<cite>
														</c:otherwise>
													</c:choose>
													</div>
												</div><!-- single-comment -->
												
												<div class="clear-after-comment-add${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentTextArea="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="display: none;">
													
													<br>
													<form class="comment-form-add">
														<textarea class="plain buffer" placeholder="댓글작성란"></textarea>
														<input class="plain button red add" value="등록완료">
														<input class="plain button red cancle" value="취소">
													</form>
													<br>
													
												</div><!-- post-comment -->	
												
												<div class="clear-after-comment-update${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentTextArea="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="display: none;">
													
													<br>
													<form class="comment-form-update">
														<textarea class="plain buffer"></textarea>
														<input class="plain button red update${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" value="수정완료">
														<input class="plain button red cancle" value="취소">
													</form>
													<br>
													
												</div><!-- post-comment -->
												
												
												
												
												
												<%-- 대댓글리스트 --%>
												<div class="recomment-header depth">
													<div class="recomment-header-space"></div>
													<div class="recomment-header-body">
														<ul class="children plain${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" clubCondition="0">
															
															<%-- "<div class='comment-parent'>"
																	<li class="recomment">
																		 <div class="single-comment${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" depth="2" commentNo="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" revUserId="${ clubPost.getClubPostCommentList[i].user.userId }">
																			<div class="comment-author">
																				<cite><a href="#"><img src="/resources/image/uploadFiles/${ clubPost.getClubPostCommentList[i].user.profileImage }" class="avatar" alt=""></a></cite>
																				<cite><a href="#">${ clubPost.getClubPostCommentList[i].user.nickName }</a></cite>
																				<span class="says">says:</span>
																			</div><!-- comment-author -->
																			<div class="comment-meta">
																				<c:choose>
																					<c:when test="${ empty clubPost.getClubPostCommentList[i].commentUpdateDate }"><time datetime="2013-03-23 19:58">${ clubPost.getClubPostCommentList[i].commentRegDate }</time></c:when>
																					<c:otherwise><time datetime="2013-03-23 19:58">${ clubPost.getClubPostCommentList[i].commentUpdateDate }(수정됨)</time></c:otherwise>
																				</c:choose>
																				
																				해당 댓글의 해당 유저의 좋아요 여부에 따라 이미지 변한다
																				<div class="comment body">
																					<div class="comment-heart-${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
																					 	<a class="reply heartCondition">
																				 			<!-- 하트컨디션이 댓글번호면 좋아요/0이면 좋아요 안했다 -->
																				 			<img src="/resources/image/uploadFiles/${ clubPost.getClubPostCommentList[i].heartCondition != 0 ? 'heart.jpg' : 'no_heart.jpg' }" height="40" width="40">
																						 </a>
																					 </div>
																					 <div>
																						해당 댓글의 좋아요 수
																						 <span class="commentHeartCount${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="font-size: 30px;">${ clubPost.getClubPostCommentList[i].commentHeartCount }</span>
																						
																						해당 댓글의 댓글 등록
																						 <a class="reply add">
																						 	&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-plus-sign" aria-hidden="true" style="font-size: 25px;"></span>
																						 </a>
																						 해당 댓글 수정
																						 <a class="reply update">
																						 	<c:if test="${ clubPost.getClubPostCommentList[i].user.userId == sessionScope.user.userId }">
																						 		&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true" style="font-size: 25px;"></span>
																						 	</c:if>
																						 </a>
																						 해당 댓글 삭제
																						 <a href="#" class="reply delete">
																						 해당 댓글 작성자 또는 해당 게시물 작성자 또는 모임대표 또는 관리자
																						 <c:if test="${ clubPost.getClubPostCommentList[i].user.userId == sessionScope.user.userId || clubPost.getClubPost.user.userId == sessionScope.user.userId
																						 || fn:trim(sessionScope.clubUser.memberRole) == '2' || sessionScope.user.role == '1' }">
																						  	&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment comment" aria-hidden="true" style="font-size: 25px;"></span>
																						  </c:if>
																						  </a>
																						 해당 댓글 신고
																						  <a href="#" class="reply report">
																						  	<c:if test="${ clubPost.getClubPostCommentList[i].user.userId != sessionScope.user.userId }">
																						  		&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" style="font-size: 25px;"></span>
																						  	</c:if>
																						  </a>
																					 </div>
																				 </div>
																			</div><!-- comment-meta -->
																			<p>${ clubPost.getClubPostCommentList[i].commentContent }</p>
																			<c:choose>
																				<c:when test="${ clubPost.getClubPostCommentList[i].commentCount > 0 }">
																					<div class="comment-author">
																						<cite>
																							<a class="123">댓글 ${ clubPost.getClubPostCommentList[i].commentCount }개</a>
																						<cite>
																					</div>
																				</c:when>
																			</c:choose>
																		</div> --%><!-- single-comment -->
														
																		<%-- <div class="clear-after-comment-update${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentTextArea="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="display: none;">
																			
																			<form class="comment-form-update">
																				<textarea class="plain buffer"></textarea>
																				<input class="plain button red add${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" value="수정완료" style="height: 30px; width: 90px;">
																				<input class="plain button red cancle" value="취소" style="height: 30px; width: 60px;">
																			</form>
																			
																		</div><!-- post-comment -->
													
																	</li>
																</div> --%>
																	
																	
														</ul>
													</div>
												</div>
												<br>
												<%-- 대댓글 for문 --%>
											</div>
											
											
											
											
										</c:if>
									</c:forEach>
								</c:if>
							</li>
							<%--댓글 for문 --%>
						</ul>
					</div><!-- comment-section -->	
					
					
					
					
					

					<%-- <div class="comment-section">
						<h3 id="comments">
							<c:choose>
								<c:when test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">댓글 ${ clubPost.getClubPost.clubPostCommentCount } 개</c:when>
							</c:choose>
						</h3>
						<ul class="comment-list plain" style="background-color: aqua;">
							<li class="comment" style="background-color: red;">
								<div class="single-comment">
									<div class="comment-author">
										<img src="http://placehold.it/60x60" class="avatar" alt="">
										<cite><a href="#">Mark Robben</a></cite>
										<span class="says">says:</span>
									</div><!-- comment-author -->
									<div class="comment-meta">
										<time datetime="2013-03-23 19:58">March 23, 2013 at 7:58 pm</time> / <a href="#" class="reply">Reply</a>
									</div><!-- comment-meta -->
									<p>111</p>
								</div><!-- single-comment -->
								<ul class="children plain">
									<li class="comment">
										<div class="single-comment">
											<div class="comment-author">
												<img src="http://placehold.it/60x60" class="avatar" alt="">
												<cite><a href="#">Mark Robben</a></cite>
												<span class="says">says:</span>
											</div><!-- comment-author -->
											<div class="comment-meta">
												<time datetime="2013-03-23 19:58">March 23, 2013 at 7:58 pm</time> / <a href="#" class="reply">Reply</a>
											</div><!-- comment-meta -->
											<p>222</p>
										</div><!-- single-comment -->
										<ul class="children plain">
											<li class="comment">
												<div class="single-comment">
													<div class="comment-author">
														<img src="http://placehold.it/60x60" class="avatar" alt="">
														<cite><a href="#">Mark Robben</a></cite>
														<span class="says">says:</span>
													</div><!-- comment-author -->
													<div class="comment-meta">
														<time datetime="2013-03-23 19:58">March 23, 2013 at 7:58 pm</time> / <a href="#" class="reply">Reply</a>
													</div><!-- comment-meta -->
													<p>333</p>
												</div><!-- single-comment -->
											</li>
										</ul>										
									</li>
								</ul>
							</li>
							<li class="comment">
								<div class="single-comment">
									<div class="comment-author">
										<img src="http://placehold.it/60x60" class="avatar" alt="">
										<cite><a href="#">Mark Robben</a></cite>
										<span class="says">says:</span>
									</div><!-- comment-author -->
									<div class="comment-meta">
										<time datetime="2013-03-23 19:58">March 23, 2013 at 7:58 pm</time> / <a href="#" class="reply">Reply</a>
									</div><!-- comment-meta -->
									<p>444</p>
								</div><!-- single-comment -->
							</li>	
							<li class="comment">
								<div class="single-comment">
									<div class="comment-author">
										<img src="http://placehold.it/60x60" class="avatar" alt="">
										<cite><a href="#">Mark Robben</a></cite>
										<span class="says">says:</span>
									</div><!-- comment-author -->
									<div class="comment-meta">
										<time datetime="2013-03-23 19:58">March 23, 2013 at 7:58 pm</time> / <a href="#" class="reply">Reply</a>
									</div><!-- comment-meta -->
									<p>555</p>
								</div><!-- single-comment -->
							</li>													
						</ul>
					</div> --%><!-- comment-section -->
											
				</div><!-- row-content -->
			</div><!-- row -->
		</main><!-- main -->
		
		
		
		
		<!-- 모달창 start -->
		<div class="modal fade" id="club-post-update-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</button>
						<h3 class="modal-title" id="exampleModalLabel">게시물 수정하기</h5>
					</div>
					<div class="club-post-update-view">
						<form name="summernoteUpdateClubPost">
	
							<input type="hidden" id="clubNo" value="${ clubPost.getClubPost.clubNo }">
							<input type="hidden" id="clubPostNo" value="${ clubPost.getClubPost.clubPostNo }">
							
							<div class="clubPostTitle">
								<input type="text" name="clubPostTitle" placeholder="제목">
							</div>
							<textarea id="summernote" aria-multiline="true" name="clubPostContent"></textarea>
							<input type="button" id="summernoteUpdate" value="게시물 수정">
							<input type="button" id="summernoteCancle" value="이전으로">
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달창 end -->
		
		
		
		
		
		<script type="text/javascript">
		<%-- 이미지 클릭시 다이얼로그 온 --%>
		$(function(){
			
			var user_Id = "";
			
			   
			   $('.dl').on("click",function(){
			      
			   user_Id = $(this).parent().attr("userId");
			   var nickName = $(this).attr("nickName");
			   var profileImage = $(this).attr("profileImage");
			   
			   //alert(user_Id);
			   //alert(nickName);
			   //alert(profileImage);
			   
			   //alert(followUser.receiveId.userId);
			   $.ajax("/myHomeRest/json/getFollow", {

			      type : "POST",
			      data : JSON.stringify({
			         receiveId : user_Id
			      }),
			      dataType : "json",
			      contentType : "application/json",
			      headers : {
			         "Accept" : "application/json"
			      },
			      success : function(Data, status) {
			      if(Data.follow != null){
			         var freceiveId = Data.follow.receiveId.userId;
			         var fnickName = Data.follow.receiveId.nickName;
			         var fprofileImage = Data.follow.receiveId.profileImage;
			         var ffbType = Data.follow.fbType;
			         var ffbState = Data.follow.fbState;
			      }else{
			         var freceiveId = "";
			         var fnickName = "";
			         var fprofileImage = "";
			         var ffbType = "";
			         var ffbState = "";
			      }
			      if(Data.block != null){
			         var breceiveId = Data.block.receiveId.userId;
			            var bnickName = Data.block.receiveId.nickName;
			         var bprofileImage = Data.block.receiveId.profileImage;
			         var bfbType = Data.block.fbType;
			         var bfbState = Data.block.fbState;
			      }else{
			         var breceiveId = "";
			            var bnickName = "";
			         var bprofileImage = "";
			         var bfbType = "";
			         var bfbState = "";
			      }
			         
			         
			      
			      
			         
			         if( freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '1' && bfbType.trim() == '2' && bfbState.trim() == '1' ){
			            var value =
			               "<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='following' class='btn btn-danger btn-sm'>"+
			               "팔로잉</button><button type='button' id='stopBlock' class='btn btn-danger btn-sm'>차단해제</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			         }else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '2' && bfbType.trim() == '2' && bfbState.trim() == '1'){
			            var value =
			               "<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='updateFollow' class='btn btn-danger btn-sm'>"+
			               "팔로우</button><button type='button' id='stopBlock' class='btn btn-danger btn-sm'>차단해제</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			         }else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '1' && bfbType.trim() == '2' && bfbState.trim() == '2'){
			            var value =
			               "<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='following' class='btn btn-danger btn-sm'>"+
			               "팔로잉</button><button type='button' id='updateBlock' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			         }else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '2' && bfbType.trim() == '2' && bfbState.trim() == '2'){
			            var value =
			               "<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='updateFollow' class='btn btn-danger btn-sm'>"+
			               "팔로우</button><button type='button' id='updateBlock' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			         }else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '1' && bfbType == ""){
			            var value =
			               "<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='following' class='btn btn-danger btn-sm'>"+
			               "팔로잉</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			         }else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '2' && bfbType == "" ){
			            var value =
			               "<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='updateFollow' class='btn btn-danger btn-sm'>"+
			               "팔로우</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			         }else if(breceiveId == user_Id && ffbType == ""  && bfbType.trim() == '2' && bfbState.trim() == '1'){
			            var value =
			               "<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+bprofileImage+"' style='width:100px; height:100px;'><div><h4>"+bnickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
			               "팔로우</button><button type='button' id='stopBlock' class='btn btn-danger btn-sm'>차단해제</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			         }else if(breceiveId == user_Id && ffbType == ""  && bfbType.trim() == '2' && bfbState.trim() == '2'){
			            var value =
			               "<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+bprofileImage+"' style='width:100px; height:100px;'><div><h4>"+bnickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
			               "팔로우</button><button type='button' id='updateBlock' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			         }else if(ffbType == ""  && bfbType == "" ){
			            var value =
			               "<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+profileImage+"' style='width:100px; height:100px;'><div><h4>"+nickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
			               "팔로우</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			         }
			         
			          $("#"+nickName+"").html(value);
			      
			         
			            $("#"+nickName+"").dialog({
			               
			               autoOpen: false,
			               show: {
			                  effect: "Pulsate",
			                    duration: 1000
			               },
			               hide: {
			                    effect: "Scale",
			                    duration: 1000
			               },
			               position: {
			                  
			                  my:"center",
			                  at:"center",
			                  of:"#"+user_Id+""
			               }
			               
			            });
			   
			   
			             $("#"+nickName+"").dialog("open");
			   
			      },
			      error : function(){
			         var value =
			            "<div name='dialog'><img src='/resources/image/uploadFiles/"+profileImage+"' style='width:100px; height:100px;'><div><h4>"+nickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
			            "팔로우</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			            
			          $("#"+nickName+"").html(value);
			            
			            
			            $("#"+nickName+"").dialog({
			               
			               autoOpen: false,
			               show: {
			                  effect: "Pulsate",
			                    duration: 1000
			               },
			               hide: {
			                    effect: "Scale",
			                    duration: 1000
			               },
			               position: {
			                  
			                  my:"right",
			                  at:"right",
			                  of:"#"+user_Id+""
			               }
			               
			            });
			   
			   
			             $("#"+nickName+"").dialog("open");
			      }
			   })

			}) 
			$(".main").on("click",function(){

			    $("div[name='dialog']").parent().dialog("close");

			}) 

			



			   
			   
		<%-- 이미지 클릭시 다이얼로그 온 --%>
		
		
		
		
		
		<%-- 다이얼로그 창의 차단버튼과 팔로우 활성화 --%>

		      $(document).on("click","#follow", function() {
		         var userId = $(this).parent().parent().attr("id");
		         console.log("전달받은 회원 Id : " + userId);

		         $.ajax("/myHomeRest/json/getFollow", {
		            type : "POST",
		            data : JSON.stringify({
		               receiveId : userId,
		               fbType : "1"
		            }),
		            dataType : "json",
		            contentType : "application/json",
		            headers : {
		               "Accept" : "application/json"
		            },
		            success : function(data, status) {
		               console.log(data);
		               console.log(data.follow);
		            if(data.follow != null ){
		               console.log("서버로 받은 데이터 : " + data.follow.userId);
		               console.log("서버로 받은 데이터 : " + data.follow.fbState);
		               var fbState = "";
		               if(data.follow.fbState == 1){
		                  fbState = "2";
		               }else if(data.follow.fbState == 2){
		                  fbState = "1";
		               }
		               
		               console.log("state 값 : "+fbState);
		               $.ajax("/myHomeRest/json/updateFollow", {
		                  type : "POST",
		                  data : JSON.stringify({
		                     receiveId : userId,
		                     fbType : "1",
		                     fbState : fbState
		                  }),
		                  dataType : "json",
		                  contentType : "application/json",
		                  headers : {
		                     "Accept" : "application/json"
		                  },
		                  success : function(update, status) {
		                     console.log("서버로 받은 데이터(정상) : " + update.follow.userId);
		                     if(update.follow.fbState == 1){
		                        $("#follow").text("팔로잉");
		                           if(sock) {
		                                 var Msg = "follow," + userId + ",0, 가 나를 팔로우 했습니다."
		                                 sock.send(Msg);
		                           }
		                        }else if(update.follow.fbState == 2){
		                        $("#follow").text("팔로우");
		                        }
		                  }
		               })
		               }else if(data.follow ==null){
		                  console.log("서버로 받은 데이터(error) : " + data.follow);

		                  $.ajax("/myHomeRest/json/addFollow", {
		                     type : "POST",
		                     data : JSON.stringify({
		                        receiveId : userId
		                     }),
		                     dataType : "json",
		                     contentType : "application/json",
		                     headers : {
		                        "Accetp" : "application/json"
		                     },
		                     success : function(Data, status) {
		                        console.log("서버로부터 받은 Data(error) : " + Data);
		                        $("#follow").text("팔로잉");
		                        
		                        if(sock) {
		                              var Msg = "follow," + userId + ",0, 가 나를 팔로우 했습니다."
		                              sock.send(Msg);
		                        }
		                     }
		                  })
		               } 
		            }
		            
		         })
		      })

		       $(document).on("click","#following", function() {
		         var userId = $(this).parent().parent().attr("id");
		         console.log("전달받은 회원 Id : " + userId);
		           
		         $.ajax("/myHomeRest/json/getFollow", {
		            type : "POST",
		            data : JSON.stringify({
		               receiveId : userId,
		               fbType : "1"
		            }),
		            dataType : "json",
		            contentType : "application/json",
		            headers : {
		               "Accept" : "application/json"
		            },
		            success : function(data, status) {
		               console.log(data);
		               console.log("서버로 받은 데이터 : " + data.follow.userId);
		               console.log("서버로 받은 데이터 : " + data.follow.fbState);
		               var fbState = "";
		               if(data.follow.fbState == 1){
		                  fbState = "2";
		               }else if(data.follow.fbState == 2){
		                  fbState = "1";
		               }
		               
		               console.log("state 값 : "+fbState);
		               $.ajax("/myHomeRest/json/updateFollow", {
		                  type : "POST",
		                  data : JSON.stringify({
		                     receiveId : userId,
		                     fbType : "1",
		                     fbState : fbState
		                  }),
		                  dataType : "json",
		                  contentType : "application/json",
		                  headers : {
		                     "Accept" : "application/json"
		                  },
		                  success : function(update, status) {
		                     console.log("서버로 받은 데이터(정상) : " + update.follow.userId);
		                     if(update.follow.fbState == 1){
		                     $("#following").text("팔로잉");
		                     if(sock) {
		                           var Msg = "follow," + userId + ",0, 가 나를 팔로우 했습니다."
		                           sock.send(Msg);
		                     }
		                     }else if(update.follow.fbState == 2){
		                     $("#following").text("팔로우");
		                     }
		                  }
		               })
		            }
		         })
		      }) 

		       $(document).on("click","#updateFollow", function() {
		         var userId = $(this).parent().parent().attr("id");
		         console.log("전달받은 회원 Id : " + userId);

		         $.ajax("/myHomeRest/json/getFollow", {
		            type : "POST",
		            data : JSON.stringify({
		               receiveId : userId,
		               fbType : "1"
		            }),
		            dataType : "json",
		            contentType : "application/json",
		            headers : {
		               "Accept" : "application/json"
		            },
		            success : function(data, status) {
		               console.log("서버로 받은 데이터 : " + data.follow.userId);
		               console.log("서버로 받은 데이터 : " + data.follow.fbState);
		               var fbState = "";
		               if(data.follow.fbState == 1){
		                  fbState = "2";
		               }else if(data.follow.fbState == 2){
		                  fbState = "1";
		               }
		               
		               console.log("state 값 : "+fbState);
		               $.ajax("/myHomeRest/json/updateFollow", {
		                  type : "POST",
		                  data : JSON.stringify({
		                     receiveId : userId,
		                     fbType : "1",
		                     fbState : fbState
		                  }),
		                  dataType : "json",
		                  contentType : "application/json",
		                  headers : {
		                     "Accept" : "application/json"
		                  },
		                  success : function(update, status) {
		                     console.log("서버로 받은 데이터(정상) : " + update.follow.userId);
		                     if(update.follow.fbState == 1){
		                     $("#updateFollow").text("팔로잉");
		                     if(sock) {
		                           var Msg = "follow," + userId + ",0, 가 나를 팔로우 했습니다."
		                           sock.send(Msg);
		                     }
		                     }else if(update.follow.fbState == 2){
		                     $("#updateFollow").text("팔로우");
		                     }
		                  }
		               })
		            }
		         })
		      })


		      $(document).on("click","#block", function() {
		         var userId = $(this).parent().parent().attr("id");
		         console.log("전달받은 회원 Id : " + userId);

		         $.ajax("/myHomeRest/json/getFollow", {
		            type : "POST",
		            data : JSON.stringify({
		               receiveId : userId,
		               fbType : "2"
		            }),
		            dataType : "json",
		            contentType : "application/json",
		            headers : {
		               "Accept" : "application/json"
		            },
		            success : function(data, status) {
		               console.log(data);
		               console.log(data.block);
		               if(data.block != null ){
		               console.log("서버로 받은 데이터 : " + data.block.userId);
		               console.log("서버로 받은 데이터 : " + data.block.fbState);
		               var fbState = "";
		               if(data.block.fbState == 1){
		                  fbState = "2";
		               }else if(data.block.fbState == 2){
		                  fbState = "1";
		               }
		               
		               console.log("state 값 : "+fbState);
		               $.ajax("/userRest/json/updateBlock", {
		                  type : "POST",
		                  data : JSON.stringify({
		                     receiveId : userId,
		                     fbType : "2",
		                     fbState : fbState
		                  }),
		                  dataType : "json",
		                  contentType : "application/json",
		                  headers : {
		                     "Accept" : "application/json"
		                  },
		                  success : function(update, status) {
		                     console.log("서버로 받은 데이터(정상) : " + update.block.userId);
		                     if(update.block.fbState == 1){
		                        $("#block").text("차단해제");
		                        }else if(update.block.fbState == 2){
		                        $("#block").text("차단");
		                        }
		                  }
		               })
		               }else if(data.block ==null){
		                  console.log("서버로 받은 데이터(error) : " + data.block);

		                  $.ajax("/userRest/json/addBlock", {
		                     type : "POST",
		                     data : JSON.stringify({
		                        receiveId : userId
		                     }),
		                     dataType : "json",
		                     contentType : "application/json",
		                     headers : {
		                        "Accetp" : "application/json"
		                     },
		                     success : function(Data, status) {
		                        console.log("서버로부터 받은 Data(error) : " + Data);
		                        $("#block").text("차단해제");
		                     }
		                  })
		               }
		            }
		            
		         })
		      })

		      $(document).on("click","#stopBlock", function() {
		         var userId = $(this).parent().parent().attr("id");
		         console.log("전달받은 회원 Id : " + userId);

		         $.ajax("/myHomeRest/json/getFollow", {
		            type : "POST",
		            data : JSON.stringify({
		               receiveId : userId,
		               fbType : "2"
		            }),
		            dataType : "json",
		            contentType : "application/json",
		            headers : {
		               "Accept" : "application/json"
		            },
		            success : function(data, status) {
		               console.log(data);
		               console.log("서버로 받은 데이터 : " + data.block.userId);
		               console.log("서버로 받은 데이터 : " + data.block.fbState);
		               var fbState = "";
		               if(data.block.fbState == 1){
		                  fbState = "2";
		               }else if(data.block.fbState == 2){
		                  fbState = "1";
		               }
		               
		               console.log("state 값 : "+fbState);
		               $.ajax("/userRest/json/updateBlock", {
		                  type : "POST",
		                  data : JSON.stringify({
		                     receiveId : userId,
		                     fbType : "2",
		                     fbState : fbState
		                  }),
		                  dataType : "json",
		                  contentType : "application/json",
		                  headers : {
		                     "Accept" : "application/json"
		                  },
		                  success : function(update, status) {
		                     console.log("서버로 받은 데이터(정상) : " + update.block.userId);
		                     if(update.block.fbState == 1){
		                     $("#stopBlock").text("차단해제");
		                     }else if(update.block.fbState == 2){
		                     $("#stopBlock").text("차단");
		                     }
		                  }
		               })
		            }
		         })
		      })

		      $(document).on("click","#updateBlock", function() {
		         var userId = $(this).parent().parent().attr("id");
		         console.log("전달받은 회원 Id : " + userId);

		         $.ajax("/myHomeRest/json/getFollow", {
		            type : "POST",
		            data : JSON.stringify({
		               receiveId : userId,
		               fbType : "2"
		            }),
		            dataType : "json",
		            contentType : "application/json",
		            headers : {
		               "Accept" : "application/json"
		            },
		            success : function(data, status) {
		               console.log("서버로 받은 데이터 : " + data.block.userId);
		               console.log("서버로 받은 데이터 : " + data.block.fbState);
		               var fbState = "";
		               if(data.block.fbState == 1){
		                  fbState = "2";
		               }else if(data.block.fbState == 2){
		                  fbState = "1";
		               }
		               
		               console.log("state 값 : "+fbState);
		               $.ajax("/userRest/json/updateBlock", {
		                  type : "POST",
		                  data : JSON.stringify({
		                     receiveId : userId,
		                     fbType : "2",
		                     fbState : fbState
		                  }),
		                  dataType : "json",
		                  contentType : "application/json",
		                  headers : {
		                     "Accept" : "application/json"
		                  },
		                  success : function(update, status) {
		                     console.log("서버로 받은 데이터(정상) : " + update.block.userId);
		                     if(update.block.fbState == 1){
		                     $("#updateBlock").text("차단해제");
		                     }else if(update.block.fbState == 2){
		                     $("#updateBlock").text("차단");
		                     }
		                  }
		               })
		            }
		         })
		      })
		    
		    <%-- 1:1 채팅 --%>
			$(document).on("click","button:contains('채팅')", function() {
				//alert("a");
				$("#chat-icon").attr("style", "display:none");
				// 채팅창 보인다
				$("#allChat").attr("style", "position: fixed; bottom: 0; right: 0; margin-right: 50px; margin-bottom: 50px; border-radius: 40px; padding: 10px; padding-top: 20px; width: 350px; height: 700px; box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;");
				 	  
				// 1:1채팅 보이고 모임채팅 숨긴다
				$("#user-chat-list").removeAttr("style");
				$("#club-chat-list").attr("style", "display: none");
				// 1:1채팅 이미지 테두리 이벤트, 모임채팅 이미지 테두리 이벤트 없애기
				$(this).attr("style", "box-shadow: rgba(102, 051, 102, 0.3) 0px 9px 38px, rgba(95, 0, 128, 0.3) 0px 5px 12px;");
				$(".chat-img-sidebar.people-users").removeAttr("style");
				
				//alert( "1:1 채팅하고하는 상대방 아이디 : " + user_Id );
				var make_roomId = "";
				

				socket.disconnect();
				$('#chatLog').empty();
				
				$("#allChat-toobar-title").attr("style", "display: none");
				$("#allChat-toobar-back").removeAttr("style");
				
				$("#chat-list-content").attr("style", "display: none");
				$("#chat-room-content").removeAttr("style");
				
				// ajax로 roomId 만들어서 DB에 넣고
				$.ajax( "/clubPostRest/json/addChat",
						{
							method : "POST",
							data : JSON.stringify({
								userId2 : user_Id
							}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								//alert(status);
								
								var user_chat_list = "";
								$("#user-chat-list").empty();
								
								for (var i = 0; i < JSONData.length; i++) {
									//alert(JSONData[i].roomId);
									//alert(JSONData[i].user2.nickName);
									//alert(JSONData[i].user2.profileImage);
									//alert(JSONData[i].currentRoomId);
									
									make_roomId = JSONData[i].currentRoomId;

									// 넣은 roomId까지 가져와서 1:1채팅 리스트 돌리고
									user_chat_list = "<div class='chat-content chat-content-onechat' roomId='"+JSONData[i].roomId+"' namespace='userchat'>"
															+"<div>"
																+"<img class='chat-img-main' src='/resources/image/uploadFiles/"+JSONData[i].user2.profileImage+"'>"
															+"</div>"
															+"<div>"+JSONData[i].user2.nickName+"</div>"
														+"</div>";
									
									$("#user-chat-list").append( user_chat_list );
								}
								
								//alert( make_roomId );
								console.log(socket)
								
								//소켓서버에 접속시킨다.
								socket = io("http://192.168.0.74:3000/userchat", { // clubchat 네임스페이스
									cors: { origin: "*" },
									path: '/socket.io',
									query: {
										userId : $("#session_userId").val(),
										profileImage : $("#session_profileImage").val(),
										nickName : $("#session_nickName").val(),
										roomId : make_roomId
									},
									forceNew: true,
									autoConnect:false
								});
								console.log(socket)
								
								setChat()
								
								socket.connect()
								
								
							}//end of success	
						});// end of ajax
			
						
				// 만든 roomId = '${ sessionScope.user.userId }'+user_Id로 채팅방 접속한다
				//alert( make_roomId );
				
				//소켓서버에 접속시킨다.
				/* socket = io.connect("http://192.168.0.74:3000/userchat", { // clubchat 네임스페이스
					cors: { origin: "*" },
					path: '/socket.io',
					query: {
						userId : $("#session_userId").val(),
						profileImage : $("#session_profileImage").val(),
						nickName : $("#session_nickName").val(),
						roomId : make_roomId,
					},
					forceNew: true
				}); */
				// 소켓 접속
				
				//server message 라는 이벤트명으로 대기
				/* socket.on('server message', function(data){
				    //console.log(data);
				    
				    var display = "";
					    
					    if( $("#session_nickName").val() != data.username ){
					    	display = "<div style='display: grid; grid-template-columns: 1fr 8fr;'>"
										+"<div><img src='/resources/image/uploadFiles/"+data.profileImage+"' height='50px' width='50px' style='border-radius: 100px;'></div>"
										+"<div>"
											+"<div>"+data.username+"</div>"
											+"<div>"
												+"<div>"+data.message+"</div>"
											+"</div>"
										+"</div>"
									+"</div>";
					    		
					    }else{
					    	display = "<div style='display: grid; grid-template-columns: 8fr 1fr;'>"
										+"<div>"
											+"<div style='float: right;'>"+data.username+"</div>"
											+"<div>"
												+"<div style='float: right;'>"+data.message+"</div>"
											+"</div>"
										+"</div>"
										+"<div><img src='/resources/image/uploadFiles/"+data.profileImage+"' height='50px' width='50px' style='border-radius: 100px;'></div>"
									+"</div>";
					    }
				    					    
				    
				    //소켓서버로부터 수신한 메시지를 화면에 출력한다.
					$('#chatLog').append(display);
				    
				}); */
				// 이벤트명으로 대기하다가 서버에서 데이터가 오면 출력한다
			 	  
			});//end of 프로필사진의 채팅 클릭시 1:1 채팅

			
			
			
			
		   });//end of $(function
		<%-- 다이얼로그 창의 차단버튼과 팔로우 활성화 --%>
		
		</script>
		
		
		
		
				
	</body>

</html>
