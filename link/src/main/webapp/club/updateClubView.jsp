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
		
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>	
		
		
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
        .plain.button.red.cancel{
	   background-color: white;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 65px !important;
	   color: #5F0080 !important;
	   font-size: 16px !important;
	   text-align: center;
	   border: solid 2px;
	}
	
		.plain.button.red.cancel:hover{
	   background-color: #5F0080;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 65px !important;
	   color: white !important;
	   font-size: 16px !important;
	}
		
		textarea {
		resize: none;
	
		}          
        
    </style>
    
<script type="text/javascript">


	function fncUpdateClub() {

		var title = $("textarea[name='clubTitle']").val();
		var content = $("textarea[name='clubDetail']").val();
		var image = $("input[name='file']").val();
		
		if (title == null || title.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '�����̸��� �ʼ��Դϴ�.',
			});
			return;
		}
		
		if( content == null || content.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '���Ӽ����� �ʼ��Դϴ�.',
			});
			return;
		}
		
		if( image == null || image.length < 1) {
			Swal.fire({
				icon: 'error',
				title: '���Ӵ�ǥ�̹����� �ʼ��Դϴ�.',
			});
			return;
		}
		
		$("form").submit();
	}


	$(function() {

		$("#updateClub").on("click", function() {
			//alert($("td.ct_btn01:contains('���')").html());
			fncUpdateClub();
		});
	});

	// 	 function resetData() {
	// 		document.detailForm.reset();
	// 	} 

	$(function() {

		$("#cancel").bind("click", function() {
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
	
	<jsp:include page="/toolbar.jsp"/>
	
	
	<form class="form-horizontal" method="post" action="/club/updateClub" enctype="multipart/form-data">
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">�� �� �� ��</h2>
					<p class="exTxt">������ �����غ�����...</p>
					<div class="join_form">
			
		
		
		
			<div class="form-group">
				<label for="clubTitle" class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<strong>�� �� �� ��</strong><textarea class="clubTitle" id="clubTitle" name="clubTitle" value="" maxlength="80" style="width: 500px; height: 50px;">${club.clubTitle }</textarea>
				</div>					
			</div>
			
			
		
			<div class="form-group">
				<label for="clubDetail" class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<strong>�� �� �� ��</strong><textarea class="clubDetail" id="clubDetail" name="clubDetail" value="" maxlength="500" style="width: 500px; height: 300px;">${club.clubDetail }</textarea>
				</div>		
			</div>
			
			<div class="form-group">
				<label for="clubCategory" class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<strong>����ī�װ�</strong>
					<select class="form-control" id="clubCategory" name="clubCategory" style="width:350px;">
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
				<label for="clubArea" class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<strong>�� ��</strong>
					<select class="form-control" id="clubArea" name="clubArea" style="width:350px;">
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
				<label for="clubImage" class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4">
				<strong>�����̹���</strong><input type="file" class="file" id="clubImage" name="file" multiple="multiple" onchange="setThumbnail(event);" style="display: none;" class="form-file" />
					<button id="im" type="button" class="image" style="border-style: hidden;"><img id="imga" src="/resources/image/uploadFiles/default.png" style="height: 300px; width: 300px; max-width: 260%;"></button>
				</div>		
			</div>
			
			
			
			<div class="form-group" id="btn_group">
				<div class="col-sm-offset-6  col-sm-6 text-center">
		      		<button type="button" class="plain button red cancel" id="updateClub" >�� &nbsp;��</button>
					<button type="button" class="plain button red cancel" id="cancel">��&nbsp;��</button>
		    </div>
			</div>
			</div>
		</div>
		</div>
		</div>
	</form>	
		
</body>
</html>