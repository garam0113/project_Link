<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<title>Q&A 상세보기</title>
</head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("button:contains('뒤로')").bind("click", function() {
			
				if(${empty sessionScope.user.userId}){
					location.href = "/serviceCenter/getQandAList";  //겟 ==전체보기
				
				}else if(${!empty sessionScope.user.userId}){
					if(${ sessionScope.user.role == '1'}){ //관리자
						location.href = "/serviceCenter/getQandAList";  //겟 ==전체보기
					}else if(${sessionScope.user.role == '0' }){ //유저
						$("form").attr("method","get").attr("action","/serviceCenter/getQandAList").submit(); 	//겟 ==전체보기
					}
				}  
		});

		$("button:contains('수정')").bind("click", function() {
			self.location = "/serviceCenter/updateQandA?qandANo="+$('#qandANo').val();
		})

		$("button:contains('삭제')").bind("click", function() {
			 Swal.fire({
		          title: '정말로 삭제하시겠습니까?',
		          text: "다시 되돌릴 수 없습니다. 신중하세요.",
		          icon: 'warning',
		          showCancelButton: true,
		          confirmButtonColor: '#3085d6',
		          cancelButtonColor: '#d33',
		          confirmButtonText: '삭제',
		          cancelButtonText: '취소'
		      }).then((result) => {
		          if (result.isConfirmed) {
		 	self.location = "/serviceCenter/deleteQandA?qandANo="+$('#qandANo').val();
		          }
		    })
		})
	});
</script>
<style>
.row {
	margin-left : 0px !important;
	    display: inherit;
}
body{
background-color: #EBEDF0 !important;
}
textarea {
	resize: none;
}

.btn-13 {
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background-color: white;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  border: solid 2px;
  box-shadow:none !important;
  outline: none;
  box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
  border-radius: 10px;
  padding: 10px;
  color: #5F0080 !important;
  font-size: 16px !important;
  text-align: center;
}

.btn-13:hover { 
   background-color: #5F0080;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;
   color: white !important;
   font-size: 16px !important;
   text-align: center;
   border: solid 2px;
}



</style>

<jsp:include page="/toolbar.jsp" />

<div class="page-header" align="center" style="transform: translate(-316px, 38px); margin-bottom: 60px;">
  <h2>Q&A 상세보기</h2>
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
						<td align="left"><strong>${qandA.qandANo}번째 질문</strong>
						<input type="hidden" name="qandANo" id="qandANo" value="${qandA.qandANo}">
						</td>
					</tr>
					<tr class = "title" id ="title">
						<th style="text-align-last: center;">제목</th>
						<td style="display: flex; height: 40px; width: 700px; background-color:white; text-align : center; ">${qandA.qandATitle}
						<input type="hidden" id="qandATitle" name="qandATitle" value="${qandA.qandATitle }">		
						</td> 
					</tr>
					<tr>
						<th></th>
						<td align="left" name ="qandARegDate" id="qandARegDate"><strong>${qandA.qandARegDate }</strong></td>
						<td align="left" style="transform: translateX(-370px);"><strong>${qandA.userId.nickName}</strong></td>
						
					</tr>
					<tr >
						<th style="text-align-last: center;">내용</th>
						<td style="display: flex; min-height : 150px; max-height: 800px; width: 700px; background-color:white; ">
						${qandA.qandAContent}
						<input type="hidden" id="qandAContent" name="qandAContent" value="${qandA.qandAContent}">
						</td>
					</tr>
					<tr >
						<th style="text-align-last: center;">첨부파일</th>
						<c:if test="${qandA.qandAImage1 == null && qandA.qandAImage2 ==null }">
							<td>첨부파일 없음</td>
						</c:if>
						<td><c:if test="${qandA.qandAImage1 != null }">
						<img src="/resources/image/uploadFiles/${qandA.qandAImage1}" 
						style="vertical-align: sub; display: inline-block; width:250px; height:250px; 
						cursor:pointer;" onclick="window.open('/resources/image/uploadFiles/${qandA.qandAImage1}','asdfo8or','scrollbars=yes,width=417,height=385,top=10,left=20');">
						
						</c:if>
						<c:if test="${qandA.qandAImage2 != null }">
						<img src="/resources/image/uploadFiles/${qandA.qandAImage2}" 
						style="vertical-align: sub; display: inline-block; width:250px; height:250px; margin-left: 70px; 
						cursor:pointer;" onclick="window.open('/resources/image/uploadFiles/${qandA.qandAImage2}','asdfo8or','scrollbars=yes,width=417,height=385,top=10,left=20');">
						
						</c:if>
						</td>
						
						
						
						<c:if test ="${qandA.qandAAnswerRegDate != null}"> <%--관리자--%>
					<tr>
						<th></th>
						<td align="left" name ="qandAAnswerRegDate" id="qandAAnswerRegDate"><strong>${qandA.qandAAnswerRegDate }</strong></td>
						<td align="left" style="transform: translateX(-370px);"><strong>관리자</strong></td>
						<td/>
					</tr>
					<tr >
						<th style="text-align-last: center;">답변</th>
						<td style="display: flex; min-height : 150px; max-height: 800px; width: 700px; background-color:white; ">
						${qandA.qandAContent}
						<input type="hidden" id="qandAContent" name="qandAContent" value="${qandA.qandAContent}">
						</td>
					</tr>
						</c:if>
					</tr>
					<tr >
						<th style="text-align-last: center;"></th>
					</tr>
			</table>
			<!--  table End /////////////////////////////////////-->
	

		
						
									<div> 
									<c:if test ="${qandA.userId.userId==user.userId || user.role ==1}">
 									 <button class="custom-btn btn-13" style= "transform: translate(400px,0px); ">
									   수정</button> 
									 <button class="custom-btn btn-13" style= "transform: translate(400px,0px); ">
									   삭제</button> 
									</c:if>
									<button class="custom-btn btn-13" style= "transform: translate(400px, 0px); ">
									뒤로</button>
									
									</div>
				
			</div>
<form></form>
</body>

</html>