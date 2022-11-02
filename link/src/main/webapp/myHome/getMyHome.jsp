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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="/resources/css/feed/getFeedListForMyHome.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Sacramento&display=swap" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script type="text/javascript">

	//썸네일 클릭시 상세상품조회 페이지 or 상품수정 페이지로 이동
	function getClubPostGo(clubPostNo){
		location.href = "/clubPost/getClubPost?clubPostNo="+clubPostNo;
	}
	
	// 닉네임, 프로필사진 클릭시 해당 유저의 마이홈피로 이동
	function getMyHomeGo(userId){
		location.href = "/myHome/getYourHome?userId="+userId;
	}


</script>
<script type="text/javascript">
$(function() {
	$(document).on("click","#myCut", function() {
		var userId = $("#userId").val();
		$.ajax({
			url : "/myHomeRest/json/getBlockList",
			type : "POST", 
			datatype : "json",
			 data		:  JSON.stringify({
				searchKeyword : userId
				
			 }),
			 
			contentType : "application/json",
			success : function(data,status) { 
	       console.log(status);
	       console.log(data);
	          var value="";
	       $.each(data.blockList, function(index, item) { 
	    	      value += 	"<div id='"+item.receiveId.userId+"'><img class='mc' src='/resources/image/uploadFiles/"+item.receiveId.profileImage+"' width='100' height='100' style='border-radius: 50px;'' />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<span class='yourHome3'>"+item.receiveId.nickName+"</span>"+
					        "<button type='button' class='"+item.receiveId.userId+" btn-danger btn-sm' id='stopBlock2'>차단해제</button></div>"
						                                                       

	    	   
	    	   
			})
			Swal.fire({
				
		  html : "<div id='swal1'></div>"
		})
			$("#swal1").append(value);
			
			$(".yourHome3").on("click", function(){
				self.location = "/myHome/getYourHome?userId="+$(this).parent().attr("id");
			})
				$(document).on("click","#stopBlock2", function() {
		var userId = $(this).parent().attr("id");
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
						$("."+userId+"").text("차단해제");
						}else if(update.block.fbState == 2){
						$("."+userId+"").text("차단");
						}
					}
				})
			}
		})
	})
			
			}	
		})
		
	})
	



});



$(function(){
$(document).on("click","#myClub", function() {
	var userId = $("#userId").val();
	$.ajax({
		url : "/myHomeRest/json/getApprovalConditionList",
		type : "POST", 
		datatype : "json",
		 data		:  JSON.stringify({
			userId : userId
			
		 }),
		 
		contentType : "application/json",
		success : function(data,status) { 
       console.log(status);
       console.log(data);
          var value="";
       $.each(data.approvalConditionList, function(index, item) { 
    	      value += "<div class='thumbnail' id='"+item.clubNo+"'><img src='/resources/image/uploadFiles/"+item.clubImage+"' style='width:500px; height:400px;'><h3>"+item.clubTitle+"</h3></div></br></br>"
    	   
    	   
		})
		Swal.fire({
			
	  html : "<div id='swal'></div>"
	})
		$("#swal").append(value);
		
		$(".thumbnail").on("click", function(){
			self.location = "/club/getClub?clubNo="+$(this).attr("id");
		})
		}	
	})
	
})
});

 $(function(){
	
	$('.dl').on("click",function(){
		
	var user_Id = $(this).parent().parent().attr("id");
	var nickName = $("."+user_Id+"").val();
	var profileImage = $(this).attr("id");
	//alert(followUser.receiveId.userId);
	$.ajax("/myHomeRest/json/getFollow", {

		type : "POST",
		data : JSON.stringify({
			receiveId : user_Id
		}),
		dataType : "json",
		contentType : "application/json",
		headers : {
			"Accept" : "application/json"
		},
		success : function(Data, status) {
		if(Data.follow != null){
			var freceiveId = Data.follow.receiveId.userId;
			var fnickName = Data.follow.receiveId.nickName;
			var fprofileImage = Data.follow.receiveId.profileImage;
			var ffbType = Data.follow.fbType;
			var ffbState = Data.follow.fbState;
		}else{
			var freceiveId = "";
			var fnickName = "";
			var fprofileImage = "";
			var ffbType = "";
			var ffbState = "";
		}
		if(Data.block != null){
			var breceiveId = Data.block.receiveId.userId;
            var bnickName = Data.block.receiveId.nickName;
			var bprofileImage = Data.block.receiveId.profileImage;
			var bfbType = Data.block.fbType;
			var bfbState = Data.block.fbState;
		}else{
			var breceiveId = "";
            var bnickName = "";
			var bprofileImage = "";
			var bfbType = "";
			var bfbState = "";
		}
			
			
		
		
			
			if( freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '1' && bfbType.trim() == '2' && bfbState.trim() == '1' ){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='following' class='btn btn-danger btn-sm'>"+
					"팔로잉</button><button type='button' id='stopBlock' class='btn btn-danger btn-sm'>차단해제</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '2' && bfbType.trim() == '2' && bfbState.trim() == '1'){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='updateFollow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='stopBlock' class='btn btn-danger btn-sm'>차단해제</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '1' && bfbType.trim() == '2' && bfbState.trim() == '2'){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='following' class='btn btn-danger btn-sm'>"+
					"팔로잉</button><button type='button' id='updateBlock' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '2' && bfbType.trim() == '2' && bfbState.trim() == '2'){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='updateFollow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='updateBlock' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '1' && bfbType == ""){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='following' class='btn btn-danger btn-sm'>"+
					"팔로잉</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button></div><button type='button' class='btn btn-danger btn-sm'>채팅</button></div>";
			}else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '2' && bfbType == "" ){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='updateFollow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button></div><button type='button' class='btn btn-danger btn-sm'>채팅</button></div>";
			}else if(breceiveId == user_Id && ffbType == ""  && bfbType.trim() == '2' && bfbState.trim() == '1'){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+bprofileImage+"' style='width:100px; height:100px;'><div><h4>"+bnickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='stopBlock' class='btn btn-danger btn-sm'>차단해제</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(breceiveId == user_Id && ffbType == ""  && bfbType.trim() == '2' && bfbState.trim() == '2'){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+bprofileImage+"' style='width:100px; height:100px;'><div><h4>"+bnickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='updateBlock' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(ffbType == ""  && bfbType == "" ){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+profileImage+"' style='width:100px; height:100px;'><div><h4>"+nickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}
			
			 $("#"+nickName+"").html(value);
		
			
				$("#"+nickName+"").dialog({
					
					autoOpen: false,
					show: {
						effect: "Pulsate",
				        duration: 1000
					},
					hide: {
				        effect: "Scale",
				        duration: 1000
					},
					position: {
						
						my:"center",
						at:"center",
						of:"#"+user_Id+""
					}
					
				});
	
	
				 $("#"+nickName+"").dialog("open");
	
		},
		error : function(){
			var value =
				"<div name='dialog'><img src='/resources/image/uploadFiles/"+profileImage+"' style='width:100px; height:100px;'><div><h4>"+nickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
				"팔로우</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
				
			 $("#"+nickName+"").html(value);
				
				
				$("#"+nickName+"").dialog({
					
					autoOpen: false,
					show: {
						effect: "Pulsate",
				        duration: 1000
					},
					hide: {
				        effect: "Scale",
				        duration: 1000
					},
					position: {
						
						my:"center",
						at:"center",
						of:"#"+user_Id+""
					}
					
				});
	
	
				 $("#"+nickName+"").dialog("open");
		}
	})

}) 
$(".main").on("click",function(){

	 $("div[name='dialog']").parent().dialog("close");

}) 

$(document).on("click",".dll",function(){
	
	var user_Id = $(this).parent().parent().attr("id");
	var nickName = $("."+user_Id+"").val();
	var profileImage = $(this).attr("id");
	
	$.ajax("/myHomeRest/json/getFollow", {

		type : "POST",
		data : JSON.stringify({
			receiveId : user_Id
		}),
		dataType : "json",
		contentType : "application/json",
		headers : {
			"Accept" : "application/json"
		},
		success : function(Data, status) {
		if(Data.follow != null){
			var freceiveId = Data.follow.receiveId.userId;
			var fnickName = Data.follow.receiveId.nickName;
			var fprofileImage = Data.follow.receiveId.profileImage;
			var ffbType = Data.follow.fbType;
			var ffbState = Data.follow.fbState;
		}else{
			var freceiveId = "";
			var fnickName = "";
			var fprofileImage = "";
			var ffbType = "";
			var ffbState = "";
		}
		if(Data.block != null){
			var breceiveId = Data.block.receiveId.userId;
            var bnickName = Data.block.receiveId.nickName;
			var bprofileImage = Data.block.receiveId.profileImage;
			var bfbType = Data.block.fbType;
			var bfbState = Data.block.fbState;
		}else{
			var breceiveId = "";
            var bnickName = "";
			var bprofileImage = "";
			var bfbType = "";
			var bfbState = "";
		}
			
			
			
		
			
			if( freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '1' && bfbType.trim() == '2' && bfbState.trim() == '1' ){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='following' class='btn btn-danger btn-sm'>"+
					"팔로잉</button><button type='button' id='stopBlock' class='btn btn-danger btn-sm'>차단해제</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '2' && bfbType.trim() == '2' && bfbState.trim() == '1'){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='updateFollow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='stopBlock' class='btn btn-danger btn-sm'>차단해제</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '1' && bfbType.trim() == '2' && bfbState.trim() == '2'){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='following' class='btn btn-danger btn-sm'>"+
					"팔로잉</button><button type='button' id='updateBlock' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '2' && bfbType.trim() == '2' && bfbState.trim() == '2'){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='updateFollow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='updateBlock' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '1' && bfbType == ""){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='following' class='btn btn-danger btn-sm'>"+
					"팔로잉</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(freceiveId == user_Id && ffbType.trim() == '1' && ffbState.trim() == '2' && bfbType == "" ){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+fprofileImage+"' style='width:100px; height:100px;'><div><h4>"+fnickName+"</h4></div><div><button type='button' id='updateFollow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(breceiveId == user_Id && ffbType == ""  && bfbType.trim() == '2' && bfbState.trim() == '1'){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+bprofileImage+"' style='width:100px; height:100px;'><div><h4>"+bnickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='stopBlock' class='btn btn-danger btn-sm'>차단해제</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(breceiveId == user_Id && ffbType == ""  && bfbType.trim() == '2' && bfbState.trim() == '2'){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+bprofileImage+"' style='width:100px; height:100px;'><div><h4>"+bnickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='updateBlock' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}else if(ffbType == ""  && bfbType == "" ){
				var value =
					"<div name='dialog' id='"+user_Id+"'><img src='/resources/image/uploadFiles/"+profileImage+"' style='width:100px; height:100px;'><div><h4>"+nickName+"</h4></div><div><button type='button' id='follow' class='btn btn-danger btn-sm'>"+
					"팔로우</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
			}
			
			 $("#"+nickName+"1").html(value);
		
			
				$("#"+nickName+"1").dialog({
					
					autoOpen: false,
					show: {
						effect: "Pulsate",
				        duration: 1000
					},
					hide: {
				        effect: "Scale",
				        duration: 1000
					},
					position: {
						
						my:"center",
						at:"center",
						of:"div[name='"+nickName+"']"
					}
					
				});
	
	
				 $("#"+nickName+"1").dialog("open");
	
		},
		error : function(){
			var value =
				"<div name='dialog1'><img src='/resources/image/uploadFiles/"+profileImage+"' style='width:100px; height:100px;'><div><h4>"+nickName+"</h4></div><div><button type='button' id='Follow' class='btn btn-danger btn-sm'>"+
				"팔로우</button><button type='button' id='block' class='btn btn-danger btn-sm'>차단</button><button type='button' class='btn btn-danger btn-sm'>채팅</button></div></div>";
				
			 $("#"+nickName+"1").html(value);
				
				
				$("#"+nickName+"1").dialog({
					
					autoOpen: false,
					show: {
						effect: "Pulsate",
				        duration: 1000
					},
					hide: {
				        effect: "Scale",
				        duration: 1000
					},
					position: {
						
						my:"center",
						at:"center",
						of:"div[name='"+nickName+"']"
					}
					
				});
	
	
				 $("#"+nickName+"1").dialog("open");
		}
	})

}) 
$(".main").on("click",function(){

	 $("div[name='dialog1']").parent().dialog("close");

}) 



	
	
});
 

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className) 
	$(".yourHome").on("click" , function() {
		
		self.location = "/myHome/getYourHome?userId="+$(this).parent().parent().attr("id");
	});
	
	
   
	
 });
 
function showPopUp(){
    window.open("/myHome/getPayList","테스트","width=500, height=600, top=50, left=50");
}

function showPopUp2(){
    window.open("/myHome/getBlockList","테스트","width=400, height=600, top=50, left=50");
}
 

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
	$(document).on("click", ".carousel-control", function(event) {
		event.stopPropagation();
	})
	<%-- CAROUSEL 침범 방지 --%>
	
	<%-- CALL REPORT --%>
	$(document).on("click", ".report", function(event) {
		event.stopPropagation();
	    
		$(this).parent().parents(".feedForm").attr("method", "POST").attr("action", "/serviceCenter/addReport").submit();
		
	}) // .report evenet close
	<%-- CALL REPORT --%>
	
})
$(function() {

		$(document).on("click","#follow", function() {
			var userId = $(this).parent().parent().attr("id");
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
									if(sock) {
										   var Msg = "follow," + userId + ",0, 가 나를 팔로우 했습니다."
										   sock.send(Msg);
									}
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
								
								if(sock) {
									   var Msg = "follow," + userId + ",0, 가 나를 팔로우 했습니다."
									   sock.send(Msg);
								}
							}
						})
					} 
				}
				
			})
		})

		 $(document).on("click","#following", function() {
			var userId = $(this).parent().parent().attr("id");
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
							if(sock) {
								   var Msg = "follow," + userId + ",0, 가 나를 팔로우 했습니다."
								   sock.send(Msg);
							}
							}else if(update.follow.fbState == 2){
							$("#following").text("팔로우");
							}
						}
					})
				}
			})
		}) 

		 $(document).on("click","#updateFollow", function() {
			var userId = $(this).parent().parent().attr("id");
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
							if(sock) {
								   var Msg = "follow," + userId + ",0, 가 나를 팔로우 했습니다."
								   sock.send(Msg);
							}
							}else if(update.follow.fbState == 2){
							$("#updateFollow").text("팔로우");
							}
						}
					})
				}
			})
		})


		$(document).on("click","#block", function() {
			var userId = $(this).parent().parent().attr("id");
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

		$(document).on("click","#stopBlock", function() {
			var userId = $(this).parent().parent().attr("id");
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

		$(document).on("click","#updateBlock", function() {
			var userId = $(this).parent().parent().attr("id");
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
	



</script>

<style>
.my{
margin-right: 450px;
}
a {
    color: #222;
    text-decoration: auto !important;
    width: 140px;
    color : black !important;
}
#main{
background-color : #EBEDF0 !important;
display : grid;
justify-content: center;
}

i{
color : #b276ff !important;

}


h5.meta-post {
    margin-bottom: 13px !important;
    color: black !important;
}

.main{
display:block;
position:relative;

}

#calendar {
	margin-left: 955px;
	margin-top: 50px;
	display: flex;
	justify-content: center;
	float: left;
	width : 675px;
	height : 680px;
	
}

.container {
	float: left;
	margin-left: 455px;
	display: flex;
	position:absolute;
	margin-top: 10px;
	width: 340px;
	background-color:#F5F6F7;
	border-radius: 15px;
}

/* Profile container */
.profile {
	margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
	padding: 20px 0 10px 0;
	width:500px;
	
}

.profile-userpic img {
	float: left;
	margin-left: 30px;
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
	
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 7px;
}

.profile-usertitle-job {
	text-transform: uppercase;
	
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
	color: #b276ff;
	font-size: 15px;
	font-weight: 600;
}

.profile-usermenu ul li a i {
	margin-right: 8px;
	font-size: 14px;
	
}

.profile-usermenu ul li a:hover {
	background-color:#CCD0D5;
	
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
    width : 600px;
    border: 2px solid #CCD0D5;
    border-radius: 15px;
    box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
		
		
    
    
	
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
  margin-top: 120px;
  margin-bottom: 100px;
  background-color: #F5F6F7;
  width: 330px;
  display:inline-block;
  margin-left:310px;
  float: left;
  height:800px;
  border-radius: 15px;
  border: 2px solid #CCD0D5;
  }
  .tabs2 {
  margin-top: 120px;
  margin-bottom: 100px;
   background-color: #F5F6F7;
   border: 2px solid #DADDE1;
  width: 670px;
  display:inline-block;
  margin-left:170px;
  height:800px;
   border-radius: 15px;
  
  
  
  
  }

/* 탭 스타일 */
.tab_item1 {
  width: calc(100%/3);
  height: 50px;
  border-bottom: 3px solid #EBEDF0;;
  background-color: #F5F6F7;
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
  border-radius: 15px 15px 0px 0px ;
}
.tab_item-following {
  width: calc(100%/3);
  height: 50px;
  background-color: #F5F6F7;
  border-bottom: 3px solid #EBEDF0;
  line-height: 50px;
  font-size: 16px;
  text-align: center;
  color: #333333;
  display: inline-block;
  width:160px;
  text-align: center;
  font-weight: bold;
  transition: all 0.2s ease;
 border-radius: 15px 15px 0px 0px ;
}
.tab_item-follow {
  width: calc(100%/3);
  height: 50px;
  background-color: #F5F6F7;
  border-bottom: 3px solid #EBEDF0;
  line-height: 50px;
  font-size: 16px;
  text-align: center;
  color: #333333;
  display: block;
  float: left;
  width:160px;
  text-align: center;
  font-weight: bold;
  transition: all 0.2s ease;
  border-radius: 15px 15px 0px 0px ;
}

.tab_item2 {
  width: calc(100%/3);
  height: 50px;
  border-bottom: 3px solid #EBEDF0;
  background-color: #F5F6F7;
  line-height: 50px;
  font-size: 16px;
  text-align: center;
  color: #333333;
  display: inline-block;
  width:330px;
  text-align: center;
  font-weight: bold;
  transition: all 0.2s ease;
  border-radius: 15px 15px 0px 0px ;
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

.caption h2 {
margin-top:35px !important;
}


.userbtn{
background-color :#EBEDF0; 
font-size: 15px; 
font-weight: 600;
width :300px;
border-radius: 15px;
margin-bottom: 15px;
text-align: center;
margin-left : 5px;
}
header.transparent {
    background-color: white !important;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
}
.post{
width:500px;
margin-left:65px;

}

@keyframes post-ani {
	
    25% {
        transform: rotate(2deg) scale(1.01);
	    }
 
    50% {
        transform: rotate(0deg) scale(1);
    	}
 
    75% {
        transform: rotate(-2deg) scale(1.01);
    	}
	}
	.thumbnail:hover {
	transform: scale(1.1);
		transition: transform .5s; 
	}

</style>
</head>


<body class="blog masonry-style">

	

	<main role="main" class="main">
		
			
			<div id="main" class="row">
			<div>
			<jsp:include page="/toolbar.jsp" />
			</div>
			<div class="my" style="margin-top : 100px;">
			<div>
				<div id="calendar">

					<jsp:include page="/myHome/calendar.jsp" />
				</div>

				<div class="container">
					<div class="row profile">
						
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
									
										<div class="userbtn" id="myClub" style="color : black;">
												 내 모임</div>
										
										<div class="userbtn" style="color : black;"><a href="/user/updateProfile?userId=${user.userId }"> 
										
												 프로필 수정</a></div>
												
										<div class="userbtn" id="myCut" style="color : black;">
												차단 리스트</div>
												
										<div class="userbtn" style="color : black;" onclick="showPopUp();"> 
												결제 내역</div>
										
								</div>
								<!-- END MENU -->
							</div>
						
						
					</div>
				</div>
				</div>
				</div>
<div class="tab">
			<div class="tabs1">
			<input id="all-follow" type="radio" name="tab_item-follow" checked>
    <label class="tab_item-follow" for="all-follow"><h4> 팔로우</h4></label>
    <input id="programming-follow" type="radio" name="tab_item-follow">
    <label class="tab_item-following" for="programming-follow"><h4>팔로워</h4></label>
    
    <div class="tab_content-follow" id="all-follow_content" style="white-space:nowrap; overflow-x:hidden; overflow-y:auto; width:300px; height:700px;">
        		
        		<br />
		<c:set var = "i" value = "0" />
		<c:forEach var = "list" items = "${list}">
			<c:set var = "i" value = "${i + 1}" />
			<div class="follow-section" style="margin-left:50px;" id="${list.receiveId.userId }">
			<div style="display: inline-block; margin-left :-50px;"><img class="dl" src="/resources/image/uploadFiles/${list.receiveId.profileImage}" id="${list.receiveId.profileImage}" width="100" height="100" /></div><div style="float: right; margin-right:380px;"><h4 class="yourHome">${list.receiveId.nickName}</h4>
			</div>
			<div id="${list.receiveId.nickName }"></div>
			<input type="hidden" class="${list.receiveId.userId }" value="${list.receiveId.nickName }">
			
				</div>
				
			</c:forEach>
			
				
				</div>
				<div class="tab_content-follow" id="programming-follow_content" style="white-space:nowrap; overflow-x:hidden; overflow-y:auto; width:300px; height:700px;">
     <div class="col-md-4" id="fl">
					 		<br />
	
		
			
								
</div>
</div>
  </div>
  
			
<div class="tabs2">
    <input id="all" type="radio" name="tab_item" checked>
    <label class="tab_item1" for="all"><h4>내가 쓴 피드</h4></label>
    <input id="programming" type="radio" name="tab_item">
    <label class="tab_item2" for="programming"><h4>내 모임 게시물</h4></label>
    
 
    <div class="tab_content" id="all_content" style="white-space:nowrap; overflow-x:hidden; overflow-y:auto; width:660px; height:700px; margin-left:-30px;">
        		<div class="comment-section" style="margin-left:-50px; width:720px; " >
					<br />
					<c:set var="i" value="0"></c:set>
					<c:forEach var="feed" items="${feedList}">
						<c:set var="i" value="${i + 1}"></c:set>

						<c:if test="${fn:trim(feed.deleteCondition) eq '0' and fn:trim(feed.reportCondition) eq '0'}">

							<div class="single-comment">
								<form class="feedForm">
									

											<img src="/resources/image/uploadFiles/${feed.user.profileImage}" /><h4 style="vertical-align: text-bottom;">${feed.user.nickName}</h4>
									 &nbsp; &nbsp;
									<!-- comment-author -->
									    
										<h5 class="meta-post" style="display: inline-block; vertical-align: text-bottom;">
											<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
											<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
										</h5>
									<c:if test="${sessionScope.user.userId eq feed.user.userId}">
											
											<div style="display: inline-block; float: right; margin-top:10px; margin-right:10px;">
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
											<h4>${feed.content}</h4>
											
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
														<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" aria-hidden="true"/>
													</div>
												</c:if>
												<c:if test="${feed.checkHeart ne 0}">
													<div class="col-xs-2">
														<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" aria-hidden="true"/>
													</div>
												</c:if>
												
												<div class="col-xs-1 likeCount">
													${feed.heartCount}
												</div>
												
												<div class="col-xs-1">
												</div>
												
												<div class="col-xs-2 comment">
													<img src="/resources/image/uploadFiles/comment2.jpg" aria-hidden="true"/>
												</div>
												
												<div class="col-xs-1 commentCount">
													 ${feed.commentCount}
												</div>
												
												<div class="col-xs-1">
												</div>
													
												<!-- 신고 아이콘 -->
												<div class="col-xs-2 report">
													<img src="/resources/image/uploadFiles/report.jpg" aria-hidden="true"/>
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
    	   console.log( "하트컨디션 : " + item.heartCondition);
    	   var heartImage = item.heartCondition != 0? 'heart.jpg' : 'no_heart.jpg';
    	   console.log( "하트이미지 : " + heartImage ); 
			var date = "";
			if(item.clubPostUpdateDate != null){
				date = item.clubPostUpdateDate+"(수정됨)";
			}else{
				date = item.clubPostRegDate;
			};
			
			
			var value = "";
			if(item.clubPostVideo1 == null){
				value =
					"<div class='post' style='margin-bottom : 40px;'>"+
					"<h5 style='text-align:right; margin-right:120px; font-size:15px !important; color:black !important;'>"+date+"</h5>"+
				"<a href='javascript:getClubPostGo("+item.clubPostNo+")'>"+
				"<img src='/resources/image/uploadFiles/"+item.image1+"' height='300' width='400' style='border-radius:20px;'>"+
			"</a>"+
			"<div style='width: 87%;'>"+
			"<p align='center' style='font-size: 25px; margin-bottom : -20px;'>"+item.clubPostTitle+"</p>"+
		"</div>"+
			"<div style='display: flex; width: 87%;'>"+
				"<div style='flex:1; margin-top:10px;'>"+
				"<a href='javascript:getMyHomeGo(\"item.user.userId\")'>"+
						"<img src='/resources/image/uploadFiles/"+ item.user.profileImage+ "' height='70' width='70' style='border-radius:50px;'>"+
					"</a>"+
					
				"</div>"+
				"<div style='margin-right:130px; padding-top: 15px;'>"+
					/* "<a href='/myHome/getYourHome?userId="+item.user.userId+">"+ */
					"<a href='javascript:getMyHomeGo(\"item.user.userId\")'>"+
						"<p align='center' style='font-size: 20px;'>"+ item.user.nickName+ "</p>"+
					"</a>"+
				"</div>"+
				"<div style='padding-top: 33px; margin-left:50px;'>"+
                <!-- heartCondition에 모임 게시물 번호가 있으면 해당 유저가 좋아요했다 / 0이면 좋아요 안했다 -->
                "<img style='float: right;' src='/resources/image/uploadFiles/"+heartImage+"' height='30' width='30'>"+
             "</div>"+
				"<div style='flex:1;  padding-top: 15px;' >"+
					"<p align='center' style='font-size: 20px; margin-right: 35px;'>"+ item.clubPostHeartCount+ "</p>"+
				"</div>"+
			
				
			"</div>"+
			"</div>";

				
			}else{
				value =
					"<div class='post' style='margin-bottom : 30px;'>"+
					"<h5 style='text-align:right; margin-right:120px; font-size:15px !important; color:black !important;'>"+date+"</h5>"+
				"<a href='javascript:getClubPostGo("+item.clubPostNo+")'>"+
				"<img src='https://img.youtube.com/vi/"+item.clubPostVideo1+"/mqdefault.jpg' height='300' width='400' style='border-radius:20px;'>"+
				
			"</a>"+
			"<div style='width: 87%;'>"+
			"<p align='center' style='font-size: 25px; margin-bottom : -20px;'>"+item.clubPostTitle+"</p>"+
			"</div>"+
			"<div style='display: flex; width: 87%;'>"+
				"<div style='flex:1; margin-top:10px;'>"+
				"<a href='javascript:getMyHomeGo(\"item.user.userId\")'>"+
						"<img src='/resources/image/uploadFiles/"+ item.user.profileImage+ "' height='70' width='70' style='border-radius:50px;'>"+
					"</a>"+
				"</div>"+
				"<div style='flex:1; margin-right:130px; padding-top: 15px;'>"+
					/* "<a href='/myHome/getYourHome?userId="+item.user.userId+">"+ */
					"<a href='javascript:getMyHomeGo(\"item.user.userId\")'>"+
						"<p align='center' style='font-size: 20px;'>"+ item.user.nickName+ "</p>"+
					"</a>"+
				"</div>"+
				"<div style='padding-top: 33px; margin-left:50px;'>"+
                <!-- heartCondition에 모임 게시물 번호가 있으면 해당 유저가 좋아요했다 / 0이면 좋아요 안했다 -->
                "<img style='float: right;' src='/resources/image/uploadFiles/"+heartImage+"' height='30' width='30'>"+
             "</div>"+
				"<div style='flex:1; padding-top: 15px;'>"+
					"<p align='center' style='font-size: 20px; margin-right: 35px;'>"+ item.clubPostHeartCount+ "</p>"+
				"</div>"+
			
				
			"</div>"+
			"</div>";
				
			};
			
				
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
				"<div class='following-section' style='margin-left:35px;' id='"+item.userId+"' name='"+item.nickName+"'>"+
			"<div style='display: inline-block; margin-left :-50px;'>"+"<img class='dll' src='/resources/image/uploadFiles/"+item.profileImage+"' id='"+item.profileImage+"' width='100' height='100' />"+"</div><div style='float: right; margin-right:380px;'>"+
			"<h4 class='yourHome2'>"+item.nickName+"</h4></div><div id='"+item.nickName+"1'></div>"+"<input type='hidden' class='"+item.userId+"' value='"+item.nickName+"'>"+
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