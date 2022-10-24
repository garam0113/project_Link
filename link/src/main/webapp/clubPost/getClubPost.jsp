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
		
		<!-- ����, ����, �Ű� ������ ������ �� �ִ� -->
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
			<%-- ���� �Խù� ���� --%>
			$(".clubPost-header-update").bind("click", function(){
				$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
			});
			
			<%-- ���� �Խù� ���� --%>
			$("#club-post-delete").bind("click", function(){
				if(confirm("���� �����Ͻðڽ��ϱ�?")){
					$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
				}
			});
			
			<%-- ���� �Խù� �Ű� --%>
			$(".clubPost-header-report").bind("click", function(){
				event.stopPropagation();
				$("form[name='clubPostReport']").attr("method", "post").attr("action", "/serviceCenter/addReport" ).submit();
			});

			<%-- ���� �Խù� ���ƿ� �Ǵ� ���ƿ���� --%>
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
								
								// �α����� ȸ���� ���ƿ��ϸ� �Խù���ȣ�� �������� 0�� �����Ѵ�
								if(JSONData.heartCondition == 0){
									heartDisplay = "<img src='/resources/image/uploadFiles/no_heart.jpg' height='70' width='70'>";
								}else{
									heartDisplay = "<img src='/resources/image/uploadFiles/heart.jpg' height='70' width='70'>";
								}
								
								$(".clubPost-header-heart").append( heartDisplay );
								$(".clubPost-header-heartCount").text( JSONData.clubPostHeartCount );
							}
						});
			}); // end of ��Ʈ

			<%-- ���� �Խù� ��۸���Ʈ �����´� --%>
			/* $(document).on("click", "b:contains('��� ��')", function(){
				alert("��� ��");
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
													+"��� ���� : <div class='" + el.clubPostCommentNo + "'>" + el.commentContent + "</div>"
													+"<button class='" + el.clubPostCommentNo + "'>����</button>"
													+"<input type='button' class='" + el.clubPostCommentNo + "' value='����'>"
													+"<b style='color : blue;'>��۹�ȣ : " + el.clubPostCommentNo + "</b></br>"
													+"��۵�ϳ�¥ : " + el.commentRegDate + "</br>"
													+"��ۼ�����¥ : " + el.commentUpdateDate + "</br>"
													+"��� ���ƿ� �� : " + el.commentHeartCount + "</br>"
													+"��� �Ű��� : " + el.reportCondition + "</br>"
													+"��� �������� : " + el.deleteCondition + "</br>"
													+"��� �θ��ȣ : " + el.parent + "</br>"
													+"��� ���� : " + el.depth + "</br>"
													+"��� ���� : " + el.sequence + "</br>"
													//+"<div class='"+el.clubPostCommentNo+"'>"
													//+"<b style='color : green;' clubPostNo="+el.clubPostNo+" clubPostCommentNo="
															//+el.clubPostCommentNo+">��� �� " + el.commentCount + "</b></br>"
													//+"</div>"
													+"</nav>";
									alert(display);
		
									$("nav[class='"+clubPostCommentNo+"']").append(display);
								});
							} // end of success
						}); // end of ajax
			}); // end of ��� �� */
			
			<%-- �Խù��� ����� ����� �� �ִ� textarea �������� --%>
			$("input[value='��۵��']").bind("click", function(){
				$(this).parent().next().removeAttr("style");
				$(this).parent().attr("style", "display: none");
			});
			
			<%-- �Խù��� ����� ����� �� �ִ� textarea �������� --%>
			$("input[value='����ϱ�']").bind("click", function(){
				$(this).prev().prev().val("");
				$(this).parent().parent().prev().removeAttr("style");
				$(this).parent().parent().attr("style", "display: none");
			});

			<%-- �ش� ����� ����� �� �ִ� �Է��ؽ�Ʈ �������� --%>
			$(document).on("click", ".reply.add", function(){
				<%-- display : none�� �����Ͽ� ����ۼ����� ���̰��Ѵ� --%>
				alert('add');
				$(".clear-after-comment-add").attr("style", "display: none");
				$(".clear-after-comment-update").attr("style", "display: none");
				$(this).parent().parent().parent().parent().parent().children("div:eq(1)").removeAttr("style");
			}); // end of ���
			
			<%-- ��� ��� �Ǵ� ������ ����Ѵ� --%>
			$(document).on("click", "input[value='���']", function(){
				$(this).parent().parent().attr("style", "display: none");
			});
			
			<%-- �ش� �Խù��� ��� ��� --%>
			$(document).on("click", "input[value='��� ����ϱ�']", function(){
				//alert('��۵��');
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
															<%-- �ش� ����� ���ƿ� �� --%>
															 +"<span class='commentHeartCount"+JSONData.clubPostCommentNo+"' style='font-size: 30px;'>"+JSONData.commentHeartCount+"</span>"
																
																<%-- �ش� ����� ��� ��� --%>
															 +"<a class='reply add'>"
																 +"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-plus-sign' aria-hidden='true' style='font-size: 25px;'></span>"
															 +"</a>"
																 <%-- �ش� ��� ���� --%>
															 +"<a class='reply update'>"
																 +"<c:if test='"+booleanCheck+"'>"
																	 +"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-paperclip updateCommentView' aria-hidden='true' style='font-size: 25px;'></span>"
																 +"</c:if>"
															 +"</a>"
																 <%-- �ش� ��� ���� --%>
															 +"<a href='#' class='reply delete'>"
																 <%-- �ش� ��� �ۼ��� �Ǵ� �ش� �Խù� �ۼ��� �Ǵ� ���Ӵ�ǥ �Ǵ� ������ --%>
																 <%--+"<c:if test="+JSONData.user.userId+" == "+${ sessionScope.user.userId }" || "+${ clubPost.getClubPost.user.userId }+" == "+${ sessionScope.user.userId }+" || fn:trim("+${ sessionScope.clubUser.memberRole }+") == '2' || "+${ sessionScope.user.role }+" == '1'>"--%>
																 <%--+"<c:if test='"+JSONData.user.userId+" == "+${ sessionScope.user.userId }+"'>"--%>
																	 +"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-trash deleteComment comment' aria-hidden='true' style='font-size: 25px;'></span>"
																 <%--+"</c:if>"--%>
															 +"</a>"
																 <%-- �ش� ��� �Ű� --%>
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
																	+"<a class='123'>��� "+JSONData.commentCount+"��</a>"
																+"<cite>"
															+"</div>"
														<%--+"</c:when>"--%>
													+"</c:if>"
												+"</div>"
												+"<div class='clear-after-comment-add' commentTextArea='"+JSONData.clubPostCommentNo+"' style='display: none;'>"
													+"<form class='comment-form'>"
													+"<textarea class='plain buffer' placeholder='����ۼ���'></textarea>"
													+"<input class='plain button red add' value='����' style='height: 30px; width: 60px;'>"
													+"<input class='plain button red cancle' value='���' style='height: 30px; width: 60px;'>"
													+"</form>"						
												+"</div>"
											+"</li>";
								
								$(".comment-list.plain").append( display );
							}// end of success
					
				});// end of ajax
			}); // end of ���

			<%-- �ش� ����� ������ �� �ִ� �Է��ؽ�Ʈ �������� --%>
			$(document).on("click", ".reply.update", function(){
				<%-- display : none�� �����Ͽ� ����ۼ����� ���̰��Ѵ� --%>
				//alert('update');
				$(".clear-after-comment-add").attr("style", "display: none");
				$(".clear-after-comment-update").attr("style", "display: none");
				$(this).parent().parent().parent().parent().parent().children("div:eq(2)").removeAttr("style");
				var content = $(this).parent().parent().parent().parent().children("p").text();
				$(this).parent().parent().parent().parent().parent().find("textarea").val(content );
			});

			<%-- �ش� ����� �����Ѵ� --%>
			$(document).on("click", "input[value='�����Ϸ�']", function(){
				alert("�����Ϸ�");
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
			}); // end of �����Ϸ�

			<%-- �ش� ����� �����Ѵ� --%>
			$(document).on("click", ".glyphicon.glyphicon-trash.deleteComment.comment", function(){
				alert("����");
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
			}); // end of ����

			<%-- �ش� ����� ���ƿ� �Ǵ� ���ƿ� ����Ѵ� --%>
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
			}); // end of ������ƿ�
			
			<%-- ���� �Խù� ��� �Ű� --%>
			$(document).on("click", ".reply.report", function(event) {
				var clubPostCommentNo = $(this).parent().parent().parent().parent().attr("commentNo");
				var revUserId = $(this).parent().parent().parent().parent().attr("revUserId");
				
				$("#sourceNumber").val( clubPostCommentNo );
				$("#revUserId").val( revUserId );
				
				event.stopPropagation();
				
				$("form[name='commentReport']").attr("method", "post").attr("action", "/serviceCenter/addReport" ).submit();
				
			}) // .report evenet close

			<%-- �����ʻ��� Ŭ���� �ش����� ����Ȩ�Ƿ� �̵� --%>
			$(document).on("click", ".clubPost-header-profile", function(){
				location.href = "/myHome/getYourHome?userId="+$(this).attr("userId");
			});//end of ����Ȩ�� �̵�

			<%-- �г��� Ŭ���� �ش����� ����Ȩ�Ƿ� �̵� --%>
			$(document).on("click", ".clubPost-header-nickName", function(){
				location.href = "/myHome/getYourHome?userId="+$(this).attr("userId");
			});//end of ����Ȩ�� �̵�
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
		<%-- ���ӰԽù� �Ű� --%>
		<input type="hidden" name="reportSource" value="1">
		<input type="hidden" name="sourceNumber" value="${ clubPost.getClubPost.clubPostNo }">
		<input type="hidden" name="userId" value="${ clubPost.getClubPost.user.userId }">
		<%-- ���ӰԽù� �Ű� --%>
	</form>
	
	<form name="commentReport" method="post" action="/serviceCenter/addReport">
		<%-- ���ӰԽù� ��� �Ű� --%>
		<input type="hidden" name="reportSource" value="2">
		<input type="hidden" name="sourceNumber" id="sourceNumber" value="">
		<input type="hidden" name="userId" id="revUserId" value="">
		<%-- ���ӰԽù� ��� �Ű� --%>
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
							<a href="/club/getClubList">���� ����</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList">���� �Խù�</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList">���ӿ�</a>
						</li>
						<li data-group="infographics">
							<a href="#">���� ä��</a>
						</li>
					</ul>

					<div class="post-area clear-after">
						<article role="main">
							
							<h5><time datetime="2013-11-09">
							<c:choose>
								<c:when test="${ !empty clubPost.getClubPost.clubPostUpdateDate }">${ clubPost.getClubPost.clubPostUpdateDate }(���� ��)</c:when>
								<c:otherwise>${ clubPost.getClubPost.clubPostRegDate }</c:otherwise>
							</c:choose>
							</time></h5>
							
							<div class="clubPost-header">
								<%-- �Խù� ��� ȸ�� ������ ���� --%>
								<div class="clubPost-header-profile" userId = "${ clubPost.getClubPost.user.userId }">
									<img src="/resources/image/uploadFiles/${ clubPost.getClubPost.user.profileImage }" height="110" width="110"></div>
								
								<div class="clubPost-header-space"></div>
								
								<%-- �ش� ȸ���� ���ƿ��� ���ο� ���� ��Ʈ�� ��ȭ --%>
								<div class="clubPost-header-heart">
									<a>
									<c:choose>
										<c:when test="${ clubPost.getClubPost.heartCondition == 0}"><img src="/resources/image/uploadFiles/no_heart.jpg" height="70" width="70"></c:when>
										<c:otherwise><img src="/resources/image/uploadFiles/heart.jpg" height="70" width="70"></c:otherwise>
									</c:choose>
									</a>
								</div>
								
								<%-- �Խù� ���ƿ� �� --%>
								<div class="clubPost-header-heartCount">${ clubPost.getClubPost.clubPostHeartCount }</div>
								
								<%-- �Խù� ���� --%>
								<c:if test="${ clubPost.getClubPost.user.userId == sessionScope.user.userId }">
									<div class="clubPost-header-update">
										<a>
											<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true"></span>
										</a>
									</div>
								</c:if>
								
								<%-- �ش� �Խù� �ۼ��� �Ǵ� �ش� ���Ӵ�ǥ �Ǵ� ������ �Խù� ���� ���� --%>
								<c:if test="${ clubPost.getClubPost.user.userId == sessionScope.user.userId || clubPost.getClubPost.clubRole == '2' || sessionScope.user.role == '1' }">
									<div class="clubPost-header-delete">
										<span class="glyphicon glyphicon-trash deleteComment" id="club-post-delete" aria-hidden="true"></span>
									</div>
								</c:if>
								
								<%-- �ش� �Խù� �ۼ��� �̿��� ȸ�� �Ű� ���� --%>
								<c:if test="${ clubPost.getClubPost.user.userId != sessionScope.user.userId }">
									<div class="clubPost-header-report">
										<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
									</div>
								</c:if>
							</div>
							
							<%-- �Խù� ��� ȸ�� �г��� --%>
							<div class="clubPost-header-nickName" userId="${ clubPost.getClubPost.user.userId }">�г��� : ${ clubPost.getClubPost.user.nickName }</div>
							
							<div class="clubPost-body">
								<div class="clubPost-body-title">
									<h1>���� : ${ clubPost.getClubPost.clubPostTitle }</h1>
								</div>
								<div class="clubPost-body-content">
									<%-- <p>���� ��ȣ : ${ clubPost.getClubPost.clubNo }</p> --%>
									<%-- <p>���� �Խù� ��ȣ : ${ clubPost.getClubPost.clubPostNo }</p> --%>
									<p>���� : ${ clubPost.getClubPost.clubPostContent }</p>
								</div>
							</div>
													
						</article>

					</div><!-- post-area -->
					
					
					<div>
						<input class="plain button red" value="��۵��" style="width: 75px;">
					</div>
					<div id="post-comment" class="clear-after" style="display: none;">
						<h3 id="reply-title">��� �ۼ���</h3>
						<form class="comment-form">
							<textarea class="plain buffer" placeholder="��� ��϶�"></textarea>
							<input class="plain button red" value="��� ����ϱ�" style="width: 100px;">
							<input class="plain button red" value="����ϱ�" style="width: 75px;">
						</form>						
					</div><!-- post-comment -->	
					
					
					
					
					
					
				<%-- 	<c:if test="${ clubPost.getClubPost.clubPostCommentCount > 0 }"></br></br>
						<div add="add" clubPostNo="${ clubPost.getClubPost.clubPostNo }">
							<a href="###"><img alt="" src="abcd.jpg">������ƿ�</a></br>
						</div>
						<c:forEach var="i" begin="0" end="${ clubPost.getClubPost.clubPostCommentCount - 1 }" step="1">
							<c:if test="${ clubPost.getClubPostCommentList[i].parent == clubPost.getClubPost.clubPostNo }">
								<nav class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
									��� ���� : <div class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
									${ clubPost.getClubPostCommentList[i].commentContent }</div>
									<c:if test="${ user.userId == clubPost.getClubPostCommentList[i].user.userId }">
									<button class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">����</button>
									</c:if></br>
									���� �Խù� ��ȣ : ${ clubPost.getClubPostCommentList[i].clubPostNo }</br>
									���� �Խù� ��� ��ȣ : ${ clubPost.getClubPostCommentList[i].clubPostCommentNo }</br>
									���� �Խù� ��� ��� ȸ�� ���̵� : ${ clubPost.getClubPostCommentList[i].user.userId }</br>
									���� �Խù� ��� ��� ȸ�� �г��� : ${ clubPost.getClubPostCommentList[i].user.nickName }</br>
									��� ��ϳ�¥ : ${ clubPost.getClubPostCommentList[i].commentRegDate }</br>
									��� ������¥ : ${ clubPost.getClubPostCommentList[i].commentUpdateDate }</br>
									��� ���ƿ� �� : ${ clubPost.getClubPostCommentList[i].commentHeartCount }</br>
									�Ű��� : ${ clubPost.getClubPostCommentList[i].reportCondition }</br>
									�������� : ${ clubPost.getClubPostCommentList[i].deleteCondition }</br>
									��� �θ��ȣ : ${ clubPost.getClubPostCommentList[i].parent }</br>
									��� ���� : ${ clubPost.getClubPostCommentList[i].depth }</br>
									��� ���� : ${ clubPost.getClubPostCommentList[i].sequence }</br>
									<a href="/clubPostRest/getClubPostCommentList?clubPostCommentNo=${ clubPost.getClubPostCommentList[i].clubPostCommentNo }&depth=0">��� �� : ${ clubPost.getClubPostCommentList[i].commentCount }</a></br>
									<c:if test="${ clubPost.getClubPostCommentList[i].commentCount > 0 }">
										<div class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
											<b style="color : red;" clubPostCommentNo="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }"
											clubPostNo="${ clubPost.getClubPostCommentList[i].clubPostNo }">
											��� �� ${ clubPost.getClubPostCommentList[i].commentCount }</b></br>
										</div>
									</c:if>
								</nav>
							</c:if>
						</c:forEach>
					</c:if> --%>
					
					
					
					
					
					<div class="comment-section">
						<h3 id="comments">
							<c:choose>
								<c:when test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">��� ${ clubPost.getClubPost.clubPostCommentCount }��</c:when>
							</c:choose>
						</h3>
						<ul class="comment-list plain">
							<%-- �ش� �Խù��� ����� �������� for���� ���� --%>
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
														<c:otherwise><time datetime="2013-03-23 19:58">${ clubPost.getClubPostCommentList[i].commentUpdateDate }(������)</time></c:otherwise>
													</c:choose>
													
													<%-- �ش� ����� �ش� ������ ���ƿ� ���ο� ���� �̹��� ���Ѵ� --%>
													<div class="comment body">
														<div class="comment-heart-${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
														 	<a class="reply heartCondition">
													 			<!-- ��Ʈ������� ��۹�ȣ�� ���ƿ�/0�̸� ���ƿ� ���ߴ� -->
													 			<img src="/resources/image/uploadFiles/${ clubPost.getClubPostCommentList[i].heartCondition != 0 ? 'heart.jpg' : 'no_heart.jpg' }" height="40" width="40">
															 </a>
														 </div>
														 <div>
															<%-- �ش� ����� ���ƿ� �� --%>
															 <span class="commentHeartCount${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="font-size: 30px;">${ clubPost.getClubPostCommentList[i].commentHeartCount }</span>
															
															<%-- �ش� ����� ��� ��� --%>
															 <a class="reply add">
															 	&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-plus-sign" aria-hidden="true" style="font-size: 25px;"></span>
															 </a>
															 <%-- �ش� ��� ���� --%>
															 <a class="reply update">
															 	<c:if test="${ clubPost.getClubPostCommentList[i].user.userId == sessionScope.user.userId }">
															 		&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true" style="font-size: 25px;"></span>
															 	</c:if>
															 </a>
															 <%-- �ش� ��� ���� --%>
															 <a href="#" class="reply delete">
															 <%-- �ش� ��� �ۼ��� �Ǵ� �ش� �Խù� �ۼ��� �Ǵ� ���Ӵ�ǥ �Ǵ� ������ --%>
															 <c:if test="${ clubPost.getClubPostCommentList[i].user.userId == sessionScope.user.userId || clubPost.getClubPost.user.userId == sessionScope.user.userId
															 || fn:trim(sessionScope.clubUser.memberRole) == '2' || sessionScope.user.role == '1' }">
															  	&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment comment" aria-hidden="true" style="font-size: 25px;"></span>
															  </c:if>
															  </a>
															 <%-- �ش� ��� �Ű� --%>
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
																<a class="123">��� ${ clubPost.getClubPostCommentList[i].commentCount }��</a>
															<cite>
														</div>
													</c:when>
												</c:choose>
											</div><!-- single-comment -->
											
											<div class="clear-after-comment-add${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentTextArea="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="display: none;">
												<!-- <h3 id="reply-title">��� �ۼ���</h3> -->
												
												<form class="comment-form-add">
													<textarea class="plain buffer" placeholder="����ۼ���"></textarea>
													<input class="plain button red add" value="��ϿϷ�" style="height: 30px; width: 90px;">
													<input class="plain button red cancle" value="���" style="height: 30px; width: 60px;">
												</form>
												
											</div><!-- post-comment -->	
											
											<div class="clear-after-comment-update${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentTextArea="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="display: none;">
												<!-- <h3 id="reply-title">��� �ۼ���</h3> -->
												
												<form class="comment-form-update">
													<textarea class="plain buffer"></textarea>
													<input class="plain button red add" value="�����Ϸ�" style="height: 30px; width: 90px;">
													<input class="plain button red cancle" value="���" style="height: 30px; width: 60px;">
												</form>
												
											</div><!-- post-comment -->	
											
											<%-- ���۸���Ʈ --%>
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
																		<c:otherwise><time datetime="2013-03-23 19:58">${ clubPost.getClubPostCommentList[k].commentUpdateDate }(������)</time></c:otherwise>
																	</c:choose>
																	/ <a href="#" class="reply">��۵��</a>
																</div><!-- comment-meta -->
																<p>${ clubPost.getClubPostCommentList[k].commentContent }</p>
																	<c:choose>
																		<c:when test="${ clubPost.getClubPostCommentList[k].commentCount > 0 }"><h3 id="comments">��� ${ clubPost.getClubPostCommentList[k].commentCount }��</h3></c:when>
																	</c:choose>
															</div><!-- single-comment -->
														</li>
													</ul> --%>
											<%-- ���� for�� --%>
									
										</li>
									</c:if>
								</c:forEach>
							</c:if>
							<%--��� for�� --%>
						</ul>
					</div><!-- comment-section -->	
					
					
					
					
					

					<%-- <div class="comment-section">
						<h3 id="comments">
							<c:choose>
								<c:when test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">��� ${ clubPost.getClubPost.clubPostCommentCount } ��</c:when>
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
