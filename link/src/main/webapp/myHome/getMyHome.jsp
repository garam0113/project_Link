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
<link href="/resources/css/feed/getFeedList.css" rel="stylesheet">
	
	
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	
<script type="text/javascript">
	//썸네일 클릭시 상세상품조회 페이지 or 상품수정 페이지로 이동
	function getClubPostGo(clubPostNo){
		alert(clubPostNo);
		location.href = "/clubPost/getClubPost?clubPostNo="+clubPostNo;
	}
	
	// 닉네임, 프로필사진 클릭시 해당 유저의 마이홈피로 이동
	function getMyHomeGo(userId){
		location.href = "/myHome/getYourHome?userId="+userId;
	}
</script>
<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className) 
	$(".yourHome").on("click" , function() {
		
		self.location = "/myHome/getYourHome?userId="+$(this).parent().parent().attr("id");
	});
   
	
 });
 

$(function(){
	
	<!-- REST CONTROLLTER TEST -->

	<!-- REST CONTROLLTER TEST -->
	
	<!-- ADD_FEED -->
	$(".addFeed").bind("click", function(){
		alert("피드 추가버튼");
		$(this.form).attr("method", "POST").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
	});
	<!-- ADD_FEED -->
	$(document).on("click", ".btn_update", function(event){
		event.stopPropagation();
		console.log("피드 수정 버튼");
		console.log($(this).parents(".feedForm").html())
		
		$(this).parents(".feedForm").attr("method", "GET").attr("action", "/feed/updateFeed").submit();
	});
	
	$(document).on("click", ".feedForm", function(event) {
		event.stopPropagation();
		var feedNumber = $(this).children("input[name='feedNo']").val();
		location.href="/feed/getFeed?feedNo=" + feedNumber;
	})
	
	
	<!-- UPDATE_FEED -->
	$(document).on("click", ".btn_delete", function(event){
		event.stopPropagation();
		console.log("피드 삭제 버튼");
		console.log( $(this).parents(".feedForm").html());
		
		Swal.fire({
			  title: '글을 삭제하시겠습니까?',
			  text: "삭제하시면 다시 복구시킬 수 없습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
		}).then((result) => {
			if (result.value) {
	       		//"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
				// $(".feedForm").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
				$(this).parents(".feedForm").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
			}
		})
	});
	
	<!-- GET_FEED -->
	$(".btn_getFeed").bind("click", function(){
		alert("클릭한 글 번호 : " + $(this).parent().find("input[name='feedNo']").val());
		location.href="/feed/getFeed?feedNo=" + $(this).parents(".feedForm").find("input[name='feedNo']").val();
	})
	<!-- GET_FEED -->
	
	<!-- ADD_FEED_HEART -->
	$(document).on("click", ".feedLike", function(event){
		event.stopPropagation();
		alert($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 좋아요");
		
		var html = $(this);
		var sessionUser = $(this).parents(".feedForm").children("input[name='userId']").val();
		
		$.ajax(
				{
					url : "/feedRest/json/addFeedHeart",
					method : "POST",
					data : JSON.stringify ({
						source : 0,
						sourceNo : $(this).parents(".feedForm").children("input[name='feedNo']").val(),
						userId : sessionUser
					}),
					contentType: 'application/json',
					dataType : "json",
					header : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}, // header end
					
					success : function(data, status) {
						
						alert("피드 좋아요 성공 : " + data);

						$(html).parents(".row").children(".likeCount").text(data);
						$(html).parent().html('<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" />');
						
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
.following-section {
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
	margin-left: 50px;
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
.tab{

}

/* 탭 전체 스타일 */
.tabs1 {
  margin-top: 50px;
  margin-bottom: 100px;
  background-color: #ffffff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  width: 400px;
  display:inline-block;
  margin-left:300px;
  float: left;
  height:800px;
  }
  .tabs2 {
  margin-top: 50px;
  margin-bottom: 100px;
  background-color: #ffffff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  width: 800px;
  display:inline-block;
  margin-left:200px;
  height:800px;
  
  
  
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
.tab_item-following {
  width: calc(100%/3);
  height: 50px;
  border-bottom: 3px solid #333333;
  background-color: #f8f8f8;
  line-height: 50px;
  font-size: 16px;
  text-align: center;
  color: #333333;
  display: inline-block;
  width:200px;
  text-align: center;
  font-weight: bold;
  transition: all 0.2s ease;
}
.tab_item-follow {
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
  width:200px;
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
}
.tab_item-follow:hover {
  opacity: 0.75;
}
}
.tab_item-following:hover {
  opacity: 0.75;
}

/* 라디오 버튼 UI삭제*/
input[name="tab_item"] {
  display: none;
}
input[name="tab_item-follow"] {
  display: none;
}

/* 탭 컨텐츠 스타일 */
.tab_content {
  display: none;
  padding: 0px 40px 0;
  clear: both;
  overflow: hidden;
}
.tab_content-follow {
  display: none;
  padding: 0px 40px 0;
  clear: both;
  overflow: hidden;

  
}


/* 선택 된 탭 콘텐츠를 표시 */
#all:checked ~ #all_content,
#programming:checked ~ #programming_content,
#design:checked ~ #design_content {
  display: block;
}
#all-follow:checked ~ #all-follow_content,
#programming-follow:checked ~ #programming-follow_content,
#design:checked ~ #design_content {
  display: block;
}

/* 선택된 탭 스타일 */
.tabs input:checked + .tab_item1 {
  background-color: #333333;
  color: #fff;
}
.tabs input:checked + .tab_item2 {
  background-color: #333333;
  color: #fff;
}
::-webkit-scrollbar {
  display: none;
}
</style>
</head>


<body class="blog masonry-style">

	<jsp:include page="/toolbar.jsp" />

	<main role="main">
		
			<div id="intro-wrap" data-height="27.778">
				<div id="intro" class="preload">
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
<div class="tab">
			<div class="tabs1">
			<input id="all-follow" type="radio" name="tab_item-follow" checked>
    <label class="tab_item-follow" for="all-follow">FollowList</label>
    <input id="programming-follow" type="radio" name="tab_item-follow">
    <label class="tab_item-following" for="programming-follow">FollowerList</label>
    
    <div class="tab_content-follow" id="all-follow_content" style="white-space:nowrap; overflow-x:hidden; overflow-y:auto; width:420px; height:700px;">
        		
        		<br />
		<c:set var = "i" value = "0" />
		<c:forEach var = "list" items = "${list}">
			<c:set var = "i" value = "${i + 1}" />
			<div class="follow-section" style="margin-left:50px;" id="${list.receiveId.userId }">
			<div style="display: inline-block;"><img src="/resources/image/uploadFiles/${list.receiveId.profileImage}" width="100" height="100" /></div><div style="float: right; margin-right:300px;"><h4 class="yourHome">${list.receiveId.nickName}</h4>
			</div>
					
				</div>
			</c:forEach>
			
				
				</div>
				<div class="tab_content-follow" id="programming-follow_content" style="white-space:nowrap; overflow-x:hidden; overflow-y:auto; width:420px; height:700px;">
     <div class="col-md-4" id="fl">
					 		<br />
		
			
								
</div>
</div>
  </div>
			
		
<div class="tabs2">
    <input id="all" type="radio" name="tab_item" checked>
    <label class="tab_item1" for="all">내가 쓴 피드</label>
    <input id="programming" type="radio" name="tab_item">
    <label class="tab_item2" for="programming">내 모임 게시물</label>
    
 
    <div class="tab_content" id="all_content" style="white-space:nowrap; overflow-x:hidden; overflow-y:auto; width:820px; height:700px; margin-left:-30px;">
        		<div class="comment-section" style="margin-left:-50px; width:720px; " >
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
									
										<h5 class="meta-post" style="display: inline-block; vertical-align: text-bottom;">
											<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
											<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
										</h5>
									
									<!-- comment-meta -->
									<p>${feed.content}</p>
									<c:if test="${!empty feed.hashtag}">
										<br />${feed.hashtag}</c:if>
									<c:if test="${feed.checkHeart != 0}">
									<div class="col-xs-2">
														<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" aria-hidden="true"/>
													</div>
										</c:if>
											<c:if test="${feed.checkHeart ne 0}">
													<div class="col-xs-2">
														<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" aria-hidden="true"/>
													</div>
												</c:if>
									<c:if test="${sessionScope.user.userId eq feed.user.userId}">
										<span class="glyphicon glyphicon-paperclip btn_update" aria-hidden="true"></span>
										<span class="glyphicon glyphicon-trash btn_delete" aria-hidden="true"></span>
									</c:if>
								 
									<input type="hidden" name="feedNo" value="${feed.feedNo}">

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
    <div class="tab_content" id="programming_content" style="white-space:nowrap; overflow-x:hidden; overflow-y:auto; width:820px; height:700px; margin-left : 10px;">
    
    <br/>
     <div class="col-md-4" id="cp">
											
</div>

  </div>
			</div>
		</div>
	</main>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    
	 
	<script type="text/javascript">
$(function() {
	$(".tab_item2").on("click" , function(e) {
		var userId = $("#userId").val(); 
		$(".tab_item2").off(e);
	$.ajax({
		url : "/myHomeRest/json/getClubPostListMyHome", // 어디로 갈거니? // 갈 때 데이터
		type : "POST", // 타입은 뭘 쓸거니?
		datatype : "json",
		 data		:  JSON.stringify({
			userId : userId
		 }),
		 
		contentType : "application/json",
		success : function(data) { 
       console.log(data.ClubPostList[1]);
       $.each(data.ClubPostList, function(index, item) { // 데이터 =item
    	   console.log(item.clubPostNo);
			var value = 
				"<a href='javascript:getClubPostGo("+item.clubPostNo+")'>"+
			"<img src='/resources/image/uploadFiles/"+item.image1+"' height='400' width='700'>"+
			
		"</a>"+
		
		"<div style='display: flex; width: 87%;'>"+
			"<div style='flex:1;'>"+
			"<a href='javascript:getMyHomeGo(\"item.user.userId\")'>"+
					"<img src='/resources/image/uploadFiles/"+ item.user.profileImage+ "' height='100' width='100'>"+
				"</a>"+
			"</div>"+
			"<div style='flex:1;'>"+
				/* "<a href='/myHome/getYourHome?userId="+item.user.userId+">"+ */
				"<a href='javascript:getMyHomeGo(\"item.user.userId\")'>"+
					"<p align='center' style='font-size: 30px; color: red;'>"+ item.user.nickName+ "</p>"+
				"</a>"+
			"</div>"+
			"<div style='flex:1;'>"+
				"<p align='center' style='font-size: 30px'>"+ item.clubPostHeartCount+ "</p>"+
			"</div>"+
		
			
		"</div>"+
		"<div style='width: 87%;'>"+
			"<p align='center' style='font-size: 30px'>"+item.clubPostTitle+"</p>"+
		"</div>";

			$("#cp").append(value);       
                      
			
		})
		
		}	
	});
});
	
	$(".tab_item-following").on("click" , function(e) {
		var userId = $("#userId").val();
		console.log(userId);
		$(".tab_item-following").off(e);
	$.ajax({
		url : "/myHomeRest/json/getFollowerList", // 어디로 갈거니? // 갈 때 데이터
		type : "POST", // 타입은 뭘 쓸거니?
		datatype : "json",
		 data		:  JSON.stringify({
			searchKeyword : userId
			
		 }),
		 
		contentType : "application/json",
		success : function(data) { 
       console.log(data.followerList[1]);
       $.each(data.followerList, function(index, item) { // 데이터 =item
    	   console.log(item);
			var value = 
				"<div class='following-section' style='margin-left:50px;' id='"+item.userId+"'>"+
			"<div style='display: inline-block;'>"+"<img src='/resources/image/uploadFiles/"+item.profileImage+"' width='100' height='100' />"+"</div><div style='float: right; margin-right:300px;'>"+
			"<h4 class='yourHome2'>"+item.nickName+"</h4></div>"+
		"</div>";
			
			
			 $("#fl").append(value);     
			
			 $(".yourHome2").on("click" , function() {
					
					self.location = "/myHome/getYourHome?userId="+$(this).parent().parent().attr("id");
				});
				
			
		})
		
		}	
	});
});
	
	 
});	

</script>
	

</body>

</html>