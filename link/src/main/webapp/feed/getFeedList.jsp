<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="The Page Description">
	
	<title>Feed</title>
	
	<link href="/resources/css/feed/getFeedList.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	
	<%-- SUMMER NOTE --%>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<%-- SUMMER NOTE --%>
	
	<%-- ALERT --%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<%-- ALERT --%>
	
	<%-- BOOTSTRAP ICON --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<%-- BOOTSTRAP ICON --%>
	
	<%-- SOCKET IO --%>
	<script src="/socket.io/socket.io.js"></script>
	<%-- SOCKET IO --%>
	
	<script>
	// 소켓 서버 연결
		var socket = io();
		var box = document.getElementById("box");
	
	// noti 이벤트 수신
		socket.on("noti", function(){
			var time = getTimeString();
	
			box.insertAdjacentHTML("afterbegin", "<div>" + time + " 소켓 서버로부터 알림을 받았습니다.</div>");
		});
	
		function getTimeString() {
			var h = new Date().getHours();
			var m = new Date().getMinutes();
			var s = new Date().getSeconds();
			var fill = function(n) {return n<10 ? "0" + n : n};
		
			return fill(h) + ":" + fill(m) + ":" + fill(s);
		}
	</script>
	
	<script type="text/javascript">
	
	
	
	function formatDate(date) {
	    
	    var d = new Date(date),
	    
	    month = '' + (d.getMonth() + 1) , 
	    day = '' + d.getDate(), 
	    year = d.getFullYear();
	    
	    if (month.length < 2) month = '0' + month; 
	    if (day.length < 2) day = '0' + day; 
	    
	    return [year, month, day].join('-');
	    
	}
	
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/feedRest/json/uploadImage",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
	
	$(function(){
		
		
				
		<%-- SEARCH BY HASHTAG --%>
		
		$(document).on("click", ".searchByHashtag", function(event){
			event.stopPropagation();
			
			var searchKeyword = $(this).text().trim();
			$("#searchKeyword").val(searchKeyword);
			
			console.log($("#searchKeyword").val());
			$("#searchForm").attr("method", "POST").attr("action","/feed/getFeedList").submit();
		})
		
		
		<%-- 무한 스크롤 --%>
		
		$(window).scroll(function() {
			console.log(($("#pageFlag").val()));
			if($("#pageFlag").val() == "true") {
			
				if((Math.ceil($(window).scrollTop() + $(window).height())) >= ( $(document).height() )) {
					
					console.log("무한 스크롤");
					
					var maxHeight = $(document).height();
					var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
					
					var sessionUser = $("#userId").val();
					
					console.log("서치키워드 : " + $("#searchKeyword").val());
					
					$.ajax(
							{
								url : "/feedRest/json/getFeedList",
								method : "POST",
								data : JSON.stringify ({
									userId : sessionUser,
									currentPage : parseInt($("#currentPage").val()) + 1,
									searchKeyword : $("#searchKeyword").val()
								}),
								contentType: 'application/json',
								dataType : "json",
								header : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								}, // header end
								
								success : function(data, status) {
									

									var addHtml = "";
									
									$.each(data, function(index, item) {
										

										console.log("무한 스크롤 정보 성공" + item.content + "\n");
										
										addHtml +=
										'<div class="showFeedForm">' +
										'<form class="feedForm">' +
										'	<img src="/resources/image/uploadFiles/' + item.user.profileImage + '" /><h4 style="vertical-align: text-bottom;">' + item.user.nickName + '</h4>' + 
										'	<h5 class="meta-post" style="display: inline-block; vertical-align: text-bottom;">'
										
										if(item.updateDate != null) {
											addHtml += formatDate(item.updateDate) + '</h5>';
										} else {
											addHtml += formatDate(item.regDate) + '</h5>';
										}
										
										
										if(sessionUser == item.user.userId) {
											addHtml += '<div style="display: inline-block; float: right; margin-top:10px; margin-right:10px;">' +
														'<span class="glyphicon glyphicon-paperclip btn_update" aria-hidden="true"></span> ' +
														'<span class="glyphicon glyphicon-trash btn_delete" aria-hidden="true" ></span>' +
														'</div>'
										}
										
										addHtml += '<div class="feedContent">';
										
										if(item.content != null) {
											addHtml += item.content
										}
										
										if(item.image1 != null) {
											addHtml += '<div id="carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" class="carousel slide" data-ride="carousel">' +
													'<ol class="carousel-indicators">' +
														'<li data-target="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" data-slide-to="0" class="active"></li>'
														
											if(item.image2 != null) {
												addHtml += '<li data-target="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" data-slide-to="1"></li>';
											}
														
											if(item.image3 != null) {
												addHtml += '<li data-target="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" data-slide-to="2"></li>';
											}
											
											if(item.image4 != null) {
												addHtml += '<li data-target="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" data-slide-to="3"></li>';
											}		
														
											addHtml += '</ol>' +
												'<div class="carousel-inner" role="listbox">' +
												'<div class="item active">' +
												'<img src="/resources/image/uploadFiles/' + item.image1 + '" alt="' + item.image1 + '">' +
												'</div>'
												
											if(item.image2 != null) {
												addHtml += '<div class="item">' +
															'<img src="/resources/image/uploadFiles/' + item.image2 + '" alt="' + item.image2 + '">' +
															'</div>'
											}
														
											if(item.image3 != null) {
												addHtml += '<div class="item">' +
															'<img src="/resources/image/uploadFiles/' + item.image3 + '" alt="' + item.image3 + '">' +
															'</div>'
											}
											
											if(item.image4 != null) {
												addHtml += '<div class="item">' +
															'<img src="/resources/image/uploadFiles/' + item.image4 + '" alt="' + item.image4 + '">' +
															'</div>'
											}
																
											addHtml += '</div>' +
														'<a class="left carousel-control carousel_prev" href="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" role="button" data-slide="prev">' +
														'	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>' +
														'	<span class="sr-only">Previous</span>' +
														'</a>' +
														'<a class="right carousel-control carousel_next" href="#carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" role="button" data-slide="next">' +
														'	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>' +
														'	<span class="sr-only">Next</span>' +
														'</a>' +
													'</div>'
										}
											
										addHtml += '</div>';
										
										if(item.hashtag != null) {
											addHtml += '<div class="hashtagContent">' +
													item.hashtag +
													'</div>'
										}
											
										addHtml += '<input type="hidden" name="reportSource" value="3">' +
											'<input type="hidden" name="sourceNumber" value="' + item.feedNo + '">' +
											'<input type="hidden" name="user2" value="' + item.user.userId + '">' +
											'<input type="hidden" name="source" value="0">' +
											'<input type="hidden" name="feedNo" value="' + item.feedNo + '"> ' +
											'<input type="hidden" id="userId" name="userId" value="' + sessionUser + '">' +
											'<input type="hidden" name="openCondition" value="3">' +
											'<section class="row section lastBar">' +
											'	<div class="row">' +
											'		<div class="col-xs-1"></div>'
										
										if(item.checkHeart == 0) {
											addHtml += '<div class="col-xs-2">' +
															'<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" aria-hidden="true"/>' +
														'</div>'
										} else {
											addHtml += '<div class="col-xs-2">' +
															'<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" aria-hidden="true"/>' +
														'</div>'
										}
											
										addHtml += '<div class="col-xs-1 likeCount">' +
														item.heartCount +
													'</div>' +
													'<div class="col-xs-1">' +
													'</div>' +
													'<div class="col-xs-2 comment">' +
													'	<img src="/resources/image/uploadFiles/comment2.jpg" aria-hidden="true"/>' +
													'</div>' +
													'<div class="col-xs-1 commentCount">' +
														item.commentCount +
													'</div>' +
													'<div class="col-xs-1">' +
													'</div>' +
													'<div class="col-xs-2 report">' +
													'	<img src="/resources/image/uploadFiles/report.jpg" aria-hidden="true"/>' +
													'</div>' +
													'<div class="col-xs-1"></div>' +
													'</div>' +
												'</section>' +
											'</form>' +
										'</div>'
										
									}) // each close
									
									console.log(addHtml);
									$(addHtml).appendTo($("div.six:last"));
									$("#currentPage").val( parseInt($("#currentPage").val()) + 1 );
									
									if(addHtml == "") {
										$("#pageFlag").val(false);
									}
									
								} // success close
								
							} // ajax inner close
							
					) // ajax close
					
				} // scroll if close
			
			} // pageFlag close;
		
		}); // window scroll event close
		
		<%-- 무한 스크롤 --%>
		
		
		
		<%-- SUMMER NOTE WEB LOADING --%>
		$('#summernote').summernote({
			toolbar: [
                // [groupName, [list of button]]
                ['Insert', ['picture', 'video']],
            ],
            
            disableResizeEditor: true,
			height: 300,                 	// 에디터 높이
			minHeight: null,             	// 최소 높이
			maxHeight: null,             	// 최대 높이
			focus: true,                 	// 에디터 로딩후 포커스를 맞출지 여부
			placeholder: '오늘 하루는 어떤가요?',
			lang:'ko-KR',
			
			
			callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
           			// 파일 업로드(다중업로드를 위해 반복문 사용)
					for (var i = files.length - 1; i >= 0; i--) {
			            uploadSummernoteImageFile(files[i],
			            this);
		            		
					}
          		}
            }
		
		});
		
		<%-- SUMMER NOTE WEB LOADING --%>
		
		<%-- GET_FEED --%>
		$(document).on("click", ".feedForm", function(event) {
			event.stopPropagation();
			var feedNumber = $(this).children("input[name='feedNo']").val();
			
			if($(event.target).hasClass("comment") || $(event.target).hasClass("commentImg")) {
				
				return false;
			}
			
			location.href="/feed/getFeed?feedNo=" + feedNumber;
		})
		<%-- GET_FEED --%>
		
		<%-- ADD_FEED --%>
		$(document).on("click", ".addFeed", function(event){
			event.stopPropagation();
			
			console.log($(".note-editable").html());
			
			if($(".note-editable").html() == "<p><br></p>") {
				Swal.fire({
					  title: '내용을 입력하세요',
					  width: 400,
					  icon: 'warning',
					  timer : 500,
					  showConfirmButton : false,
				})
			} else {
				$(this.form).attr("method", "POST").attr("accept-charset", "EUC-KR").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
			}
		});
		<%-- ADD_FEED --%>
		
		<%-- UPDATE_FEED --%>
		$(document).on("click", ".btn_update", function(event){
			event.stopPropagation();
			console.log("피드 수정 버튼");
			console.log($(this).parent().parents(".feedForm").html())
			
			$(this).parent().parents(".feedForm").attr("method", "GET").attr("action", "/feed/updateFeed").submit();
		});
		<%-- UPDATE_FEED --%>
		
		<%-- DELETE_FEED --%>
		$(document).on("click", ".btn_delete", function(event){
			event.stopPropagation();
			console.log("피드 삭제 버튼");
			console.log( $(this).parent().parents(".feedForm").html());
			
			Swal.fire({
				  title: '글을 삭제하시겠습니까?',
				  text: "삭제하시면 다시 복구시킬 수 없습니다.",
				  width: 500,
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
					$(this).parent().parents(".feedForm").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
				}
			})
		});
		<%-- DELETE_FEED --%>
		
		<%-- ADD_FEED_HEART --%>
		$(document).on("click", ".feedLike", function(event){
			event.stopPropagation();
			console.log($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 좋아요");
			
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
							
							console.log("피드 좋아요 성공 : " + data);

							$(html).parents(".row").children(".likeCount").text(data);
							$(html).parent().html('<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" />');
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<%-- ADD_FEED_HEART --%>
		
		<%-- DELETE_FEED_HEART --%>
		$(document).on("click", ".feedDislike", function(event){
			event.stopPropagation();
			console.log($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 시러요");
			
			var html = $(this);
			var sessionUser = $(this).parents(".feedForm").children("input[name='userId']").val();
			
			$.ajax(
					{
						url : "/feedRest/json/deleteFeedHeart",
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
							
							console.log("피드 시러요 성공 : " + data);
							
							$(html).parents(".row").children(".likeCount").text(data);
							$(html).parent().html('<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" />');
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<%-- DELETE_FEED_HEART --%>
		
		<%-- CAROUSEL 침범 방지 --%>
		$(document).on("click", ".carousel-control", function(event) {
			event.stopPropagation();
		})
		<%-- CAROUSEL 침범 방지 --%>
		
		<%-- CALL REPORT --%>
		$(document).on("click", ".report", function(event) {
			event.stopPropagation();
			
			$(this).parent().parents(".feedForm").attr("method", "POST").attr("action", "/serviceCenter/addReport").submit();
		//	window.open('/serviceCenter/addReportView.jsp',  '_blank', 'width=200,height=200,resizeable,scrollbars');
		}) // .report evenet close
		<%-- CALL REPORT --%>
		
	})
	
	
	
	</script>

<!------------------------------ CSS ------------------------------>

<style type="text/css">

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
	
	
	
	.tab{
		display: block;
	}
	
	/* 탭 전체 스타일 position: fixed; */
	.tabs1 {
		position: fixed;
		width:200px;
		margin-bottom: 100px;
		background-color: #ffffff;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		display:inline-block;
		float: left;
		height:500px;
		border-radius: 15px;
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
		width: 100px !important;
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
		border-radius: 15px;
	}
	.tab_item-follow {
		width: 100px !important;
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
		border-radius: 15px;
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
		pacity: 0.75;
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
		position: fixed;
		display: none;
		height: 440px;
		clear: both;
		overflow: hidden;
		overflow-y: auto;
		scrollbar-width: none;
	    width: inherit;
	}
	.tab_content-follow {
		position: fixed;
		display: none;
		height: 440px;
		clear: both;
		overflow: hidden;
		overflow-y: auto;
		scrollbar-width: none;
		width: inherit;
	}
	
	/* 스크롤바 안보이기 */
	
	.tab_content::-webkit-scrollbar {
	    display: none; /* Chrome, Safari, Opera*/
	}
	
	.tab_content-follow::-webkit-scrollbar {
	    display: none; /* Chrome, Safari, Opera*/
	}
	
	#fll {
	    display: contents;
	}
	
	#fl {
	    display: contents;
	}

	.follow-section {
		margin: 0px;
	    display: flex;
	    justify-content: space-around;
	    align-items: center;
	    margin-bottom: 20px;
	}
	
	.following-section {
		margin: 0px;
	    display: flex;
	    justify-content: space-around;
	    align-items: center;
	    margin-bottom: 20px;
	}
	
	
</style>

<!------------------------------ CSS ------------------------------>


	
</head>

<body>

<h2>Logs</h2>
<div id="box"></div>

<h2>Push API</h2>
<p>
  새 창에서 <a href="/push" target="_blank">Push API</a> 를 호출하면 위 Logs에 수신된 알림이 출력된다.
</p>

	<jsp:include page="/toolbar.jsp" />

	<main role="main">
	
		<div id="intro-wrap" data-height="15">
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/);">
						<div class="caption">
							<h2>Feed</h2>
							<p>If you’re any good at all, you know you can be better.</p>
						</div><!-- caption -->					
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
		
		<div id="main">
		
			<section class="row section">
			<div class="container">
			
				<div class="row-content buffer even clear-after">
					<div class="column three">
						
						<button class="plain button purple searchPlace" onclick="window.open('http://localhost:5005/', '_blank', 'width=800, height=600, location =no,status=no, toolbar=no, scrollbars=no'); return false;">주변검색</button>						
						<%-- 검색 --%>
						<form id="searchForm" method="POST" action="/feed/getFeedList" accept-charset="euc-kr">
							
							<input type="text" id="searchKeyword" placeholder="검색" name="searchKeyword" value="${search.searchKeyword}">
							
						</form>
						<%-- 검색 --%>
						
					</div>
					
					<div class="column six">
						<div class="post-area clear-after addFeedForm">
							<form id="addForm">
							
							<c:if test="${!empty sessionScope.user}">
							
								<article role="main">
									<img class="sessionProfileImage" src="/resources/image/uploadFiles/${sessionScope.user.profileImage}" /><h4 style="vertical-align: top;">${sessionScope.user.nickName}</h4>
									
									<input class="plain button purple addFeed" value="Submit">
									
									<textarea id="summernote" name="fullContent"></textarea>
								</article>
								
							</c:if>
		
							<input type="hidden" name="openCondition" value="3">
							
							</form>
						</div>

						<c:set var="i" value="0"></c:set>
						<c:forEach var="feed" items="${feedList}">
							<c:set var="i" value="${i + 1}"></c:set>

							<c:if test="${fn:trim(feed.deleteCondition) eq '0' and fn:trim(feed.reportCondition) eq '0'}">

								<div class="showFeedForm shadow-lg">
									<form class="feedForm">

										<img src="/resources/image/uploadFiles/${feed.user.profileImage}" /><h4 style="vertical-align: text-bottom;">${feed.user.nickName}</h4>
										
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
									
										<div class="feedContent">
											${feed.content}
											
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
												
												<c:set var="text" value="${fn:split(feed.hashtag, '#')}"/>
												tag : 
												<c:forEach var="textValue" items="${text}" varStatus="varStatus">
													<span class="searchByHashtag">
														#${textValue}
													</span>
												</c:forEach>
												
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

										<!-- 피드 좋아요 댓글수 신고 -->
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
													<img src="/resources/image/uploadFiles/comment2.jpg" class="commentImg" aria-hidden="true" data-toggle="modal" data-target="#myModal"/>
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
										<!-- 피드 좋아요 댓글수 신고 -->

									</form>

								</div>

							</c:if>
							
						</c:forEach>

					</div>
					
					<div class="column three">
					
					<script type="text/javascript" charset="utf-8" src="/resources/javascript/myHome/followListForFeed.js"></script>
					
						<div class="tabs1">
							<input id="all-follow" type="radio" name="tab_item-follow" checked>
						    <label class="tab_item-follow" for="all-follow">Follow</label>
						    <input id="programming-follow" type="radio" name="tab_item-follow">
						    <label class="tab_item-following" for="programming-follow">Follower</label>
						    
							 <div class="tab_content-follow" id="all-follow_content" >
							     <div class="col-md-4" id="fll">
												 		<br />
								</div>
							</div>		
								 <div class="tab_content-follow" id="programming-follow_content">
							    	 <div class="col-md-4" id="fl">
												 		<br />
									</div>
								</div>
						</div>
						
					</div>
					
					<%-- 현재 페이지 --%>
					<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}">
					<input type="hidden" id="pageFlag" value=true>
					<%-- 현재 페이지 --%>
					
				</div>

			</div>
			</section>

		</div>

	</main>
	
	<!-- COMMENT Modal -->
	<div class="modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						title
					</h4>
				</div>
				<div class="modal-body">여기는 내용</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						Close
					</button>
					<button type="button" class="btn btn-primary">
						Save changes
					</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
