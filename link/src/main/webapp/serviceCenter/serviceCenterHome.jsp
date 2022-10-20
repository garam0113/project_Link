<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>

<head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<title>고객센터</title>


<style>

body {
	width: 1300px;
}
.button{
	height: 20px;
}
.button1{
	width: 150px;
	left: 30px;
}
.button2{
    width: 150px;
    left: 30px;
}
.button3{
	left: 10px;
}
.button4{
	left: 10px;
}
</style>



<script type="text/javascript">
$(function() {
	$("button:contains('공지사항 보기')").bind("click", function() {
		location.href = "/serviceCenter/getNoticeList";
	});

	$("button:contains('Q&A보기')").bind("click", function() {
		location.href = "/serviceCenter/getQandAList";
		
	});
		
	$("button:contains('내 신고 보기')").bind("click", function() {
		if(${user.role== null}){
		 	alert('로그인 후 이용 가능합니다.')
          	return; 
		}else if(${!empty sessionScope.user.userId}){
			$("form").attr("method","post").attr("action","/serviceCenter/getReportList/${sessionScope.user.userId}").submit();
			
		}
	});
	
	$("button:contains('내 질문 보기')").bind("click", function() {
		if(${user.role == null}){
			alert('로그인 하셔야 이용 가능합니다.');
			return;
		}else if(${!empty sessionScope.user.userId}){
			$("form").attr("method","post").attr("action","/serviceCenter/getQandAList").submit();
		}
	});

	$("button:contains('신고 목록')").bind("click", function() {
		location.href = "/serviceCenter/getReportList";
	});
	
	$("button:contains('관리자 질문')").bind("click", function() {
		alert('난 실행됩니다');
		location.href = "/serviceCenter/getQandAList";
	});
	
});	
</script>


</head>

<body>
	<jsp:include page="/toolbar.jsp" />

	<h1 style="transform: translate(500px, 50px);">고객센터</h1>
	<h4 style="transform: translate(500px, 50px);">
		고객센터를 통해 궁금증을 해결하세요
	<h4>
			
	<img src="/resources/image/uploadFiles/고객센터.JPG" class="image2"
				width="400px" height="400px"
				style="transform: translate(1020px, -150px);" /> <br /> <br /> <br />
			
   <div class="container" style="transform: translate(300px, -200px);">
      <div class="row">
        <div class="col-4">
          
          <div class="card">
            <div class="card-header">
             
            </div>
           <img src="/resources/image/uploadFiles/공지사항.png" class="image1" height="220px" />
            <div class="card-body">
              <h3 class="card-title" align="center">공지사항</h3>
             <p class="card-text" align="center"> 사이트 내 공지사항을</br> 조회 할 수 있습니다.</p>
              	<button type="submit" class="button button1" style="transform: translate(25px, 0px);">공지사항 보기</button>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card">
            <div class="card-header">

            </div>
           <img src="/resources/image/uploadFiles/q&a.jpg" class="image2" height="220px" />
            <div class="card-body">
             <h3 class="card-title" align="center">Q&A</h3>
              <p class="card-text" align="center">사이트 내에 궁금하신 점이나</br> 의견을 남길 수 있습니다.</p>
              <button type="submit" class="button button2" style="transform: translate(25px, -0px);">Q&A보기</button>
              
            </div>
          </div>
        </div>
          <div class="col-4">
          <div class="card">
            <div class="card-header">
            </div>
            <img src="/resources/image/uploadFiles/물음표.jpg" class="image3" height="220px" />
            <div class="card-body">
              <h3 class="card-title" align="center">내 신고 및 Q&A 보기</h3>
              <p class="card-text" align="center">내 신고 및 Q&A 내역을 </br>확인할 수 있습니다. </p>
              <c:if test="${ user.role == '0' || user.role== null }">
              	<form>
				<button class="button button3" style="transform: translate(30px, 0px);">내 신고 보기</button>
				<button class="button button4" style="transform: translate(70px, 0px);">내 질문 보기</button>
				</form>
				</c:if>
				<c:if test="${ user.role == '1'  }">
				<button class="button button3" style="transform: translate(30px, 0px);">신고 목록</button>
				<button class="button button4" style="transform: translate(70px, 0px);">관리자 질문</button>
				</c:if>
            </div>
          </div>
        </div>
      </div>
    </div>

  </body>
</html>
</body>