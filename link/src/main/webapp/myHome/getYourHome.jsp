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
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<link href="/resources/css/feed/getFeedList.css" rel="stylesheet">
	 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Sacramento&display=swap" rel="stylesheet">
	
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript">
	$(function() {

		$("#follow").on("click", function() {
			var userId = $("#userId").val();
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
							}
						})
					} 
				}
				
			})
		})

		 $("#following").on("click", function() {
			var userId = $("#userId").val();
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
							}else if(update.follow.fbState == 2){
							$("#following").text("팔로우");
							}
						}
					})
				}
			})
		}) 

		 $("#updateFollow").on("click", function() {
			var userId = $("#userId").val();
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
							}else if(update.follow.fbState == 2){
							$("#updateFollow").text("팔로우");
							}
						}
					})
				}
			})
		})


		$("#block").on("click", function() {
			var userId = $("#userId").val();
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

		$("#stopBlock").on("click", function() {
			var userId = $("#userId").val();
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

		$("#updateBlock").on("click", function() {
			var userId = $("#userId").val();
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

	});
	
	function getClubPostGo(clubPostNo){
		location.href = "/clubPost/getClubPost?clubPostNo="+clubPostNo;
	}
	
	// 닉네임, 프로필사진 클릭시 해당 유저의 마이홈피로 이동
	function getMyHomeGo(userId){
		location.href = "/myHome/getYourHome?userId="+userId;
	}


$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className) 
	$(".yourHome").on("click" , function() {
		var userId = $("#sendId").val(); 
		if($(this).parent().parent().attr("id")==userId){
			self.location = "/myHome/getMyHome?userId="+$(this).parent().parent().attr("id");
			
		}else{
			self.location = "/myHome/getYourHome?userId="+$(this).parent().parent().attr("id");
		}
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
a {
    color: #222;
    text-decoration: auto !important;
    width: 140px;
    color : black !important;
}
#main{
background-color : black !important;
}

i{
color : blueviolet !important;

}
.active{

}

h5.meta-post {
    margin-bottom: 13px !important;
    color: white !important;
}
.main{
display:block;
position:relative;

}

#calendar {
	margin-left: 940px;
	margin-top: 50px;
	display: flex;
	justify-content: center;
	float: left;
	width : 660px;
	height : 680px;
	
}

.container {
	float: left;
	margin-left: 430px;
	display: flex;
	position:absolute;
	margin-top: 10px;
	
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
	width: 250px;
	height: 300px;
	-webkit-border-radius: 20% !important;
	-moz-border-radius: 20% !important;
	border-radius: 20% !important;
}

.profile-usertitle {
	text-align: center;
	margin-top: 20px;
	margin-right: 200px;
}

.profile-usertitle-name {
	color: white;
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 7px;
}

.profile-usertitle-job {
	text-transform: uppercase;
	color: white;
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
	background-color: blueviolet;
	
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
.follow-section img {
 vertical-align: sub;
    display: inline-block;
    width: 80px;
    height: 80px;
    margin-top: 10px;
    margin-left: 10px;
    border-radius: 15px;
	
}

.follow-section {
	margin-right: 100px;
	margin-top: 50px;
	width: 500px;
	display: inline-block;
	justify-content: center;
	float: left;
}
.following-section img {
  vertical-align: sub;
    display: inline-block;
    width: 80px;
    height: 80px;
    margin-top: 10px;
    margin-left: 10px;
    border-radius: 15px;
	
}
.following-section {
	margin-right: 100px;
	margin-top: 50px;
	width: 500px;
	display: inline-block;
	justify-content: center;
	float: left;
}

.single-comment {
	padding-left: 0;
	border-radius:20px;
	margin-left : 70px;
    box-shadow: rgba(252, 0, 255, 0.3) 4px 27px 38px, rgba(252, 0, 255, 0.22) 4px 27px 38px;
    width : 600px;
	
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
display:flex;
margin-left:150px;



}

/* 탭 전체 스타일 */
.tabs1 {
  margin-top: 180px;
  margin-bottom: 100px;
  background-color: black;
  box-shadow: rgba(252, 0, 255, 0.3) 4px 27px 38px, rgba(252, 0, 255, 0.22) 4px 27px 38px;
  width: 300px;
  display:inline-block;
  margin-left:300px;
  float: left;
  height:800px;
  border-radius: 15px;
  }
  .tabs2 {
  margin-top: 180px;
  margin-bottom: 100px;
  background-color: black;
  box-shadow: rgba(252, 0, 255, 0.3) 4px 27px 38px, rgba(252, 0, 255, 0.22) 4px 27px 38px;
  width: 660px;
  display:inline-block;
  margin-left:200px;
  height:800px;
   border-radius: 15px;
  
  
  
  
  }

/* 탭 스타일 */
.tab_item1 {
  width: calc(100%/3);
  height: 50px;
  border-bottom: 3px solid black;
  background-color: black;
  line-height: 50px;
  font-size: 16px;
  text-align: center;
  color: #333333;
  display: block;
  float: left;
  width:330px;
  text-align: center;
  font-weight: bold;
  transition: all 0.2s ease;
  border-radius: 15px;
}
.tab_item-following {
  width: calc(100%/3);
  height: 50px;
  border-bottom: 3px solid black;
  background-color: black;
  line-height: 50px;
  font-size: 16px;
  text-align: center;
  color: #333333;
  display: inline-block;
  width:150px;
  text-align: center;
  font-weight: bold;
  transition: all 0.2s ease;
 border-radius: 15px;
}
.tab_item-follow {
  width: calc(100%/3);
  height: 50px;
  border-bottom: 3px solid black;
  background-color: black;
  line-height: 50px;
  font-size: 16px;
  text-align: center;
  color: #333333;
  display: block;
  float: left;
  width:150px;
  text-align: center;
  font-weight: bold;
  transition: all 0.2s ease;
  border-radius: 15px;
}

.tab_item2 {
  width: calc(100%/3);
  height: 50px;
  border-bottom: 3px solid black;
  background-color: black;
  line-height: 50px;
  font-size: 16px;
  text-align: center;
  color: #333333;
  display: inline-block;
  width:310px;
  text-align: center;
  font-weight: bold;
  transition: all 0.2s ease;
  border-radius: 15px;
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
.feedForm {
  margin-left:-70px;
}

.feedForm > img {
    vertical-align: sub;
    display: inline-block;
    width: 80px;
    height: 80px;
    margin-top: 10px;
    margin-left: 10px;
    border-radius: 15px;
}
.neon {
  animation: neon 1s ease infinite;
  -moz-animation: neon 1s ease infinite;
  -webkit-animation: neon 1s ease infinite;
  font-family: 'Sacramento';
}
.neon2 {
  animation: neon 1s ease infinite;
  -moz-animation: neon 1s ease infinite;
  -webkit-animation: neon 1s ease infinite;
  font-family: 'Sacramento';
}


@keyframes neon {
  0%,
  18%,
  22%,
  25%,
  53%,
  57%,
  100% {
    text-shadow: 0 0 4px #da00ff, 0 0 11px #da00ff, 0 0 19px #da00ff, 0 0 40px #da00ff,
      0 0 80px #da00ff, 0 0 90px #da00ff, 0 0 100px #da00ff, 0 0 150px #da00ff;
  }
  20%,
  24%,
  55% {
    text-shadow: none;
  }
}
@keyframes neon2 {
  0%,
  18%,
  22%,
  25%,
  53%,
  57%,
  100% {
    text-shadow: 0 0 4px #da00ff, 0 0 11px #da00ff, 0 0 19px #da00ff, 0 0 40px #da00ff,
      0 0 80px #da00ff, 0 0 90px #da00ff, 0 0 100px #da00ff, 0 0 150px #da00ff;
  }
    20%,
  24%,
  55% {
    text-shadow: none;
  }
}


</style>
</head>

<body class="blog masonry-style">

	<jsp:include page="/toolbar.jsp" />

	<main role="main">
		
			<div id="intro-wrap" data-height="12" style="background-color : black;">
				<div id="intro" class="preload">
					<div class="intro-item"
						style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2 class="neon">MyBlog</h2>
							
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

					<jsp:include page="/myHome/youCalendar.jsp" />
				</div>

				<div class="container">
					<div class="row profile">
						
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
								<input type="hidden" name="yuserId" id="yuserId" value="${getUser.userId }">
									<br/>
									<div class="profile-usertitle-name">${getUser.nickName }</div>
									<div class="profile-usertitle-job">${getUser.profileWriting }
									</div>
								</div>
								<!-- END SIDEBAR USER TITLE -->
								<!-- SIDEBAR BUTTONS -->
								<div class="profile-userbuttons">
							
								  <c:if test="${followUser.receiveId.userId == getUser.userId and fn:trim(followUser.receiveId.fbType) == '1'}">
									<c:if test="${fn:trim(followUser.receiveId.fbState) == '1'}">
										<button type="button" class="btn btn-danger btn-sm"
											id="following">팔로잉</button>
									</c:if>
									<c:if test="${fn:trim(followUser.receiveId.fbState) == '2'}">
										<button type="button" class="btn btn-danger btn-sm"
											id="updateFollow">팔로우</button>
									</c:if>
								</c:if> 
								<c:if test="${ empty followUser }">
									<button type="button" class="btn btn-danger btn-sm" id="follow">팔로우</button>
								</c:if>


								<c:if
									test="${block.receiveId.userId == getUser.userId and fn:trim(block.receiveId.fbType) == '2'}">
									<c:if test="${fn:trim(block.receiveId.fbState) == '1'}">
										<button type="button" class="btn btn-danger btn-sm"
											id="stopBlock">차단해제</button>
									</c:if>
									<c:if test="${fn:trim(block.receiveId.fbState) == '2'}">
										<button type="button" class="btn btn-danger btn-sm"
											id="updateBlock">차단</button>
									</c:if>
								</c:if>
								<c:if test="${ empty block }">
									<button type="button" class="btn btn-danger btn-sm" id="block">차단</button>
								</c:if>
								<br> <br>

							</div>
							<div>
								<input type="hidden" name="sendId" id="sendId"
									value="${sessionScope.user.userId}"> <input
									type="hidden" name="recvId" id="recvId"
									value="${getUser.userId}">
							</div> 
								<!-- END SIDEBAR BUTTONS -->
								<!-- SIDEBAR MENU -->
								<div class="profile-usermenu">
									<ul class="nav">
										<li class="active"><a href="/club/getApprovalConditionList?userId=${getUser.userId}&order=1"> <i
													class="glyphicon glyphicon-home"></i> 내 모임
										</a></li>
										<li class="active">
										<a href="/user/updateProfile?userId=${getUser.userId}"> <i
												class="glyphicon glyphicon-user"></i> 프로필 수정
										</a></li>
										<li class="active"><a href="/myHome/getPayList"> 
												<i class="glyphicon glyphicon-ok pay"></i> 결제 내역
										</a></li>
										<li class="active"><a href="#"> <i class="glyphicon glyphicon-flag"></i>
												차단리스트
										</a></li>
									</ul>
								</div>
								<!-- END MENU -->
							</div>
						
						<div class="col-md-9"></div>
					</div>
				</div>
<div class="tab">
			<div class="tabs1">
			<input id="all-follow" type="radio" name="tab_item-follow" checked>
    <label class="tab_item-follow" for="all-follow"><h4 class="neon2" style="color:white"> 팔로우</h4></label>
    <input id="programming-follow" type="radio" name="tab_item-follow">
    <label class="tab_item-following" for="programming-follow"><h4 class="neon2" style="color:white">팔로워</h4></label>
    
    <div class="tab_content-follow" id="all-follow_content" style="white-space:nowrap; overflow-x:hidden; overflow-y:auto; width:420px; height:700px;">
        		
        		<br />
		<c:set var = "i" value = "0" />
		<c:forEach var = "list" items = "${list}">
			<c:set var = "i" value = "${i + 1}" />
			<div class="follow-section" style="margin-left:50px;" id="${list.receiveId.userId }">
			<div style="display: inline-block; margin-left :-50px;"><img src="/resources/image/uploadFiles/${list.receiveId.profileImage}" width="100" height="100" /></div><div style="float: right; margin-right:380px;"><h4 class="yourHome" style="color : white;">${list.receiveId.nickName}</h4>
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
    <label class="tab_item1" for="all"><h4 class="neon2" style="color:white">내가 쓴 피드</h4></label>
    <input id="programming" type="radio" name="tab_item">
    <label class="tab_item2" for="programming"><h4 class="neon2" style="color:white">내 모임 게시물</h4></label>
    
 
    <div class="tab_content" id="all_content" style="white-space:nowrap; overflow-x:hidden; overflow-y:auto; width:820px; height:700px; margin-left:-30px;">
        		<div class="comment-section" style="margin-left:-50px; width:720px; " >
					<br />
					<c:set var="i" value="0"></c:set>
					<c:forEach var="feed" items="${feedList}">
						<c:set var="i" value="${i + 1}"></c:set>

						<c:if test="${fn:trim(feed.deleteCondition) eq '0' and fn:trim(feed.reportCondition) eq '0'}">

							<div class="single-comment">
								<form class="feedForm">
									

										<img src="/resources/image/uploadFiles/${feed.user.profileImage}" /><h4 style="vertical-align: text-bottom; color : white;">${feed.user.nickName}</h4>
									 &nbsp; &nbsp;
									<!-- comment-author -->
									<h5 class="meta-post" style="display: inline-block; vertical-align: text-bottom; color:white;">
											<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
											<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
										</h5>
									<c:if test="${sessionScope.user.userId eq feed.user.userId}">
											
											<div style="display: inline-block; float: right; margin-top:10px; margin-right:10px; color:white;">
												<%-- 수정 버튼 --%>
												<span class="glyphicon glyphicon-paperclip btn_update" aria-hidden="true"></span>
												<%-- 수정 버튼 --%>
											
												<%-- 삭제 버튼 --%>
												<span class="glyphicon glyphicon-trash btn_delete" aria-hidden="true" ></span>
												<%-- 삭제 버튼 --%>
											</div>
										</c:if>
									
									<!-- comment-meta -->
									<div class="feedContent">
											<h4 style="color:white;">${feed.content}</h4>
											
											<%-- 이미지 --%>
											<c:if test="${!empty feed.image1}">
											<div id="carousel-example-generic${i}" class="carousel slide" data-ride="carousel">
												<ol class="carousel-indicators">
													<li data-target="#carousel-example-generic${i}" data-slide-to="0" class="active"></li>
													
													<c:if test="${!empty feed.image2}">
														<li data-target="#carousel-example-generic${i}" data-slide-to="1"></li>
													</c:if>
													<c:if test="${!empty feed.image3}">
														<li data-target="#carousel-example-generic${i}" data-slide-to="2"></li>
													</c:if>
													<c:if test="${!empty feed.image4}">
														<li data-target="#carousel-example-generic${i}" data-slide-to="3"></li>
													</c:if>
												</ol>
											
												<!-- Wrapper for slides -->
												<div class="carousel-inner" role="listbox">
													<div class="item active">
														<img src="/resources/image/uploadFiles/${feed.image1}" alt="${feed.image1}">
													</div>
													
													<c:if test="${!empty feed.image2}">
														<div class="item">
															<img src="/resources/image/uploadFiles/${feed.image2}" alt="${feed.image2}">
														</div>
															<c:if test="${!empty feed.image3}">
																<div class="item">
																	<img src="/resources/image/uploadFiles/${feed.image3}" alt="${feed.image3}">
																</div>
																<c:if test="${!empty feed.image4}">
																	<div class="item">
																		<img src="/resources/image/uploadFiles/${feed.image4}" alt="${feed.image4}">
																	</div>
																</c:if>
															</c:if>														
													</c:if>
												</div>
	
												<!-- Controls -->
												<a class="left carousel-control carousel_prev" href="#carousel-example-generic${i}" role="button" data-slide="prev">
													<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
													<span class="sr-only">Previous</span>
												</a>
												<a class="right carousel-control carousel_next" href="#carousel-example-generic${i}" role="button" data-slide="next">
													<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
													<span class="sr-only">Next</span>
												</a>
											</div>
											</c:if>
											<%-- 이미지 --%>
											
										</div>
										<c:if test="${!empty feed.hashtag}">
											<div class="hashtagContent">
												${feed.hashtag}
											</div>
										</c:if>
										<%-- 피드 댓글 신고 --%>
										<input type="hidden" name="reportSource" value="3">
										<input type="hidden" name="sourceNumber" value="${feed.feedNo}">
										<input type="hidden" name="user2" value="${feed.user.userId}">
										<%-- 피드 댓글 신고 --%>
										
										<input type="hidden" name="source" value="0">
										<input type="hidden" name="feedNo" value="${feed.feedNo}">
										<input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}">
										<input type="hidden" name="openCondition" value="3">
								
								 
									<input type="hidden" name="feedNo" value="${feed.feedNo}">

									<section class="row section lastBar">
											<div class="row">
												<%-- 여백 --%>
												<div class="col-xs-1"></div>
												<%-- 여백 --%>
											
												<c:if test="${feed.checkHeart eq 0}">
													<div class="col-xs-2">
														<img class="feedLike" src="/resources/image/uploadFiles/black_no_heart.jpg" aria-hidden="true"/>
													</div>
												</c:if>
												<c:if test="${feed.checkHeart ne 0}">
													<div class="col-xs-2">
														<img class="feedDislike" src="/resources/image/uploadFiles/black_heart.jpg" aria-hidden="true"/>
													</div>
												</c:if>
												
												<div class="col-xs-1 likeCount" style="color : white;">
													${feed.heartCount}
												</div>
												
												<div class="col-xs-1">
												</div>
												
												<div class="col-xs-2 comment">
													<img src="/resources/image/uploadFiles/black_comment2.jpg" aria-hidden="true"/>
												</div>
												
												<div class="col-xs-1 commentCount" style="color : white;">
													 ${feed.commentCount}
												</div>
												
												<div class="col-xs-1">
												</div>
													
												<!-- 신고 아이콘 -->
												<div class="col-xs-2 report">
													<img src="/resources/image/uploadFiles/black_report.jpg" aria-hidden="true"/>
												</div>
												<!-- 신고 아이콘 -->
												
												<%-- 여백 --%>
												<div class="col-xs-1"></div>
												<%-- 여백 --%>
												
											</div>
										</section>
								</form>
							</div>

						</c:if>
					</c:forEach>

				</div>
				<%-- 현재 페이지 --%>
					<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}">
					<input type="hidden" id="pageFlag" value=true>
					<%-- 현재 페이지 --%>
    </div>
    <div class="tab_content" id="programming_content" style="white-space:nowrap; overflow-x:hidden; overflow-y:auto; width:820px; height:700px; margin-left : 10px;">
    
    <br/>
     <div class="col-md-4" id="cp">
											
</div>

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
		var userId = $("#yuserId").val();
		console.log(userId);
		$(".tab_item2").off(e);
	$.ajax({
		url : "/myHomeRest/json/getClubPostList", // 어디로 갈거니? // 갈 때 데이터
		type : "POST", // 타입은 뭘 쓸거니?
		datatype : "json",
		 data		:  JSON.stringify({
			userId : userId
		 }),
		 
		contentType : "application/json",
		success : function(data, status) {
			
       console.log(data.ClubPostList);
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
		var userId = $("#yuserId").val(); 
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
				"<div class='following-section' style='margin-left:50px;' id="+item.userId+">"+
			"<div style='display: inline-block;'>"+"<img src='/resources/image/uploadFiles/"+item.profileImage+"' width='100' height='100' />"+"</div><div style='float: right; margin-right:300px;'>"+
			"<h4 class='yourHome'>"+item.nickName+"</h4></div>"+
		"</div>";
			
			
			$("#fl").append(value);            
			
		})
		
		}	
	});
});
	
	 
});	

</script>
	

</body>
</html>
