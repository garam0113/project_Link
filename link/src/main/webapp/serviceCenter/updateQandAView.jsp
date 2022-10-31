<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
    
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<title>Q&A수정</title>
</head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	
	function fncUpdateQandA(){
		var title = $("textarea[name='qandATitle']").val();
		var content = $("textarea[name='qandAContent']").val();
		var image = $("textarea[name='qandAImage']").val();
		var image = $("input[name='qandAImage']").val();
		
		if (title == null || title.length < 1) {
		 	Swal.fire({
                icon: 'error',
                title: '제목은 필수입니다.',
            });
				return;
			}
		if (content == null || content.length < 1) {
		 	Swal.fire({
                icon: 'error',
                title: '내용은 필수입니다.',
            });
				return;
			}
		alert("2");
		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/updateQandA").submit();
	}
			
	
	
	$(function(){
		
		$("button:contains('수정')").bind("click", function(){
			fncUpdateQandA();
			alert("3");
		});
		
		$("#back").bind("click", function(){
			alert("4");
			window.history.back(-1);
		});

		
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
</head>

<jsp:include page="/toolbar.jsp" />

<div class="page-header" align="center" style="transform: translate(-316px, 38px);">
  <h2>
	<c:if test ="${user.role == '1'}"> 
  Q&A 답변하기
  </c:if>
  <c:if test ="${user.role == '0'}"> 
  Q&A 수정하기
  </c:if>
  </h2>
</div>
	
		<div class="container" style="margin-top: 37px;">
			<form class="form-horizontal" enctype="multipart/form-data">
		 <input type="hidden" id="userId" name="qandA.userId" value ="${SessionScope.user.userId}">
			<!--  table Start /////////////////////////////////////-->
			<table>

				</tbody>
					 <tr class = "body" id ="body" >
					 
						<th style="text-align-last: center;"></th>
						<td align="left">${qandA.qandANo}번째 질문
						<input type="hidden" name="qandANo" id="qandANo" value="${qandA.qandANo}">
						</td>
					</tr>
					<tr class = "content" id ="content">
						<th style="text-align-last: center;">제목</th>
						<td>		
						<textarea class="text" id="qandATitle" name="qandATitle" value=""  
						style="width: 900px; height:40px;" >${qandA.qandATitle}</textarea>
						</td> 
					</tr>
					<tr>
						<th></th>
						<td align="left" name ="qandARegDate" id="qandARegDate"><strong>${qandA.qandARegDate }</strong></td>
						<td align="left" style="transform: translateX(-370px);">${qandA.userId.nickName}</td>
						
					</tr>
					<tr >
						<th style="text-align-last: center;">내용</th>
						<td>
						<textarea class="text" id="qandAContent" name="qandAContent" value=""  
						style="width: 900px; size:400px;" >${qandA.qandAContent}</textarea>
						</td>
					</tr>
					<tr >
						<th style="text-align-last: center;">첨부파일</th>
<%--파일 --%>				<!-- <td><input multiple="multiple" type="file" name="image" id="file" class="ct_input_g" style="width: 200px; height: 50px" />
						</td> -->
						<c:if test="${qandA.qandAImage1 == null && qandA.qandAImage2 ==null }">
							<td>첨부파일 없음</td>
						</c:if>
						<td><c:if test="${qandA.qandAImage1 != null }">
						${qandA.qandAImage1}
						
						</c:if>
						<c:if test="${qandA.qandAImage2 != null }">
						<br/> ${qandA.qandAImage2}
						</c:if>
						</td>
						
						<c:if test ="${user.role == '1'}"> <%--관리자--%>
					<tr>
						<th></th>
						<td align="left" name ="qandAAnswerRegDate" id="qandAAnswerRegDate">${qandA.qandAAnswerRegDate }</td>
						<td/>
					</tr>
					<tr >
						<th style="text-align-last: center;">답변 내용</th>
						<td>
						<textarea class="text" id="qandAAnswerContent" name="qandAAnswerContent" value=""  
						style="width: 900px; size:400px;" >${qandA.qandAAnswerContent}</textarea>
						</td>
					</tr>
						</c:if>
					</tr>
					<tr >
						<td/>
						<c:if test="${qandA.qandAOpenCondition==0}">
						<td style ="display:flex;"> 
						<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="0" 
						 style ="width:auto; height:auto;" checked>나만 보기</td> <td/>
						<td style ="display:flex; transform: translateX(-708px);">
						<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="1"
							 style ="width:auto; height:auto;">전체 보기</td></c:if>
						<c:if test="${qandA.qandAOpenCondition==1}">
						<td style ="display:flex;"> 
						<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="0" 
						 style ="width:auto; height:auto;" >나만 보기</td> <td/>
						<td style ="display:flex; transform: translateX(-708px);">
						<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="1"
							 style ="width:auto; height:auto;" checked>전체 보기</td></c:if>
					</tr>
			</table></form>
			<!--  table End /////////////////////////////////////-->
	

 			
		
						
									<div> 
			 						 <button class="custom-btn btn-13" type="submit" style= "transform: translate(400px,0px); ">
									   수정</button> 

									<button class="custom-btn btn-13" id="back" style= "transform: translate(400px, 0px); ">
									뒤로</button>
									
									</div>
				
			</div>

</body>

</html>