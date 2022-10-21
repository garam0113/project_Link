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
  
   <!-- updateClubCss -->
  <link rel="stylesheet" href="/resources/css/addUser.css">
    
  	<!--  	jQuery UI toolTip ��� JS -->
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
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

		$("button.btn.btn-primary").on("click", function() {
			//alert($("td.ct_btn01:contains('���')").html());
			fncUpdateClub();
		});
	});

	// 	 function resetData() {
	// 		document.detailForm.reset();
	// 	} 

	$(function() {

		$("a[href='#']").bind("click", function() {
			window.close();
		});
	});

</script>
</head>

<body>

	<form>
		<div class="wrap wd668">	
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">�� �� �� ��</h2>
					<p class="exTxt">������ �����ϼ���...</p>
					
					<div class="join_form">
		
					<form class="form-horizontal" method="post" action="/club/updateClub" enctype="multipart/form-data">
		
		
				<table>
					<colgroup>
						<col width="30%" />
						<col width="auto" />
					</colgroup>
				
					<tbody>
						<tr>
							<th><span>�� �� �� ��</span></th>
							<td><input style="height: 40px;" type="text" id="clubTitle" name="clubTitle" value="${club.clubTitle}" autocomplete='off'>
							</td>
						</tr>
						
						<tr>
							<th><span>�� �� �� ��</span></th>
							<td><input type="text" id="clubDetail" name="clubDetail" value="${club.clubDetail}" autocomplete='off'>
							</td>
						</tr>
						
						<tr>
							<th><span>����ī�װ�</span></th>
							<td><select class="form-control" id="clubCategory" name="clubCategory">
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
							</td>
						</tr>
						
						<tr>
							<th><span>Ȱ �� �� ��</span></th>
							<td><input type="text" id="clubArea" name="clubArea" value="${club.clubArea}" autocomplete='off'>
							</td>
						</tr>
						
						<tr>
							<th><span>�����̹���</span></th>
							<td><input type="file" class="file" id="clubImage" name="file" multiple="multiple">
							</td>
						</tr>		
						
					
					</tbody>
				
				</table>
				</div>
				</div>
				</div>
				
				</div>
				</form>			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
						<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    	</div>
			</div>
	
</body>
</html>
				
				
				
				
				<%-- <div class="form-group">
					<label for="clubTitle" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��${club}</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="clubTitle" name="clubTitle" value="${club.clubTitle}">
					</div>					
				</div>
			
			
		
			<div class="form-group">
				<label for="clubDetail" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="clubDetail" name="clubDetail" value="${club.clubDetail}">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="clubCategory" class="col-sm-offset-1 col-sm-3 control-label">����ī�װ�</label>
				<div class="col-sm-4">
					<select class="form-control" id="clubCategory" name="clubCategory">
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
					<input type="text" class="form-control" id="clubArea" name="clubArea" value="${club.clubArea}">
				</div>		
			</div>			
			
			<div class="form-group">
				<label for="clubImage" class="col-sm-offset-1 col-sm-3 control-label">�����̹���</label>
				<div class="col-sm-4">
					<input type="file" class="file" id="clubImage" name="file" multiple="multiple">
				</div>		
			</div> --%>
			
			
			
		<!-- 	<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
			</div>
		</form>	
		</div>
		
</body>
</html> -->



	<%-- 	<form class="form-horizontal" method="post" action="/club/updateClub" enctype="multipart/form-data">
		
			<div class="form-group">
				<label for="clubTitle" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��${club}</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="clubTitle" name="clubTitle" value="${club.clubTitle}">
				</div>					
			</div>
			
			
		
			<div class="form-group">
				<label for="clubDetail" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="clubDetail" name="clubDetail" value="${club.clubDetail}">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="clubCategory" class="col-sm-offset-1 col-sm-3 control-label">����ī�װ�</label>
				<div class="col-sm-4">
					<select class="form-control" id="clubCategory" name="clubCategory">
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
					<input type="text" class="form-control" id="clubArea" name="clubArea" value="${club.clubArea}">
				</div>		
			</div>			
			
			<div class="form-group">
				<label for="clubImage" class="col-sm-offset-1 col-sm-3 control-label">�����̹���</label>
				<div class="col-sm-4">
					<input type="file" class="file" id="clubImage" name="file" multiple="multiple">
				</div>		
			</div>
 --%>















