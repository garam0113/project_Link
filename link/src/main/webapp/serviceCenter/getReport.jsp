<%@ page contentType="text/html; charset=EUC-KR"%>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<title>신고내용 조회</title>
</head>


<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("button:contains('뒤로')").bind("click", function() {
			if(${user.role=='1'}){
			self.location = "/serviceCenter/getReportList";
			}else if (${user.role=='0'}){
			$("form").attr("method","post").attr("action","/serviceCenter/getReportList/${sessionScope.user.userId}").submit();	
			}
		})

		$("td.ct_btn01:contains('수정')").bind("click", function() {
			self.location = "../serviceCenter/updateReport?no="+$('tr.no').find('td').text();
		})



	});
</script>
<style>
textarea {
	resize: none;
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
<%-- 테이블 시작 --%>
<jsp:include page="/toolbar.jsp" />
<div class="page-header" align="center" style="transform: translate(-316px, 38px);">
  <h2>신고 상세보기</h2>
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
						<td style="    display: flex; height: 40px;">						
						<textarea class="text" id="title" name="title" value="${report.title}"  
						style="width: 900px; height:40px;" readonly >${report.title}</textarea>
						</td> 
					</tr>
					<tr>
						<th></th>
						<td align="left" name ="reportRegDate" id="reportRegDate" style="display: flex; height: 40px;">${report.regDate }</td>
					</tr>
					<tr >
						<th style="text-align-last: center;">내용</th>
						<td>
						<textarea class="text" id="content" name="content" value="${report.content}"  
						style="width: 900px; size:400px;" readonly >${report.content}</textarea>
						</td>
					</tr>
					<tr>
					 	<th style="text-align-last: center;"> 신고 출처</th>
					 	<td align="left" name ="reportRegDate" id="reportRegDate" style="display: flex; height: 70px;">
					 		<c:if test="${report.reportSource== '1'}"> 
					 		<input type="text" class="" value="모임게시물" style="width: 150px;" disabled />
		     				<input type="hidden" id="reportSource" name="reportSource" value="1">
		     				
		     				</c:if>
		     				<c:if test="${report.reportSource=='2'}"> 
							<input type="text" class="" value="모임게시물댓글" style="width: 150px;" disabled />
		     		 		<input type="hidden" id="reportSource" name="reportSource" value="2">
		     		 		
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
		     			<td style="transform: translate(-450px, -5px);"><strong>신고받는 닉네임</strong>
		     			 <input type="text" class="" value="${report.user2.nickName}" style="width:auto; height:35px; display:inline;" disabled />
		     			</td>
					</tr>
					<tr >
						<th style="text-align-last: center;">신고 사유</th>
						<td style="display:flex;">
						<c:if test="${report.reportReason == '1'|| report.reportReason == '3' || report.reportReason == '5' || report.reportReason =='7'|| report.reportReason =='9'
		 				   || report.reportReason =='11'|| report.reportReason =='13'|| report.reportReason =='15'}">
		    			  욕설<input type="checkbox" class="input" id="reportReason" name="reportReason" value="1" checked> 
		    			</c:if>
		    			 <c:if test="${report.reportReason == '2'|| report.reportReason == '3' || report.reportReason =='6'|| report.reportReason =='7'|| report.reportReason =='10'
		     			|| report.reportReason =='14'|| report.reportReason =='15'}">
		    				  광고<input type="checkbox" class="input" id="reportReason" name="reportReason" value="2" checked>
		    			</c:if>
		    				<c:if test="${report.reportReason == '4'|| report.reportReason == '5' || report.reportReason == '6' || report.reportReason =='7'|| report.reportReason == '12'
		    			|| report.reportReason =='13'|| report.reportReason =='14'|| report.reportReason =='15'}">
		   				   기타<input type="checkbox" class="input" id="reportReason" name="reportReason" value="4" checked>
		   				  </c:if>
		   				 <c:if test="${report.reportReason == '8'|| report.reportReason == '9' || report.reportReason == '10' || report.reportReason == '11' || report.reportReason == '12'
		    				 || report.reportReason == '11' || report.reportReason == '14' || report.reportReason == '15' }">
		    			  성적<input type="checkbox" class="input" id="reportReason" name="reportReason" value="8" checked>
		   				</c:if>
						</td>
						
					</tr>
					<tr >
						<th style="text-align-last: center;">첨부 파일</th>
						<c:if test="${report.reportImage1 == null && report.reportImage2 ==null }">
							<td>첨부파일 없음</td>
						</c:if>
						<td><c:if test="${report.reportImage1 != null }">
						<img src="/resources/image/uploadFiles/${report.reportImage1}" 
						style="vertical-align: sub; display: inline-block; width:250px; height:250px; 
						cursor:pointer;" onclick="window.open('/resources/image/uploadFiles/${report.reportImage1}','asdfo8or','scrollbars=yes,width=417,height=385,top=10,left=20');">
						
						</c:if>
						<c:if test="${report.reportImage2 != null }">
						<img src="/resources/image/uploadFiles/${report.reportImage2}" 
						style="vertical-align: sub; display: inline-block; width:250px; height:250px; margin-left: 70px; 
						cursor:pointer;" onclick="window.open('/resources/image/uploadFiles/${report.reportImage2}','asdfo8or','scrollbars=yes,width=417,height=385,top=10,left=20');">
						
						</c:if>
						</td>
						
						
					</tr>
					<tr >
						<th style="text-align-last: center;"></th>
					</tr>
			</table>
			<!--  table End /////////////////////////////////////-->
	

		
						
									<div> 
									<c:if test="${user.role=='1'}">
 									 <button class="custom-btn btn-13" style= "transform: translate(400px,0px); ">
									   수정</button> 

									</c:if>
									<button class="custom-btn btn-13" style= "transform: translate(400px, 0px); ">
									뒤로</button>
									</div>
				
			</div><form></form>


</body>

</html>