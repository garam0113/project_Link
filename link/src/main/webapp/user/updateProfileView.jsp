<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="The Page Description">

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/nickNameCheck.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/category.js"></script>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#update").on("click", function() {
			fncUpdateProfile();
		});
		$("#cancel").on("click", function() {
			history.back();
		});
	});
	
	function fncUpdateProfile() {
		
		var regExp2 = /\s/g;
		var nickName = $("#nickName").val();
		var gender = $("#gender").is(":checked");
		var checkNickName = $("#checkNickName").val();
		//alert(gender);
		
		if(nickName == null || nickName.length < 1){
			swal.fire("�г����� �Է��� �ּ���.");
			return;
		}
		
		if(gender == false){
			swal.fire("���� üũ�� ���ּ���.");
			return;
		}
		
		if(nickName == null || nickName.length <1){
			swal.fire("�г����� �Է��ϼž� �մϴ�.");
			return;
		}
		
		if(regExp2.test(nickName)){
			swal.fire("������ ����� �� �����ϴ�.");
			return;
		}
		
		if(checkNickName == 2){
			swal.fire("������� �г��� �Դϴ�");
			return;
		}
		
		if(${ empty getUser.nickName}){
			$("form").attr("method", "POST").attr("action", "/user/addProfile").attr("encType", "multipart/form-data").submit();
		}else{
			$("form").attr("method", "POST").attr("action", "/user/updateProfile").attr("encType", "multipart/form-data").submit();
		}
	}
</script>
</head>

<body>
	<jsp:include page="/toolbar.jsp" />
	<c:if test="${! empty getUser.nickName }">
		<div id="intro-wrap" data-height="27.778">
			<div id="intro" class="preload darken">
				<div class="intro-item"
					style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
					<div class="caption">
						<h2>MyBlog</h2>
						<p>Write down your daily life</p>
					</div>
					<!-- caption -->
				</div>
				<!-- intro -->
			</div>
			<!-- intro -->
		</div>
	</c:if>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

	<form>
		<div class="wrap wd668">
			<div class="container">
				<br /> <br />
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">�������ۼ�</h2>
					<div class="join_form">
						<table>
							<colgroup>
								<col width="30%" />
								<col width="auto" />
							</colgroup>
							<tbody>
								<tr>
									<td><input type="hidden" class="form-control" id="userId"
										name="userId" value="${ getUser.userId }"></td>
								</tr>
								<tr>
									<th><span>�г���</span></th>
									<td><input type="text" class="form-control" id="nickName"
										name="nickName" placeholder="�ߺ�Ȯ���ϼ���" value="${getUser.nickName }"><span
										id="helpBlock" class="help-block"> <strong
											class="text-danger" id="nickNameCheck">Ư������&nbsp;���&nbsp;�Ұ�,&nbsp;1~10��</strong>
											<input type="hidden" id="checkNickName"></span></td>
								</tr>
								<tr>
								<tr>
									<th><span>����</span></th>
									<td><input type="radio" class="form-radio" id="gender"
										name="gender" placeholder="����" value="����">&nbsp;���� <input
										type="radio" class="form-radio" id="gender" name="gender"
										placeholder="����" value="����">&nbsp;����</td>
								</tr>
								<tr>
									<th><span>Ȱ������</span></th>
									<td><select name="selectArea" id="selectArea">
											<option selected="selected">�������ּ���</option>
											<option>2</option>
											<option>2</option>
											<option>2</option>
									</select></td>
								</tr>

								<tr>
									<th></th>
									<td>
										<div id="area1" name="area1"></div>
										<div id="area2" name="area2"></div>
										<div id="area1" name="area1"></div>
								</tr>

								<tr>
									<th><span>����ī�װ�</span></th>
									<td><div style="display: flex;">
											<select class="form-control"
												style="height: 40px; width: 200px; margin-right: 20px; border: 1px solid #2c2b2b17;"
												name="categorySelect" id="categorySelcet">
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
											<button type="button" class="btn btn-primary"
												id="categryClick">�߰�</button>
										</div></td>
								</tr>

								<tr>
									<th></th>
									<td>
										<div id="ca"></div> <input type="hidden" name="category1"
										id="category1"> <input type="hidden" name="category2"
										id="category2"> <input type="hidden" name="category3"
										id="category3">
								</tr>


								<tr>
									<th><span>�����ʱ�</span></th>
									<td><input type="text" class="form-control"
										id="profileWriting" name="profileWriting" placeholder="�����ʱ�"
										value="${getUser.profileWriting}"></td>
								</tr>
								<tr>
									<th><span>�����ʻ���</span></th>
									<td><input type="file" class="form-file" id="profileImageFile"
										name="profileImageFile" placeholder="�����ʻ���"
										value="${getUser.profileImage}"></td>
								</tr>
								<tr>
									<th><span></span></th>
									<td align="center">
										<button type="button" class="btn btn-primary" id="update">��
											&nbsp;��</button>
										<button type="button" class="btn btn-primary" id="cancel">��
											&nbsp;��</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- form_txtInput E -->
			</div>
			<!-- content E-->
		</div>
		<!-- container E -->
	</form>

</body>
</html>