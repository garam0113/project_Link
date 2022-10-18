<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="The Page Description">

<title>고객센터</title>
<link rel="stylesheet" href="/resources/css/layers.min.css"
	media="screen">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	media="screen">
<link rel="stylesheet" href="/resources/css/style.css" media="screen">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="apple-touch-icon"
	href="/resources/image/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/image/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="/resources/image/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="/resources/image/apple-touch-icon-152x152.png">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button1 {
	width: 75%;
}

.button2 {
	width: 75%;
}

.button3 {
	width: 23%;
}

.button4 {
	width: 23%;
}

body {
	width: 1300px;
}
</style>



<script type="text/javascript">
		$(function() {
		$("button:contains('공지사항')").bind("click", function() {
			location.href = "/serviceCenter/getNoticeList";
		});

		$("button:contains('Q&A')").bind("click", function() {
			
			$("form").attr("method","post").attr("action","/serviceCenter/getQandAList").submit();
			
		});
			
	
		$("button:contains('내신고 보기')").bind("click", function() {
			if(${empty sessionScope.user.userId}){
			alert("로그인 후 이용 가능합니다.")
			location.href="/user/login.jsp";
			}
			if(${!empty sessionScope.user.userId}){
			location.href = "/serviceCenter/getReportList"+"&userId=${sessionScope.user.userId}";
			}
		});

		$("button:contains('내질문 보기')").bind("click", function() {
			if(${empty sessionScope.user.userId}){
			alert("로그인 후 이용 가능합니다.")
			location.href="/user/login.jsp";
			}
			if(${!empty sessionScope.user.userId}){
			$("form").attr("method","get").attr("action","/serviceCenter/getQandAList/${sessionScope.user.userId}").submit();
			}
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
				style="transform: translate(1020px, -150px);" /> <br />
			<br />
			<br />
			<div class="container" style="transform: translate(300px, -200px);">
				<div class="row">
					<div class="col-4">
						<div class="card">
							<div class="card-header"></div>
							<img src="/resources/image/uploadFiles/공지사항.png" class="image1"
								height="220px" />
							<div class="card-body">
								<h3 class="card-title" align="center">공지사항</h3>
								<p class="card-text" align="center">
									사이트 내 공지사항을</br> 조회 할 수 있습니다.
								</p>
								<button class="button button1"
									style="transform: translate(25px, 0px);">공지사항 보기</button>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card">
							<div class="card-header"></div>
							<img src="/resources/image/uploadFiles/q&a.jpg" class="image2"
								height="220px" />
							<div class="card-body">
								<h3 class="card-title" align="center">Q&A</h3>
								<p class="card-text" align="center">
									사이트 내에 궁금하신 점이나</br> 의견을 남길 수 있습니다.
								</p>
								<button class="button button2"
									style="transform: translate(25px, -0px);">Q&A 보기</button>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card">
							<div class="card-header"></div>
							<img src="/resources/image/uploadFiles/물음표.jpg" class="image3"
								height="220px" />
							<div class="card-body">
								<form>
									<h3 class="card-title" align="center">내 신고 및 Q&A 보기</h3>
									<p class="card-text" align="center">
										내 신고 및 Q&A 내역을 </br>확인할 수 있습니다.
									</p>

									<button class="button button3"
										style="transform: translate(30px, 0px);">내신고 보기</button>
									<button class="button button4"
										style="transform: translate(70px, 0px);">내질문 보기</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>