<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<title>q&a ���</title>
	
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

		
		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/addQandA").submit();
	} //funtion  ��
	

	$(function(){
				
		$("button:contains('���')").bind("click", function(){
			
			fncAddQandA();
		});

		$("button:contains('�ڷ�')").bind("click", function(){
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
		<h2>Q&A ���</h2>
	</div>
	<div class="container">
		<div></div>
		<div class="page-header text-center"></div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="userId" id="userId" value="${user.userId}">

			<div class="form-group">
				<strong>����</strong> <label for="title"></label>
				<div class="col-sm-4">
					<textarea class="qandATitle" id="qandATitle" name="qandATitle" value=""
						maxlength="66" placeholder="������ �Է����ּ���"></textarea>


				</div>
			</div>
			<strong>����</strong>
			<div class="form-group">
				<label for="content" class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<textarea class="content" id="qandAContent" name="qandAContent" value=""
						placeholder="������ �Է����ּ���." maxlength="500"
						style="width: 500px; height: 500px;"></textarea>
				</div>
			</div>

			<div  style= "display:flex; height: 30px;">
				<input multiple="multiple" type="file" name="image" id="file" class="ct_input_g" style="width: 200px; height: 50px" />
				<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="0" style ="margin-left: 60px; width:auto; height:auto;" checked>���� ����
			 	<input type="radio" class="form-control" id="qandAOpenCondition" name="qandAOpenCondition" value ="1" style ="margin-left: 20px; width:auto; height:auto;">��ü ����
				</div></form> 
			
			<span id="helpBlock" class="help-block"> <strong
				class="text-danger">������ 2����� �����մϴ�.</strong>
			</span>


			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button class="custom-btn btn-13"
						style="transform: translate(70px, 0px);">���</button>
					<button class="custom-btn btn-13"
						style="transform: translate(70px, 0px);">�ڷ�</button>
				</div>
			</div>
			 
			
							
			


	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>