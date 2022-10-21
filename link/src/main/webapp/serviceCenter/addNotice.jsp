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
						<td>		
						<textarea class="text" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}"  
						style="width: 900px; height:40px;" readonly >${notice.noticeTitle}</textarea>
						</td> 
					</tr>
					<tr>
						<th></th>
						<td align="left" name ="noticeRegDate" id="noticeRegDate">${notice.noticeRegDate }</td>
						<td align="left" style="transform: translateX(-370px);">${notice.userId.nickName}</td>
						
					</tr>
					<tr >
						<th style="text-align-last: center;">내용</th>
						<td>
						<textarea class="text" id="noticeContent" name="noticeContent" value="${notice.noticeContent}"  
						style="width: 900px; size:400px;" readonly >${notice.noticeContent}</textarea>
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