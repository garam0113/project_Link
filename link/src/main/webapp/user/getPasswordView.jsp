<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/SMSCheck.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/emailCheck.js"></script>
 

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<script type="text/javascript">
	$(function() {
		$(".btn.check12").on("click", function() {
			fncGetPassword();
		}); 
		$(".btn.black1").on("click", function() {
			$('#modalPass').modal('hide');
		});
	});
	
	$(function() {
		 $("a[href='#q']").on("click", function() {
			 $("#home1").hide();
			 $("#profile1").show();
		})
		$("a[href='#n']").on("click", function() {
			 $("#profile1").hide();
			 $("#home1").css('display','flex');
		}) 
	})

	function fncGetPassword() {

		var id = $("#userId").val();
		var name = $("#name").val();
		var rrn1 = $("#rrn1").val();
		var rrn2 = $("#rrn2").val();
		var rrn = rrn1 + "-" + rrn2;
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var phoneNo = $("#phone1").val() + "-" + phone2 + "-" + phone3;
		var checkNo = $("#checkNo").val();
		var email = $("#email").val();

		$("#rrn").val(rrn);

		console.log("rrn �� : " + $("#rrn").val());
		console.log("phone2 : " + phone2 + ", phone3 : " + phone3);
		console.log("email : " + email);

		if (id == null || id.length < 1) {
			swal.fire("���̵� �Է��� �ּ���.");
			return;
		}

		if (name == null || name.length < 1) {
			swal.fire("�̸��� �Է��� �ּ���.");
			return;
		}

		if (rrn == null || rrn.length < 1) {
			swal.fire("�ֹι�ȣ�� �Է��� �ּ���.");
			return;
		}

		if (phone2 == "" && phone3 == "" && email == "") {
			swal.fire("�ڵ���, �̸��������� �ϳ��� �����ּ���.")
			return;
		}

		if (checkNo != 1) {
			swal.fire("������ �ʿ��մϴ�.");
			return;
		}

		$.ajax("/userRest/json/getUserId", {

			type : "POST",
			data : JSON.stringify({
				name : name,
				rrn : rrn,
				outUserState : '0'
			}),
			dataType : "json",
			contentType : "application/json",
			henders : {
				"Accept" : "application/json"
			},
			success : function(Data, status) {
				console.log(Data.phoneNo)
				console.log(phoneNo)
				console.log(Data.userId)

				if (Data.userId != id) {
					swal.fire("���̵� �ٸ��ϴ�.");
					return;
				}

				$.ajax("/userRest/json/updatePassword", {

					type : "POST",
					data : JSON.stringify({
						userId : id,
						email : email
					}),
					contentType : "application/json",
					henders : {
						"Accept" : "application/json"
					},
					success : function(JsonData, status) {
						console.log(JsonData)

						if (email == null || email.length < 1) {
							swal.fire("�ӽ� ��й�ȣ�� �ڵ�����ȣ�� ���۵Ǿ����ϴ�.").then(
									function() {
										window.close();
									});
						}

						if (phone2.length < 1 || phone3.length < 1) {
							swal.fire("�ӽ� ��й�ȣ�� �̸��Ϸ� ���۵Ǿ����ϴ�.").then(
									function() {
										window.close();
									});
						}
					}
				})
			},
			error : function() {
				console.log("error");
				swal.fire("���Ե� ������ ��ġ���� �ʽ��ϴ�.");
			}
		})
	}
</script>

</head>

<body>
	<div class='modal fade' id='modalPass'
		style='display: none; width: fit-content; height: fit-content; margin-left: 515px; border-radius: 30px; zoom: 1.2;'>
		<div class='madal-dialog'>
			<div class='modal-content' style="background-color: whitesmoke;">
				<div class='modal-header'>
					<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
					<div class="container" style="width: 500px;">

						<!-- form Start /////////////////////////////////////-->
						<form class="form-horizontal">
							<div class="form-group" style="margin-top: 30px; margin-left: 20px; display: flex; height: 30px">
								<label for="userId" style="margin-left: 0px;">���̵�</label>
									<input type="text" class="form-control" id="userId"
										name="uesrID" style="margin-left: 35px;" value=""
										placeholder="���̵�">
							</div>
							<div class="form-group"
								style="display: flex; margin-top: 20px; margin-left: 20px; height: 30px;">
								<label for="name" style="text-align-last: start;">�� ��</label> <input
									type="text" class="form-control" id="name" name="name" value=""
									placeholder="�̸�" style="margin-left: 50px;">
							</div>

							<div class="form-group"
								style="display: flex; margin-left: 20px; height: 30px; margin-top: 20px;">
								<label for="rrn" style="text-align-last: start;">�ֹι�ȣ</label>
								<div>
									<input type="text" class="form-control" id="rrn1" name="rrn1"
										value="" style="margin-left: 20px; width: 100px">
								</div>
								<div>
									<input type="password" class="form-control" id="rrn2"
										name="rrn2" value="" style="margin-left: 10px; width: 100px">
								</div>
								<input type="hidden" id="rrn" name="rrn">
							</div>

							<ul class="nav nav-tabs" role="tablist"
								style="margin-left: 20px; display: flex; margin-top: 30px;">
								<li role="presentation" class="active"><a href="#n"
									aria-controls="home" role="tab" data-toggle="tab">�ڵ���</a></li>
								<li role="presentation"><a href="#q"
									aria-controls="profile" role="tab" data-toggle="tab">�̸���</a></li>
							</ul>

							<div class="tab-content" style="margin-top: 15px;">
								<div role="tabpanel" class="tab-pane active" id="home1"
									style="display: flex; margin-left: 20px;">
									<div>
										<select class="form-control" name="phone1" id="phone1"
											style="margin-top: 10px; margin-left: 0px; width: auto; font-size: large;">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
									</div>

									<div style="margin: 10px">
										<input type="text" class="form-control" id="phone2"
											name="phone2" style="width: 75px;">
									</div>

									<div style="margin: 10px">
										<input type="text" class="form-control" id="phone3"
											name="phone3" style="margin-left: -10px; width: 75px;">
									</div>
									<input type="hidden" name="phoneNo" />

									<div style="margin: 7px;">
										<button type="button" id="sendPhoneNumber" class="btn"
											style="margin-top: 3px; height: 20px; font-size: large; font-weight: 600; border-color: #5F0080; border-radius: 13px;">������ȣ����</button>
									</div>
								</div>

								<div role="tabpanel" class="tab-pane" id="profile1"
									style="display: none; margin-left: 30px; margin-top: 20px;">
									<div>
										<input type="text" class="form-control" id="email"
											name="email"
											style="margin-top: 0px; margin-left: 0px; width: 220px;"
											placeholder="�����̸���">
									</div>
									<div>
										<button type="button" id="sendEmail" class="btn "
											style="margin-bottom: 20px; margin-top: -10px; margin-left: 0px; height: 22px; font-size: large; font-weight: 600; border-color: #5F0080; border-radius: 13px;">������ȣ����</button>
									</div>
								</div>
							</div>

							<div class="form-group"
								style="display: flex; margin-left: 20px; width: 100px; height: 40px;">
								<input type="text" class="form-control"
									id="inputCertifiedNumber" style="width: 100px; height: 40px;"
									name="inputCertifiedNumber" placeholder="������ȣ">
								<div>
									<button type="button" id="checkBtn" class="btn "
										style="margin-left: 15px; margin-top: 3px; height: 22px; font-size: large; font-weight: 600; border-color: #5F0080; border-radius: 13px;">������ȣȮ��</button>
									<input type="hidden" id=checkNo>
								</div>
							</div>

							<div class="form-group" style="display: flex;">
								<button type="button" id="check12" class="btn check12"
									style="margin-left: 182px; font-size: large; font-weight: 600; border-color: #5F0080; border-radius: 13px; margin-top: 15px;">Ȯ
									&nbsp;��</button>
								<button type="button" id="black1" class="btn black1"
									style="margin-left: 10px; font-size: large; font-weight: 600; border-color: #5F0080; border-radius: 13px; margin-top: 15px;">��
									&nbsp;��</button>
							</div>
						</form>
						<!-- form Start /////////////////////////////////////-->

					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>