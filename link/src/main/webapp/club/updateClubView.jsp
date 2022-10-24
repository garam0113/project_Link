<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">  
  
  <!-- addMeetingCss -->
  <link rel="stylesheet" href="/resources/css/addUser.css">
  
  	<!--  	jQuery UI toolTip ��� JS -->
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <!-- <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
        #btn_group button{
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
		color: #BD76FF;
    	border-color: #BD76FF;
    	background-color: #ffffff;
		}            
        
    </style>
    
<script type="text/javascript">


	function fncUpdateClub() {

		////////////////////////////////////////////////////
		//document.detailForm.action = '/addProduct.do';
		///////////////////////////////////////////////////

		// 		document.detailForm.action = '/product/addProduct';		
		// 		document.detailForm.submit(); 

		/* $("form").attr("method", "POST").attr("action", "/club/updateClub")
				.submit(); */
				
		$("form").submit();
	}


	$(function() {

		$("button.btn.btn-update").on("click", function() {
			//alert($("td.ct_btn01:contains('���')").html());
			fncUpdateClub();
		});
	});

	// 	 function resetData() {
	// 		document.detailForm.reset();
	// 	} 

	$(function() {

		$("button.btn.btn-cancel").bind("click", function() {
			//window.close();
			history.go(-1);
		});
	});
	
	function setThumbnail(event) {
		var fileInput = document.getElementById("clubImage");
		var file = fileInput.files[0];
		var reader = new FileReader();

		reader.onload = function(event) {
			$("#imga").attr("src", event.target.result);
		};
		
		console.log(file);
		reader.readAsDataURL(file);
		
	} 

	$(function() {
		$(".image").on("click", function() {
			$("#clubImage").click();		
		})
	})
	

</script>
</head>

<body>
	
	<form class="form-horizontal" method="post" action="/club/updateClub" enctype="multipart/form-data">
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">�� �� �� ��</h2>
					<p class="exTxt">������ �����غ�����...</p>
					<div class="join_form">
			
		
		
		
			<div class="form-group">
				<label for="clubTitle" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="clubTitle" name="clubTitle" value="${club.clubTitle}" style="width:300px; border-color: #BD76FF;" autocomplete='off'>
				</div>					
			</div>
			
			
		
			<div class="form-group">
				<label for="clubDetail" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="clubDetail" name="clubDetail" value="${club.clubDetail}" style="width:300px; border-color: #BD76FF;" autocomplete='off'>
				</div>		
			</div>
			
			<div class="form-group">
				<label for="clubCategory" class="col-sm-offset-1 col-sm-3 control-label">����ī�װ�</label>
				<div class="col-sm-4">
					<select class="form-control" id="clubCategory" name="clubCategory" style="width:300px; border-color: #BD76FF;">
						<option value="�">�</option>
  						<option value="����Ȱ��">����Ȱ��</option>
  						<option value="����">����</option>
						<option value="����">����</option>
						<option value="�ݷ�����">�ݷ�����</option>
						<option value="����">����</option>
						<option value="����/��">����/��</option>
						<option value="����">����</option>
						<option value="��Ÿ">��Ÿ</option>
					</select>
				</div>			    
			</div>			
			
			<div class="form-group">
				<label for="clubArea" class="col-sm-offset-1 col-sm-3 control-label">Ȱ �� �� ��</label>
				<div class="col-sm-4">
					<select class="form-control" id="clubArea" name="clubArea" style="width:300px; border-color: #BD76FF;">
						<option value="������">������</option>
						<option value="������">������</option>
						<option value="���ϱ�">���ϱ�</option>
						<option value="������">������</option>
						<option value="���Ǳ�">���Ǳ�</option>
						<option value="������">������</option>
						<option value="���α�">���α�</option>
						<option value="��õ��">��õ��</option>
						<option value="�����">�����</option>
						<option value="������">������</option>
						<option value="���빮��">���빮��</option>
						<option value="���۱�">���۱�</option>
						<option value="������">������</option>
						<option value="���빮��">���빮��</option>
						<option value="���ʱ�">���ʱ�</option>
						<option value="������">������</option>
						<option value="���ϱ�">���ϱ�</option>
						<option value="���ı�">���α�</option>
						<option value="��õ��">��õ��</option>
						<option value="��������">��������</option>
						<option value="��걸">��걸</option>
						<option value="����">����</option>
						<option value="���α�">���α�</option>
						<option value="�߱�">�߱�</option>
						<option value="�߶���">�߶���</option>
					</select>
				</div>		
			</div>			
			
			<div class="form-group">
				<label for="clubImage" class="col-sm-offset-1 col-sm-3 control-label">�����̹���</label>
				<div class="col-sm-4">
					<input type="file" class="file" id="clubImage" name="file" multiple="multiple" onchange="setThumbnail(event);" style="display: none;" class="form-file" />
					<button id="im" type="button" class="image" style="border-style: hidden;"><img id="imga" src="/resources/image/uploadFiles/${club.clubImage}" style="height: 300px; width: 300px;"></button>
				</div>		
			</div>
			
			
			
			<div class="form-group" id="btn_group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-update" >�� &nbsp;��</button>
					<button type="button" class="btn btn-cancel">��&nbsp;��</button>
		    </div>
			</div>
			</div>
		</div>
		</div>
		</div>
	</form>	
		
</body>
</html>