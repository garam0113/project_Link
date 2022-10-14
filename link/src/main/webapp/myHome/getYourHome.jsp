<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script type="text/javascript">

$(function(){


    $("#follow").on("click" , function() {
    	
          alert("팔로우");
    	var recvId = $("#recvId").val();
    	console.log("recvId="+recvId);
    	
          $(document).ready(function(){
        	  if(${user.fbState=='2'} || ${user.fbState==null}){
       		$.ajax({
       			type: 'POST',   //get방식으로 명시
       			url : '/myHomeRest/json/addFollow',  //이동할 jsp 파일 주소
       			data: JSON.stringify({
       			    userId : recvId
       			}),
       			dataType:'json',   //문자형식으로 받기
       			contentType : "application/json",
       			header : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, // header end
       			success: function(data, status){   //데이터 주고받기 성공했을 경우 실행할 결과
       	            //function(data)를 쓰게 되면 전달받은 데이터가 data안에 담아서 들어오게 된다. 
       				
       			   
       			},
       			error:function(data){   //데이터 주고받기가 실패했을 경우 실행할 결과
       			
       			 console.log("userId : "+data);
    
       			}
       		})}
        	  else{
       		$.ajax({
     			type: 'POST',   //get방식으로 명시
     			url : '/myHomeRest/json/deleteFollow',  //이동할 jsp 파일 주소
     			data: JSON.stringify({
     			    userId : recvId
     			}),
     			dataType:'json',   //문자형식으로 받기
     			contentType : "application/json",
     			header : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, // header end
     			success: function(data, status){   //데이터 주고받기 성공했을 경우 실행할 결과
     	            //function(data)를 쓰게 되면 전달받은 데이터가 data안에 담아서 들어오게 된다. 
     				
     			   
     			},
     			error:function(data){   //데이터 주고받기가 실패했을 경우 실행할 결과
     			
     			 console.log("userId : "+data);
  
     			}
     		})}
       	});
             
    });
   
});			

</script>

<style>
#calendar {
	margin-left: 100px;
	margin-top: 50px;
	width: 700px;
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
	margin-left: 100px;
	
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
    float:right;
	width:600px;
	height:400px;
	display: inline-block;
	margin-top: 20px;
	margin-right: 150px;
    
}
.club{
margin-left: 100px;
}

.L {
    margin-top: 20px;
	margin-left: 400px;
	width:600px;
	height:400px;
	display: inline-block;
}
.section-Box{
    
}

</style>
</head>
	

	<body class="blog masonry-style">

		<jsp:include page="/toolbar.jsp" />

		<main role="main">
			<div id="intro-wrap" data-height="27.778">
				<div id="intro" class="preload darken">
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>MyBlog</h2>
							<p>Write down your daily life</p>
						</div><!-- caption -->								
					</div><!-- intro -->
				</div><!-- intro -->				
			</div><!-- intro-wrap -->

			<div id="main" class="row">
			<div id="calendar" >
			
			<jsp:include page="/myHome/calendar.jsp" />
			</div>
			
<div class="container" >
    <div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR USERPIC -->
				<div class="profile-userpic">
						<img
										src="/resources/image/uploadFiles/${getUser.profileImage}"
										class="img-responsive" width="100" height="100">
				</div>
				
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<input type="hidden" name="userId" id="userId" value="${getUser.userId }">
									<br/>
									<div class="profile-usertitle-name">${getUser.nickName }</div>
									<div class="profile-usertitle-job">${getUser.profileWriting }
									</div>
								</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
				<c:if test="${ fn:trim(sessionScope.user.fbState) =='1'}">
					<button type="button" class="btn btn-success btn-sm" id="follow">Following</button>
			    </c:if>
				<c:if test="${(fn:trim(sessionScope.user.fbState) =='2')and empty fn:trim(sessionScope.user.fbState)} ">
					<button type="button" class="btn btn-success btn-sm" id="follow">Follow</button>
			 </c:if>
					<button type="button" class="btn btn-danger btn-sm">Message</button>
					<br>
					<br>
					
				</div>
				<div>
				<input type="hidden" name="sendId" id="sendId" value="${sessionScope.user.userId}">
			    <input type="hidden" name="recvId" id="recvId" value="${getUser.userId}">
			    </div>
				<!-- END SIDEBAR BUTTONS -->
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav">
						<li class="active">
							<a href="/club/getApprovalConditionList?userId=${getUser.userId}">
							<i class="glyphicon glyphicon-home"></i>
							모임 보기 </a>
						</li>
						
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
		<div class="col-md-9">
          
		</div>
	</div>
</div>
	<div class="section-Box">
			<div class="L" >My FollowList</div>
						<c:set var = "i" value = "0" />
		<c:forEach var = "list" items = "${list}">
			<c:set var = "i" value = "${i + 1}" />
			<div class="follow-section" style="margin-left:300px;">
			<div style="display: inline-block;"><img src="/resources/image/uploadFiles/${list.receiveId.profileImage}" width="100" height="100" /></div><div style="float: right; margin-right:300px;"><h4 id="yourHome">${list.receiveId.nickName}</h4></div>
					<input type="hidden" name="receiveId" id="receiveId" value="${list.receiveId.userId }">
				</div>
			</c:forEach>
				
				
				<!-- single-comment -->

			
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
										src="/resources/image/uploadFiles/${getUser.profileImage}"
										class="img-responsive" width="100" height="100"> <cite>${getUser.nickName }</cite>
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
				<!-- single-comment -->




			</div>
	</main>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="js/plugins.js"></script>
	<script src="js/beetle.js"></script>

</body>

</html>
			