<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<title>q&a 등록</title>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">

	
	<script type="text/javascript">
	
	function fncAddQandA(){
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

		
		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/addQandA").submit();
	} //funtion  끝
	

	$(function(){
				
		$("button:contains('등록')").bind("click", function(){
			
			fncAddQandA();
		});

		$("button:contains('뒤로')").bind("click", function(){
			if(${empty sessionScope.user.userId}){
				$("form").attr("method","post").attr("action","/serviceCenter/getQandAList").submit();
			}
			if(${!empty sessionScope.user.userId}){
				$("form").attr("method","get").attr("action","/serviceCenter/getQandAList/${sessionScope.user.userId}").submit();
			}
		})
		
		
	});
	
	</script>
<style>
textarea {
	resize: none;
}
body{
background-color: #EBEDF0 !important;
}
.qandATitle {
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

<body>

	<jsp:include page="/toolbar.jsp" />
	<!-- form Start /////////////////////////////////////-->
	<div class="page-header" align="center"
		style="transform: translate(-316px, 38px);">
		<h2>Q&A 등록</h2>
	</div>
	<div class="container">
		<div></div>
		<div class="page-header text-center"></div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="userId" id="userId" value="${user.userId}">

			<div class="form-group">
				<strong>제목</strong> <label for="title"></label>
				<div class="col-sm-4">
					<textarea class="qandATitle" id="qandATitle" name="qandATitle" value=""
						maxlength="80" placeholder="제목을 입력해주세요"></textarea>


				</div>
			</div>
			<strong>내용</strong>
			<div class="form-group">
				<label for="content" class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<textarea class="content" id="qandAContent" name="qandAContent" value=""
						placeholder="내용을 입력해주세요." maxlength="500"
						style="width: 500px; height: 500px;"></textarea>
				</div>
			</div>

			<label  style= "display:flex; height: 30px;">
				<input multiple="multiple" type="file" name="image" id="file" class="ct_input_g" style="width: 200px; height: 50px" />
				<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="0" style ="margin-left: 60px; width:auto; height:auto;" checked>나만 보기
			 	<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="1" style ="margin-left: 20px; width:auto; height:auto;">전체 보기
				</label></form> 
			
			<span id="helpBlock" class="help-block"> <strong
				class="text-danger">사진은 2장까지 가능합니다.</strong>
			</span>


			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button class="custom-btn btn-13"
						style="transform: translate(70px, 0px);">등록</button>
					<button class="custom-btn btn-13"
						style="transform: translate(70px, 0px);">뒤로</button>
				</div>
			</div>
			 
			
							
			


	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>