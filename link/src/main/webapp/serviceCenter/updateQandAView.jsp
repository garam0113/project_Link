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

<title>Q&A����</title>
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
                title: '������ �ʼ��Դϴ�.',
            });
				return;
			}
		if (content == null || content.length < 1) {
		 	Swal.fire({
                icon: 'error',
                title: '������ �ʼ��Դϴ�.',
            });
				return;
			}
		
		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/updateQandA").submit();
	}
			
	
	
	$(function(){
		
		$("button:contains('����')").bind("click", function(){
			fncUpdateQandA();
		});
		
		$("button:contains('�ڷ�')").bind("click", function(){
			history.go(-1);
		});

		
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
.btn-13:hover { <%-- �۾��� --%>
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

<jsp:include page="/toolbar.jsp" />

<div class="page-header" align="center" style="transform: translate(-316px, 38px);">
  <h2>
	<c:if test ="${user.role == '1'}"> 
  Q&A �亯�ϱ�
  </c:if>
  <c:if test ="${user.role == '0'}"> 
  Q&A �����ϱ�
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
						<td align="left">${qandA.qandANo}��° ����
						<input type="hidden" name="qandANo" id="qandANo" value="${qandA.qandANo}">
						</td>
					</tr>
					<tr class = "content" id ="content">
						<th style="text-align-last: center;">����</th>
						<td>		
						<textarea class="text" id="qandATitle" name="qandATitle" value=""  
						style="width: 900px; height:40px;" >${qandA.qandATitle}</textarea>
						</td> 
					</tr>
					<tr>
						<th></th>
						<td align="left" name ="qandARegDate" id="qandARegDate">${qandA.qandARegDate }</td>
						<td align="left" style="transform: translateX(-370px);">${qandA.userId.nickName}</td>
						
					</tr>
					<tr >
						<th style="text-align-last: center;">����</th>
						<td>
						<textarea class="text" id="qandAContent" name="qandAContent" value=""  
						style="width: 900px; size:400px;" >${qandA.qandAContent}</textarea>
						</td>
					</tr>
					<tr >
						<th style="text-align-last: center;">÷������</th>
<%--���� --%>				<!-- <td><input multiple="multiple" type="file" name="image" id="file" class="ct_input_g" style="width: 200px; height: 50px" />
						</td> -->
						<c:if test="${qandA.qandAImage1 == null && qandA.qandAImage2 ==null }">
							<td>÷������ ����</td>
						</c:if>
						<td><c:if test="${qandA.qandAImage1 != null }">
						${qandA.qandAImage1}
						
						</c:if>
						<c:if test="${qandA.qandAImage2 != null }">
						<br/> ${qandA.qandAImage2}
						</c:if>
						</td>
						
						<c:if test ="${user.role == '1'}"> <%--������--%>
					<tr>
						<th></th>
						<td align="left" name ="qandAAnswerRegDate" id="qandAAnswerRegDate">${qandA.qandAAnswerRegDate }</td>
						<td/>
					</tr>
					<tr >
						<th style="text-align-last: center;">�亯 ����</th>
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
						 style ="width:auto; height:auto;" checked>���� ����</td> <td/>
						<td style ="display:flex; transform: translateX(-708px);">
						<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="1"
							 style ="width:auto; height:auto;">��ü ����</td></c:if>
						<c:if test="${qandA.qandAOpenCondition==1}">
						<td style ="display:flex;"> 
						<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="0" 
						 style ="width:auto; height:auto;" >���� ����</td> <td/>
						<td style ="display:flex; transform: translateX(-708px);">
						<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="1"
							 style ="width:auto; height:auto;" checked>��ü ����</td></c:if>
					</tr>
			</table>
			<!--  table End /////////////////////////////////////-->
	

 			
		
						
									<div> 
			 						 <button class="custom-btn btn-13" style= "transform: translate(400px,0px); ">
									   ����</button></form> 

									<button class="custom-btn btn-13" style= "transform: translate(400px, 0px); ">
									�ڷ�</button>
									
									</div>
				
			</div>

</body>

</html>