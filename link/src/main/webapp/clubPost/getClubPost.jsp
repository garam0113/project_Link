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
		
		<title>���� �Խù� �󼼺���</title>
		
		<!-- ����� ���� css -->
		<link rel="stylesheet" href="/resources/css/clubPost/clubPost.css" type="text/css" media="screen" title="no title">
		
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
		
		<!--  font -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
		
		<!-- Swal �������� cdn -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		
		<script type="text/javascript">
		$(function(){
			
			
			
			///////////////////////////////////////// textarea ////////////////////////////////////////////////
			
			
			
			<%-- ��۵�� ��ư Ŭ���� ��ư ����� �Խù��� ����� ����� �� �ִ� textarea �������� --%>
			$("input[value='��۵��']").bind("click", function(){
				alert("�Խù� ��� ���");
				
				// ����ۼ� textarea�� ��� ��� ��ư ���̱�
				$(this).parent().next().removeAttr("style");
				
				// ��۵�� ��ư �����
				$(this).parent().attr("style", "display: none");
			});
			
			<%-- ����ϱ� ��ư Ŭ���� �Խù��� ����� ����� �� �ִ� textarea ����� ��۵�� ��ư �������� --%>
			$("input[value='����ϱ�']").bind("click", function(){
				alert("�Խù� ��� ���");
				
				// ����ۼ��� textarea�� �ִ� ���� �����
				$(this).prev().prev().val("");
				
				// �Խù� ��۵�� ��ư ���̱�
				$(this).parent().parent().prev().removeAttr("style");
				
				// ������ ��ư �����
				$(this).parent().parent().attr("style", "display: none");
			});

			<%-- ����� ����� ����� �� �ִ� textarea �������� --%>
			$(document).on("click", ".reply.add", function(){
				alert('���� ���');
				
				// display : none�� �����Ͽ� ����ۼ����� ���̰��Ѵ�
				$(".clear-after-comment-add").attr("style", "display: none");
				$(".clear-after-comment-update").attr("style", "display: none");

				// display : none�� �����Ͽ� ����ۼ����� ���̰��Ѵ�
				$(this).parent().parent().parent().parent().next().removeAttr("style");
			}); // end of ���

			<%-- �ش� ����� ������ �� �ִ� �Է��ؽ�Ʈ �������� --%>
			$(document).on("click", ".reply.update", function(){
				alert('���� ����');
				
				// display : none�� �Ͽ� ��϶� �������� �� �ݴ´�
				$(".clear-after-comment-add").attr("style", "display: none");
				$(".clear-after-comment-update").attr("style", "display: none");

				// display : none�� �����Ͽ� ����ۼ����� ���̰��Ѵ�
				$(this).parent().parent().parent().parent().parent().children("div:eq(2)").removeAttr("style");
				
				// ���� ��۳���
				var content = $(this).parent().parent().parent().parent().children("p").text();
				//alert( content );
				
				// ���� ��۳����� �������� ���
				$(this).parent().parent().parent().parent().parent().children("div:eq(2)").find("textarea").val(content );
			});
			
			<%-- ����� ����, ����� ��� ����� ����Ѵ� --%>
			$(document).on("click", ".plain.button.red.cancle", function(){
				alert('���� ���');
				
				// ����� �����
				$(this).siblings("textarea").val("");
				
				// ��� �ۼ����� �����
				$(this).parent().parent().attr("style", "display: none");
			});
			
			
			
			///////////////////////////////////////// clubPost ////////////////////////////////////////////////
			
			
			
			<%-- ���� �Խù� ���� --%>
			$(".clubPost-header-update").bind("click", function(){
				alert("���ӰԽù� ����");
				$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
			});
			
			<%-- ���� �Խù� ���� --%>
			$("#club-post-delete").bind("click", function(){
				
				Swal.fire({
					  title: '���� �����Ͻðڽ��ϱ�?',
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '����',
					  cancelButtonText: '���',
					}).then((result) => {
					  if (result.isConfirmed) {
					    Swal.fire(
					      '�����Ϸ�',
					      '����� �����Ǿ����ϴ�',
					      'success'
					    )
					    
					    clubPostdeleteFnc();
					  }//end of if
					})// end of swal
			});
			
			<%-- ���� �Խù� �Ű� --%>
			$(".clubPost-header-report").bind("click", function(){
				alert("���ӰԽù� �Ű�");
				event.stopPropagation();
				$("form[name='clubPostReport']").attr("method", "post").attr("action", "/serviceCenter/addReport" ).submit();
			});

			<%-- ���� �Խù� ���ƿ� �Ǵ� ���ƿ���� --%>
			$(".clubPost-header-heart").bind("click", function(){
				alert("���ӰԽù� ���ƿ�");
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
			
			
			
			///////////////////////////////////////// commentList ////////////////////////////////////////////////
			
			

			<%-- ���� �Խù� ��۸���Ʈ �����´� --%>
			$(document).on("click", ".recommentList", function(){
				alert("��� ���� Ŭ���� �ش� ����� ��۸���Ʈ �����´�");
				var clubPostCommentNo = $(this).parent().parent().parent().attr("commentNo");
				var clubPostNo = ${ clubPost.getClubPost.clubPostNo };
				var clickCondition = $(".children.plain"+clubPostCommentNo).attr("clubCondition");
				var depth = $(this).parent().parent().parent().attr("depth");

				if( clickCondition == 1 ){
					// �ش� ����� ���� ����Ʈ �����
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
									//alert( "��� ��ȣ : " + el.clubPostCommentNo );
									//alert( "��� �Խù� ��ȣ : " + el.clubPostNo );
									//alert( "��� �ۼ��� ���̵� : " + el.user.userId );
									//alert( "��� �ۼ��� �������̹��� : " + el.user.profileImage );
									//alert( "��� �ۼ��� �г��� : " + el.user.nickName );
									//alert( "��� �� : " + el.commentCount );
									//alert( "��� ���� : " + el.commentContent );
									//alert( "��� ��ϳ�¥ : " + el.commentRegDate );
									//alert( "��� ������¥ : " + el.commentUpdateDate );
									//alert( "��� ���ƿ� �� : " + el.commentHeartCount );
									//alert( "��� �Ű��� : " + el.reportCondition );
									//alert( "��� �������� : " + el.deleteCondition );
									//alert( "��� �θ��ȣ : " + el.parent );
									//alert( "��� ���� : " + el.depth );
									//alert( "��� ���� : " + el.sequence );
									//alert( "��� �ش� ������ ���ƿ俩�� : " + el.heartCondition );
									
									<%-- ��Ʈ������� ��۹�ȣ�� ���ƿ�/0�̸� ���ƿ� ���ߴ� --%>
									var heart = el.heartCondition != 0 ? 'heart.jpg' : 'no_heart.jpg';
									
									var iconString = "";
									
									if('${ sessionScope.user.userId }' == el.user.userId ){
										//alert('true');
									 	<%-- �ش� ��� ���� --%>
									 	iconString = "<a class='reply update'>"
												 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-paperclip updateCommentView' aria-hidden='true' style='font-size: 25px;'></span>"
													+"</a>"
													<%-- �ش� ��� ���� --%>
												 	+"<a href='#' class='reply delete'>"
												 		<%-- �ش� ��� �ۼ��� �Ǵ� �ش� �Խù� �ۼ��� �Ǵ� ���Ӵ�ǥ �Ǵ� ������ --%>
												 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-trash deleteComment comment' aria-hidden='true' style='font-size: 25px;'></span>"
													+"</a>"																		 		
								 	}else{
								 		//alert('false');
										<%-- �ش� ��� �Ű� --%>
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
																				<%-- ��Ʈ������� ��۹�ȣ�� ���ƿ�/0�̸� ���ƿ� ���ߴ� --%>
																	 			+"<img src='/resources/image/uploadFiles/"+heart+"' height='40' width='40'>"
																	 		+"</a>"
																		 +"</div>"
																		 																	 
																		 +"<div>"
																		 	<%-- �ش� ����� ���ƿ� �� --%>
																		 	+"<span class='commentHeartCount"+el.clubPostCommentNo+"' style='font-size: 30px;'>"+el.commentHeartCount+"</span>"																
																		 	<%-- �ش� ����� ��� ��� --%>
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
																				+"<a class='recommentList'>��� "+el.commentCount+"��</a>"
																			+"<cite>"
																		+"</div>"
																+"</c:if>"
															+"</div>"
															<%-- class='single-comment --%>
														
														
															+"<div class='clear-after-comment-add"+el.clubPostCommentNo+"' commentTextArea='"+el.clubPostCommentNo+"' style='display: none;'>"
																+"<form class='comment-form-add'>"
																+"<textarea class='plain buffer' placeholder='����ۼ���'></textarea>"
																+"<input class='plain button red add' value='��ϿϷ�'>"
																+"<input class='plain button red cancle' value='���'>"
																+"</form>"						
															+"</div>"
															
															+"<div class='clear-after-comment-update"+el.clubPostCommentNo+"' commentTextArea='"+el.clubPostCommentNo+"' style='display: none;'>"
																+"<form class='comment-form-update'>"
																+"<textarea class='plain buffer'></textarea>"
																+"<input class='plain button red update' value='�����Ϸ�'>"
																+"<input class='plain button red cancle' value='���'>"
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
									
									// ���۸���Ʈ �������� ���� ����� ������ �����
									$(".children.plain"+el.parent).children("div:eq(0)").remove();
									
									// for���� ������ ��ü ����Ʈ�� �־��ֱ� ����
									totalDisplay += display;
									parentTag = el.parent;
									
								});

								//alert( totalDisplay );
								// ���۸���Ʈ ��ü�� �����´�
								$(".children.plain"+parentTag).append( totalDisplay );
								

							} // end of success
						}); // end of ajax
			}); // end of recommentList
			
			
			
			///////////////////////////////////////// comment ////////////////////////////////////////////////
			
			
			
			<%-- �ش� �Խù��� ��� ��� --%>
			$(document).on("click", ".plain.button.red.add", function(){
				alert('��� ��ϿϷ�');
				var clubPostNo = ${ clubPost.getClubPost.clubPostNo };
				var commentContent = $(this).prev().val();
				var depth = $(this).parent().parent().prev().attr("depth");
				var clubPostCommentNo = $(this).parent().parent().prev().attr("commentNo");
				
				if( depth <= 0 ){
					//alert("�Խù��� ��� ���!");
					depth = 0;
				}
				
				if( clubPostCommentNo <= 0 ){
					//alert("�Խù��� ��� ���");
					clubPostCommentNo = 0;
				}
				
				//alert( "�Խù���ȣ : " + clubPostNo );
				//alert( "��۳��� : " + commentContent );
				//alert( "����� ����� ���� : " + depth );
				//alert( "����� �θ��� ��ȣ : " + clubPostCommentNo );

				// ����ۼ� textarea ������ �����
				$(this).prev().val("");
				// �ۼ���, ��� ��ҹ�ư �����
				$(this).parent().parent().attr("style", "display: none");
				// �Խù��� ��۵�� ��ư ���̱�
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
								//alert( depth == 0 ? '�Խù� ��� ���' : '����� ��� ���' );
								
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
															 <%-- �ش� ����� ���ƿ� �� --%>
															 	+"<span class='commentHeartCount"+JSONData.clubPostCommentNo+"' style='font-size: 30px;'>0</span>"																
															 	<%-- �ش� ����� ��� ��� --%>
															 	+"<a class='reply add'>"
															 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span "+addComment+" aria-hidden='true' style='font-size: 25px;'></span>"
															 	+"</a>"
															 	<%-- �ش� ��� ���� --%>
															 	+"<a class='reply update'>"
															 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-paperclip updateCommentView' aria-hidden='true' style='font-size: 25px;'></span>"
																+"</a>"
																<%-- �ش� ��� ���� --%>
															 	+"<a href='#' class='reply delete'>"
															 		<%-- �ش� ��� �ۼ��� �Ǵ� �ش� �Խù� �ۼ��� �Ǵ� ���Ӵ�ǥ �Ǵ� ������ --%>
															 		+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-trash deleteComment comment' aria-hidden='true' style='font-size: 25px;'></span>"
																+"</a>"
															+"</div>"
															
														+"</div>"
														
													+"</div>"
													
													+"<p>"+JSONData.commentContent+"</p>"
													
													+"<c:if test='"+JSONData.commentCount+">0'>"
															+"<div class='comment-author'>"
																+"<cite>"
																	+"<a class='recommentList'>��� "+JSONData.commentCount+"��</a>"
																+"<cite>"
															+"</div>"
													+"</c:if>"
												+"</div>"
												<%-- class='single-comment' --%>
												
												+"<div class='clear-after-comment-add"+JSONData.clubPostCommentNo+"' commentTextArea='"+JSONData.clubPostCommentNo+"' style='display: none;'>"
													+"<form class='comment-form-add'>"
													+"<textarea class='plain buffer' placeholder='����ۼ���'></textarea>"
													+"<input class='plain button red add' value='��ϿϷ�'>"
													+"<input class='plain button red cancle' value='���'>"
													+"</form>"						
												+"</div>"
												
												
												+"<div class='clear-after-comment-update"+JSONData.clubPostCommentNo+"' commentTextArea='"+JSONData.clubPostCommentNo+"' style='display: none;'>"
													+"<form class='comment-form-update'>"
													+"<textarea class='plain buffer'></textarea>"
													+"<input class='plain button red update' value='�����Ϸ�'>"
													+"<input class='plain button red cancle' value='���'>"
													+"</form>"						
												+"</div>"
												
												
												+"<div class='recomment-header "+addRecommentCss+"'>"
													+"<div class='recomment-header-space'></div>"
													+"<div class='recomment-header-body'>"
														+"<ul class='children plain"+JSONData.clubPostCommentNo+"' clubCondition='0'>"
														+"</ul>"
													+"</div>"
												+"</div>"
												<%-- ���� ����Ʈ class='recomment-header' --%>

												+"<br>"
											+"</li>"
											
										+"</div>";
										<%-- class='comment-parent' --%>
										
										
											
								if( depth == 0 ){
									alert( "�Խù��� ��۵��" );
									$(".comment-list.plain").append( display );
								}else if( depth == 1 ){
									alert( "����� ��۵��" );
									$(".children.plain"+clubPostCommentNo).append( display );
								}
								//alert( display );
							}// end of success

				});// end of ajax
			}); // end of ���

			<%-- �ش� ����� �����Ѵ� --%>
			$(document).on("click", "input[value='�����Ϸ�']", function(){
				alert('��� �����Ϸ�');
				var commentContent = $(this).prev().val();
				var clubPostCommentNo = $(this).parent().parent().attr("commentTextArea");
				var divClassName = $(this).parent().parent().attr("class");
				//alert( "��۳��� : " + commentContent );
				//alert( "�ش����ǹ�ȣ : " + clubPostCommentNo );
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
			}); // end of �����Ϸ�

			<%-- �ش� ����� �����Ѵ� --%>
			$(document).on("click", ".glyphicon.glyphicon-trash.deleteComment.comment", function(){
				
				Swal.fire({
					  title: '���� �����Ͻðڽ��ϱ�?',
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '����',
					  cancelButtonText: '���',
					}).then((result) => {
					  if (result.isConfirmed) {
					    Swal.fire(
					      '�����Ϸ�',
					      '����� �����Ǿ����ϴ�',
					      'success'
					    )
					    
					    var clubPostCommentNo = $(this).parent().parent().parent().parent().parent().attr("commentNo");
						var className = $(this).parent().parent().parent().parent().parent().attr("class");
						//var depth = $(this).parent().parent().parent().parent().parent().attr("depth");
						//alert( clubPostCommentNo );
						//alert( "������ Ŭ������ : " + className );
						//alert( depth );
						
						$("."+className).next().remove();
						$("."+className).next().remove();
						$("."+className).next().remove();
						$("."+className).next().remove();//�̰Ŵ� <br>�±� ����°�
						
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

										// �����Ȱ͵� �����ͼ� ��۰��� ���� ���ص� �ȴ�
										
										// �Խù� ��۰��� ����
										//$(".comment_count").text( JSONData.clubPostCommentCount );
										
										// �Խù� ����� ��۰��� ����
										//$("div .single-comment"+JSONData.parent).find("b").text( JSONData.commentCount );
										
										
									} // end of success
								}); // end of ajax
								
								
								
					  }//end of swal if��
					})//end of swal
				
				
			}); // end of ����

			<%-- �ش� ����� ���ƿ� �Ǵ� ���ƿ� ����Ѵ� --%>
			$(document).on("click", ".reply.heartCondition", function(){
				alert("��� ���ƿ�");
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
				alert("��� �Ű�");
				var clubPostCommentNo = $(this).parent().parent().parent().parent().attr("commentNo");
				var revUserId = $(this).parent().parent().parent().parent().attr("revUserId");
				
				$("#sourceNumber").val( clubPostCommentNo );
				$("#revUserId").val( revUserId );
				
				event.stopPropagation();
				
				$("form[name='commentReport']").attr("method", "post").attr("action", "/serviceCenter/addReport" ).submit();
				
			}) // .report evenet close
			
			
			
			///////////////////////////////////////// MyHome ////////////////////////////////////////////////
			
			

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
		<%-- ���ӰԽù� �Ű� --%>
		<input type="hidden" name="reportSource" value="1">
		<input type="hidden" name="sourceNumber" value="${ clubPost.getClubPost.clubPostNo }">
		<input type="hidden" name="userId" value="${ clubPost.getClubPost.user.userId }">
		<input type="hidden" name="clubNo" value="${ clubPost.getClubPost.clubNo }">
		<%-- ���ӰԽù� �Ű� --%>
	</form>
	
	<form name="commentReport" method="post" action="/serviceCenter/addReport">
		<%-- ���ӰԽù� ��� �Ű� --%>
		<input type="hidden" name="reportSource" value="2">
		<input type="hidden" name="sourceNumber" id="sourceNumber" value="">
		<input type="hidden" name="userId" id="revUserId" value="">
		<input type="hidden" name="clubPostNo" value="${ clubPost.getClubPost.clubPostNo }">
		<input type="hidden" name="clubNo" value="${ clubPost.getClubPost.clubNo }">
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
				
				
				
					<ul class="inline cats filter-options">
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
							
							<h5><time datetime="2013-11-09" class="club-post-time">
							<c:choose>
								<c:when test="${ !empty clubPost.getClubPost.clubPostUpdateDate }">${ clubPost.getClubPost.clubPostUpdateDate }(���� ��)</c:when>
								<c:otherwise>${ clubPost.getClubPost.clubPostRegDate }</c:otherwise>
							</c:choose>
							</time></h5>
							
							<div class="clubPost-header">
								<%-- �Խù� ��� ȸ�� ������ ���� --%>
								<div class="clubPost-header-profile" userId = "${ clubPost.getClubPost.user.userId }">
									<img class="profileImage" src="/resources/image/uploadFiles/${ clubPost.getClubPost.user.profileImage }">
								</div>
							
								<%-- �Խù� ��� ȸ�� �г��� --%>
								<div class="clubPost-header-nickName" userId="${ clubPost.getClubPost.user.userId }">${ clubPost.getClubPost.user.nickName }</div>
								
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
										<a>
											<span class="glyphicon glyphicon-trash deleteComment" id="club-post-delete" aria-hidden="true"></span>
										</a>
									</div>
								</c:if>
								
								<%-- �ش� �Խù� �ۼ��� �̿��� ȸ�� �Ű� ���� --%>
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
						<input class="plain button red" value="��۵��">
					</div>
					<div id="post-comment" class="clear-after" style="display: none;">
						<h3 id="reply-title"></h3>
						<form class="comment-form">
							<br><br>
							<textarea class="plain buffer" placeholder="��� ��϶�"></textarea>
							<input class="plain button red add" id="replyadd" value="��� ����ϱ�">
							<input class="plain button red cancle" value="����ϱ�">
						</form>						
					</div><!-- post-comment -->	
					
					
					
					
					
					<div class="comment-section">
						<h3 id="comments">
							<c:choose>
								<c:when test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">��� <b class="comment_count">${ clubPost.getClubPost.clubPostCommentCount }</b>��</c:when>
							</c:choose>
						</h3>
						<ul class="comment-list plain">
							<%-- �ش� �Խù��� ����� �������� for���� ���� --%>
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
													<div class="comment-author">
													<c:choose>
														<c:when test="${ clubPost.getClubPostCommentList[i].commentCount > 0 }">
															<cite>
																<a class="recommentList">��� <b class="recomment_count">${ clubPost.getClubPostCommentList[i].commentCount }</b>��</a>
															<cite>
														</c:when>
													</c:choose>
													</div>
												</div><!-- single-comment -->
												
												<div class="clear-after-comment-add${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentTextArea="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="display: none;">
													
													<br>
													<form class="comment-form-add">
														<textarea class="plain buffer" placeholder="����ۼ���"></textarea>
														<input class="plain button red add" value="��ϿϷ�">
														<input class="plain button red cancle" value="���">
													</form>
													<br>
													
												</div><!-- post-comment -->	
												
												<div class="clear-after-comment-update${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentTextArea="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="display: none;">
													
													<br>
													<form class="comment-form-update">
														<textarea class="plain buffer"></textarea>
														<input class="plain button red update${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" value="�����Ϸ�">
														<input class="plain button red cancle" value="���">
													</form>
													<br>
													
												</div><!-- post-comment -->
												
												
												
												
												
												<%-- ���۸���Ʈ --%>
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
																					<c:otherwise><time datetime="2013-03-23 19:58">${ clubPost.getClubPostCommentList[i].commentUpdateDate }(������)</time></c:otherwise>
																				</c:choose>
																				
																				�ش� ����� �ش� ������ ���ƿ� ���ο� ���� �̹��� ���Ѵ�
																				<div class="comment body">
																					<div class="comment-heart-${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
																					 	<a class="reply heartCondition">
																				 			<!-- ��Ʈ������� ��۹�ȣ�� ���ƿ�/0�̸� ���ƿ� ���ߴ� -->
																				 			<img src="/resources/image/uploadFiles/${ clubPost.getClubPostCommentList[i].heartCondition != 0 ? 'heart.jpg' : 'no_heart.jpg' }" height="40" width="40">
																						 </a>
																					 </div>
																					 <div>
																						�ش� ����� ���ƿ� ��
																						 <span class="commentHeartCount${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="font-size: 30px;">${ clubPost.getClubPostCommentList[i].commentHeartCount }</span>
																						
																						�ش� ����� ��� ���
																						 <a class="reply add">
																						 	&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-plus-sign" aria-hidden="true" style="font-size: 25px;"></span>
																						 </a>
																						 �ش� ��� ����
																						 <a class="reply update">
																						 	<c:if test="${ clubPost.getClubPostCommentList[i].user.userId == sessionScope.user.userId }">
																						 		&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true" style="font-size: 25px;"></span>
																						 	</c:if>
																						 </a>
																						 �ش� ��� ����
																						 <a href="#" class="reply delete">
																						 �ش� ��� �ۼ��� �Ǵ� �ش� �Խù� �ۼ��� �Ǵ� ���Ӵ�ǥ �Ǵ� ������
																						 <c:if test="${ clubPost.getClubPostCommentList[i].user.userId == sessionScope.user.userId || clubPost.getClubPost.user.userId == sessionScope.user.userId
																						 || fn:trim(sessionScope.clubUser.memberRole) == '2' || sessionScope.user.role == '1' }">
																						  	&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-trash deleteComment comment" aria-hidden="true" style="font-size: 25px;"></span>
																						  </c:if>
																						  </a>
																						 �ش� ��� �Ű�
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
																		</div> --%><!-- single-comment -->
														
																		<%-- <div class="clear-after-comment-update${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" commentTextArea="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" style="display: none;">
																			
																			<form class="comment-form-update">
																				<textarea class="plain buffer"></textarea>
																				<input class="plain button red add${ clubPost.getClubPostCommentList[i].clubPostCommentNo }" value="�����Ϸ�" style="height: 30px; width: 90px;">
																				<input class="plain button red cancle" value="���" style="height: 30px; width: 60px;">
																			</form>
																			
																		</div><!-- post-comment -->
													
																	</li>
																</div> --%>
																	
																	
														</ul>
													</div>
												</div>
												<br>
												<%-- ���� for�� --%>
											</div>
											
											
											
											
										</c:if>
									</c:forEach>
								</c:if>
							</li>
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
