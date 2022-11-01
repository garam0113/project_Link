<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>

<head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="The Page Description">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<title>������</title>


<style>
body{
background-color: #EBEDF0 !important;
}
.row {
	margin-left : 0px !important;
	display: inherit !important;
}

.card{
border-color: BD76FF;
}

.button1  {
   background-color: white;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;
   margin: 1rem;
   padding: 10px;
   width: 130px !important;
   color: #5F0080 !important;
   font-size: 16px !important;
   text-align: center;
   border: solid 2px;
}

.button3{
   background-color: white;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;
   width: 92px !important;
   color: #5F0080 !important;
   font-size: 16px !important;
   text-align: center;
    border: solid 2px;
     padding: 10px;
   
}
.button4{
   background-color: white;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;
   margin: 1rem;
   padding: 10px;
   width: 92px !important;
   color: #5F0080 !important;
   font-size: 16px !important;
   text-align: center;
   border: solid 2px;
}

.button1:hover{
   background-color: #5F0080;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;
   margin: 1rem;
   width: 130px !important;
   color: white !important;
   font-size: 16px !important;
   text-align: center;
   border: solid 2px;
}
.button3:hover{
   background-color: #5F0080;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;

   width: 92px !important;
   color: white !important;
   font-size: 16px !important;
   text-align: center;
   border: solid 2px;

}
.button4:hover{
   background-color: #5F0080;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;
   margin: 1rem;
    width: 92px !important;
   color: white !important;
   font-size: 16px !important;
   text-align: center;
   border: solid 2px;
}
</style>



<script type="text/javascript">
$(function() {
	$("button:contains('�������� ����')").bind("click", function() {
		location.href = "/serviceCenter/getNoticeList";
	});

	$("button:contains('Q&A����')").bind("click", function() {
		location.href = "/serviceCenter/getQandAList";
		
	});
		
	$("button:contains('�� �Ű� ����')").bind("click", function() {
		if(${user.role== null}){
		 	alert('�α��� �� �̿� �����մϴ�.')
          	return; 
		}else if(${!empty sessionScope.user.userId}){
			$("form").attr("method","post").attr("action","/serviceCenter/getReportList/${sessionScope.user.userId}").submit();
			
		}
	});
	
	$("button:contains('�� ���� ����')").bind("click", function() {
		if(${user.role == null}){
			alert('�α��� �ϼž� �̿� �����մϴ�.');
			return;
		}else if(${!empty sessionScope.user.userId}){
			$("form").attr("method","post").attr("action","/serviceCenter/getQandAList/${sessionScope.user.userId}").submit();
		}
	});

	$("button:contains('�Ű� ���')").bind("click", function() {
		location.href = "/serviceCenter/getReportList";
	});
	
	$("button:contains('������ ����')").bind("click", function() {
		
		location.href = "/serviceCenter/getQandAList";
	});
	
});	
</script>


</head>


	<jsp:include page="/toolbar.jsp" />


<body style="overflow-x: hidden">
	<%--������ ȭ�� --%>
	<%-- --%>
	<div style="transform: translate(800px, 50px);">
	<h1 >&nbsp;&nbsp;&nbsp;��  ��  ��  ��</h1>
	<h4>
		�����͸� ���� �ñ����� �ذ��ϼ���
	<h4>
	</div>	

			
   <div class="container" style="transform: translate(300px, -200px);">
   
   
      <div class="row">
        <div class="col-4" style ="">
          
          <div class="card" style="transform: translate(-320px, 280px);">
            <div class="card-header">
             
            </div>
           <img src="/resources/image/uploadFiles/��������.png" class="image1" height="220px"/>
            <div class="card-body">
              <h3 class="card-title" align="center">��������</h3>
             <p class="card-text" align="center"> ����Ʈ �� ����������</br> ��ȸ �� �� �ֽ��ϴ�.</p>
              	<button type="submit" class="button1 button1" style="transform: translate(60px, 0px); width: 150px;left: 30px;">�������� ����</button>
            </div>
          </div>
        </div>
        <div class="col-4">
            <div class="card" style="transform: translate(-320px, 280px);">
            <div class="card-header">

            </div>
           <img src="/resources/image/uploadFiles/q&a.jpg" class="image2" height="220px" />
            <div class="card-body">
             <h3 class="card-title" align="center">Q&A</h3>
              <p class="card-text" align="center">����Ʈ ���� �ñ��Ͻ� ���̳�</br> �ǰ��� ���� �� �ֽ��ϴ�.</p>
              <button type="submit" class="button1 button2" style="transform: translate(60px, 0px);	width: 150px;left: 30px;">Q&A����</button>
              
            </div>
          </div>
        </div>
          <div class="col-4">
              <div class="card" style="transform: translate(-320px, 280px);">
            <div class="card-header">
            </div>
            <img src="/resources/image/uploadFiles/����ǥ.jpg" class="image3" height="220px" />
            <div class="card-body">
              <h3 class="card-title" align="center">�� �Ű� �� Q&A ����</h3>
              <p class="card-text" align="center">�� �Ű� �� Q&A ������ </br>Ȯ���� �� �ֽ��ϴ�. </p>
              <c:if test="${ user.role == '0' || user.role== null }">
              	<form>
				<button class="button3" style="transform: translate(15px, 0px);">�� �Ű� ����</button>
				<button class="button4" style="transform: translate(40px, 0px);">�� ���� ����</button>
				</form>
				</c:if>
				<c:if test="${ user.role == '1'  }">
				<button class="button3" style="transform: translate(15px, 0px);">�Ű� ���</button>
				<button class="button4" style="transform: translate(40px, 0px);">������ ����</button>
				</c:if>
            </div>
          </div>
        </div>
      </div>
    </div>

  </body>
</html>
</body>