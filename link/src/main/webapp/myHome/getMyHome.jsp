<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="The Page Description">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className) 
	$(".yourHome").on("click" , function() {
		
		self.location = "/myHome/getYourHome?userId="+$("#receiveId").val();
	});
	
	
 });
 
/*
	window.onload=function() {
		var userId = $("#userId").val();
		console.log($("#userId").val());
		
		$.ajax({
			url : "/myHomeRest/json/getFollowList", // 어디로 갈거니? // 갈 때 데이터
			type : "POST", // 타입은 뭘 쓸거니?
			datatype : "json",
			 data		:  JSON.stringify({searchKeyword:userId}),
			contentType : "application/json",
			success : function(data) { // 갔다온 다음 결과값
					// 나오면 파일을 찾았다는 것
			//	alert(data);  // [object Object],[object Object],[object Object]
				
			// 데이터를 확인하고 싶을 때.
			//	let str = JSON.stringify(data); // <> parse()
			//	alert(str); 
           console.log(data.list[0].receiveId.nickName);
				$.each(data.list, function(index, item) { // 데이터 =item
					var value ="<img src='/resources/image/uploadFiles/" + item.receiveId.profileImage
					+ "' width='100' height='100'/>"
					+ item.receiveId.nickName;
					
		$("#demo").append(value);
					
				
				});
			},
			error : function() {
				alert('error');			
			}
			
		});
		
		
	};
*/




$(function(){
	
	<!-- REST CONTROLLTER TEST -->

	<!-- REST CONTROLLTER TEST -->
	
	<!-- ADD_FEED -->
	$(".addFeed").bind("click", function(){
		alert("피드 추가버튼");
		$(this.form).attr("method", "POST").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
	});
	<!-- ADD_FEED -->
	
	<!-- UPDATE_FEED -->
	$(".btn_update").bind("click", function(){
		alert("피드 수정 버튼");
		$(this.form).attr("method", "GET").attr("action", "/feed/updateFeed").submit();
	});
	<!-- UPDATE_FEED -->
	
	<!-- DELETE_FEED -->
	$(".btn_delete").bind("click", function(){
		alert("피드 삭제 버튼");
		$(this.form).attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
	});
	<!-- DELETE_FEED -->
	
	<!-- GET_FEED -->
	$(".btn_getFeed").bind("click", function(){
		alert("클릭한 글 번호 : " + $(this).parent().find("input[name='feedNo']").val());
		location.href="/feed/getFeed?feedNo=" + $(this).parents(".feedForm").find("input[name='feedNo']").val();
	})
	<!-- GET_FEED -->
	
	<!-- ADD_FEED_HEART -->
	$(".like:contains('좋아요')").bind("click", function(){
		event.stopPropagation();
		alert($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 좋아요");
		
		var html = $(this);
		
		$.ajax(
				{
					url : "/feedRest/json/addFeedHeart",
					method : "POST",
					data : JSON.stringify ({
						feedNo : $(this).parents(".feedForm").children("input[name='feedNo']").val()
					}),
					contentType: 'application/json',
					dataType : "json",
					header : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}, // header end
					
					success : function(data, status) {
						
						swal.fire("피드 좋아요 성공 : " + data);
						
						$(html).parents(".row").children(".like:contains('좋아요')").hide();
						$(html).parents(".row").children(".dislike:contains('시러요')").show();
						$(html).parents(".row").children(".likeCount").text(data);
						
					} // success close
					
				} // ajax inner close
				
		) // ajax close
	})
	<!-- ADD_FEED_HEART -->
	
	<!-- DELETE_FEED_HEART -->
	$(".dislike:contains('시러요')").bind("click", function(){
		event.stopPropagation();
		alert($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 시러요");
		
		var html = $(this);
		
		$.ajax(
				{
					url : "/feedRest/json/deleteFeedHeart",
					method : "POST",
					data : JSON.stringify ({
						feedNo : $(this).parents(".feedForm").children("input[name='feedNo']").val()
					}),
					contentType: 'application/json',
					dataType : "json",
					header : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}, // header end
					
					success : function(data, status) {
						
						swal.fire("피드 시러요 성공 : " + data);
						
						$(html).parents(".row").children(".like:contains('좋아요')").show();
						$(html).parents(".row").children(".dislike:contains('시러요')").hide();
						$(html).parents(".row").children(".likeCount").text(data);
						
					} // success close
					
				} // ajax inner close
				
		) // ajax close
	})
	<!-- DELETE_FEED_HEART -->
	
})
	




</script>

<style>
#calendar {
	margin-left: 0px;
	margin-top: 50px;
	width: 800px;
	display: inline-block;
	justify-content: center;
}

.container {
	float: left;
	margin-left: 300px;
}

/* Profile container */
.profile {
	margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
	padding: 20px 0 10px 0;
	width:600px;
	
}

.profile-userpic img {
	float: left;
	margin-left: 50px;
	width: 50%;
	height: 40%;
	-webkit-border-radius: 50% !important;
	-moz-border-radius: 50% !important;
	border-radius: 50% !important;
}

.profile-usertitle {
	text-align: center;
	margin-top: 20px;
	margin-right: 200px;
}

.profile-usertitle-name {
	color: #5b9bd1;
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 7px;
}

.profile-usertitle-job {
	text-transform: uppercase;
	color: #5b9bd1;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 15px;
}

.profile-userbuttons {
	float: left;
	text-align: center;
	margin-top: 10px;
	margin-left: 10px;
}

.profile-userbuttons .btn {
	text-transform: uppercase;
	font-size: 11px;
	font-weight: 600;
	padding: 6px 15px;
	margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
	margin-right: 0px;
}

.profile-usermenu {
	margin-top: 30px;
}

.profile-usermenu ul li {
	border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
	border-bottom: none;
}

.profile-usermenu ul li a {
	color: #5b9bd1;
	font-size: 14px;
	font-weight: 400;
}

.profile-usermenu ul li a i {
	margin-right: 8px;
	font-size: 14px;
}

.profile-usermenu ul li a:hover {
	background-color: #fafcfd;
	color: #5b9bd1;
}

.profile-usermenu ul li.active {
	border-bottom: none;
}

.profile-usermenu ul li.active a {
	color: #5b9bd1;
	margin-left: -2px;
}

/* Profile Content */
.profile-content {
	padding: 20px;
	min-height: 460px;
}

.follow-section {
	margin-left: 200px;
	margin-top: 50px;
	width: 500px;
	display: inline-block;
	justify-content: center;
	float: left;
}

.single-comment {
	padding-left: 0;
}

.f {
	margin-left: 300px;
}

.comment-section {
	margin-left: 150px;
	margin-top: 50px;
	width: 700px;
	
	
    
}
.club{
margin-left: 100px;
}
.L {
	margin-left: 400px;
	width:500px;
}

/* 탭 전체 스타일 */
.tabs {
  margin-top: 50px;
  padding-bottom: 40px;
  background-color: #ffffff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  width: 800px;
  display:inline-block;
  margin-left:100px;
  }

/* 탭 스타일 */
.tab_item1 {
  width: calc(100%/3);
  height: 50px;
  border-bottom: 3px solid #333333;
  background-color: #f8f8f8;
  line-height: 50px;
  font-size: 16px;
  text-align: center;
  color: #333333;
  display: block;
  float: left;
  width:400px;
  text-align: center;
  font-weight: bold;
  transition: all 0.2s ease;
}
.tab_item2 {
  width: calc(100%/3);
  height: 50px;
  border-bottom: 3px solid #333333;
  background-color: #f8f8f8;
  line-height: 50px;
  font-size: 16px;
  text-align: center;
  color: #333333;
  display: inline-block;
  width:400px;
  text-align: center;
  font-weight: bold;
  transition: all 0.2s ease;
}

.tab_item1:hover {
  opacity: 0.75;
}
.tab_item2:hover {
  opacity: 0.75;
}

/* 라디오 버튼 UI삭제*/
input[name="tab_item"] {
  display: none;
}

/* 탭 컨텐츠 스타일 */
.tab_content {
  display: none;
  padding: 40px 40px 0;
  clear: both;
  overflow: hidden;
}


/* 선택 된 탭 콘텐츠를 표시 */
#all:checked ~ #all_content,
#programming:checked ~ #programming_content,
#design:checked ~ #design_content {
  display: block;
}

/* 선택된 탭 스타일 */
.tabs input:checked + .tab_item {
  background-color: #333333;
  color: #fff;
}
</style>
</head>


<body class="blog masonry-style">

	<jsp:include page="/toolbar.jsp" />

	<main role="main">
		
			<div id="intro-wrap" data-height="27.778">
				<div id="intro" class="preload darken">
					<div class="intro-item"
						style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>MyBlog</h2>
							<p>Write down your daily life</p>
						</div>
						<!-- caption -->
					</div>
					<!-- intro -->
				</div>
				<!-- intro -->
			</div>
			<!-- intro-wrap -->

			<div id="main" class="row">
				<div id="calendar">

					<jsp:include page="/myHome/calendar.jsp" />
				</div>

				<div class="container">
					<div class="row profile">
						<div class="col-md-3">
							<div class="profile-sidebar">
								<!-- SIDEBAR USERPIC -->
								<div class="profile-userpic">
									<img
										src="/resources/image/uploadFiles/${user.profileImage}"
										class="img-responsive" width="100" height="100">
								</div>
								
								<!-- END SIDEBAR USERPIC -->
								<!-- SIDEBAR USER TITLE -->
								<div class="profile-usertitle">
								<input type="hidden" name="userId" id="userId" value="${user.userId }">
									<br/>
									<div class="profile-usertitle-name">${user.nickName }</div>
									<div class="profile-usertitle-job">${user.profileWriting }
									</div>
								</div>
								<!-- END SIDEBAR USER TITLE -->
								<!-- SIDEBAR BUTTONS -->
								<div class="profile-userbuttons">
									<c:if test="${ empty user }">
										<button type="button" class="btn btn-success btn-sm">Follow</button>
										<button type="button" class="btn btn-danger btn-sm">Message</button>
									</c:if>

									<br> <br>

								</div>
								<!-- END SIDEBAR BUTTONS -->
								<!-- SIDEBAR MENU -->
								<div class="profile-usermenu">
									<ul class="nav">
										<li class="active"><a href="/club/getApprovalConditionList?userId=${user.userId}"> <i
												class="glyphicon glyphicon-home"></i> 내 모임
										</a></li>
										<li>
										<a href="/user/updateProfile?userId=${user.userId }"> <i
												class="glyphicon glyphicon-user"></i> 프로필 수정
										</a></li>
										<li><a href="#" target="_blank"> <i
												class="glyphicon glyphicon-ok"></i> Tasks
										</a></li>
										<li><a href="#"> <i class="glyphicon glyphicon-flag"></i>
												Help
										</a></li>
									</ul>
								</div>
								<!-- END MENU -->
							</div>
						</div>
						<div class="col-md-9"></div>
					</div>
				</div>

			<div class="section-Box">
			<div class="L">My FollowList</div>
						<c:set var = "i" value = "0" />
		<c:forEach var = "list" items = "${list}">
			<c:set var = "i" value = "${i + 1}" />
			<div class="follow-section" style="margin-left:300px;">
			<div style="display: inline-block;"><img src="/resources/image/uploadFiles/${list.receiveId.profileImage}" width="100" height="100" /></div><div style="float: right; margin-right:300px;"><h4 class="yourHome">${list.receiveId.nickName}</h4></div>
					<input type="hidden" name="receiveId" id="receiveId" value="${list.receiveId.userId }">
				</div>
			</c:forEach>
			
				</div>
			
<div class="tabs">
    <input id="all" type="radio" name="tab_item" checked>
    <label class="tab_item1" for="all">내가 쓴 피드</label>
    <input id="programming" type="radio" name="tab_item">
    <label class="tab_item2" for="programming">내 모임 게시물</label>
    
 
    <div class="tab_content" id="all_content">
        		<div class="comment-section">
					<div class="f">My Feed</div>
					<br />
					<c:set var="i" value="0"></c:set>
					<c:forEach var="feed" items="${feedList}">
						<c:set var="i" value="${i + 1}"></c:set>

						<c:if test="${fn:trim(feed.deleteCondition) eq '0'}">

							<div class="single-comment">
								<form class="feedForm">
									<div class="comment-author">

										<img
										src="/resources/image/uploadFiles/${user.profileImage}"
										class="img-responsive" width="100" height="100"> <cite>${user.nickName }</cite>
										<span class="says">says:</span>
									</div>
									<!-- comment-author -->
									<div class="comment-meta">
										<time datetime="2013-03-23 19:58">March 23, 2013 at
											7:58 pm</time>
										/ <a href="#" class="reply">Reply</a>
									</div>
									<!-- comment-meta -->
									<p>${feed.content}</p>
									<c:if test="${!empty feed.hashtag}">
										<br />${feed.hashtag}</c:if>
									<c:if test="${feed.checkHeart != 0}">
										★★★내가 좋아요 한 피드입니다.★★★ 나중에 하트로 변경
										</c:if>
									<c:if test="${sessionScope.user.userId eq feed.user.userId}">
										<input type="button" class="btn_update" value="수정">
										<input type="button" class="btn_delete" value="삭제">
									</c:if>
									<input type="button" class="btn_getFeed" value="보기"> <input
										type="hidden" name="feedNo" value="${feed.feedNo}">

									<section class="row section">
										<div class="row">
											<c:if test="${feed.checkHeart == 0}">
												<div class="column two like" style="display: show;">
													좋아요</div>
												<div class="column two dislike" style="display: none;">
													시러요</div>
											</c:if>
											<c:if test="${feed.checkHeart != 0}">
												<div class="column two like" style="display: none;">
													좋아요</div>
												<div class="column two dislike" style="display: show;">
													시러요</div>
											</c:if>
											<div class="column two likeCount">${feed.heartCount}</div>

											<div class="column two comment">댓글수</div>

											<div class="column two commentCount">
												${feed.commentCount}</div>
											<div class="column four last">신고</div>
										</div>
									</section>
								</form>
							</div>

						</c:if>
					</c:forEach>

				</div>
    </div>
    <div class="tab_content" id="programming_content">
        ${clubPostList}
</div>

  </div>


			</div>
	</main>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="js/plugins.js"></script>
	<script src="js/beetle.js"></script>

</body>

</html>