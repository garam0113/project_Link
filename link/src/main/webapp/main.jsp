<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="The Page Description">

<title>Feed</title>

<link href="/resources/css/feed/getFeedList.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<%-- BOOTSTRAP ICON --%>


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
	
	function fncAddReport(){
			
			var title = $("textarea[name=title]").val();		
			var content =$("textarea[name=content]").val();			
			var checkbox = $("input:checkbox[name=reportReason]:checked").length;
			
			if(title == null || title.length <1){
	          	Swal.fire({
	                icon: 'error',
	                title: '��怨� ��紐⑹�� ����������.',
	            });
					return;
				}
			if(content == null || content.length <1){
				Swal.fire({
	                icon: 'error',
	                title: '��怨� �댁�⑹�� ����������.',
	                text: '媛��ν�� ���명�� ���댁＜�몄��.',
	            });
					return;
				}
					
			if(checkbox==0){
				Swal.fire({
	                icon: 'error',
	                title: '��怨� �ъ���� ����������.',
	                text: '1媛� �댁�� �대┃�댁＜�몄��.',
	            });
				return;
			}
			
							
		  Swal.fire({
	          title: '��留�濡� ��怨�����寃��듬��源�?',
	          text: "�ㅼ�� ����由� �� ���듬����. ��以����몄��.",
	          icon: 'warning',
	          showCancelButton: true,
	          confirmButtonColor: '#3085d6',
	          cancelButtonColor: '#d33',
	          confirmButtonText: '��怨�',
	          cancelButtonText: '痍⑥��'
	      }).then((result) => {
	          if (result.isConfirmed) {
	             AddReport()
	          }
	      })
	 }
	 
	function AddReport(){	

		var sum = 0;
		var checkbox = $("input:checkbox[name=reportReason]:checked").length;
				
		for(var i =0 ; i<checkbox; i++){
			var sum2 = parseInt($("input:checkbox[name=reportReason]:checked").val());
			sum += sum+parseInt(sum2);			
		}

			
		var no = 0;	
			
		 if( $("#clubPostNo").val()!=null){
			 no = $("#clubPostNo").val();
		}else if($("#clubPostCommentNo").val()!=null){
			 no = $("#clubPostCommentNo").val();
		}else if($("#feedNo").val()!=null){
			 no = $("#feedNo").val();
		}else if($("#feedCommentNo").val()!=null){
			  no = $("#feedCommentNo").val();
		}
		
		var clubNo = 0;
		
		if( $("#clubNo2").val()!=null ){
			clubNo = $("#clubNo2").val();
		}else if( $("#clubNo3").val()!=null){
			clubNo = $("#clubNo3").val();
		}
		
		var clubPostNo = 0;
		
		
		if ( $("#clubPostNo2").val()!=0){
			
			clubPostNo = $("#clubPostNo2").val();
			if(clubPostNo == undefined){
				clubPostNo = 0;
			}
			
		}
		
	 	$.ajax({
		url  : "/serviceCenterRest/json/addReport?clubNo="+clubNo+"&clubPostNo="+clubPostNo,
 		//url  : "/serviceCenterRest/json/addReport?clubNo="+clubNo,
		contentType: 'application/json',
		method : "POST",
		dataType: "json",
		data : JSON.stringify ({
			"title":$("#title").val(),
			"content":$("#content").val(),
		<%--	"file": image, --%>
			"user1":$("#user1").val(),
			"user2":$("#user2").val(),
			"reportSource":$("#reportSource").val(),
			"reportReason": sum,
			"type": $("#type").val(),
			"no" :no,
				
		 success: function(){
			 window.close();
		 }
		}),
			
		})<!-- ajax ( ReportAdd) �� --> 
		

	} //funtion ��
		
	
	$(function(){
		
	<%-- �쇰�� �쇱���� ���대���� �몃��� --%>
		
		$(document).on("click", ".feedProfileImage", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).parents(".feedCover").siblings(".feedName").text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		$(document).on("click", ".feedName", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		<%-- �쇰�� �쇱���� ���대���� �몃��� --%>
		
		<%-- ���깆�� ���대���� �몃��� --%>
		
		$(document).on("click", ".sessionProfileImage", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).parents(".addFormImage").siblings(".addFormName").text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		$(document).on("click", ".addFormName", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		<%-- ���깆�� ���대���� �몃��� --%>
		
		<%-- ���� 紐⑤�ъ갹 --%>
		
		$(document).on("click", ".alarmImg", function(event) {
			var sessionUser = '${sessionScope.user.userId}';

			$.ajax(
					{
						url : "/serviceCenterRest/json/getPushList",
						method : "POST",
						data : JSON.stringify ({
							userId : sessionUser
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							var alarm = data.alarm;
							var alarmCount = data.alarmCount;
							var addHtml = "";
							
							$("#myModalAlarmLabel").html("��由� 媛��� : " + alarmCount);
							console.log(data)
							$.each(alarm, function(index, item){
								
								if(item.feed != null) {
									addHtml += 	"<div style='display: flex; justify-content: space-between;'>" + 
										"<div>��由� �댁��</div>" + 
										"<div><a href='/feed/getFeed?feedNo=" + item.feed.feedNo + "' />" + item.content + "</a></div>" + 
									"</div>"
								} else if(item.clubPost != null) {
									addHtml += 	"<div style='display: flex; justify-content: space-between;'>" + 
										"<div>��由� �댁��</div>" + 
										"<div><a href='/clubPost/getClubPost?clubPostNo=" + item.clubPost.clubPostNo + "' />" + item.content + "</a></div>" + 
									"</div>"
								} 
								
								
							}) // each close
							
							$(".alarmModalBody").html(addHtml);
							
						}
					}	
					
			) // ajax close
			
		})
		
		<%-- ���� 紐⑤�ъ갹 --%>
		
				
		<%-- SEARCH BY HASHTAG --%>
		
		$(document).on("click", ".searchByHashtag", function(event){
			event.stopPropagation();
			
			var searchKeyword = $(this).text().trim();
			$("#searchKeyword").val(searchKeyword);
			
			console.log($("#searchKeyword").val());
			$("#searchForm").attr("method", "POST").attr("action","/feed/getFeedList").submit();
		})
		
		
		<%-- 臾댄�� �ㅽ�щ· --%>
		
		$(window).scroll(function() {
			console.log(($("#pageFlag").val()));
			if($("#pageFlag").val() == "true") {
			
				if((Math.ceil($(window).scrollTop() + $(window).height())) >= ( $(document).height() )) {
					
					console.log("臾댄�� �ㅽ�щ·");
					
					var maxHeight = $(document).height();
					var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
					
					var sessionUser = $("#userId").val();
					
					console.log("��移��ㅼ���� : " + $("#searchKeyword").val());
					
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
										

										console.log("臾댄�� �ㅽ�щ· ��蹂� �깃났" + item.content + "\n");
										
										addHtml +=
										'<div class="showFeedForm">' +
										'<form class="feedForm">' +
										'<div class="feedHeader">' +
										'<div class="feedLeft">' + 
										'<div class="feedInner">' + 
										'<div class="feedCover">' +
										'<img class="feedProfileImage" src="/resources/image/uploadFiles/' + item.user.profileImage + '" />' + 
										'</div>' +
										'<div class="feedName">' +
										item.user.nickName +
										'</div>' +
										'</div>' + 
										'<div class="feedDate">'
										
										if(item.updateDate != null) {
											addHtml += formatDate(item.updateDate) + '</div></div>';
										} else {
											addHtml += formatDate(item.regDate) + '</div></div>';
										}
										
										
										if(sessionUser == item.user.userId) {
											addHtml += '<div class="udIcon">' +
														'<span class="glyphicon glyphicon-trash btn_delete" aria-hidden="true" ></span>' +
														'</div>'
										}
										
										addHtml += '</div>';
										
										if(item.content != null) {
											addHtml += '<div class="feedContent">' + 
														'<div class="feedLetter">' + 
														item.content +
														'</div>'
										}
										
										if(item.video != null) {
											addHtml += '<div class="feedVideo">' +
														'<iframe width="560" height="315" src="http://' + item.video + '"></iframe>' +
														'</div>'
										}
										
										
										if(item.image1 != null) {
											addHtml += '<div class="feedImage">' +
													'<div id="carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" class="carousel slide" data-ride="carousel">' +
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
													'</div></div>'
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
											'		<div class="col-xs-2"></div>'
										
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
													'<div class="col-xs-2 comment">' +
													'	<img src="/resources/image/uploadFiles/comment2.jpg" aria-hidden="true"/>' +
													'</div>' +
													'<div class="col-xs-1 commentCount">' +
														item.commentCount +
													'</div>' +
													'<div class="col-xs-2 report">' +
													'	<img src="/resources/image/uploadFiles/report.jpg" aria-hidden="true"/>' +
													'</div>' +
													'<div class="col-xs-2"></div>' +
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
		
		<%-- 臾댄�� �ㅽ�щ· --%>
		
		
		
		<%-- SUMMER NOTE WEB LOADING --%>
		$('#summernote').summernote({
			toolbar: [
                // [groupName, [list of button]]
                ['Insert', ['picture', 'video']],
            ],
            
            disableResizeEditor: true,
			height: 200,                 	// ������ ����
			minHeight: null,             	// 理��� ����
			maxHeight: null,             	// 理��� ����
			focus: true,                 	// ������ 濡��⑺�� �ъ빱�ㅻ�� 留�異�吏� �щ�
			placeholder: '�ㅻ�� ��猷⑤�� �대�ㅺ���?',			
			
			callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
           			// ���� ��濡���(�ㅼ���濡���瑜� ���� 諛�蹂듬Ц �ъ��)
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
					  title: '�댁�⑹�� ���ν���몄��',
					  width: 400,
					  icon: 'warning',
					  timer : 500,
					  showConfirmButton : false,
				})
			} else {
				$(this.form).attr("method", "POST").attr("accept-charset", "EUC-KR").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
				
				if(sock) {
					var Msg = "媛� �쇰��瑜� ���깊���듬����.";
					
					sock.send(Msg);
				}
			}
		});
		<%-- ADD_FEED --%>
		
		<%-- UPDATE_FEED --%>
		$(document).on("click", ".btn_update", function(event){
			event.stopPropagation();
			// console.log("�쇰�� ���� 踰���");
			// console.log($(this).parents(".feedForm").html())
			
			// $(this).parent().parents(".feedForm").attr("method", "GET").attr("action", "/feed/updateFeed").submit();
			
			alert($(this).parents(".feedHeader").siblings(".feedContent").find(".feedLetter").html().trim())
			
			$(".updateCover").html($(this).parents(".udIcon").siblings(".feedLeft").find(".feedCover").html().trim())
			$(".updateFormName").html($(this).parents(".udIcon").siblings(".feedLeft").find(".feedName").html().trim())
			$(".updateFeedDate").html($(this).parents(".udIcon").siblings(".feedLeft").find(".feedDate").html().trim())
			$("#updateFeedForm textarea").html($(this).parents(".feedHeader").siblings(".feedContent").html())
			
			
			$('#updateModal').modal();
		});
		
		$(document).on("click", ".btn_updateFeed", function(event) {
			console.log("������湲�");
			$("#updateFeedForm").attr("method", "GET").attr("accept-charset", "EUC-KR").attr("action", "/feed/updateFeed").submit();
		})
		<%-- UPDATE_FEED --%>
		
		<%-- DELETE_FEED --%>
		$(document).on("click", ".btn_delete", function(event){
			event.stopPropagation();
			console.log("�쇰�� ���� 踰���");
			console.log( $(this).parent().parents(".feedForm").html());
			
			Swal.fire({
				  title: '湲��� ��������寃��듬��源�?',
				  text: "��������硫� �ㅼ�� 蹂듦뎄���� �� ���듬����.",
				  width: 500,
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '����',
				  cancelButtonText: '痍⑥��'
			}).then((result) => {
				if (result.value) {
		       		//"����" 踰��쇱�� ������ �� ������ �댁�⑹�� �닿납�� �ｌ�댁＜硫� ����. 
					// $(".feedForm").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
					$(this).parent().parents(".feedForm").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
					
					if(sock) {
						var Msg = "媛� �쇰��瑜� �������듬����.";
						
						sock.send(Msg);
					}
				}
			})
		});
		<%-- DELETE_FEED --%>
		
		<%-- ADD_FEED_HEART --%>
		$(document).on("click", ".feedLike", function(event){
			event.stopPropagation();
			console.log($(this).parents(".feedForm").children("input[name='feedNo']").val() + "踰� 湲� 醫�����");
			
			var html = $(this);
			var sessionUser = $(this).parents(".feedForm").children("input[name='userId']").val();
			var feedNo = $(this).parents(".feedForm").children("input[name='feedNo']").val();
			var content = $(this).parents(".feedForm").children(".feedContent").text().trim();
			
			$.ajax(
					{
						url : "/feedRest/json/addFeedHeart",
						method : "POST",
						data : JSON.stringify ({
							source : 0,
							sourceNo : feedNo,
							userId : sessionUser
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							console.log("�쇰�� 醫����� �깃났 : " + data);

							$(html).parents(".row").children(".likeCount").text(data);
							$(html).parent().html('<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" />');
							
							if(sock) {
								var Msg = "媛� �쇰�� 醫�����瑜� �����듬����.";
								
								sock.send(Msg);
							}
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<%-- ADD_FEED_HEART --%>
		
		<%-- DELETE_FEED_HEART --%>
		$(document).on("click", ".feedDislike", function(event){
			event.stopPropagation();
			console.log($(this).parents(".feedForm").children("input[name='feedNo']").val() + "踰� 湲� ���ъ��");
			
			var html = $(this);
			var sessionUser = $(this).parents(".feedForm").children("input[name='userId']").val();
			var feedNo = $(this).parents(".feedForm").children("input[name='feedNo']").val();
			var content = $(this).parents(".feedForm").children(".feedContent").text().trim();
			
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
							
							console.log("�쇰�� ���ъ�� �깃났 : " + data);
							
							$(html).parents(".row").children(".likeCount").text(data);
							$(html).parent().html('<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" />');
							
							if(sock) {
								var Msg = "媛� �쇰�� 醫����� 痍⑥�� ���듬����.";
								
								sock.send(Msg);
							}
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<%-- DELETE_FEED_HEART --%>
		
		<%-- CAROUSEL 移⑤� 諛⑹� --%>
		$(document).on("click", ".carousel-control", function(event) {
			event.stopPropagation();
		})
		<%-- CAROUSEL 移⑤� 諛⑹� --%>
		
		<%-- CALL REPORT --%>
		$(document).on("click", ".report", function(event) {
			event.stopPropagation();
			
			// $(this).parent().parents(".feedForm").attr("method", "POST").attr("action", "/serviceCenter/addReport").submit();
			// $(".modal-content").load("/loginModal");
			var reportedUser = $(this).parents(".lastBar").siblings("input[name='user2']").val();
			var feedNo = $(this).parents(".lastBar").siblings("input[name='feedNo']").val();
			
			// $('#reportModal .modal-content').load("/serviceCenter/addReport?reportSource=3&user2=" + reportedUser + "&sourceNumber=" + feedNo);
			
			$("#user2").val(reportedUser);
			$("#feedNo").val(feedNo);
			
			$('#reportModal').modal();

			//	window.open('/serviceCenter/addReportView.jsp',  '_blank', 'width=200,height=200,resizeable,scrollbars');
		})	// .report evenet close
		
		
		$(document).on("click", "button:contains('�깅�')", function(event) {
			event.stopPropagation();
			
			fncAddReport();
		})
		
		<%-- CALL REPORT --%>
		
	})
	
	<%-- 異�泥� 紐⑥�� 蹂댁�닿린 --%>
	
	$(window).on("load", function() {
		
		$.ajax(
				{
					url : "/clubRest/json/getClubList",
					method : "POST",
					data : JSON.stringify ({
						currentPage: 1
					}),
					contentType: 'application/json',
					dataType : "json",
					header : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}, // header end
					
					success : function(data, status) {
						
						var addHtml = "";
						
						$.each(data.clubList, function(index, item){

							if(index > 4) {
								return false;
							}
							
							addHtml += "<div>" +
											"<a href='/club/getClub?clubNo=" +
												item.clubNo +
											"'>" + item.clubTitle + "</a>" +
										"</div>";
							
						}) // each close
						
						$(".clubRandomName").html(addHtml);
						
					} // success close
					
				} // ajax inner close
				
		) // ajax close
		
	})
	
	<%-- 異�泥� 紐⑥�� 蹂댁�닿린 --%>
	
	
	</script>

<!------------------------------ CSS ------------------------------>

<style type="text/css">
</style>

<!------------------------------ CSS ------------------------------>



</head>

<body>

	<jsp:include page="/toolbar.jsp" />

	<main role="main">

		<div id="main">

			<section class="row section">
				<div class="container">

					<div class="row-content buffer even clear-after">
						<div class="column three">
							<button class="btn btn-primary searchPlace" type="button"
								onclick="window.open('http://localhost:5005/', '_blank', 'width=800, height=600, location =no,status=no, toolbar=no, scrollbars=no'); return false;">二쇰�寃���</button>

							<%-- 寃��� --%>
							<form id="searchForm" method="POST" action="/feed/getFeedList"
								accept-charset="euc-kr">

								<input type="text" id="searchKeyword" placeholder="寃���"
									name="searchKeyword" value="${search.searchKeyword}">

							</form>
							<%-- 寃��� --%>

						</div>

						<div class="column six">
							<div class="post-area clear-after addFeedForm">
								<form id="addForm">

									<c:if test="${!empty sessionScope.user}">

										<article role="main">

											<div class="addHeader">
												<div class="addHeaderInner">
													<div class="addFormImage">
														<img class="sessionProfileImage"
															src="/resources/image/uploadFiles/${sessionScope.user.profileImage}" />
													</div>

													<div class="addFormName">
														${sessionScope.user.nickName}</div>
												</div>

												<div>
													<button class="btn btn-primary addFeed" type="button">SUBMIT</button>
												</div>

											</div>

											<div class="addBody">

												<textarea id="summernote" name="fullContent"></textarea>
											</div>

										</article>

									</c:if>

									<input type="hidden" name="openCondition" value="3">

								</form>
							</div>

							<c:set var="i" value="0"></c:set>
							<c:forEach var="feed" items="${feedList}">
								<c:set var="i" value="${i + 1}"></c:set>

								<c:if
									test="${fn:trim(feed.deleteCondition) eq '0' and fn:trim(feed.reportCondition) eq '0'}">

									<div class="showFeedForm">
										<form class="feedForm">
											<div class="feedHeader">
												<div class="feedLeft">
													<div class="feedInner">
														<div class="feedCover">
															<img class="feedProfileImage"
																src="/resources/image/uploadFiles/${feed.user.profileImage}" />
														</div>
														<div class="feedName">${feed.user.nickName}</div>
													</div>

													<div class="feedDate">
														<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
														<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
													</div>
												</div>

												<c:if test="${sessionScope.user.userId eq feed.user.userId}">

													<div class="udIcon">
														<%-- ���� 踰��� --%>
														<%-- <span class="glyphicon glyphicon-paperclip btn_update" aria-hidden="true"></span> --%>
														<%-- ���� 踰��� --%>

														<%-- ���� 踰��� --%>
														<span class="glyphicon glyphicon-trash btn_delete"
															aria-hidden="true"></span>
														<%-- ���� 踰��� --%>
													</div>

												</c:if>
											</div>
											<div class="feedContent">
												<div class="feedLetter">${feed.content}</div>

												<c:if test="${!empty feed.video}">
													<div class="feedVideo">
														<iframe width="560" height="315"
															src="http://${feed.video}"></iframe>
													</div>
												</c:if>

												<%-- �대�몄� --%>

												<c:if test="${!empty feed.image1}">
													<div class="feedImage">
														<div id="carousel-example-generic${i}"
															class="carousel slide" data-ride="carousel">
															<ol class="carousel-indicators">
																<li data-target="#carousel-example-generic${i}"
																	data-slide-to="0" class="active"></li>

																<c:if test="${!empty feed.image2}">
																	<li data-target="#carousel-example-generic${i}"
																		data-slide-to="1"></li>
																</c:if>
																<c:if test="${!empty feed.image3}">
																	<li data-target="#carousel-example-generic${i}"
																		data-slide-to="2"></li>
																</c:if>
																<c:if test="${!empty feed.image4}">
																	<li data-target="#carousel-example-generic${i}"
																		data-slide-to="3"></li>
																</c:if>
															</ol>

															<!-- Wrapper for slides -->
															<div class="carousel-inner" role="listbox">
																<div class="item active">
																	<img src="/resources/image/uploadFiles/${feed.image1}"
																		alt="${feed.image1}">
																</div>

																<c:if test="${!empty feed.image2}">
																	<div class="item">
																		<img src="/resources/image/uploadFiles/${feed.image2}"
																			alt="${feed.image2}">
																	</div>
																	<c:if test="${!empty feed.image3}">
																		<div class="item">
																			<img
																				src="/resources/image/uploadFiles/${feed.image3}"
																				alt="${feed.image3}">
																		</div>
																		<c:if test="${!empty feed.image4}">
																			<div class="item">
																				<img
																					src="/resources/image/uploadFiles/${feed.image4}"
																					alt="${feed.image4}">
																			</div>
																		</c:if>
																	</c:if>
																</c:if>
															</div>

															<!-- Controls -->
															<a class="left carousel-control carousel_prev"
																href="#carousel-example-generic${i}" role="button"
																data-slide="prev"> <span
																class="glyphicon glyphicon-chevron-left"
																aria-hidden="true"></span> <span class="sr-only">Previous</span>
															</a> <a class="right carousel-control carousel_next"
																href="#carousel-example-generic${i}" role="button"
																data-slide="next"> <span
																class="glyphicon glyphicon-chevron-right"
																aria-hidden="true"></span> <span class="sr-only">Next</span>
															</a>
														</div>
													</div>
												</c:if>

												<%-- �대�몄� --%>

											</div>

											<c:if test="${!empty feed.hashtag}">
												<div class="hashtagContent">

													<c:set var="text" value="${fn:split(feed.hashtag, '#')}" />
													tag :
													<c:forEach var="textValue" items="${text}"
														varStatus="varStatus">
														<span class="searchByHashtag"> #${textValue} </span>
													</c:forEach>

												</div>
											</c:if>

											<%-- �쇰�� ��湲� ��怨� --%>
											<input type="hidden" name="reportSource" value="3"> <input
												type="hidden" name="sourceNumber" value="${feed.feedNo}">
											<input type="hidden" name="user2" value="${feed.user.userId}">
											<%-- �쇰�� ��湲� ��怨� --%>

											<input type="hidden" name="source" value="0"> <input
												type="hidden" name="feedNo" value="${feed.feedNo}">
											<input type="hidden" id="userId" name="userId"
												value="${sessionScope.user.userId}"> <input
												type="hidden" name="openCondition" value="3">

											<!-- �쇰�� 醫����� ��湲��� ��怨� -->
											<section class="row section lastBar">
												<div class="row">
													<%-- �щ갚 --%>
													<div class="col-xs-2"></div>
													<%-- �щ갚 --%>

													<c:if test="${feed.checkHeart eq 0}">
														<div class="col-xs-2">
															<img class="feedLike"
																src="/resources/image/uploadFiles/no_heart.jpg"
																aria-hidden="true" />
														</div>
													</c:if>
													<c:if test="${feed.checkHeart ne 0}">
														<div class="col-xs-2">
															<img class="feedDislike"
																src="/resources/image/uploadFiles/heart.jpg"
																aria-hidden="true" />
														</div>
													</c:if>

													<div class="col-xs-1 likeCount">${feed.heartCount}</div>

													<div class="col-xs-2 comment">
														<img src="/resources/image/uploadFiles/comment2.jpg"
															class="commentImg" aria-hidden="true" data-toggle="modal"
															data-target="#myModal" />
													</div>

													<div class="col-xs-1 commentCount">
														${feed.commentCount}</div>

													<!-- ��怨� ���댁� -->
													<div class="col-xs-2 report">
														<img src="/resources/image/uploadFiles/report.jpg"
															aria-hidden="true" />
													</div>
													<!-- ��怨� ���댁� -->

													<%-- �щ갚 --%>
													<div class="col-xs-2"></div>
													<%-- �щ갚 --%>

												</div>
											</section>
											<!-- �쇰�� 醫����� ��湲��� ��怨� -->

										</form>

									</div>

								</c:if>

							</c:forEach>

						</div>

						<div class="column three">

							<script type="text/javascript" charset="utf-8"
								src="/resources/javascript/myHome/followListForFeed.js"></script>

							<div class="tabs1">
								<input id="all-follow" type="radio" name="tab_item-follow" checked>
								<label class="tab_item-follow" for="all-follow">��濡���</label>
								
								<input id="programming-follow" type="radio" name="tab_item-follow">
								<label class="tab_item-following" for="programming-follow">��濡���</label>

								<div class="tab_content-follow" id="all-follow_content">
									<div class="col-md-4" id="fll">
										<br />
									</div>
								</div>
								<div class="tab_content-follow" id="programming-follow_content">
									<div class="col-md-4" id="fl">
										<br />
									</div>
								</div>
								<div class="clubRandomCover" >
								
									<div class="clubRandom">
									
										<div class="clubRandomTitle">
										理��� 紐⑥��
										</div>
									
										<div class="clubRandomName">
										
										</div>
									</div>
								</div>
								
							</div>
							
								
							
						</div>

						<%-- ���� ���댁� --%>
						<input type="hidden" id="currentPage" name="currentPage"
							value="${resultPage.currentPage}"> <input type="hidden"
							id="pageFlag" value=true>
						<%-- ���� ���댁� --%>

					</div>

				</div>
			</section>

		</div>

		<!-- COMMENT Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalCommentLabel">title</h4>
					</div>
					<div class="modal-body">�ш린�� �댁��</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>


		<!-- ��由� Modal -->
		<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalAlarmLabel">��由�</h4>
					</div>
					<div class="modal-body alarmModalBody">�ш린�� ����紐⑤��</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- ��怨� Modal -->
		<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<!-- form Start /////////////////////////////////////-->
					<form class="form-horizontal" enctype="multipart/form-data" id="reportForm">
						
						<div class="reportTitleCover">
							<div class="reportTitleTitle">
								��紐�
							</div>
							<div class="reportTitle">
							
								<textarea class="title" id="title" name="title" maxlength="80" placeholder="��怨� ��紐⑹�� ���ν�댁＜�몄��"></textarea>

							</div>

							<!--  ��硫닿뎄�� div end /////////////////////////////////////-->

						</div>
						
						<div class="reportContentCover">
							<div class="reportContentTitle">
								�댁��
							</div>
							
							<div class="reportContent">
								<textarea class="content" id="content" name="content" placeholder="��怨� �댁�⑹�� ���ν�댁＜�몄��." maxlength="500"></textarea>
							</div>
						</div>
						
						<div class="reportSourceDiv">
							��怨�諛��� ID
							<input type="text" class="reportSourceDivId" id="user2" name="user2" value="" readonly />
							��怨� 異�泥�
							<input type="text" class="reportSourceDivSource" value="�쇰��" disabled />
						</div>
						
						<input type="hidden" name="type" id="type" value="1">
						<input type="hidden" name="user1" id="user1" value="${sessionScope.user.userId}">
						<input type="hidden" id="reportSource" name="reportSource" value="3">
						<input type="hidden" name="no" id="feedNo" value="" />

						<div class="reportModalReason">

							<input type="checkbox" id="����" name="reportReason" value="1" >
								����
							<input type="checkbox" id="愿�怨�" name="reportReason" value="2" >
								愿�怨�
							<input type="checkbox" id="湲고��" name="reportReason" value="4" >
								湲고��
							<input type="checkbox" id="�깆��" name="reportReason" value="8" >
							�깆���� 諛���

						</div>
						
					</form>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Close
						</button>
						
						<button type="button" class="btn btn-default add add5">�깅�</button>
					</div>
				</div>
			</div>
		</div>

	</main>

</body>
</html>
<%-- =======
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html> --%>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="The Page Description">

<title>Feed</title>

<link href="/resources/css/feed/getFeedList.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<%-- BOOTSTRAP ICON --%>


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
	
	function fncAddReport(){
			
			var title = $("textarea[name=title]").val();		
			var content =$("textarea[name=content]").val();			
			var checkbox = $("input:checkbox[name=reportReason]:checked").length;
			
			if(title == null || title.length <1){
	          	Swal.fire({
	                icon: 'error',
	                title: '��怨� ��紐⑹�� ����������.',
	            });
					return;
				}
			if(content == null || content.length <1){
				Swal.fire({
	                icon: 'error',
	                title: '��怨� �댁�⑹�� ����������.',
	                text: '媛��ν�� ���명�� ���댁＜�몄��.',
	            });
					return;
				}
					
			if(checkbox==0){
				Swal.fire({
	                icon: 'error',
	                title: '��怨� �ъ���� ����������.',
	                text: '1媛� �댁�� �대┃�댁＜�몄��.',
	            });
				return;
			}
			
							
		  Swal.fire({
	          title: '��留�濡� ��怨�����寃��듬��源�?',
	          text: "�ㅼ�� ����由� �� ���듬����. ��以����몄��.",
	          icon: 'warning',
	          showCancelButton: true,
	          confirmButtonColor: '#3085d6',
	          cancelButtonColor: '#d33',
	          confirmButtonText: '��怨�',
	          cancelButtonText: '痍⑥��'
	      }).then((result) => {
	          if (result.isConfirmed) {
	             AddReport()
	          }
	      })
	 }
	 
	function AddReport(){	

		var sum = 0;
		var checkbox = $("input:checkbox[name=reportReason]:checked").length;
				
		for(var i =0 ; i<checkbox; i++){
			var sum2 = parseInt($("input:checkbox[name=reportReason]:checked").val());
			sum += sum+parseInt(sum2);			
		}

			
		var no = 0;	
			
		 if( $("#clubPostNo").val()!=null){
			 no = $("#clubPostNo").val();
		}else if($("#clubPostCommentNo").val()!=null){
			 no = $("#clubPostCommentNo").val();
		}else if($("#feedNo").val()!=null){
			 no = $("#feedNo").val();
		}else if($("#feedCommentNo").val()!=null){
			  no = $("#feedCommentNo").val();
		}
		
		var clubNo = 0;
		
		if( $("#clubNo2").val()!=null ){
			clubNo = $("#clubNo2").val();
		}else if( $("#clubNo3").val()!=null){
			clubNo = $("#clubNo3").val();
		}
		
		var clubPostNo = 0;
		
		
		if ( $("#clubPostNo2").val()!=0){
			
			clubPostNo = $("#clubPostNo2").val();
			if(clubPostNo == undefined){
				clubPostNo = 0;
			}
			
		}
		
	 	$.ajax({
		url  : "/serviceCenterRest/json/addReport?clubNo="+clubNo+"&clubPostNo="+clubPostNo,
 		//url  : "/serviceCenterRest/json/addReport?clubNo="+clubNo,
		contentType: 'application/json',
		method : "POST",
		dataType: "json",
		data : JSON.stringify ({
			"title":$("#title").val(),
			"content":$("#content").val(),
		<%--	"file": image, --%>
			"user1":$("#user1").val(),
			"user2":$("#user2").val(),
			"reportSource":$("#reportSource").val(),
			"reportReason": sum,
			"type": $("#type").val(),
			"no" :no,
				
		 success: function(){
			 window.close();
		 }
		}),
			
		})<!-- ajax ( ReportAdd) �� --> 
		

	} //funtion ��
		
	
	$(function(){
		
	<%-- �쇰�� �쇱���� ���대���� �몃��� --%>
		
		$(document).on("click", ".feedProfileImage", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).parents(".feedCover").siblings(".feedName").text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		$(document).on("click", ".feedName", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		<%-- �쇰�� �쇱���� ���대���� �몃��� --%>
		
		<%-- ���깆�� ���대���� �몃��� --%>
		
		$(document).on("click", ".sessionProfileImage", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).parents(".addFormImage").siblings(".addFormName").text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		$(document).on("click", ".addFormName", function(event) {
			
			if('${sessionScope.user.userId}' == null) {
				return false;
			}
			
			$.ajax (
						{
							url : "/userRest/json/getUser",
							method : "POST",
							data : JSON.stringify ({
								nickName : $(this).text().trim()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								if(data.userId == '${sessionScope.user.userId}'){
									location.href = "/myHome/getMyHome?userId=" + data.userId;
								} else {
									location.href = "/myHome/getYourHome?userId=" + data.userId;
								}
								
							}
						}
					
					)
			
		})
		
		<%-- ���깆�� ���대���� �몃��� --%>
		
		<%-- ���� 紐⑤�ъ갹 --%>
		
		$(document).on("click", ".alarmImg", function(event) {
			var sessionUser = '${sessionScope.user.userId}';

			$.ajax(
					{
						url : "/serviceCenterRest/json/getPushList",
						method : "POST",
						data : JSON.stringify ({
							userId : sessionUser
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							var alarm = data.alarm;
							var alarmCount = data.alarmCount;
							var addHtml = "";
							
							$("#myModalAlarmLabel").html("��由� 媛��� : " + alarmCount);
							console.log(data)
							$.each(alarm, function(index, item){
								
								if(item.feed != null) {
									addHtml += 	"<div style='display: flex; justify-content: space-between;'>" + 
										"<div>��由� �댁��</div>" + 
										"<div><a href='/feed/getFeed?feedNo=" + item.feed.feedNo + "' />" + item.content + "</a></div>" + 
									"</div>"
								} else if(item.clubPost != null) {
									addHtml += 	"<div style='display: flex; justify-content: space-between;'>" + 
										"<div>��由� �댁��</div>" + 
										"<div><a href='/clubPost/getClubPost?clubPostNo=" + item.clubPost.clubPostNo + "' />" + item.content + "</a></div>" + 
									"</div>"
								} 
								
								
							}) // each close
							
							$(".alarmModalBody").html(addHtml);
							
						}
					}	
					
			) // ajax close
			
		})
		
		<%-- ���� 紐⑤�ъ갹 --%>
		
				
		<%-- SEARCH BY HASHTAG --%>
		
		$(document).on("click", ".searchByHashtag", function(event){
			event.stopPropagation();
			
			var searchKeyword = $(this).text().trim();
			$("#searchKeyword").val(searchKeyword);
			
			console.log($("#searchKeyword").val());
			$("#searchForm").attr("method", "POST").attr("action","/feed/getFeedList").submit();
		})
		
		
		<%-- 臾댄�� �ㅽ�щ· --%>
		
		$(window).scroll(function() {
			console.log(($("#pageFlag").val()));
			if($("#pageFlag").val() == "true") {
			
				if((Math.ceil($(window).scrollTop() + $(window).height())) >= ( $(document).height() )) {
					
					console.log("臾댄�� �ㅽ�щ·");
					
					var maxHeight = $(document).height();
					var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
					
					var sessionUser = $("#userId").val();
					
					console.log("��移��ㅼ���� : " + $("#searchKeyword").val());
					
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
										

										console.log("臾댄�� �ㅽ�щ· ��蹂� �깃났" + item.content + "\n");
										
										addHtml +=
										'<div class="showFeedForm">' +
										'<form class="feedForm">' +
										'<div class="feedHeader">' +
										'<div class="feedLeft">' + 
										'<div class="feedInner">' + 
										'<div class="feedCover">' +
										'<img class="feedProfileImage" src="/resources/image/uploadFiles/' + item.user.profileImage + '" />' + 
										'</div>' +
										'<div class="feedName">' +
										item.user.nickName +
										'</div>' +
										'</div>' + 
										'<div class="feedDate">'
										
										if(item.updateDate != null) {
											addHtml += formatDate(item.updateDate) + '</div></div>';
										} else {
											addHtml += formatDate(item.regDate) + '</div></div>';
										}
										
										
										if(sessionUser == item.user.userId) {
											addHtml += '<div class="udIcon">' +
														'<span class="glyphicon glyphicon-trash btn_delete" aria-hidden="true" ></span>' +
														'</div>'
										}
										
										addHtml += '</div>';
										
										if(item.content != null) {
											addHtml += '<div class="feedContent">' + 
														'<div class="feedLetter">' + 
														item.content +
														'</div>'
										}
										
										if(item.video != null) {
											addHtml += '<div class="feedVideo">' +
														'<iframe width="560" height="315" src="http://' + item.video + '"></iframe>' +
														'</div>'
										}
										
										
										if(item.image1 != null) {
											addHtml += '<div class="feedImage">' +
													'<div id="carousel-example-generic' + index + 1 + (parseInt($("#currentPage").val()) * 10) + '" class="carousel slide" data-ride="carousel">' +
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
													'</div></div>'
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
											'		<div class="col-xs-2"></div>'
										
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
													'<div class="col-xs-2 comment">' +
													'	<img src="/resources/image/uploadFiles/comment2.jpg" aria-hidden="true"/>' +
													'</div>' +
													'<div class="col-xs-1 commentCount">' +
														item.commentCount +
													'</div>' +
													'<div class="col-xs-2 report">' +
													'	<img src="/resources/image/uploadFiles/report.jpg" aria-hidden="true"/>' +
													'</div>' +
													'<div class="col-xs-2"></div>' +
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
		
		<%-- 臾댄�� �ㅽ�щ· --%>
		
		
		
		<%-- SUMMER NOTE WEB LOADING --%>
		$('#summernote').summernote({
			toolbar: [
                // [groupName, [list of button]]
                ['Insert', ['picture', 'video']],
            ],
            
            disableResizeEditor: true,
			height: 200,                 	// ������ ����
			minHeight: null,             	// 理��� ����
			maxHeight: null,             	// 理��� ����
			focus: true,                 	// ������ 濡��⑺�� �ъ빱�ㅻ�� 留�異�吏� �щ�
			placeholder: '�ㅻ�� ��猷⑤�� �대�ㅺ���?',			
			
			callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
           			// ���� ��濡���(�ㅼ���濡���瑜� ���� 諛�蹂듬Ц �ъ��)
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
					  title: '�댁�⑹�� ���ν���몄��',
					  width: 400,
					  icon: 'warning',
					  timer : 500,
					  showConfirmButton : false,
				})
			} else {
				$(this.form).attr("method", "POST").attr("accept-charset", "EUC-KR").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
				
				if(sock) {
					var Msg = "媛� �쇰��瑜� ���깊���듬����.";
					
					sock.send(Msg);
				}
			}
		});
		<%-- ADD_FEED --%>
		
		<%-- UPDATE_FEED --%>
		$(document).on("click", ".btn_update", function(event){
			event.stopPropagation();
			// console.log("�쇰�� ���� 踰���");
			// console.log($(this).parents(".feedForm").html())
			
			// $(this).parent().parents(".feedForm").attr("method", "GET").attr("action", "/feed/updateFeed").submit();
			
			alert($(this).parents(".feedHeader").siblings(".feedContent").find(".feedLetter").html().trim())
			
			$(".updateCover").html($(this).parents(".udIcon").siblings(".feedLeft").find(".feedCover").html().trim())
			$(".updateFormName").html($(this).parents(".udIcon").siblings(".feedLeft").find(".feedName").html().trim())
			$(".updateFeedDate").html($(this).parents(".udIcon").siblings(".feedLeft").find(".feedDate").html().trim())
			$("#updateFeedForm textarea").html($(this).parents(".feedHeader").siblings(".feedContent").html())
			
			
			$('#updateModal').modal();
		});
		
		$(document).on("click", ".btn_updateFeed", function(event) {
			console.log("������湲�");
			$("#updateFeedForm").attr("method", "GET").attr("accept-charset", "EUC-KR").attr("action", "/feed/updateFeed").submit();
		})
		<%-- UPDATE_FEED --%>
		
		<%-- DELETE_FEED --%>
		$(document).on("click", ".btn_delete", function(event){
			event.stopPropagation();
			console.log("�쇰�� ���� 踰���");
			console.log( $(this).parent().parents(".feedForm").html());
			
			Swal.fire({
				  title: '湲��� ��������寃��듬��源�?',
				  text: "��������硫� �ㅼ�� 蹂듦뎄���� �� ���듬����.",
				  width: 500,
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '����',
				  cancelButtonText: '痍⑥��'
			}).then((result) => {
				if (result.value) {
		       		//"����" 踰��쇱�� ������ �� ������ �댁�⑹�� �닿납�� �ｌ�댁＜硫� ����. 
					// $(".feedForm").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
					$(this).parent().parents(".feedForm").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
					
					if(sock) {
						var Msg = "媛� �쇰��瑜� �������듬����.";
						
						sock.send(Msg);
					}
				}
			})
		});
		<%-- DELETE_FEED --%>
		
		<%-- ADD_FEED_HEART --%>
		$(document).on("click", ".feedLike", function(event){
			event.stopPropagation();
			console.log($(this).parents(".feedForm").children("input[name='feedNo']").val() + "踰� 湲� 醫�����");
			
			var html = $(this);
			var sessionUser = $(this).parents(".feedForm").children("input[name='userId']").val();
			var feedNo = $(this).parents(".feedForm").children("input[name='feedNo']").val();
			var content = $(this).parents(".feedForm").children(".feedContent").text().trim();
			
			$.ajax(
					{
						url : "/feedRest/json/addFeedHeart",
						method : "POST",
						data : JSON.stringify ({
							source : 0,
							sourceNo : feedNo,
							userId : sessionUser
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							console.log("�쇰�� 醫����� �깃났 : " + data);

							$(html).parents(".row").children(".likeCount").text(data);
							$(html).parent().html('<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" />');
							
							if(sock) {
								var Msg = "媛� �쇰�� 醫�����瑜� �����듬����.";
								
								sock.send(Msg);
							}
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<%-- ADD_FEED_HEART --%>
		
		<%-- DELETE_FEED_HEART --%>
		$(document).on("click", ".feedDislike", function(event){
			event.stopPropagation();
			console.log($(this).parents(".feedForm").children("input[name='feedNo']").val() + "踰� 湲� ���ъ��");
			
			var html = $(this);
			var sessionUser = $(this).parents(".feedForm").children("input[name='userId']").val();
			var feedNo = $(this).parents(".feedForm").children("input[name='feedNo']").val();
			var content = $(this).parents(".feedForm").children(".feedContent").text().trim();
			
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
							
							console.log("�쇰�� ���ъ�� �깃났 : " + data);
							
							$(html).parents(".row").children(".likeCount").text(data);
							$(html).parent().html('<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" />');
							
							if(sock) {
								var Msg = "媛� �쇰�� 醫����� 痍⑥�� ���듬����.";
								
								sock.send(Msg);
							}
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<%-- DELETE_FEED_HEART --%>
		
		<%-- CAROUSEL 移⑤� 諛⑹� --%>
		$(document).on("click", ".carousel-control", function(event) {
			event.stopPropagation();
		})
		<%-- CAROUSEL 移⑤� 諛⑹� --%>
		
		<%-- CALL REPORT --%>
		$(document).on("click", ".report", function(event) {
			event.stopPropagation();
			
			// $(this).parent().parents(".feedForm").attr("method", "POST").attr("action", "/serviceCenter/addReport").submit();
			// $(".modal-content").load("/loginModal");
			var reportedUser = $(this).parents(".lastBar").siblings("input[name='user2']").val();
			var feedNo = $(this).parents(".lastBar").siblings("input[name='feedNo']").val();
			
			// $('#reportModal .modal-content').load("/serviceCenter/addReport?reportSource=3&user2=" + reportedUser + "&sourceNumber=" + feedNo);
			
			$("#user2").val(reportedUser);
			$("#feedNo").val(feedNo);
			
			$('#reportModal').modal();

			//	window.open('/serviceCenter/addReportView.jsp',  '_blank', 'width=200,height=200,resizeable,scrollbars');
		})	// .report evenet close
		
		
		$(document).on("click", "button:contains('�깅�')", function(event) {
			event.stopPropagation();
			
			fncAddReport();
		})
		
		<%-- CALL REPORT --%>
		
	})
	
	<%-- 異�泥� 紐⑥�� 蹂댁�닿린 --%>
	
	$(window).on("load", function() {
		
		$.ajax(
				{
					url : "/clubRest/json/getClubList",
					method : "POST",
					data : JSON.stringify ({
						currentPage: 1
					}),
					contentType: 'application/json',
					dataType : "json",
					header : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}, // header end
					
					success : function(data, status) {
						
						var addHtml = "";
						
						$.each(data.clubList, function(index, item){

							if(index > 4) {
								return false;
							}
							
							addHtml += "<div>" +
											"<a href='/club/getClub?clubNo=" +
												item.clubNo +
											"'>" + item.clubTitle + "</a>" +
										"</div>";
							
						}) // each close
						
						$(".clubRandomName").html(addHtml);
						
					} // success close
					
				} // ajax inner close
				
		) // ajax close
		
	})
	
	<%-- 異�泥� 紐⑥�� 蹂댁�닿린 --%>
	
	
	</script>

<!------------------------------ CSS ------------------------------>

<style type="text/css">
</style>

<!------------------------------ CSS ------------------------------>



</head>

<body>

	<jsp:include page="/toolbar.jsp" />

	<main role="main">

		<div id="main">

			<section class="row section">
				<div class="container">

					<div class="row-content buffer even clear-after">
						<div class="column three">
							<button class="btn btn-primary searchPlace" type="button"
								onclick="window.open('http://localhost:5005/', '_blank', 'width=800, height=600, location =no,status=no, toolbar=no, scrollbars=no'); return false;">二쇰�寃���</button>

							<%-- 寃��� --%>
							<form id="searchForm" method="POST" action="/feed/getFeedList"
								accept-charset="euc-kr">

								<input type="text" id="searchKeyword" placeholder="寃���"
									name="searchKeyword" value="${search.searchKeyword}">

							</form>
							<%-- 寃��� --%>
							<jsp:include page="serviceCenter/getFestival.jsp" />
						</div>

						<div class="column six">
							<div class="post-area clear-after addFeedForm">
								<form id="addForm">

									<c:if test="${!empty sessionScope.user}">

										<article role="main">

											<div class="addHeader">
												<div class="addHeaderInner">
													<div class="addFormImage">
														<img class="sessionProfileImage"
															src="/resources/image/uploadFiles/${sessionScope.user.profileImage}" />
													</div>

													<div class="addFormName">
														${sessionScope.user.nickName}</div>
												</div>

												<div>
													<button class="btn btn-primary addFeed" type="button">SUBMIT</button>
												</div>

											</div>

											<div class="addBody">

												<textarea id="summernote" name="fullContent"></textarea>
											</div>

										</article>

									</c:if>

									<input type="hidden" name="openCondition" value="3">

								</form>
							</div>

							<c:set var="i" value="0"></c:set>
							<c:forEach var="feed" items="${feedList}">
								<c:set var="i" value="${i + 1}"></c:set>

								<c:if
									test="${fn:trim(feed.deleteCondition) eq '0' and fn:trim(feed.reportCondition) eq '0'}">

									<div class="showFeedForm">
										<form class="feedForm">
											<div class="feedHeader">
												<div class="feedLeft">
													<div class="feedInner">
														<div class="feedCover">
															<img class="feedProfileImage"
																src="/resources/image/uploadFiles/${feed.user.profileImage}" />
														</div>
														<div class="feedName">${feed.user.nickName}</div>
													</div>

													<div class="feedDate">
														<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
														<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
													</div>
												</div>

												<c:if test="${sessionScope.user.userId eq feed.user.userId}">

													<div class="udIcon">
														<%-- ���� 踰��� --%>
														<%-- <span class="glyphicon glyphicon-paperclip btn_update" aria-hidden="true"></span> --%>
														<%-- ���� 踰��� --%>

														<%-- ���� 踰��� --%>
														<span class="glyphicon glyphicon-trash btn_delete"
															aria-hidden="true"></span>
														<%-- ���� 踰��� --%>
													</div>

												</c:if>
											</div>
											<div class="feedContent">
												<div class="feedLetter">${feed.content}</div>

												<c:if test="${!empty feed.video}">
													<div class="feedVideo">
														<iframe width="560" height="315"
															src="http://${feed.video}"></iframe>
													</div>
												</c:if>

												<%-- �대�몄� --%>

												<c:if test="${!empty feed.image1}">
													<div class="feedImage">
														<div id="carousel-example-generic${i}"
															class="carousel slide" data-ride="carousel">
															<ol class="carousel-indicators">
																<li data-target="#carousel-example-generic${i}"
																	data-slide-to="0" class="active"></li>

																<c:if test="${!empty feed.image2}">
																	<li data-target="#carousel-example-generic${i}"
																		data-slide-to="1"></li>
																</c:if>
																<c:if test="${!empty feed.image3}">
																	<li data-target="#carousel-example-generic${i}"
																		data-slide-to="2"></li>
																</c:if>
																<c:if test="${!empty feed.image4}">
																	<li data-target="#carousel-example-generic${i}"
																		data-slide-to="3"></li>
																</c:if>
															</ol>

															<!-- Wrapper for slides -->
															<div class="carousel-inner" role="listbox">
																<div class="item active">
																	<img src="/resources/image/uploadFiles/${feed.image1}"
																		alt="${feed.image1}">
																</div>

																<c:if test="${!empty feed.image2}">
																	<div class="item">
																		<img src="/resources/image/uploadFiles/${feed.image2}"
																			alt="${feed.image2}">
																	</div>
																	<c:if test="${!empty feed.image3}">
																		<div class="item">
																			<img
																				src="/resources/image/uploadFiles/${feed.image3}"
																				alt="${feed.image3}">
																		</div>
																		<c:if test="${!empty feed.image4}">
																			<div class="item">
																				<img
																					src="/resources/image/uploadFiles/${feed.image4}"
																					alt="${feed.image4}">
																			</div>
																		</c:if>
																	</c:if>
																</c:if>
															</div>

															<!-- Controls -->
															<a class="left carousel-control carousel_prev"
																href="#carousel-example-generic${i}" role="button"
																data-slide="prev"> <span
																class="glyphicon glyphicon-chevron-left"
																aria-hidden="true"></span> <span class="sr-only">Previous</span>
															</a> <a class="right carousel-control carousel_next"
																href="#carousel-example-generic${i}" role="button"
																data-slide="next"> <span
																class="glyphicon glyphicon-chevron-right"
																aria-hidden="true"></span> <span class="sr-only">Next</span>
															</a>
														</div>
													</div>
												</c:if>

												<%-- �대�몄� --%>

											</div>

											<c:if test="${!empty feed.hashtag}">
												<div class="hashtagContent">

													<c:set var="text" value="${fn:split(feed.hashtag, '#')}" />
													tag :
													<c:forEach var="textValue" items="${text}"
														varStatus="varStatus">
														<span class="searchByHashtag"> #${textValue} </span>
													</c:forEach>

												</div>
											</c:if>

											<%-- �쇰�� ��湲� ��怨� --%>
											<input type="hidden" name="reportSource" value="3"> <input
												type="hidden" name="sourceNumber" value="${feed.feedNo}">
											<input type="hidden" name="user2" value="${feed.user.userId}">
											<%-- �쇰�� ��湲� ��怨� --%>

											<input type="hidden" name="source" value="0"> <input
												type="hidden" name="feedNo" value="${feed.feedNo}">
											<input type="hidden" id="userId" name="userId"
												value="${sessionScope.user.userId}"> <input
												type="hidden" name="openCondition" value="3">

											<!-- �쇰�� 醫����� ��湲��� ��怨� -->
											<section class="row section lastBar">
												<div class="row">
													<%-- �щ갚 --%>
													<div class="col-xs-2"></div>
													<%-- �щ갚 --%>

													<c:if test="${feed.checkHeart eq 0}">
														<div class="col-xs-2">
															<img class="feedLike"
																src="/resources/image/uploadFiles/no_heart.jpg"
																aria-hidden="true" />
														</div>
													</c:if>
													<c:if test="${feed.checkHeart ne 0}">
														<div class="col-xs-2">
															<img class="feedDislike"
																src="/resources/image/uploadFiles/heart.jpg"
																aria-hidden="true" />
														</div>
													</c:if>

													<div class="col-xs-1 likeCount">${feed.heartCount}</div>

													<div class="col-xs-2 comment">
														<img src="/resources/image/uploadFiles/comment2.jpg"
															class="commentImg" aria-hidden="true" data-toggle="modal"
															data-target="#myModal" />
													</div>

													<div class="col-xs-1 commentCount">
														${feed.commentCount}</div>

													<!-- ��怨� ���댁� -->
													<div class="col-xs-2 report">
														<img src="/resources/image/uploadFiles/report.jpg"
															aria-hidden="true" />
													</div>
													<!-- ��怨� ���댁� -->

													<%-- �щ갚 --%>
													<div class="col-xs-2"></div>
													<%-- �щ갚 --%>

												</div>
											</section>
											<!-- �쇰�� 醫����� ��湲��� ��怨� -->

										</form>

									</div>

								</c:if>

							</c:forEach>

						</div>

						<div class="column three">

							<script type="text/javascript" charset="utf-8"
								src="/resources/javascript/myHome/followListForFeed.js"></script>

							<div class="tabs1">
								<input id="all-follow" type="radio" name="tab_item-follow" checked>
								<label class="tab_item-follow" for="all-follow">��濡���</label>
								
								<input id="programming-follow" type="radio" name="tab_item-follow">
								<label class="tab_item-following" for="programming-follow">��濡���</label>

								<div class="tab_content-follow" id="all-follow_content">
									<div class="col-md-4" id="fll">
										<br />
									</div>
								</div>
								<div class="tab_content-follow" id="programming-follow_content">
									<div class="col-md-4" id="fl">
										<br />
									</div>
								</div>
								<div class="clubRandomCover" >
								
									<div class="clubRandom">
									
										<div class="clubRandomTitle">
											理��� 紐⑥��
										</div>
									
										<div class="clubRandomName">
										
										</div>
									</div>
								</div>
								
							</div>
							
								
							
						</div>

						<%-- ���� ���댁� --%>
						<input type="hidden" id="currentPage" name="currentPage"
							value="${resultPage.currentPage}"> <input type="hidden"
							id="pageFlag" value=true>
						<%-- ���� ���댁� --%>

					</div>

				</div>
			</section>

		</div>

		<!-- COMMENT Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalCommentLabel">title</h4>
					</div>
					<div class="modal-body">�ш린�� �댁��</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>


		<!-- ��由� Modal -->
		<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalAlarmLabel">��由�</h4>
					</div>
					<div class="modal-body alarmModalBody">�ш린�� ����紐⑤��</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- ��怨� Modal -->
		<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<!-- form Start /////////////////////////////////////-->
					<form class="form-horizontal" enctype="multipart/form-data" id="reportForm">
						
						<div class="reportTitleCover">
							<div class="reportTitleTitle">
								��紐�
							</div>
							<div class="reportTitle">
							
								<textarea class="title" id="title" name="title" maxlength="80" placeholder="��怨� ��紐⑹�� ���ν�댁＜�몄��"></textarea>

							</div>

							<!--  ��硫닿뎄�� div end /////////////////////////////////////-->

						</div>
						
						<div class="reportContentCover">
							<div class="reportContentTitle">
								�댁��
							</div>
							
							<div class="reportContent">
								<textarea class="content" id="content" name="content" placeholder="��怨� �댁�⑹�� ���ν�댁＜�몄��." maxlength="500"></textarea>
							</div>
						</div>
						
						<div class="reportSourceDiv">
							��怨�諛��� ID
							<input type="text" class="reportSourceDivId" id="user2" name="user2" value="" readonly />
							��怨� 異�泥�
							<input type="text" class="reportSourceDivSource" value="�쇰��" disabled />
						</div>
						
						<input type="hidden" name="type" id="type" value="1">
						<input type="hidden" name="user1" id="user1" value="${sessionScope.user.userId}">
						<input type="hidden" id="reportSource" name="reportSource" value="3">
						<input type="hidden" name="no" id="feedNo" value="" />

						<div class="reportModalReason">

							<input type="checkbox" id="����" name="reportReason" value="1" >
								����
							<input type="checkbox" id="愿�怨�" name="reportReason" value="2" >
								愿�怨�
							<input type="checkbox" id="湲고��" name="reportReason" value="4" >
								湲고��
							<input type="checkbox" id="�깆��" name="reportReason" value="8" >
							�깆���� 諛���

						</div>
						
					</form>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Close
						</button>
						
						<button type="button" class="btn btn-default add add5">�깅�</button>
					</div>
				</div>
			</div>
		</div>

	</main>

</body>
</html>
<jsp:include page="feed/getFeedList.jsp" />
