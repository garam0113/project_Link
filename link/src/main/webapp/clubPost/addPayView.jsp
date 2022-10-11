<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<!-- calendar.js -->
<script type="text/javascript" src="/javascript/calendar.js"></script>
<!-- import.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
	body {
		padding-top: 50px;
	}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<!-- import�� ����ϱ� ���� -->

<script type="text/javascript">
	$(function(){
		$("input[value='�����ϱ�']").bind("click", function(){
			requestPayment();
		});
		$("input[value='����ϱ�']").bind("click", function(){
			history.go(-1);
		});
	});
</script>

<script type="text/javascript">
	function requestPayment() {
		alert('����� ����?');
		
		var email = "${ user.email }";
		var name = "${ user.name }";
		var phoneNo = "${ user.phoneNo }";
		var totalPrice = $("div[class='pay-totalPrice']").find("b").text();
		var payOption = $();
		var payProduct = $();
		//alert(email);
		//alert(name);
		//alert(phoneNo);
		//alert(totalPrice);
		
		IMP.init("imp83557107"); // ������ �ĺ��ڵ�� IMP ��ü�� �ʱ�ȭ�Ѵ�
		//IMP.init("imp36216644"); // ������ �ĺ��ڵ�� IMP ��ü�� �ʱ�ȭ�Ѵ�
		
		IMP.request_pay({
			//pay_method : card(�ſ�ī��), trans(�ǽð�������ü), vbank(�������), phone(�޴����Ҿװ���)
			//�ſ�ī�� ����
			/*
				pg : 'danal_tpay',
				//pg : 'html5_inicis',
				pay_method : 'card',
				merchant_uid: 'merchant_' + new Date().getTime(), // �������� �����ϴ� �ֹ� ��ȣ
				name : '�߰����Ӽ�',
				amount : totalPrice,
				customer_uid : 'your-customer-unique-id', // �ʼ� �Է�.
				buyer_email : email,
				buyer_name : name,
				buyer_tel : phoneNo
			/*/

			//īī������
			/*
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid: 'merchant_' + new Date().getTime(), // �������� �����ϴ� �ֹ� ��ȣ
				name : '������������',
				amount : 100,
				customer_uid : 'your-customer-unique-id', // �ʼ� �Է�.
				buyer_email : 'iamport@siot.do',
				buyer_name : '������Ʈ',
				buyer_tel : '02-1234-1234'
			 */

			//�޴�������
			/*
			    pg : 'html5_inicis',
			    pay_method : 'phone',
			    merchant_uid: 'merchant_' + new Date().getTime(), // �������� �����ϴ� �ֹ� ��ȣ�� ����
			    name : '�ֹ���:�����׽�Ʈ',
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '�������̸�',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '����Ư���� ������ �Ｚ��',
			    buyer_postcode : '123-456',
			    m_redirect_url : '{����Ͽ��� ���� �Ϸ� �� ���𷺼� �� URL}' // ��: https://www.my-service.com/payments/complete/mobile
			 */
		
			//�佺����
			/*
			    pg : 'tosspay',
			    pay_method : 'card',
			    merchant_uid: 'merchant_' + new Date().getTime(), // �������� �����ϴ� �ֹ� ��ȣ�� ����
			    name : '�ֹ���:�����׽�Ʈ',
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '�������̸�',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '����Ư���� ������ �Ｚ��',
			    buyer_postcode : '123-456',
			    m_redirect_url : '{����Ͽ��� ���� �Ϸ� �� ���𷺼� �� URL}' // ��: https://www.my-service.com/payments/complete/mobile	
			 */
		
			//�ǽð� ������ü
			///*
			    pg : 'html5_inicis',
			    pay_method : 'trans',
			    merchant_uid: 'merchant_' + new Date().getTime(), // �������� �����ϴ� �ֹ� ��ȣ�� ����
			    name : '�ֹ���:�����׽�Ʈ',
			    amount : 1000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '�������̸�',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '����Ư���� ������ �Ｚ��',
			    buyer_postcode : '123-456',
			    m_redirect_url : '{����Ͽ��� ���� �Ϸ� �� ���𷺼� �� URL}' // ��: https://www.my-service.com/payments/complete/mobile
			// */

			//������ �Ա�
				/*
				pg : 'html5_inicis',
				pay_method : 'vbank',
				merchant_uid : 'merchant_' + new Date().getTime(), // �������� �����ϴ� �ֹ� ��ȣ�� ����
				name : '�ֹ���:�����׽�Ʈ',
				amount : 100,
				buyer_email : 'itzrb577@naver.com',
				buyer_name : 'Ȳ�ٷ�',
				buyer_tel : '010-8325-6825',
				//buyer_addr : '����Ư���� ������ �Ｚ��',
				//buyer_postcode : '123-456',
				//m_redirect_url : '{����Ͽ��� ���� �Ϸ� �� ���𷺼� �� URL}', // ��: https://www.my-service.com/payments/complete/mobile
				//notice_url : 'http://192.168.0.74:8080/purchase/json/complete', //���ż��� URL ��
			*/

		}, function(rsp) { // callback
			if (rsp.success) {
				msg += '\n����ID : ' + rsp.imp_uid;
    			msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
    			msg += '\n���� �ݾ� : ' + rsp.paid_amount;
    			msg += '\nī�� ���ι�ȣ : ' + rsp.apply_num;
    			alert(msg);
    			$("form").attr("method", "post").attr("action", "/clubPost/addPay").submit();
			} else {
				var msg = '������ �����Ͽ����ϴ�.';
				msg += '�������� : ' + rsp.error_msg;
				alert(msg);
			}
		});
	}
</script>

</head>

<body>
	<form name="addPayForm" method="post" action="/clubPost/addPay">
	
		<input type="text" name="payProduct" value="">
		<input type="text" name="totalPrice" value="">

		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="pay-view">
		
			<div class="pay-payOption">
				�������&nbsp;&nbsp;:&nbsp;&nbsp;
				<input type="radio" name="payOption" value="�ſ�ī��">�ſ�ī��
				<input type="radio" name="payOption" value="īī������">īī������
				<input type="radio" name="payOption" value="�޴�������">�޴�������
				<input type="radio" name="payOption" value="�佺����">�佺����
			</div>
			
			<div class="pay-payProduct">
				<c:choose>
					<c:when test="${ pay.clubNo != 0 }">�߰� ���ӿ� ��<b class="payProduct-member">20</b>��
					</c:when>
					<c:when test="${ pay.clubNo == 0 }">�߰� ���� ��<b class="payProduct-club">2</b>����
					</c:when>
				</c:choose>
			</div>
			
			<div class="pay-totalPrice">
				�� �����ݾ� : <b class="totalPrice">1000</b>��
			</div>
			
			<div>
				<input type="button" value="�����ϱ�">
				<input type="button" value="����ϱ�">
			</div>
		
		</div>
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	</form>

</body>

</html>































