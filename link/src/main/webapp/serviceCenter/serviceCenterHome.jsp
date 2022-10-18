<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="The Page Description">

<title>������</title>
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
		$("button:contains('��������')").bind("click", function() {
			location.href = "/serviceCenter/getNoticeList";
		});

		$("button:contains('Q&A')").bind("click", function() {
			
			$("form").attr("method","post").attr("action","/serviceCenter/getQandAList").submit();
			
		});
			
	
		$("button:contains('���Ű� ����')").bind("click", function() {
			if(${empty sessionScope.user.userId}){
			alert("�α��� �� �̿� �����մϴ�.")
			location.href="/user/login.jsp";
			}
			if(${!empty sessionScope.user.userId}){
			location.href = "/serviceCenter/getReportList"+"&userId=${sessionScope.user.userId}";
			}
		});

		$("button:contains('������ ����')").bind("click", function() {
			if(${empty sessionScope.user.userId}){
			alert("�α��� �� �̿� �����մϴ�.")
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

	<h1 style="transform: translate(500px, 50px);">������</h1>
	<h4 style="transform: translate(500px, 50px);">
		�����͸� ���� �ñ����� �ذ��ϼ���
		<h4>

			<img src="/resources/image/uploadFiles/������.JPG" class="image2"
				width="400px" height="400px"
				style="transform: translate(1020px, -150px);" /> <br />
			<br />
			<br />
			<div class="container" style="transform: translate(300px, -200px);">
				<div class="row">
					<div class="col-4">
						<div class="card">
							<div class="card-header"></div>
							<img src="/resources/image/uploadFiles/��������.png" class="image1"
								height="220px" />
							<div class="card-body">
								<h3 class="card-title" align="center">��������</h3>
								<p class="card-text" align="center">
									����Ʈ �� ����������</br> ��ȸ �� �� �ֽ��ϴ�.
								</p>
								<button class="button button1"
									style="transform: translate(25px, 0px);">�������� ����</button>
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
									����Ʈ ���� �ñ��Ͻ� ���̳�</br> �ǰ��� ���� �� �ֽ��ϴ�.
								</p>
								<button class="button button2"
									style="transform: translate(25px, -0px);">Q&A ����</button>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card">
							<div class="card-header"></div>
							<img src="/resources/image/uploadFiles/����ǥ.jpg" class="image3"
								height="220px" />
							<div class="card-body">
								<form>
									<h3 class="card-title" align="center">�� �Ű� �� Q&A ����</h3>
									<p class="card-text" align="center">
										�� �Ű� �� Q&A ������ </br>Ȯ���� �� �ֽ��ϴ�.
									</p>

									<button class="button button3"
										style="transform: translate(30px, 0px);">���Ű� ����</button>
									<button class="button button4"
										style="transform: translate(70px, 0px);">������ ����</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>