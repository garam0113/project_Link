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
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		<link rel="icon" href="favicon.ico">
		<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/apple-touch-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/apple-touch-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/apple-touch-icon-152x152.png">
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		
		<script type="text/javascript">
		$(function(){
			$("input[value='수정']").bind("click", function(){
				$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
			});
			$("input[value='삭제']").bind("click", function(){
				alert("모임 게시물 번호 : " + ${ clubPost.getClubPost.clubPostNo });
				$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo=2&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
			});
			$("input[value='리스트로이동']").bind("click", function(){
				location.href = "/clubPost/getClubPostList?clubNo=2&order=0";
			});
			$("a:contains('하트')").bind("click", function(){
				alert('하트');
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
			}); // end of 하트
			$(document).on("click", "b:contains('댓글 수')", function(){
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
			}); // end of 댓글 수
			$(document).on("click", "button", function(){
				alert("button");
				var text = $(this).prev().html();
				var inputText = "<input type='text' value='"+text+"'><input type='button' value='수정완료'>";
				$(this).parent().prepend(inputText);
			});
			$(document).on("click", "input[value='수정완료']", function(){
				alert("수정완료");
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
			}); // end of 수정완료
			$(document).on("click", "input[value='삭제']", function(){
				alert("삭제");
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
			}); // end of 삭제
			$(document).on("click", "input[value='등록']", function(){
				alert("등록");
				var inputText = "<input type='text' value=''><input type='button' value='등록완료'>";
				$(this).parent().prepend(inputText);
			}); // end of 등록
			$(document).on("click", "input[value='등록완료']", function(){
				alert("등록완료");
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
			}); // end of 등록완료
			$(document).on("click", "a:contains('댓글좋아요')", function(){
				alert('댓글좋아요');
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
			}); // end of 댓글좋아요
			//검색버튼 클릭시 검색 내용에 맞는 상품리스트를 display
			function fncGetProductList() {
				document.detailForm.searchCondition.value = document.detailForm.searchCondition.value;
				document.forms[0].elements[1].value = document.forms[0].elements[1].value;
				$("#currentPage").val("1");
				$("form").attr("method","post").attr("action","/product/listProduct").submit();
			}
		});
		</script>
		
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
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">결제</a>
						</li> --%>
					</ul>

					<div class="post-area clear-after">
						<article role="main">
							<h5 class="meta-post"><a href="#">Travels</a>, <a href="#">World</a> - <time datetime="2013-11-09">November 9, 2013</time></h5>
							<h1>Travelling around</h1>
							<p>모임 게시물 등록 회원 아이디 : ${ clubPost.getClubPost.user.userId }</p>
							<p>모임 번호 : ${ clubPost.getClubPost.clubNo }</p>
							<p>모임 게시물 제목 : ${ clubPost.getClubPost.clubPostTitle }</p>
							<p>모임 게시물 내용 : ${ clubPost.getClubPost.clubPostContent }</p>
							<p>모임 게시물 번호 : ${ clubPost.getClubPost.clubPostNo }</p>
							<p>모임 게시물 영상1 : <%-- <iframe width="560" height="315" src="https://www.youtube.com/embed/${  clubPost.getClubPost.clubPostVideo1 }" frameborder="0" allowfullscreen></iframe> --%></p>
							<p>모임 게시물 영상2 : ${ clubPost.getClubPost.clubPostVideo2 }</br></p>
							<p>모임 게시물 영상3 : ${ clubPost.getClubPost.clubPostVideo3 }</br></p>
							<p>모임 게시물 등록날짜 : ${ clubPost.getClubPost.clubPostRegDate }</br>
							<p>모임 게시물 수정날짜 : ${ clubPost.getClubPost.clubPostUpdateDate }</br>
							<p>모임 게시물 좋아요 수 : ${ clubPost.getClubPost.clubPostHeartCount }</br>
							<p>모임 게시물 댓글 개수 : ${ clubPost.getClubPost.clubPostCommentCount }</br>
							<p>모임 게시물 이미지1 : <img src="/resources/image/uploadFiles/${ clubPost.getClubPost.image1 }" height="400" width="700"></br></p>
							<p>모임 게시물 이미지2 : <img src="/resources/image/uploadFiles/${ clubPost.getClubPost.image2 }" height="400" width="700"></br></p>
							<p>모임 게시물 이미지3 : <img src="/resources/image/uploadFiles/${ clubPost.getClubPost.image3 }" height="400" width="700"></br></p>
							<p>모임 게시물 이미지4 : <img src="/resources/image/uploadFiles/${ clubPost.getClubPost.image4 }" height="400" width="700"></br></p>
							<p>모임 게시물 이미지5 : <img src="/resources/image/uploadFiles/${ clubPost.getClubPost.image5 }" height="400" width="700"></br></p>
							<p>모임 게시물 이미지6 : <img src="/resources/image/uploadFiles/${ clubPost.getClubPost.image6 }" height="400" width="700"></br></p>
							<p>모임 게시물 이미지7 : <img src="/resources/image/uploadFiles/${ clubPost.getClubPost.image7 }" height="400" width="700"></br></p>
							<p>모임 게시물 이미지8 : <img src="/resources/image/uploadFiles/${ clubPost.getClubPost.image8 }" height="400" width="700"></br></p>
							<p>모임 게시물 이미지9 : <img src="/resources/image/uploadFiles/${ clubPost.getClubPost.image9 }" height="400" width="700"></br></p>
							<p>모임 게시물 이미지10 : <img src="/resources/image/uploadFiles/${ clubPost.getClubPost.image10 }" height="400" width="700"></br></p>
						</article>

					</div><!-- post-area -->
					
					
					
					<div id="post-comment" class="clear-after">
						<h3 id="reply-title">댓글 작성란</h3>
						<form class="comment-form">
							<textarea class="plain buffer" placeholder=""></textarea>
							<input class="plain button red" type="submit" value="댓글 등록하기">
						</form>						
					</div><!-- post-comment -->	
					
					
					
					
					
					
					<c:if test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">
					//////////////////////////////////////////////////////////////////////</br>
					모임 게시물 댓글 리스트</br>
					<div add="add" clubPostNo="${ clubPost.getClubPost.clubPostNo }">
					<!-- <input type="button" value="등록"> -->
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
					<%-- 모임 게시물 번호 : ${ clubPost.getClubPostCommentList[i].clubPostNo }</br>
					모임 게시물 댓글 번호 : ${ clubPost.getClubPostCommentList[i].clubPostCommentNo }</br>
					모임 게시물 댓글 등록 회원 아이디 : ${ clubPost.getClubPostCommentList[i].user.userId }</br> --%>
					모임 게시물 댓글 등록 회원 닉네임 : ${ clubPost.getClubPostCommentList[i].user.nickName }</br>
					댓글 등록날짜 : ${ clubPost.getClubPostCommentList[i].commentRegDate }</br>
					<%-- 댓글 수정날짜 : ${ clubPost.getClubPostCommentList[i].commentUpdateDate }</br> --%>
					댓글 좋아요 수 : ${ clubPost.getClubPostCommentList[i].commentHeartCount }</br>
					<%-- 신고여부 : ${ clubPost.getClubPostCommentList[i].reportCondition }</br>
					삭제여부 : ${ clubPost.getClubPostCommentList[i].deleteCondition }</br> --%>
					댓글 부모번호 : ${ clubPost.getClubPostCommentList[i].parent }</br>
					댓글 깊이 : ${ clubPost.getClubPostCommentList[i].depth }</br>
					댓글 순서 : ${ clubPost.getClubPostCommentList[i].sequence }</br>
					<%-- <a href="/clubPostRest/getClubPostCommentList?clubPostCommentNo=${ clubPost.getClubPostCommentList[i].clubPostCommentNo }&depth=0">댓글 수 : ${ clubPost.getClubPostCommentList[i].commentCount }</a></br> --%>
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
