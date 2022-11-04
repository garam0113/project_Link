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

		$("button:contains('이전')").bind("click", function(){
			if(${empty sessionScope.user.userId}){
				$("form").attr("method","get").attr("action","/serviceCenter/getQandAList").submit();
			}
			else if(${!empty sessionScope.user.userId}){
				$("form").attr("method","post").attr("action","/serviceCenter/getQandAList/${sessionScope.user.userId}").submit();
			}
		})
		
		
	});
	
	</script>
<style>
.table{
    box-shadow: rgb(102 51 102 / 30%) 0px 19px 38px, rgb(95 0 128 / 22%) 0px 15px 12px;
    border-radius: 20px;
    background: #c9c9ff;
    translate: -225px;
}
input[type=file]::file-selector-button {
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
}
.row {
	margin-left : 0px !important;
	   display: initial !important;
	
}
textarea {
	resize: none;
}
body{
background-color: #EBEDF0 !important;
margin-left: 400px !important;
}
.qandATitle {
	width: 500px;
	height: 50px;
}

.content {
	margin-top: -30px;
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
	<div class ="table" style="width:880px; box-shadow: rgb(0 0 0 / 30%) 0px 19px 38px, rgb(0 0 0 / 22%) 0px 15px 12px;
	    transform: translate(205px, 0px); background-color:aliceblue; margin-top:50px; height:750px;">
		<div></div>
		<div class="page-header text-center"></div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="userId" id="userId" value="${user.userId}">

			<div class="form-group" style="margin-left: 161px;">
				<strong>제목</strong> <label for="title"></label>
				<div class="col-sm-4">
					<textarea class="qandATitle" id="qandATitle" name="qandATitle" value=""
						maxlength="66" placeholder="제목을 입력해주세요"></textarea>


				</div>
			</div>
			<strong style="margin-left: 161px;">내용</strong>
			<div class="form-group">
				<label for="content" class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<textarea class="content" id="qandAContent" name="qandAContent" value=""
						placeholder="내용을 입력해주세요." maxlength="500"
						style="width: 500px; height: 500px; margin-left: 161px;"></textarea>
				</div>
			</div>

			<div  style= "display:flex; height: 30px; margin-left: 161px;">
				<input multiple="multiple" type="file" name="image" id="file" class="ct_input_g" style="width: 200px; height: 65px " />
				<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="0" style ="margin-left: 60px; width:auto; height:auto;" checked>나만 보기
			 	<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="1" style ="margin-left: 20px; width:auto; height:auto;">전체 보기
				</div></form> 
			
			<div id="helpBlock" class="help-block"> 
				<strong class="text-danger" style="margin-left: 161px; display: flex; margin-top: 30px;">사진은 2장까지 가능합니다.</strong>
			</div>
			
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button class="custom-btn btn-13"
						style="transform: translate(220px, 0px);">등록</button>
					<button class="custom-btn btn-13"
						style="transform: translate(220px, 0px);">이전</button>
				</div>
			</div>
			 
			
							
			


	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>