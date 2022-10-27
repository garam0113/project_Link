<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
    
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="The Page Description">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<title>신고내용 처리</title>
	
	
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>	
<script type="text/javascript">
	
	function fncUpdateReport(){

		alert($($("form")[0]));
		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/updateReport").submit();
	
	}
	$(function(){
		
		$("button:contains('처리')").bind("click", function(){
			fncUpdateReport();
		});
		
		$("button:contains('뒤로')").bind("click", function(){
				self.location = "/serviceCenter/getReportList";
		});
		
	
		

		
	})
	

</script>
<style>
textarea {
	resize: none;
	border: none;
    outline: none;
}

.custom-btn {
  margin: 5px;
  width: 80px;
  height: 30px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  border: none !important;
  box-shadow:none !important;
  outline: none;
}
.btn-13 {
  background-color: #5F0080;
  background-image: linear-gradient(315deg, #BD76FF  50%, #5F0080 74%);
  border: none;
  z-index: 1;
}
.btn-13:after {
  position: absolute;
  content: "";
  width: 100%;
  height: 0;
  bottom: 0;
  left: 0;
  z-index: -1;
  border-radius: 5px;
   background-color: #5F0080;
  background-image: linear-gradient(315deg, #BD76FF 50%, #5F0080 74%);
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
  transition: all 0.3s ease;
}
.btn-13:hover { <%-- 글씨색 --%>
  color: #fff;
}
.btn-13:hover:after {
  top: 0;
  height: 100%;
}
.btn-13:active {
  top: 2px;
}
.input{
	width:auto;
	height:auto;
	margin-right: 70px;
}

</style>
</head>
<jsp:include page="/toolbar.jsp" /><form>
<div class="page-header" align="center" style="transform: translate(-316px, 38px);">
  <h2>신고 처리하기</h2>
</div>
	
		<div class="container" style="margin-top: 37px;">
			<!--  table Start /////////////////////////////////////-->
			<table>
			
				<div class="row2">
				<thead>
				</thead>
				</div>
				</tbody>
					 <tr class = "body" id ="body" >
				<th style="text-align-last: center;"></th>
						<td align="left" style="display:flex; height: 50px;">${report.no}번 신고
						<input type="hidden" name="no" id="no" value="${report.no}">
						</td>
					</tr>
					<tr class = "content" id ="content" >
						<th style="text-align-last: center;">제목</th>
						<td style="display: flex; height: 40px; width: 900px;">						
						${report.title}
						<input type="hidden" id="title" name="title" value="${report.title}">
						</td> 
					</tr>
					<tr>
						<th></th>
						<td align="left" name ="reportRegDate" id="reportRegDate" style="display: flex; height: 40px;">${report.regDate }</td>
					</tr>
					<tr >
						<th style="text-align-last: center;">내용</th>
						<td style="display: flex; min-height : 300px; max-height: 800px; width: 100%">
						${report.content}
						<input type="hidden" id="content" name="content" value="${report.content}">
						</td>
					</tr>
					<tr>
					 	<th style="text-align-last: center;"> 신고 출처</th>
					 	<td align="left" name ="reportRegDate" id="reportRegDate" style="display: flex; height: 70px;">
					 		<c:if test="${report.reportSource== '1'}"> 
					 		<input type="text" class="" value="모임게시물" style="width: 150px;" disabled />
		     				<input type="hidden" id="reportSource" name="reportSource" value="1">
		     				 <a href="/clubPost/getClubPost?clubNo=${report.club.clubNo}&clubPostNo=${report.clubPost.clubPostNo}" 
		     				 style="transform: translate(-150px, 30px);"> 
		     						${report.clubPost.clubPostNo} 클럽게시물 번호 </a>	
		     						
		     						
		     				</c:if>
		     				<c:if test="${report.reportSource=='2'}"> 
							<input type="text" class="" value="모임게시물댓글" style="width: 150px;" disabled />
		     		 		<input type="hidden" id="reportSource" name="reportSource" value="2">
		     		 	<a href="/clubPost/getClubPost?clubNo=${report.club.clubNo}&clubPostNo=${report.clubPost.clubPostNo}" 
		     				 style="transform: translate(-150px, 30px);"> 
		     						${report.clubPost.clubPostNo} 클럽게시물 번호 </a>
		     		 		</c:if>
		     		 		<c:if test="${report.reportSource=='3'}">
							<input type="text" class="" value="피드" style="width: 150px;" disabled />
		     				 <input type="hidden" id="reportSource" name="reportSource" value="3">
		     				 
		     				 <a href="/feed/getFeed?feedNo=${report.feed.feedNo}" style="transform: translate(-150px, 30px);"> 
		     				 ${report.feed.feedNo} 번째 피드 </a>
		     				</c:if>
		     				<c:if test="${report.reportSource=='4'}">
							<input type="text" class="" value="피드댓글" style="width: 150px;" disabled />
		     				 <input type="hidden" id="reportSource" name="reportSource" value="4">
		     				  <a href="/feed/getFeed?feedNo= ${report.feedComment.feedNo}" style="transform: translate(-150px, 30px);"> 
		     				 ${report.feedComment.feedNo} 번째 피드 </a>
		     				 </c:if>
		     			</td>
		     			<td style="display:flex; margin-left :200px; margin-top : -70px;"><strong>신고받는 닉네임 &nbsp;&nbsp;</strong>
		     			 ${report.user2.nickName}
		     			</td>
					</tr>
					<tr  style="margin-top:20px;" >
						<th style="text-align-last: center;">신고 사유</th>
						<td style="display:flex;   margin-top:20px;">
						<input type="checkbox" id="욕설" name="reportReason" value="1" style="margin-left:55px">욕설
						<input type="checkbox" id="광고" name="reportReason" value="2" style="margin-left:30px">광고
						<input type="checkbox" id="기타" name="reportReason" value="4" style="margin-left:30px">기타
						<input type="checkbox" id="성적" name="reportReason" value="8" style="margin-left:30px">성적인 발언
						</td>
						
					</tr>
					<tr>
						<th style="text-align-last: center;"></th>
					</tr>
			</table>
			<!--  table End /////////////////////////////////////-->
	
</form>	
		
						
									<div> 
									
 									 <button class="custom-btn btn-13" style= "transform: translate(400px,0px); ">
									   처리</button> 

									
								<button class="custom-btn btn-13" style= "transform: translate(400px, 0px); ">
									뒤로</button>
									</div>
				
			</div>


</body>

</html>