<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <!-- addMeetingCss -->
  <link rel="stylesheet" href="/resources/css/addUser.css">
  
  
  	<!--  	jQuery UI toolTip ��� JS -->
  <!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
  
  <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <!-- <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	
	
	
	<style>
	  body>div.container {
			border: 3px solid #D6CDB7;
			margin-top: 10px;
		}       
        
    </style>
    
<script type="text/javascript">


	function fncAddClub() {

		////////////////////////////////////////////////////
		//document.detailForm.action = '/addProduct.do';
		///////////////////////////////////////////////////

		$("form").submit();
	}


	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			//alert($("td.ct_btn01:contains('���')").html());
			fncAddClub();
		});
	});

	// 	 function resetData() {
	// 		document.detailForm.reset();
	// 	} 

	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});

</script>
</head>

<body>
	<form class="form-horizontal" method="post" action="/club/addClub" enctype="multipart/form-data">
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">�� �� �� ��</h2>
					<p class="exTxt">���ο� ������ ����غ�����...</p>
					<div class="join_form">
		
		<!-- <form class="form-horizontal" method="post" action="/club/addClub" enctype="multipart/form-data"> -->
		
			<div class="form-group">
				<label for="clubTitle" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="clubTitle" name="clubTitle" placeholder="���������� �ʼ��Դϴ�" style="width:300px;">
				</div>					
			</div>
			
			
		
			<div class="form-group">
				<label for="clubDetail" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="clubDetail" name="clubDetail" placeholder="���Ӽ����� �ʼ��Դϴ�. (�ִ� 500��)" style="width:300px;">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="clubCategory" class="col-sm-offset-1 col-sm-3 control-label" >����ī�װ�</label>
				<div class="col-sm-4">
					<!-- <select class="form-control"> -->
					<select class="form-control" id="clubCategory" name="clubCategory" style="width:300px;">
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
					<input type="text" class="form-control" id="clubArea" name="clubArea" style="width:300px;">
				</div>		
			</div>			
			
			<div class="form-group">
				<label for="clubImage" class="col-sm-offset-1 col-sm-3 control-label">�����̹���</label>
				<div class="col-sm-4">
					<input type="file" name="file" class="file" id="clubImage" multiple="multiple">
				</div>		
			</div>
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
			</div>
			</div>
		</div>
		</div>
		</div>	
			
		</form>	
		
		
</body>
</html>