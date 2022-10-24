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
		<title>Beetle - Single Blog Post Full Width</title>
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
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		
		<script type="text/javascript">
		$(function(){
			<%-- 모임 게시물 수정 --%>
			$(".clubPost-header-update").bind("click", function(){
				$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
			});
			
			<%-- 모임 게시물 삭제 --%>
			$("#club-post-delete").bind("click", function(){
				if(confirm("정말 삭제하시겠습니까?")){
					$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
				}
			});
			
			<%-- 모임 게시물 신고 --%>
			$(".clubPost-header-report").bind("click", function(){
				event.stopPropagation();
				$("form[name='clubPostReport']").attr("method", "post").attr("action", "/serviceCenter/addReport" ).submit();
			});

			<%-- 모임 게시물 좋아요 또는 좋아요취소 --%>
			$(".clubPost-header-heart").bind("click", function(){
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

			<%-- 모임 게시물 댓글리스트 가져온다 --%>
			/* $(document).on("click", "b:contains('댓글 수')", function(){
				alert("댓글 수");
				var clubPostCommentNo = $(this).attr("clubPostCommentNo");
				var clubPostNo = $(this).attr("clubPostNo");
				$.ajax( "/clubPostRest/json/getClubPostCommentList",
						{
							method : "POST",
							data : JSON.stringify({
										clubPostCommentNo : clubPostCommentNo,
										clubPostNo : clubPostNo
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								alert(status);
								$.each( JSONData, function( index, el ){
									var display = "<nav>"
													+"댓글 내용 : <div class='" + el.clubPostCommentNo + "'>" + el.commentContent + "</div>"
													+"<button class='" + el.clubPostCommentNo + "'>수정</button>"
													+"<input type='button' class='" + el.clubPostCommentNo + "' value='삭제'>"
													+"<b style='color : blue;'>댓글번호 : " + el.clubPostCommentNo + "</b></br>"
													+"댓글등록날짜 : " + el.commentRegDate + "</br>"
													+"댓글수정날짜 : " + el.commentUpdateDate + "</br>"
													+"댓글 좋아요 수 : " + el.commentHeartCount + "</br>"
													+"댓글 신고여부 : " + el.reportCondition + "</br>"
													+"댓글 삭제여부 : " + el.deleteCondition + "</br>"
													+"댓글 부모번호 : " + el.parent + "</br>"
													+"댓글 깊이 : " + el.depth + "</br>"
													+"댓글 순서 : " + el.sequence + "</br>"
													//+"<div class='"+el.clubPostCommentNo+"'>"
													//+"<b style='color : green;' clubPostNo="+el.clubPostNo+" clubPostCommentNo="
															//+el.clubPostCommentNo+">댓글 수 " + el.commentCount + "</b></br>"
													//+"</div>"
													+"</nav>";
									alert(display);
		
									$("nav[class='"+clubPostCommentNo+"']").append(display);
								});
							} // end of success
						}); // end of ajax
			}); // end of 댓글 수 */
			
			<%-- 게시물의 댓글을 등록할 수 있는 textarea 보여진다 --%>
			$("input[value='댓글등록']").bind("click", function(){
				$(this).parent().next().removeAttr("style");
				$(this).parent().attr("style", "display: none");
			});
			
			<%-- 게시물의 댓글을 등록할 수 있는 textarea 보여진다 --%>
			$("input[value='취소하기']").bind("click", function(){
				$(this).prev().prev().val("");
				$(this).parent().parent().prev().removeAttr("style");
				$(this).parent().parent().attr("style", "display: none");
			});

			<%-- 해당 댓글을 등록할 수 있는 입력텍스트 보여진다 --%>
			$(document).on("click", ".reply.add", function(){
				<%-- display : none을 제거하여 댓글작성란이 보이게한다 --%>
				alert('add');
				$(".clear-after-comment-add").attr("style", "display: none");
				$(".clear-after-comment-update").attr("style", "display: none");
				$(this).parent().parent().parent().parent().parent().children("div:eq(1)").removeAttr("style");
			}); // end of 등록
			
			<%-- 댓글 등록 또는 수정을 취소한다 --%>
			$(document).on("click", "input[value='취소']", function(){
				$(this).parent().parent().attr("style", "display: none");
			});
			
			<%-- 해당 게시물에 댓글 등록 --%>
			$(document).on("click", "input[value='댓글 등록하기']", function(){
				//alert('댓글등록');
				var clubPostNo = ${ clubPost.getClubPost.clubPostNo };
				var commentContent = $(this).parent().children().val();
				
				$(this).prev().val("");
				$(this).parent().parent().prev().removeAttr("style");
				$(this).parent().parent().attr("style", "display: none");
				
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
								commentContent : commentContent
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
								//alert(JSONData.heart.size());
								//alert(JSONData.heart.length);
								//for (var i = 0; i < JSONData.heart.length; i++) {
									//alert(JSONData.heart[i].sourceNo);
									//alert(JSONData.heart[i].userId);
								//}
								//const length = parseInt(JSONData.heart.length) - 1;
								//alert(length);
								var booleanCheck = (JSONData.user.userId == '${ sessionScope.user.userId }');
								alert( booleanCheck );
								
								var display = "<li class='comment'>"
												+"<div class='single-comment' commentNo='"+JSONData.clubPostCommentNo+"'>"
													+"<div class='comment-author'>"
													+"<cite><a href='#'><img src='/resources/image/uploadFiles/"+JSONData.user.profileImage+"' class='avatar' alt=''></a></cite>"
													+"<cite><a href='#'>"+JSONData.user.nickName+"</a></cite>"
													+"<span class='says'>says:</span>"
													+"</div>"
													
													
													

													+"<div class='comment-meta'>"
														
														+"<div class='comment body'>"
														+"<div class='comment-heart-"+JSONData.clubPostCommentNo+"'>"
																+"<a class='reply heartCondition'>"
																+"<c:set var='commentHeart' value='0'></c:set>"
																<%--for (var num = 0; num < JSONData.heart.length; num++) {--%>																	
																	<%--+"<c:forEach var='m' begin='0' end="+length+" step='1'>"--%>
																	+"<c:if test='false'>"
																	+"<span><img src='/resources/image/uploadFiles/heart.jpg' height='40' width='40'>+"</span>"
																			+"<c:set var='commentHeart' value='1'></c:set>"
																		+"</c:if>"
																	<%--}--%>
																<%--+"</c:forEach>"--%>
																+"<c:if test='${ commentHeart == 0 }'><span><img src='/resources/image/uploadFiles/no_heart.jpg' height='40' width='40'></span></c:if>"
																+"</a>"
															+"</div>"
															+"<div>"
															<%-- 해당 댓글의 좋아요 수 --%>
															 +"<span class='commentHeartCount"+JSONData.clubPostCommentNo+"' style='font-size: 30px;'>"+JSONData.commentHeartCount+"</span>"
																
																<%-- 해당 댓글의 댓글 등록 --%>
															 +"<a class='reply add'>"
																 +"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-plus-sign' aria-hidden='true' style='font-size: 25px;'></span>"
															 +"</a>"
																 <%-- 해당 댓글 수정 --%>
															 +"<a class='reply update'>"
																 +"<c:if test='"+booleanCheck+"'>"
																	 +"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-paperclip updateCommentView' aria-hidden='true' style='font-size: 25px;'></span>"
																 +"</c:if>"
															 +"</a>"
																 <%-- 해당 댓글 삭제 --%>
															 +"<a href='#' class='reply delete'>"
																 <%-- 해당 댓글 작성자 또는 해당 게시물 작성자 또는 모임대표 또는 관리자 --%>
																 <%--+"<c:if test="+JSONData.user.userId+" == "+${ sessionScope.user.userId }" || "+${ clubPost.getClubPost.user.userId }+" == "+${ sessionScope.user.userId }+" || fn:trim("+${ sessionScope.clubUser.memberRole }+") == '2' || "+${ sessionScope.user.role }+" == '1'>"--%>
																 <%--+"<c:if test='"+JSONData.user.userId+" == "+${ sessionScope.user.userId }+"'>"--%>
																	 +"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-trash deleteComment comment' aria-hidden='true' style='font-size: 25px;'></span>"
																 <%--+"</c:if>"--%>
															 +"</a>"
																 <%-- 해당 댓글 신고 --%>
															 	+"<a href='#' class='reply report'>"
															 		+"<c:if test='"+JSONData.user.userId+" != "+${ sessionScope.user.userId }+"'>"
															 			+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true' style='font-size: 25px;'></span>"
															 		+"</c:if>"
															 	+"</a>"
															+"</div>"
														+"</div>"
													+"</div>"
													+"<p>"+JSONData.commentContent+"</p>"
													+"<c:if test='"+JSONData.commentCount+">0'>"
														<%--+"<c:when test='"+JSONData.commentCount+">0'>"--%>
															+"<div class='comment-author'>"
																+"<cite>"
																	+"<a class='123'>댓글 "+JSONData.commentCount+"개</a>"
																+"<cite>"
															+"</div>"
														<%--+"</c:when>"--%>
													+"</c:if>"
												+"</div>"
												+"<div class='clear-after-comment-add' commentTextArea='"+JSONData.clubPostCommentNo+"' style='display: none;'>"
													+"<form class='comment-form'>"
													+"<textarea class='plain buffer' placeholder='댓글작성란'></textarea>"
													+"<input class='plain button red add' value='저장' style='height: 30px; width: 60px;'>"
													+"<input class='plain button red cancle' value='취소' style='height: 30px; width: 60px;'>"
													+"</form>"						
												+"</div>"
											+"</li>";
								
								$(".comment-list.plain").append( display );
							}// end of success
					
				});// end of ajax
			}); // end of 등록

			<%-- 해당 댓글을 수정할 수 있는 입력텍스트 보여진다 --%>
			$(document).on("click", ".reply.update", function(){
				<%-- display : none을 제거하여 댓글작성란이 보이게한다 --%>
				//alert('update');
				$(".clear-after-comment-add").attr("style", "display: none");
				$(".clear-after-comment-update").attr("style", "display: none");
				$(this).parent().parent().parent().parent().parent().children("div:eq(2)").removeAttr("style");
				var content = $(this).parent().parent().parent().parent().children("p").text();
				$(this).parent().parent().parent().parent().parent().find("textarea").val(content );
			});

			<%-- 해당 댓글을 수정한다 --%>
			$(document).on("click", "input[value='수정완료']", function(){
				alert("수정완료");
				var commentContent = $(this).prev().val();
				var clubPostCommentNo = $(this).parent().parent().attr("commentTextArea");
				var divClassName = $(this).parent().parent().attr("class");
				var className = $(this).parents("li").attr("class");
				//alert( commentContent );
				//alert( clubPostCommentNo );
				//alert( divClassName );
				//alert( className );
				
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
								$("."+className).find("p").text( JSONData.commentContent );
							} // end of success
						}); // end of ajax
			}); // end of 수정완료

			<%-- 해당 댓글을 삭제한다 --%>
			$(document).on("click", ".glyphicon.glyphicon-trash.deleteComment.comment", function(){
				alert("삭제");
				var clubPostCommentNo = $(this).parent().parent().parent().parent().parent().attr("commentNo");
				var className = $(this).parent().parent().parent().parent().parent().attr("class");
				alert( clubPostCommentNo );
				alert( className );
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
								alert(status);
								//$("."+className).remove();
							} // end of success
						}); // end of ajax
			}); // end of 삭제

			<%-- 해당 댓글을 좋아요 또는 좋아요 취소한다 --%>
			$(document).on("click", ".reply.heartCondition", function(){
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
				var clubPostCommentNo = $(this).parent().parent().parent().parent().attr("commentNo");
				var revUserId = $(this).parent().parent().parent().parent().attr("revUserId");
				
				$("#sourceNumber").val( clubPostCommentNo );
				$("#revUserId").val( revUserId );
				
				event.stopPropagation();
				
				$("form[name='commentReport']").attr("method", "post").attr("action", "/serviceCenter/addReport" ).submit();
				
			}) // .report evenet close

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
		
		<style type="text/css">
			.clubPost-header {
				/* background-color: yellow; */
				display: grid;
				grid-template-columns: 2fr 5fr 1fr 1fr 1fr 1fr 1fr;
			}
			.clubPost-header-profile {
				/* background-color: blue; */
			}
			.clubPost-header-space{
				/* background-color: black; */
			}
			.clubPost-header-heart{
				/* background-color: orange; */
			}
			.clubPost-header-heartCount{
				/* background-color: gray; */
				font-size: 3rem;
			}
			.clubPost-header-update{
				/* background-color: lime; */
				font-size: 3rem;
			}
			.clubPost-header-delete{
				/* background-color: purple; */
				font-size: 3rem;
			}
			.clubPost-header-report{
				/* background-color: aqua; */
				font-size: 3rem;
			}
			.clubPost-header-nickName{
				/* background-color: green; */
				font-size: 2rem;
			}
			.clubPost-body-title{
				/* background-color: yellow; */
			}
			.comment.body {
				display: grid;
				grid-template-columns: 1fr 13fr;
			}
			.comment.heart {
				float: right;
			}
		</style>
		
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
		<%-- 모임게시물 신고 --%>
	</form>
	
	<form name="commentReport" method="post" action="/serviceCenter/addReport">
		<%-- 모임게시물 댓글 신고 --%>
		<input type="hidden" name="reportSource" value="2">
		<input type="hidden" name="sourceNumber" id="sourceNumber" value="">
		<input type="hidden" name="userId" id="revUserId" value="">
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
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px;">
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
							
							<h5><time datetime="2013-11-09">
							<c:choose>
								<c:when test="${ !empty clubPost.getClubPost.clubPostUpdateDate }">${ clubPost.getClubPost.clubPostUpdateDate }(수정 됨)</c:when>
								<c:otherwise>${ clubPost.getClubPost.clubPostRegDate }</c:otherwise>
							</c:choose>
							</time></h5>
							
							<div class="clubPost-header">
								<%-- 게시물 등록 회원 프로필 사진 --%>
								<div class="clubPost-header-profile" userId = "${ clubPost.getClubPost.user.userId }">
									<img src="/resources/image/uploadFiles/${ clubPost.getClubPost.user.profileImage }" height="110" width="110"></div>
								
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
										<span class="glyphicon glyphicon-trash deleteComment" id="club-post-delete" aria-hidden="true"></span>
									</div>
								</c:if>
								
								<%-- 해당 게시물 작성자 이외의 회원 신고 가능 --%>
								<c:if test="${ clubPost.getClubPost.user.userId != sessionScope.user.userId }">
									<div class="clubPost-header-report">
										<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
									</div>
								</c:if>
							</div>
							
							<%-- 게시물 등록 회원 닉네임 --%>
							<div class="clubPost-header-nickName" userId="${ clubPost.getClubPost.user.userId }">닉네임 : ${ clubPost.getClubPost.user.nickName }</div>
							
							<div class="clubPost-body">
								<div class="clubPost-body-title">
									<h1>제목 : ${ clubPost.getClubPost.clubPostTitle }</h1>
								</div>
								<div class="clubPost-body-content">
									<%-- <p>모임 번호 : ${ clubPost.getClubPost.clubNo }</p> --%>
									<%-- <p>모임 게시물 번호 : ${ clubPost.getClubPost.clubPostNo }</p> --%>
									<p>내용 : ${ clubPost.getClubPost.clubPostContent }</p>
								</div>
							</div>
													
						</article>

					</div><!-- post-area -->
					
					
					<div>
						<input class="plain button red" value="댓글등록" style="width: 75px;">
					</div>
					<div id="post-comment" class="clear-after" style="display: none;">
						<h3 id="reply-title">댓글 작성란</h3>
						<form class="comment-form">
							<textarea class="plain buffer" placeholder="댓글 등록란"></textarea>
							<input class="plain button red" value="댓글 등록하기" style="width: 100px;">
							<input class="plain button red" value="취소하기" style="width: 75px;">
						</form>						
					</div><!-- post-comment -->	
					
					
					
					
					
					
				<%-- 	<c:if test="${ clubPost.getClubPost.clubPostCommentCount > 0 }"></br></br>
						<div add="add" clubPostNo="${ clubPost.getClubPost.clubPostNo }">
							<a href="###"><img alt="" src="abcd.jpg">댓글좋아요</a></br>
						</div>
						<c:forEach var="i" begin="0" end="${ clubPost.getClubPost.clubPostCommentCount - 1 }" step="1">
							<c:if test="${ clubPost.getClubPostCommentList[i].parent == clubPost.getClubPost.clubPostNo }">
								<nav class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
									댓글 내용 : <div class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
									${ clubPost.getClubPostCommentList[i].commentContent }</div>
									<c:if test="${ user.userId == clubPost.getClubPostCommentList[i].user.userId }">
									<button class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">수정</button>
									</c:if></br>
									모임 게시물 번호 : ${ clubPost.getClubPostCommentList[i].clubPostNo }</br>
									모임 게시물 댓글 번호 : ${ clubPost.getClubPostCommentList[i].clubPostCommentNo }</br>
									모임 게시물 댓글 등록 회원 아이디 : ${ clubPost.getClubPostCommentList[i].user.userId }</br>
									모임 게시물 댓글 등록 회원 닉네임 : ${ clubPost.getClubPostCommentList[i].user.nickName }</br>
									댓글 등록날짜 : ${ clubPost.getClubPostCommentList[i].commentRegDate }</br>
									댓글 수정날짜 : ${ clubPost.getClubPostCommentList[i].commentUpdateDate }</br>
									댓글 좋아요 수 : ${ clubPost.getClubPostCommentList[i].commentHeartCount }</br>
									신고여부 : ${ clubPost.getClubPostCommentList[i].reportCondition }</br>
									삭제여부 : ${ clubPost.getClubPostCommentList[i].deleteCondition }</br>
									댓글 부모번호 : ${ clubPost.getClubPostCommentList[i].parent }</br>
									댓글 깊이 : ${ clubPost.getClubPostCommentList[i].depth }</br>
									댓글 순서 : ${ clubPost.getClubPostCommentList[i].sequence }</br>
									<a href="/clubPostRest/getClubPostCommentList?clubPostCommentNo=${ clubPost.getClubPostCommentList[i].clubPostCommentNo }&depth=0">댓글 수 : ${ clubPost.getClubPostCommentList[i].commentCount }</a></br>
									<c:if test="${ clubPost.getClubPostCommentList[i].commentCount > 0 }">
										<div class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
											<b style="color : red;" clubPostCommentNo="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }"
											clubPostNo="${ clubPost.getClubPostCommentList[i].clubPostNo }">
											댓글 수 ${ clubPost.getClubPostCommentList[i].commentCount }</b></br>
										</div>
									</c:if>
								</nav>
							</c:if>
						</c:forEach>
					</c:if> --%>
					
					
					
					
					
					<div class="comment-section">
						<h3 id="comments">
							<c:choose>
								<c:when test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">댓글 ${ clubPost.getClubPost.clubPostCommentCount }개</c:when>
							</c:choose>
						</h3>
						<ul class="comment-list plain">
							<%-- 해당 게시물에 댓글이 있을때만 for문을 돈다 --%>
							<c:if test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">
								<c:forEach var="i" begin="0" end="${ clubPost.getClubPost.clubPostCommentCount - 1 }" step="1">									
									<c:if test="${ clubPost.getClubPost.clubPostNo == clubPost.getClubPostCommentList[i].parent }">
										<li class="comment">
											<div class="single-comment${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentNo="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" revUserId="${ clubPost.getClubPostCommentList[i].user.userId }">
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
												<c:choose>
													<c:when test="${ clubPost.getClubPostCommentList[i].commentCount > 0 }">
														<div class="comment-author">
															<cite>
																<a class="123">댓글 ${ clubPost.getClubPostCommentList[i].commentCount }개</a>
															<cite>
														</div>
													</c:when>
												</c:choose>
											</div><!-- single-comment -->
											
											<div class="clear-after-comment-add${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentTextArea="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="display: none;">
												<!-- <h3 id="reply-title">댓글 작성란</h3> -->
												
												<form class="comment-form-add">
													<textarea class="plain buffer" placeholder="댓글작성란"></textarea>
													<input class="plain button red add" value="등록완료" style="height: 30px; width: 90px;">
													<input class="plain button red cancle" value="취소" style="height: 30px; width: 60px;">
												</form>
												
											</div><!-- post-comment -->	
											
											<div class="clear-after-comment-update${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentTextArea="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="display: none;">
												<!-- <h3 id="reply-title">댓글 작성란</h3> -->
												
												<form class="comment-form-update">
													<textarea class="plain buffer"></textarea>
													<input class="plain button red add" value="수정완료" style="height: 30px; width: 90px;">
													<input class="plain button red cancle" value="취소" style="height: 30px; width: 60px;">
												</form>
												
											</div><!-- post-comment -->	
											
											<%-- 대댓글리스트 --%>
												<%-- <ul class="children plain">
														<li class="comment">
															<div class="single-comment">
																<div class="comment-author">
																	<img src="/resources/image/uploadFiles/${ clubPost.getClubPostCommentList[k].user.profileImage }" class="avatar" alt="">
																	<cite><a href="#">${ clubPost.getClubPostCommentList[k].user.nickName }</a></cite>
																	<span class="says">says:</span>
																</div><!-- comment-author -->
																<div class="comment-meta">
																	<c:choose>
																		<c:when test="${ empty clubPost.getClubPostCommentList[k].commentUpdateDate }"><time datetime="2013-03-23 19:58">${ clubPost.getClubPostCommentList[k].commentRegDate }</time></c:when>
																		<c:otherwise><time datetime="2013-03-23 19:58">${ clubPost.getClubPostCommentList[k].commentUpdateDate }(수정됨)</time></c:otherwise>
																	</c:choose>
																	/ <a href="#" class="reply">댓글등록</a>
																</div><!-- comment-meta -->
																<p>${ clubPost.getClubPostCommentList[k].commentContent }</p>
																	<c:choose>
																		<c:when test="${ clubPost.getClubPostCommentList[k].commentCount > 0 }"><h3 id="comments">댓글 ${ clubPost.getClubPostCommentList[k].commentCount }개</h3></c:when>
																	</c:choose>
															</div><!-- single-comment -->
														</li>
													</ul> --%>
											<%-- 대댓글 for문 --%>
									
										</li>
									</c:if>
								</c:forEach>
							</c:if>
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
