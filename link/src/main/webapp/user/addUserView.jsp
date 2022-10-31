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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/addUser.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/SMSCheck.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/nickNameCheck.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/category.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/image.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#addUser").on("click", function() {
			fncAddUser();
		});
	});

	function fncAddUser() {

		var num = /^[0-9]*$/;
		var regExp = /^[a-z0-9_]{4,20}$/;
		var regExp2 = /\s/g;
		var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var regRrn = /^([0-9]{6})-?([0-9]{7})$/;

		var id = $("#userId").val();
		var checkId = $("#checkId").val();
		var pw = $("#password").val();
		var pw2 = $("#password2").val();
		var name = $("#name").val();
		var nickName = $("#nickName").val();
		var checkNickName = $("#checkNickName").val();
		var gender = $(".radiog").is(":checked");
		var rrn1 = $("#rrn1").val();
		var rrn2 = $("#rrn2").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var checkNo = $("#checkNo").val();
		var email = $("#email").val();

		console.log("üũ ��� �� : " + gender);

		if (id == null || id.length < 1) {
			swal.fire("���̵� �Է��ϼž� �մϴ�.");
			return;
		} else if (5 > id.length || id.length > 8) {
			swal.fire("���̵�� ����, �������� 5~8�� �Դϴ�.");
			return;
		} else if (!regExp.test(id)) {
			swal.fire("���̵�� ����, �������� 5~8�� �Դϴ�.");
			return;
		}

		if (checkId == 2) {
			swal.fire("������� ���̵� �Դϴ�");
			return;
		}

		if (pw == null || pw.length < 1) {
			swal.fire("��й�ȣ�� �Է��ϼž� �մϴ�.");
			return;
		}

		if (6 > pw.length || pw.length > 12) {
			swal.fire("��й�ȣ�� ����, �������� 6~12�� �Դϴ�.");
			return;
		}

		if (!regExp.test(pw) && num.test(pw)) {
			swal.fire("��й�ȣ�� ����, �������� 6~12�� �Դϴ�.");
			return;
		}

		if (pw != pw2) {
			swal.fire("��й�ȣ�� �ٸ��ϴ�.");
			return;
		}

		if (name == null || name.length < 1) {
			swal.fire("�̸��� �Է��ϼž� �մϴ�.");
			return;
		}

		if (nickName == null || nickName.length < 1) {
			swal.fire("�г����� �Է��ϼž� �մϴ�.");
			return;
		}

		if (regExp2.test(nickName)) {
			swal.fire("������ ����� �� �����ϴ�.");
			return;
		}

		if (checkNickName == 2) {
			swal.fire("������� �г��� �Դϴ�");
			return;
		}

		if (gender == false) {
			swal.fire("���� üũ�� ���ּ���.");
			return;
		}

		var rrn = "";
		if (rrn1 != "" && rrn2 != "") {
			rrn = rrn1 + "-" + rrn2;
		} else if (rrn1 != "" || rrn2 != "") {
			swal.fire("�ֹι�ȣ�� �Է��ϼž� �մϴ�.");
			return;
		}
		$("input:hidden[name='rrn']").val(rrn);

		if (!regRrn.test($("input:hidden[name='rrn']").val())) {
			swal.fire("�ֹι�ȣ�� ����� �Է��� �ּ���.");
			return;
		}

		var value = "";
		if (phone2 != "" && phone3 != "") {
			value = $("#phone1").val() + "-" + phone2 + "-" + phone3;
		} else if (phone2 != "" || phone3 != "") {
			swal.fire("�ڵ��� ��ȣ�� �Է��ϼž� �մϴ�.");
			return;
		}
		$("input:hidden[name='phoneNo']").val(value);

		if (!regPhone.test($("input:hidden[name='phoneNo']").val())) {
			swal.fire("�ڵ�����ȣ�� ����� �Է����ּ���.");
			return;
		}

		if (checkNo != 1) {
			swal.fire("�ڵ��������� �ʿ��մϴ�.");
			return;
		}

		if (email == null || email.length < 1) {
			swal.fire("�̸����� �Է��ϼž� �մϴ�.");
			return;
		}

		if (!regEmail.test(email)) {
			swal.fire("�̸����� ����� �Է����ּ���.");
			return;
		}

		console.log(rrn);
		$.ajax("/userRest/json/getUser", {
			method : "POST",
			data : JSON.stringify({
				name : name,
				rrn : rrn,
				outUserState : '0'
			}),
			dataType : "json",
			contentType : "application/json",
			henders : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
				console.log(JSONData);
				if (JSONData.userId != "") {
					swal.fire("�̹̰��Ե� ȸ���Դϴ�.");
				} else {
					$("form").attr("method", "POST").attr("action",
							"/user/addUser").attr("encType",
							"multipart/form-data").submit();
				}
			}
		});

	}

	$(function() {
		//alert("function����")
		$("#userId").on("keyup", function() {

			console.log($("#userId").val());

			var input = $("#userId").val();

			$.ajax("/userRest/json/getUser", {

				method : "POST",
				data : JSON.stringify({
					userId : input
				}),
				dataType : "json",
				contentType : "application/json",
				henders : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {

					//console.log("JSONData : "+JSONData);
					//console.log("JSONData.userId : "+JSONData.userId);

					var userId = JSONData.userId;
					console.log("DB�� ���� UserId : " + userId);
					if (userId == "") {
						$("#userIdCheck").html("��밡���� ���̵� �Դϴ�.");
						$("#checkId").val(1);
						console.log($("#checkId").val());
					} else {
						$("#userIdCheck").html("������� ���̵� �Դϴ�.");
						$("#checkId").val(2);
						console.log($("#checkId").val());
					}

				}

			});
		});
	});
</script>

</head>

<body>
	<form style="background-color: #EBEDF0;">
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">ȸ������</h2>
					<p class="exTxt">ȸ�����Խ� �ڵ��� ������ �ݵ�� �����ϼž� �մϴ�.</p>
					<div class="join_form">
						<table>
							<colgroup>
								<col width="30%" />
								<col width="auto" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>���̵�</span></th>
									<td><input style="height: 40px;" type="text" id="userId"
										name="userId" placeholder="ID �� �Է��ϼ���."> <span><strong
											class="text-danger" id="userIdCheck">����, �������� 5~8��</strong> </span>
										<input type="hidden" id="checkId"></td>
								</tr>
								<tr>
									<th><span>�̸�</span></th>
									<td><input type="text" id="name" style="height: 40px;"
										name="name" placeholder=""></td>
								</tr>
								<tr>
									<th><span>�г���</span></th>
									<td><input type="text" id="nickName" style="height: 40px;"
										name="nickName" placeholder=""><strong
										class="text-danger" id="nickNameCheck">" Ư������ ��� �Ұ�,
											1~10��</strong><input type="hidden" id="checkNickName"></td>
								</tr>
								<tr>
									<th><span>����</span></th>
									<td>
										<div style="display: flex;">
											<div style="margin-right: 10px;">
												<input type="radio" class="radiog" id="gender" name="gender"
													placeholder="����" value="����">����
											</div>
											<div>
												<input type="radio" class="radiog" id="gender" name="gender"
													placeholder="����" value="����">����
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th><span>�ֹι�ȣ</span></th>
									<td>
										<div style="display: flex;">
											<div>
												<input
													style="height: 40px; width: 150px; margin-right: 20px;"
													type="text" id="rrn1" name="rrn1" class="rrn1">
											</div>
											<div>
												<input style="height: 40px; width: 150px;" type="password"
													id="rrn2" name="rrn2" class="rrn2">
											</div>
											<input type="hidden" id="rrn" name="rrn" class="rrn">
											<input type="hidden" id="rrnCheck">
										</div>
									</td>
								</tr>
								<tr>
									<th><span>��й�ȣ</span></th>
									<td><input type="password" id="password"
										style="height: 40px;" name="password"
										placeholder="��й�ȣ�� �Է����ּ���."><span id="helpBlock"
										class="help-block"> <strong class="text-danger">����,
												�������� 6~12��</strong>
									</span></td>
								</tr>
								<tr>
									<th><span>��й�ȣ</span> <span>Ȯ��</span></th>
									<td><input type="password" id="password2"
										style="height: 40px;" name="password2"
										placeholder="��й�ȣ�� Ȯ���ϼ���"><span id="helpBlock"
										class="help-block"> <strong class="text-danger">����,
												�������� 6~12��</strong>
									</span></td>
								</tr>
								<tr class="email">
									<th><span>�̸���</span></th>
									<td><input type="text"
										style="height: 40px; width: 461.59px;" class="email"
										name="email" id="email" placeholder=""></td>
								</tr>
								<tr>
									<th><span>�޴���</span><span>��ȣ</span></th>
									<td>
										<div style="display: flex;">
											<div>
												<select class="form-control"
													style="height: 40px; width: 80px; margin-right: 20px; border: 1px solid #ececec;"
													name="phone1" id="phone1">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="018">018</option>
													<option value="019">019</option>
												</select>
											</div>
											<div>
												<input
													style="height: 40px; width: 80px; margin-right: 20px;"
													type="text" id="phone2" name="phone2" class="phone2"
													placeholder="">
											</div>
											<div>
												<input
													style="height: 40px; width: 80px; margin-right: 20px;"
													type="text" id="phone3" name="phone3" class="phone3"
													placeholder="">
												<button type="button" id="sendPhoneNumber"
													style="height: 40px; width: 100px; background-color: #E1BFFF; border-style: hidden;">������ȣ
													�߼�</button>
											</div>
											<input type="hidden" name="phoneNo" />
										</div>
									</td>
								</tr>
								<tr>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th><span>������ȣ</span></th>
									<td><div style="display: flex;">
											<input type="text" id="inputCertifiedNumber"
												style="height: 40px; margin-right: 20px;"
												name="inputCertifiedNumber" class="send_number"
												placeholder="10:00">
											<button type="button"
												style="height: 40px; width: 100px; background-color: #E1BFFF; border-style: hidden;"
												id="checkBtn" class="btn_confirm">������ȣ Ȯ��</button>
											<input type="hidden" id="checkNo">
										</div></td>
								</tr>
								<tr>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th><span>Ȱ������</span></th>
									<td>
										<div style="display: flex;">
											<select class="form-control"
												style="height: 40px; width: 200px; margin-right: 20px; border: 1px solid #ececec;"
												name="areaSelcet" id="areaSelcet">
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
											<button type="button"
												style="width: 60px; background-color: #E1BFFF; border-style: hidden;"
												id="areaClick">�߰�</button>
										</div>
									</td>
								</tr>
								<tr>
									<th></th>
									<td>
										<div id="ar"></div> <input type="hidden" name="area1"
										id="area1"> <input type="hidden" name="area2"
										id="area2"> <input type="hidden" name="area3"
										id="area3">
									</td>
								</tr>
								<tr>
									<th><span>����</span><span>ī�װ�</span></th>
									<td>
										<div style="display: flex;">
											<select class="form-control"
												style="height: 40px; width: 200px; margin-right: 20px; border: 1px solid #ececec;"
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
											<button type="button"
												style="width: 60px; background-color: #E1BFFF; border-style: hidden;"
												id="categryClick">�߰�</button>
										</div>
									</td>
								</tr>
								<tr>
									<th></th>
									<td>
										<div id="ca"></div> <input type="hidden" name="category1"
										id="category1"> <input type="hidden" name="category2"
										id="category2"> <input type="hidden" name="category3"
										id="category3">
									</td>
								</tr>
								<tr>
									<th>�����ʱ�</th>
									<td><input type="text" style="height: 40px;"
										class="form-control" id="profileWriting" name="profileWriting"
										placeholder="�����ʱ�"></td>
								</tr>
								<tr>
									<th>�����ʻ���</th>
									<td><input type="file" onchange="setThumbnail(event);"
										style="display: none;" class="form-file" id="profileImageFile"
										name="profileImageFile" />
										<button id="im" type="button" class="image"
											style="border-style: hidden;">
											<img id="imga" src="/resources/image/uploadFiles/default.png"
												style="height: 300px; width: 300px;" />
										</button></td>
								</tr>
							</tbody>
						</table>
						<div class="exform_txt"></div>
					</div>
					<!-- join_form E  -->
					<div class="agree_wrap">
						<div class="checkbox_wrap mar27">
							<input type="checkbox" id="marketing" name="marketing"
								class="agree_chk"> <label for="marketing">[����]������
								���� �������� ���� �� �̿뿡 ���� ����</label>
							<ul class="explan_txt">
								<li><span class="red_txt">�׸� : ����, �������</span></li>
								<li>���Բ����� ���� �������� �� ȸ������ ���� ���� ���� �߰��� �����ϴ� ����������<br /> ����
									�������� �ʰų� ���������� �������� �������ν� �ź��Ͻ� �� �ֽ��ϴ�.<br /> �ٸ� �̶� ȸ�� ��� ���񽺰�
									���ѵ� �� �ֽ��ϴ�.
								</li>
							</ul>
						</div>
					</div>
					<div class="btn_wrap">
						<a href="#" id="addUser" style="height: 50px;">Ȯ��</a>
					</div>
					<br />
				</div>
				<!-- form_txtInput E -->
			</div>
			<!-- content E-->
		</div>
		<!-- container E -->
	</form>
</body>
</html>