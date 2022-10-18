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
			$(".clubPost-header-update").bind("click", function(){
				$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
			});
			$(".clubPost-header-delete").bind("click", function(){
				alert("���� �Խù� ��ȣ : " + ${ clubPost.getClubPost.clubPostNo });
				//$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo=2&clubPostNo="+${ clubPost.getClubPost.clubPostNo }+"&userId="+${ user.userId }).submit();
			});
			$(".clubPost-header-report").bind("click", function(){
				alert("���� �Խù� ��ȣ : " + ${ clubPost.getClubPost.clubPostNo });
				alert("���� ���̵� : " + ${ clubPost.getClubPost.user.userId });
				//$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo=2&clubPostNo="+${ clubPost.getClubPost.clubPostNo }+"&userId="+${ user.userId }).submit();
			});
			$("input[value='����Ʈ���̵�']").bind("click", function(){
				location.href = "/clubPost/getClubPostList?clubNo=2&order=0";
			});
			$(".clubPost-header-heart").bind("click", function(){
				alert('��Ʈ');
				$.ajax( "/clubPostRest/json/updateClubPost",
						{
							method : "POST",
							data : JSON.stringify({
										clubPostNo : ${ clubPost.getClubPost.clubPostNo },
										userId : "${ clubPost.getClubPost.user.userId }"
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								//alert(status);
								//alert(JSONData);
								$("a[href='#']").text(JSONData);
							}
						});
			}); // end of ��Ʈ
			$(document).on("click", "b:contains('��� ��')", function(){
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
			}); // end of ��� ��
			$(document).on("click", "button", function(){
				alert("button");
				var text = $(this).prev().html();
				var inputText = "<input type='text' value='"+text+"'><input type='button' value='�����Ϸ�'>";
				$(this).parent().prepend(inputText);
			});
			$(document).on("click", "input[value='�����Ϸ�']", function(){
				alert("�����Ϸ�");
				var commentContent = $("input[type='text']").val();
				$.ajax( "/clubPostRest/json/updateClubPostComment",
						{
							method : "POST",
							data : JSON.stringify({
										clubPostCommentNo : 3,
										commentContent : commentContent
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								alert(status);
							} // end of success
						}); // end of ajax
			}); // end of �����Ϸ�
			$(document).on("click", "input[value='����']", function(){
				alert("����");
				var clubPostCommentNo = $(this).attr("class");
				alert(clubPostCommentNo);
				$.ajax( "/clubPostRest/json/deleteClubPostComment",
						{
							method : "POST",
							data : JSON.stringify({
										clubPostCommentNo : clubPostCommentNo
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								alert(status);
							} // end of success
						}); // end of ajax
			}); // end of ����
			$(document).on("click", "input[value='���']", function(){
				alert("���");
				var inputText = "<input type='text' value=''><input type='button' value='��ϿϷ�'>";
				$(this).parent().prepend(inputText);
			}); // end of ���
			$(document).on("click", "input[value='��ϿϷ�']", function(){
				alert("��ϿϷ�");
				var commentContent = $("input[type='text']").val();
				alert(commentContent);
				$.ajax( "/clubPostRest/json/addClubPostComment",
						{
							method : "POST",
							data : JSON.stringify({
										clubPostCommentNo : 0,
										clubPostNo : 64,
										commentContent : commentContent
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								alert(status);
								alert(JSONData);
							} // end of success
						}); // end of ajax
			}); // end of ��ϿϷ�
			$(document).on("click", "a:contains('������ƿ�')", function(){
				alert('������ƿ�');
				$.ajax( "/clubPostRest/json/updateClubPostComment",
						{
							method : "POST",
							data : JSON.stringify({
										clubPostCommentNo : 9,
										heartCondition : 1,
										userId : "user03"
									}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status){
								//alert(status);
								//alert(JSONData);
								$("a[href='###']").text(JSONData);
							}
						});
			}); // end of ������ƿ�
			//�˻���ư Ŭ���� �˻� ���뿡 �´� ��ǰ����Ʈ�� display
			/* function fncGetProductList() {
				document.detailForm.searchCondition.value = document.detailForm.searchCondition.value;
				document.forms[0].elements[1].value = document.forms[0].elements[1].value;
				$("#currentPage").val("1");
				$("form").attr("method","post").attr("action","/product/listProduct").submit();
			} */
		});
		</script>
		
		<style type="text/css">
			.clubPost-header {
				background-color: yellow;
				display: grid;
				grid-template-columns: 1fr 10fr 1fr 1fr 1fr 1fr 1fr;
			}
			.clubPost-header-profile {
				background-color: blue;
				width: 
			}
			.clubPost-header-nickName{
				background-color: green;
			}
			.clubPost-header-heart{
				background-color: orange;
			}
			.clubPost-header-heartCount{
				background-color: gray;
			}
			.clubPost-header-update{
				background-color: lime;
			}
			.clubPost-header-delete{
				background-color: purple;
			}
			.clubPost-header-report{
				background-color: aqua;
			}
		</style>
		
	</head>

	<body class="single single-post">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

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
				<div class="row-content buffer-left buffer-right buffer-bottom">
				
				
				
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
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">����</a>
						</li> --%>
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
								<div class="clubPost-header-profile">
									<img src="/resources/image/uploadFiles/${ clubPost.user.profileImage }" height="70" width="70"></div>
								<div class="clubPost-header-nickName">${ clubPost.user.nickName }</div>
								<div class="clubPost-header-heart">
									<img src="/resources/image/uploadFiles/heart.jpg" height="70" width="70">
								</div>
								<div class="clubPost-header-heartCount" style="font-size: 2rem;">${ clubPost.getClubPost.clubPostHeartCount }</div>
								<div class="clubPost-header-update">
									<span class="glyphicon glyphicon-paperclip updateCommentView" aria-hidden="true" style="font-size: 4rem;"></span>
								</div>
								<div class="clubPost-header-delete">
									<span class="glyphicon glyphicon-trash deleteComment" aria-hidden="true" style="font-size: 4rem;"></span>
								</div>
								<div class="clubPost-header-report">
									<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" style="font-size: 4rem;"></span>
								</div>
							</div>
							<div style="background-color: yellow;">
								<h1>${ clubPost.getClubPost.clubPostTitle }</h1>
							</div>
							<div>
								<%-- <p>���� �Խù� ��� ȸ�� ���̵� : ${ clubPost.getClubPost.user.userId }</p> --%>
								<%-- <p>���� ��ȣ : ${ clubPost.getClubPost.clubNo }</p> --%>
								<p>${ clubPost.getClubPost.clubPostContent }</p>
								<%-- <p>���� �Խù� ��ȣ : ${ clubPost.getClubPost.clubPostNo }</p> --%>
								<c:if test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">
									<p>��� ���� ${ clubPost.getClubPost.clubPostCommentCount } ��</br>
								</c:if>
							</div>
													
						</article>

					</div><!-- post-area -->
					
					
					
					<div id="post-comment" class="clear-after">
						<h3 id="reply-title">��� �ۼ���</h3>
						<form class="comment-form">
							<textarea class="plain buffer" placeholder=""></textarea>
							<input class="plain button red" type="submit" value="��� ����ϱ�">
						</form>						
					</div><!-- post-comment -->	
					
					
					
					
					
					
					<c:if test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">
					//////////////////////////////////////////////////////////////////////</br>
					���� �Խù� ��� ����Ʈ</br>
					<div add="add" clubPostNo="${ clubPost.getClubPost.clubPostNo }">
					<!-- <input type="button" value="���"> -->
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
					<%-- ���� �Խù� ��ȣ : ${ clubPost.getClubPostCommentList[i].clubPostNo }</br>
					���� �Խù� ��� ��ȣ : ${ clubPost.getClubPostCommentList[i].clubPostCommentNo }</br>
					���� �Խù� ��� ��� ȸ�� ���̵� : ${ clubPost.getClubPostCommentList[i].user.userId }</br> --%>
					���� �Խù� ��� ��� ȸ�� �г��� : ${ clubPost.getClubPostCommentList[i].user.nickName }</br>
					��� ��ϳ�¥ : ${ clubPost.getClubPostCommentList[i].commentRegDate }</br>
					<%-- ��� ������¥ : ${ clubPost.getClubPostCommentList[i].commentUpdateDate }</br> --%>
					��� ���ƿ� �� : ${ clubPost.getClubPostCommentList[i].commentHeartCount }</br>
					<%-- �Ű��� : ${ clubPost.getClubPostCommentList[i].reportCondition }</br>
					�������� : ${ clubPost.getClubPostCommentList[i].deleteCondition }</br> --%>
					��� �θ��ȣ : ${ clubPost.getClubPostCommentList[i].parent }</br>
					��� ���� : ${ clubPost.getClubPostCommentList[i].depth }</br>
					��� ���� : ${ clubPost.getClubPostCommentList[i].sequence }</br>
					<%-- <a href="/clubPostRest/getClubPostCommentList?clubPostCommentNo=${ clubPost.getClubPostCommentList[i].clubPostCommentNo }&depth=0">��� �� : ${ clubPost.getClubPostCommentList[i].commentCount }</a></br> --%>
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
					</c:if>
					
					
					
					
					

					<%-- <div class="comment-section">
						<h3 id="comments">19 Comments</h3>
						<ul class="comment-list plain">
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
									<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
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
											<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
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
													<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
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
									<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
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
									<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
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
