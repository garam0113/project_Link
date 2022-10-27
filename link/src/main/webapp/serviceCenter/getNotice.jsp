<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<title>�������� ��ȸ</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script type="text/javascript"> <%-- �ڹٽ�ũ��Ʈ ���� --%>
	$(function() {

		$("button:contains('�ڷ�')").bind("click", function() {
			self.location = "/serviceCenter/getNoticeList";
		})

		$("button:contains('����')").bind("click", function() {
			self.location = "/serviceCenter/updateNotice?noticeNo="+$('#noticeNo').val();
		})

		$("button:contains('����')").bind("click", function() {
			 Swal.fire({
		          title: '������ �����Ͻðڽ��ϱ�?',
		          text: "�ٽ� �ǵ��� �� �����ϴ�. �����ϼ���.",
		          icon: 'warning',
		          showCancelButton: true,
		          confirmButtonColor: '#3085d6',
		          cancelButtonColor: '#d33',
		          confirmButtonText: '����',
		          cancelButtonText: '���'
		      }).then((result) => {
		          if (result.isConfirmed) {
		        	  self.location = "../serviceCenter/deleteNotice?noticeNo="+$('#noticeNo').val(); 
		          }
		      })	
			
			
		 	
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
<%-- ���̺� ���� --%>
<jsp:include page="/toolbar.jsp" />
<div class="page-header" align="center" style="transform: translate(-316px, 38px);">
  <h2>�������� �󼼺���</h2>
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
						<td align="left" style="display:flex; height: 50px;">${notice.noticeNo}�� ��������
						<input type="hidden" name="noticeNo" id="noticeNo" value="${notice.noticeNo}">
						</td>
					</tr>
					<tr class = "content" id ="content">
						<th style="text-align-last: center;">����</th>
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
						<th style="text-align-last: center;">����</th>
						<td style="display: flex; min-height : 150px; max-height: 800px; width: 100%">
						${notice.noticeContent}
						<input type="hidden" id="noticeContent" name="noticeContent" value="${notice.noticeContent}">
						</td>
					</tr>
					<tr >
						<th style="text-align-last: center;">÷������</th>
						<c:if test="${notice.noticeImage1 == null && notice.noticeImage2 ==null }">
							<td>÷������ ����</td>
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
									<c:if test="${user.role=='1'}">
 									 <button class="custom-btn btn-13" style= "transform: translate(400px,0px); ">
									   ����</button> 
									 <button class="custom-btn btn-13" style= "transform: translate(400px,0px); ">
									   ����</button> 
									</c:if>
									<button class="custom-btn btn-13" style= "transform: translate(400px, 0px); ">
									�ڷ�</button>
									</div>
				
			</div>


</body>

</html>