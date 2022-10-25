<%@ page contentType="text/html; charset=UTF-8" %>
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
	
	<script type="text/javascript">
	
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
		
		<%-- SUMMER NOTE WEB LOADING --%>
		$('#summernote').summernote({
			toolbar: [
                // [groupName, [list of button]]
                ['Insert', ['picture', 'video']],
            ],
            
            disableResizeEditor: true,
			height: 600,                 // 에디터 높이
			minHeight: null,             // 최소 높이
			maxHeight: null,             // 최대 높이
			focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
			lang : 'ko-KR',
	        
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
		
		
		
		$(".btn_update").bind("click", function() {
			alert("수정하기");
			$("form").attr("method", "POST").attr("accept-charset", "EUC-KR").attr("action", "/feed/updateFeed").submit();
		})
	
	})
	
	</script>

	<style>

		/* SUMMERNOTE */
	
		.note-toolbar {
			border: 2px solid rgba(171,148,233,1);
			color: rgba(171,148,233,1) !important;
		}
			
		.note-btn {
			border: 2px solid rgba(171,148,233,1);
			color: rgba(171,148,233,1) !important;
		}
		
		.note-editing-area {
			border: 2px solid rgba(171,148,233,1);
			color: rgba(171,148,233,1) !important;
		}
	
		/* SUMMERNOTE */
		
		/* FEED ADD BUTTON */
	
		input.button.purple.btn_update {
			display: inline-block !important;
			width:75px !important;
			height:35px;
			margin-top:18px;
			margin-right:0px;
			float: right;
			font-size: 0.5em !important;
		}
		
		/* FEED ADD BUTTON */
		
		/* FEED TIME */
		
		h5.meta-post {
			margin-bottom:13px !important;
			color:black !important;
			display: inline-block;
			vertical-align: text-bottom !important;
		}
		
		/* FEED TIME */
		
		/* FEED USER NAME */
		
		h4 {
			display: inline-block;
			vertical-align: text-bottom !important;
			margin-top:5px !important;
			margin-left:5px; 
		}
		
	</style>

</head>

<body class="single single-post">

	<jsp:include page="/toolbar.jsp" />			

	<div id="intro-wrap" data-height="12.222">
		<div id="intro" class="preload darken">					
			<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
				<div class="caption">
					<h2>Feed</h2>
				</div><!-- caption -->					
			</div>								
		</div><!-- intro -->
	</div><!-- intro-wrap -->
	
	<div id="main">
		<section class="row section">
			<div class="row-content buffer even clear-after">
			
				<div class="column three">
					<a href="/feed/getFestivalLocation.jsp">길찾기</a>
				</div>
				
				<div class="column six">
				
					<form id="feedInfo">
					
						<!-- 피드 내용 -->
						<div class="post-area clear-after">
						
							<article role="main">
								<img src="/resources/image/uploadFiles/${feed.user.profileImage}" style="vertical-align: sub; display: inline-block; width:50px; height:50px;" />
								<h4>${feed.user.nickName}</h4>
	
								<input class="plain button purple btn_update" value="submit">
								
								<h5 class="meta-post">
									<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
									<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
								</h5>
								
								<textarea id="summernote" name="fullContent">${feed.fullContent}</textarea>
								
							</article>
	
						</div>
					
						<!-- 댓글 관련 hidden -->
						<input type="hidden" name="source" value="0">
						<input type="hidden" name="openCondition" value="3">
						<input type="hidden" name="userId" value="${sessionScope.user.userId}">
						<input type="hidden" name="feedNo" value="${feed.feedNo}">
						
						<!-- 댓글 관련 hidden -->
					</form>
					
				</div>
				
				<div class="column three"></div>
				
			</div>
		</section>
		
	</div>
	
</body>
</html>
	