<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">
<head>

	<title>공지사항 확인</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
		
		$("button:contains('확인')").bind("click", function(){
			self.location = "/serviceCenter/getNoticeList";
		});
		
		$("button:contains('추가등록')").bind("click", function(){
			self.location = "../serviceCenter/addNoticeView.jsp";
		})
		
		$("button:contains('수정')").bind("click", function(){
			self.location = "../serviceCenter/updateNoticeView.jsp";
		})
		
		$("button:contains('삭제')").bind("click", function(){
		self.location = "../serviceCenter/deleteNotice";
		})
	});
	
	</script>
<style>

textarea {
	resize: none;
}

.noticeTitle {
	width: 500px;
	height: 50px;
}

.content {
	margin-top: -30px;
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
</style>
</head>

<%-- 테이블 시작 --%>
<jsp:include page="/toolbar.jsp" />
<div class="page-header" align="center" style="transform: translate(-316px, 38px);">
  <h2>공지사항 확인하기</h2>
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
						<td align="left">${notice.noticeNo}번 공지사항
						<input type="hidden" name="noticeNo" id="noticeNo" value="${notice.noticeNo}">
						</td>
					</tr>
							<tr class = "content" id ="content">
						<th style="text-align-last: center;">제목</th>
						<td style="display: flex; height: 40px; width: 900px;">						
						${notice.noticeTitle}	
						<input type="hidden" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}">
						</td> 
					</tr>
					<tr>
						<th></th>
						<td align="left" name ="noticeRegDate" id="noticeRegDate" style="display: flex; height: 40px;">${notice.noticeRegDate }</td>
						<td align="left" style="transform: translateX(-370px);" style="display: flex; height: 40px;">${notice.userId.nickName}</td>
						
					</tr>
					<tr >
						<th style="text-align-last: center;">내용</th>
						<td style="display: flex; min-height : 300px; max-height: 800px; width: 100%">
						${notice.noticeContent}
						<input type="hidden" id="noticeContent" name="noticeContent" value="${notice.noticeContent}">
						</td>
					</tr>
					<tr >
						<th style="text-align-last: center;">첨부파일</th>
						<c:if test="${notice.noticeImage1 == null && notice.noticeImage2 ==null }">
							<td>첨부파일 없음</td>
						</c:if>
						<td><c:if test="${notice.noticeImage1 != null }">
						<img src="/resources/image/uploadFiles/${notice.noticeImage1}" 
						style="vertical-align: sub; display: inline-block; width:250px; height:250px; 
						cursor:pointer;" onclick="window.open('/resources/image/uploadFiles/${notice.noticeImage1}','asdfo8or','scrollbars=yes,width=417,height=385,top=10,left=20');">
						
						</c:if>
						<c:if test="${notice.noticeImage2 != null }">
						<img src="/resources/image/uploadFiles/${notice.noticeImage2}" 
						style="vertical-align: sub; display: inline-block; width:250px; height:250px; margin-left: 70px; 
						cursor:pointer;" onclick="window.open('/resources/image/uploadFiles/${notice.noticeImage2}','asdfo8or','scrollbars=yes,width=417,height=385,top=10,left=20');">
						
						</c:if>
						</td>
						
						
					</tr>
					<tr >
						<th style="text-align-last: center;"></th>
					</tr>
			</table>
			<!--  table End /////////////////////////////////////-->
	

		
						
									<div> 
								
 									 <button class="custom-btn btn-13" style= "transform: translate(680px,0px); ">
									   수정</button> 
									 <button class="custom-btn btn-13" style= "transform: translate(680px,0px); ">
									   삭제</button> 
									 <button class="custom-btn btn-13" style= "transform: translate(680px, 0px); ">
										확인</button>
										<button class="custom-btn btn-13" style= "transform: translate(680px, 0px); ">
										추가등록</button>	
									</div>
				
			</div>


</body>

</html>