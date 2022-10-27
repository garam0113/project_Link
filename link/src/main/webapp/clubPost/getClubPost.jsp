<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="The Page Description">
		
		<style type="text/css">@-ms-viewport{width: device-width;}</style>
		
		<title>모임 게시물 상세보기</title>
		
		<!-- 사용자 정의 css -->
		<link rel="stylesheet" href="/resources/css/clubPost/clubPost.css" type="text/css" media="screen" title="no title">
		
		<link rel="stylesheet" href="css/layers.min.css" media="screen">
		<link rel="stylesheet" href="css/font-awesome.min.css" media="screen"> 
		<link rel="stylesheet" href="style.css" media="screen">
		<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css'>
		
		<!-- 수정, 삭제, 신고 아이콘 가져올 수 있다 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

		<link rel="icon" href="favicon.ico">
		<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/apple-touch-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/apple-touch-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/apple-touch-icon-152x152.png">
		
		<!--  font -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
		
		<!-- Swal 쓰기위한 cdn -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		
		<script type="text/javascript">
		$(function(){
			
			
			
			///////////////////////////////////////// textarea ////////////////////////////////////////////////
			
			
			
			<%-- 댓글등록 버튼 클릭시 버튼 숨기고 게시물의 댓글을 등록할 수 있는 textarea 보여진다 --%>
			$("input[value='댓글등록']").bind("click", function(){
				alert("게시물 댓글 등록");
				
				// 댓글작성 textarea와 등록 취소 버튼 보이기
				$(this).parent().next().removeAttr("style");
				
				// 댓글등록 버튼 숨기기
				$(this).parent().attr("style", "display: none");
			});
			
			<%-- 취소하기 버튼 클릭시 게시물의 댓글을 등록할 수 있는 textarea 숨기고 댓글등록 버튼 보여진다 --%>
			$("input[value='취소하기']").bind("click", function(){
				alert("게시물 댓글 취소");
				
				// 댓글작성란 textarea에 있는 내용 지우기
				$(this).prev().prev().val("");
				
				// 게시물 댓글등록 버튼 보이기
				$(this).parent().parent().prev().removeAttr("style");
				
				// 댓글취소 버튼 숨기기
				$(this).parent().parent().attr("style", "display: none");
			});

			<%-- 댓글의 댓글을 등록할 수 있는 textarea 보여진다 --%>
			$(document).on("click", ".reply.add", function(){
				alert('대댓글 등록');
				
				// display : none을 제거하여 댓글작성란이 보이게한다
				$(".clear-after-comment-add").attr("style", "display: none");
				$(".clear-after-comment-update").attr("style", "display: none");

				// display : none을 제거하여 댓글작성란이 보이게한다
				$(this).parent().parent().parent().parent().next().removeAttr("style");
			}); // end of 등록

			<%-- 해당 댓글을 수정할 수 있는 입력텍스트 보여진다 --%>
			$(document).on("click", ".reply.update", function(){
				alert('대댓글 수정');
				
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
				alert('대댓글 취소');
				
				// 댓글을 지운다
				$(this).siblings("textarea").val("");
				
				// 댓글 작성란을 숨긴다
				$(this).parent().parent().attr("style", "display: none");
			});
			
			
			
			///////////////////////////////////////// clubPost ////////////////////////////////////////////////
			
			
			
			<%-- 모임 게시물 수정 --%>
			$(".clubPost-header-update").bind("click", function(){
				alert("모임게시물 수정");
				$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
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
				alert("모임게시물 신고");
				event.stopPropagation();
				$("form[name='clubPostReport']").attr("method", "post").attr("action", "/serviceCenter/addReport" ).submit();
			});

			<%-- 모임 게시물 좋아요 또는 좋아요취소 --%>
			$(".clubPost-header-heart").bind("click", function(){
				alert("모임게시물 좋아요");
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
							}
						});
			}); // end of 하트
			
			
			
			///////////////////////////////////////// commentList ////////////////////////////////////////////////
			
			

			<%-- 모임 게시물 댓글리스트 가져온다 --%>
			$(document).on("click", ".recommentList", function(){
				alert("댓글 개수 클릭시 해당 댓글의 댓글리스트 가져온다");
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
				alert('댓글 등록완료');
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
													
													+"<c:if test='"+JSONData.commentCount+">0'>"
															+"<div class='comment-author'>"
																+"<cite>"
																	+"<a class='recommentList'>댓글 "+JSONData.commentCount+"개</a>"
																+"<cite>"
															+"</div>"
													+"</c:if>"
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
										
										
											
								if( depth == 0 ){
									alert( "게시물의 댓글등록" );
									$(".comment-list.plain").append( display );
								}else if( depth == 1 ){
									alert( "댓글의 댓글등록" );
									$(".children.plain"+clubPostCommentNo).append( display );
								}
								//alert( display );
							}// end of success

				});// end of ajax
			}); // end of 등록

			<%-- 해당 댓글을 수정한다 --%>
			$(document).on("click", "input[value='수정완료']", function(){
				alert('댓글 수정완료');
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
				alert("댓글 좋아요");
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
				alert("댓글 신고");
				var clubPostCommentNo = $(this).parent().parent().parent().parent().attr("commentNo");
				var revUserId = $(this).parent().parent().parent().parent().attr("revUserId");
				
				$("#sourceNumber").val( clubPostCommentNo );
				$("#revUserId").val( revUserId );
				
				event.stopPropagation();
				
				$("form[name='commentReport']").attr("method", "post").attr("action", "/serviceCenter/addReport" ).submit();
				
			}) // .report evenet close
			
			
			
			///////////////////////////////////////// MyHome ////////////////////////////////////////////////
			
			

			<%-- 프로필사진 클릭시 해당유저 마이홈피로 이동 --%>
			$(document).on("click", ".clubPost-header-profile", function(){
				location.href = "/myHome/getYourHome?userId="+$(this).attr("userId");
			});//end of 마이홈피 이동

			<%-- 닉네임 클릭시 해당유저 마이홈피로 이동 --%>
			$(document).on("click", ".clubPost-header-nickName", function(){
				location.href = "/myHome/getYourHome?userId="+$(this).attr("userId");
			});//end of 마이홈피 이동
			
			
		});
		</script>
		
		<script type="text/javascript">
			function clubPostdeleteFnc(){
				$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
			}
		</script>
		
	</head>

	<body class="single single-post">
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
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

		<main role="main">
			<div id="intro-wrap">
				<div id="intro" class="preload darken" data-autoplay="5000" data-navigation="true" data-pagination="true" data-transition="fade">
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="photocaption">
							<h4>Photography by <a href="http://danielezedda.com/">Daniele Zedda</a></h4>
						</div><!-- photocaption -->
					</div>
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="photocaption">
							<h4>Photography by <a href="http://danielezedda.com/">Daniele Zedda</a></h4>
						</div><!-- photocaption -->
					</div>	
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="photocaption">
							<h4>Photography by <a href="http://danielezedda.com/">Daniele Zedda</a></h4>
						</div><!-- photocaption -->
					</div>	
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="photocaption">
							<h4>Photography by <a href="http://danielezedda.com/">Daniele Zedda</a></h4>
						</div><!-- photocaption -->
					</div>															
				</div><!-- intro -->				
			</div><!-- intro-wrap -->

			<div id="main" class="row">
				<div class="row-content buffer-left buffer-right buffer-bottom clear-after">
				<!-- <div class="row-content buffer-left buffer-right buffer-bottom"> -->
				
				
				
					<ul class="inline cats filter-options">
						<li data-group="advertising">
							<a href="/club/getClubList">모임 일정</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList">모임 게시물</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList">모임원</a>
						</li>
						<li data-group="infographics">
							<a href="#">모임 채팅</a>
						</li>
					</ul>

					<div class="post-area clear-after">
						<article role="main">
							
							<h5><time datetime="2013-11-09" class="club-post-time">
							<c:choose>
								<c:when test="${ !empty clubPost.getClubPost.clubPostUpdateDate }">${ clubPost.getClubPost.clubPostUpdateDate }(수정 됨)</c:when>
								<c:otherwise>${ clubPost.getClubPost.clubPostRegDate }</c:otherwise>
							</c:choose>
							</time></h5>
							
							<div class="clubPost-header">
								<%-- 게시물 등록 회원 프로필 사진 --%>
								<div class="clubPost-header-profile" userId = "${ clubPost.getClubPost.user.userId }">
									<img class="profileImage" src="/resources/image/uploadFiles/${ clubPost.getClubPost.user.profileImage }">
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
								
								<div class="clubPost-body-title">${ clubPost.getClubPost.clubPostTitle }</div>
								
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

		<footer role="contentinfo">
			<div class="row">
				<div class="row-content buffer clear-after">
					<section id="top-footer">
						<div class="widget column three">
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
		</footer>

		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>		
		<script src="js/plugins.js"></script>
		<script src="js/beetle.js"></script>

	</body>

</html>
