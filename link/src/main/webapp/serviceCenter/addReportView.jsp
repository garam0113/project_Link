<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<title>신고 등록</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>


<script type="text/javascript">
	

	function fncAddReport(){
		
		var title = $("textarea[name=title]").val();		
		var content =$("textarea[name=content]").val();			
		var checkbox = $("input:checkbox[name=reportReason]:checked").length;
		
		
		
		if(title == null || title.length <1){
				alert("제목은 반드시 입력하셔야 합니다.");
				return;
			}
		if(content == null || content.length <1){
				alert("내용은 반드시 입력하셔야 합니다.");
				return;
			}
				
		if(checkbox==0){
			alert("신고사유 하나는 선택해주세요");
			return;
		}
		
		var sum = 0;
	
		for(var i =0 ; i<checkbox; i++){
			var sum2 = parseInt($("input:checkbox[name=reportReason]:checked").val());
			sum += sum+parseInt(sum2);
		}
			
	alert(sum);			
						
		
						
	 	$.ajax({
		url  : "/serviceCenterRest/json/addReport",
		contentType: 'application/json',
		method : "POST",
		dataType: "json",
		data : JSON.stringify ({
			"title":$("#title").val(),
			"content":$("#content").val(),
			"reportImage1":$("#reportImage1").val(),
			"reportImage2":$("#reportImage2").val(),
			"user2":$("#user2").val(),
			"reportSource":$("#reportSource").val(),
			"reportReason": sum,
			"type": $("#type").val(),
	
		 success: function(){
			 window.close();
		 }
		}),
			
		})<!-- ajax ( ReportAdd) 끝 --> 
		

	} //funtion 끝
	

	$(function(){

		$("button:contains('등록')").bind("click", function(){
		
			fncAddReport();
			
		})
		$("button:contains('뒤로')").bind("click", function(){
			
			close();
		})
		
		var reportSource = opener.$("input[name='reportSource']").val();
		var user2 = opener.$("input[name='user2']").val();
		
		var userId = opener.$("input[name='reportedId']").val();
		$("#reportSource").val(reportSource);
		$("#user2").val(user2);
		$("#user2").val(userId);
		
	});
	
	</script>
<style>
textarea {
	resize: none;
}

.title {
	width: 400px;
}
.add {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 11px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
}
.add5 {
    background-color: white; 
  	color: black; 
  	border: 2px solid #f44336;
}
.add5:hover {
   background-color: #f44336;
  color: white;
}
.add6 {
    background-color: white; 
  	color: black; 
  	border: 2px solid #0a6bdf;
}
.add6:hover {
   background-color: #0a6bdf;
  color: white;
}
</style>
</head>

<body>


	<!-- form Start /////////////////////////////////////-->
	<div class="container">
		<div></div>
		<div class="page-header text-center">
			<h2>신고 등록</h2>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="type" id="type" value="1"> <input
				type="hidden" name="clubPostNo" id="clubPostNo" value="clubPostNo">
			<input type="hidden" name="clubPostCommentNo" id="clubPostCommentNo"
				value="clubPostCommentNo"> <input type="hidden" name="feed"
				id="feed" value="feed"> <input type="hidden"
				name="feedComment" id="feedComment" value="feedCommet">
			<div class="form-group">
				<label for="title" class="col-sm-offset-1 col-sm-3 control-label">제목</label>
				<div class="col-sm-4">
					<textarea class="title" id="title" name="title" value=""
						maxlength="80" placeholder="신고 제목을 입력해주세요"
						style="position: fixed;"></textarea>


				</div>

 	
	<!--  화면구성 div end /////////////////////////////////////-->

			</div>
			</br>
			<div class="form-group">
				<label for="content" class="col-sm-offset-1 col-sm-3 control-label">내용</label>
				<div class="context">
					<textarea class="content" id="content" name="content" value=""
						placeholder="신고 내용을 입력해주세요." maxlength="500"
						style="width: 400px; height: 250px; margin-left: 15px;"></textarea>
				</div>
			</div>
			</br>
			<div class="form-group">

					<label for="text" class="col-sm-offset-1 col-sm-3 control-label">신고받는
						ID </label> 
						<input type="text" class="" id="user2"
						name="user2" value="${user02}" readonly style="width: 150px;" readonly />
				
					<label for="text"
						class="col-sm-offset-1 col-sm-offset-1  control-label">신고
						출처 </label>
					
					<c:if test="${reportSource.slice(1,2)== '1'}"> 
						<input type="text" class="" value="모임게시물" style="width: 150px;" disabled />
		     		 <input type="hidden" name="reportSource" value="1">
					</c:if> 
					<c:if test="${reportSource.slice(1,2)=='2'}"> 
					<input type="text" class="" value="모임게시물댓글" style="width: 150px;" disabled />
		     		 <input type="hidden" name="reportSource" value="2">
					</c:if>
					<c:if test="${reportSource.slice(1,2)=='3'}">
						<input type="text" class="" value="피드" style="width: 150px;" disabled />
		     		 <input type="hidden" name="reportSource" value="3">
					</c:if>
					<c:if test="${reportSource.slice(1,2)=='4'}">
						<input type="text" class="" value="피드댓글" style="width: 150px;" disabled />
		     		 <input type="hidden" name="reportSource" value="4">
					</c:if>
					

				
			</div>


			<div class="form-group">
				<label for="Reason" class="col-sm-offset-1 col-sm-3 control-label">신고
					사유</label>
				<div class="col-sm-4" id="Reason" style="width: 400px;">

					<input type="checkbox" id="욕설" name="reportReason" value="1" style="margin-left:55px">욕설
					<input type="checkbox" id="광고" name="reportReason" value="2" style="margin-left:30px">광고
					<input type="checkbox" id="기타" name="reportReason" value="4" style="margin-left:30px">기타
					<input type="checkbox" id="성적" name="reportReason" value="8" style="margin-left:30px">성적인 발언

				</div>
			</div>

			<label for="reportImage"
				class="col-sm-offset-1 col-sm-3 control-label">파일첨부</label>
			<div class="col-sm-4">
				<input multiple="multiple" type="file" name="image"
					class="ct_input_g" style="width: 200px; height: 50px"
					 />사진은 2장까지 가능합니다.

		 </div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center" style="left:30px;">
					<button type="button" class="add add5">등록</button>
					<button type="button" class="add add6">뒤로</button>
				</div>
			</div>

		</form>
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>