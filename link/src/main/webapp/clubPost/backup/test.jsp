<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
  <button id="testBtn" class="btn">��� �׽�Ʈ</button>
  
  <!-- ȸ������ Ȯ�� Modal-->
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</button>
					<h3 class="modal-title" id="exampleModalLabel">����׽�Ʈ</h5>
				</div>
				<div class="modal-body">���� �Է� !!</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">��</a>
					<button class="btn" type="button" data-dismiss="modal">�ƴϿ�</button>
				</div>
			</div>
		</div>
	</div>
	


	
	<script>
		$('#testBtn').click(function(e){
			e.preventDefault();
			$('#testModal').modal("show");
		});
	</script>
</body>
</html>