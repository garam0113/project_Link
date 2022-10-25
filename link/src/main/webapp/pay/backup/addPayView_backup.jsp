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
<!-- <link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->

<!-- Bootstrap Dropdown Hover JS -->
<!-- <script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->
<!-- calendar.js -->
<script type="text/javascript" src="/javascript/calendar.js"></script>
<!-- import.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

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
		
		$(".plus").bind("click", function(){
			
			//var updateClubMemberCount = parseInt( $(".payProduct-member").text() );
			var updateClubMemberCount = $(".payProduct-member").text();
			var updateClubCount = parseInt( $(".payProduct-club").text() );
			var totalPrice = parseInt( $(".totalPrice").text() );
			var clubNo = $("input[name='clubNo']").val();
			var maxPay = $("#maxPay").val();
			
			//alert( maxPay );
			//alert( clubNo );			
			//alert( updateClubMemberCount );
			//alert( updateClubCount );
			//alert( totalPrice );
			
			if( maxPay == totalPrice ){
				alert('if');
				${ pay.clubNo } == 0 ? $(".result").text( "�Ѹ�� �ִ�� ���� �� �� �ִ� ������ 10���Դϴ�" ): $(".result").text( "�ϳ��� ���Ӵ� �ִ� ���ӿ��� 50���Դϴ�" );
			}else{
				alert('else');
				if( clubNo != 0 ){
					// ȸ���� ���԰��Խ�û ������
					alert('if');
					$(".payProduct-club").text( parseInt( updateClubCount ) + 2 );
					$(".return-club-limit").text( parseInt( $(".return-club-limit").text() ) + 2 );
				}else{
					alert('else');
					$(".payProduct-member").text( updateClubMemberCount + 10 );
					$(".return-max-member").text( parseInt( $(".return-max-member").text() ) + 10 );
				}
				$(".totalPrice").text( totalPrice + 5000 );
				$(".result").text( "" );
			}
			
		});//end of plus
		
		$(".minus").bind("click", function(){
			
			var updateClubMemberCount = $(".payProduct-member").text();
			var updateClubCount = $(".payProduct-club").text();
			var totalPrice = $(".totalPrice").text();
			var clubNo = $("input[name='clubNo']").val();
			var max_member = $(".return-max-member").text();
			
			if( totalPrice == 5000 ){
				alert('if');
				$(".result").text( "�ּ� ���� �ݾ��� 5000���Դϴ�" );
			}else{
				alert('else');
				if( clubNo == 0 ){
					alert('if');
					$(".payProduct-club").text( parseInt( updateClubCount - 2 ) );
					$(".return-club-limit").text( parseInt( $(".return-club-limit").text() ) - 2 );
				}else{
					alert('else');
					alert(updateClubMemberCount);
					alert(max_member);
					$(".payProduct-member").text( updateClubMemberCount - 10 );
					$(".return-max-member").text( parseInt( max_member ) - 10 );
				}
				$(".totalPrice").text( totalPrice - 5000 );
				$(".result").text( "" );
			}
			
		});//end of minus
	});
</script>

<script type="text/javascript">
	function requestPayment() {
		//alert('����� ����?');
		
		var email = "${ user.email }";
		var phoneNo = "${ user.phoneNo }";
		var totalPrice = $(".totalPrice").text();
		var payProduct = ${ pay.clubNo != 0 && pay.payNavigation != 1 } ? "���ӿ� �߰�": "���� �߰�";
		var pg = $("input[name='payOption']:checked").attr("pg");
		var pay_method = $("input[name='payOption']:checked").attr("pay_method");
		var name = payProduct===0 ? "�ִ� ���� �� ����" : "�ִ� ���ӿ� �� ����";
		var updateClubMemberCount = $(".payProduct-member").text();
		var updateClubCount = $(".payProduct-club").text();
		
		if( !updateClubMemberCount ){
			updateClubMemberCount = 0;
		}
		if( !updateClubCount ){
			updateClubCount = 0;
		}
		
		$("input[name='payProduct']").val( payProduct );
		$("input[name='totalPrice']").val( totalPrice );
		$("input[name='updateClubMemberCount']").val( updateClubMemberCount );
		$("input[name='updateClubCount']").val( updateClubCount );
		$("input[name='clubNo']").val( ${ pay.clubNo } );		
		
		IMP.init("imp83557107"); // ������ �ĺ��ڵ�� IMP ��ü�� �ʱ�ȭ�Ѵ�
		//IMP.init("imp36216644"); // ������ �ĺ��ڵ�� IMP ��ü�� �ʱ�ȭ�Ѵ�
		
		IMP.request_pay({
				pg : pg,
				pay_method : pay_method,
				merchant_uid: 'merchant_' + new Date().getTime(), // �������� �����ϴ� �ֹ� ��ȣ
				name : name,
				amount : totalPrice,
				customer_uid : 'your-customer-unique-id', // �ʼ� �Է�.
				buyer_email : email,
				buyer_name : '���',
				buyer_tel : ${ user.phoneNo }
			    //buyer_addr : '����Ư���� ������ �Ｚ��',
			    //buyer_postcode : '123-456'

		}, function(rsp) { // callback
			if (rsp.success) {
				msg += '\n����ID : ' + rsp.imp_uid;
    			msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
    			msg += '\n���� �ݾ� : ' + rsp.paid_amount;
    			msg += '\nī�� ���ι�ȣ : ' + rsp.apply_num;
    			alert(msg);
    			$("input[name='merchant_uid']").val( rsp.merchant_uid );
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
		<input type="text" name="merchant_uid" value="">
		<input type="text" name="updateClubMemberCount" value="0">
		<input type="text" name="updateClubCount" value="0">
		<input type="text" name="clubNo" value="${ pay.clubNo }">
		<input type="text" id="maxPay" value="${ pay.maxPay }">
		<input type="text" name="payNavigation" value="${ pay.payNavigation }">
		</br></br></br>
		
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="pay-view">
		
			<div class="pay-payOption">				
				�������&nbsp;&nbsp;:&nbsp;&nbsp;
				<input type="radio" name="payOption" pg="danal_tpay" pay_method="card" value="�ſ�ī��">�ſ�ī��
				<input type="radio" name="payOption" pg="kakaopay" pay_method="card" value="īī������">īī������
				<input type="radio" name="payOption" pg="kcp" pay_method="phone" value="�޴�������">�޴�������
				<input type="radio" name="payOption" pg="tosspay" pay_method="card" value="�佺����">�佺����
				<input type="radio" name="payOption" pg="kcp" pay_method="trans" value="�ǽð� ������ü">�ǽð� ������ü
				</br></br>

				<c:choose>
					<c:when test="${ pay.clubNo != 0 && pay.payNavigation != 1  }">���� �� �ش� ������ �� ���ӿ����� <b class="return-max-member">${ returnClub.clubMaxMember + 10 }</b>��</c:when><%-- ���ӿ�����Ʈ�� --%>
					<c:when test="${ pay.clubNo == 0 && pay.payNavigation != 1 }">���� �� �ش� ȸ���� �� ���Ӽ��� <b class="return-club-limit">${ returnUser.joinClubLimit + 2 }</b>����</c:when><%-- ���Ӹ���Ʈ�� �̵� --%>
					<c:when test="${ pay.clubNo != 0 && pay.payNavigation == 1 }">���� �� �ش� ȸ���� �� ���Ӽ��� <b class="return-club-limit">${ returnUser.joinClubLimit + 2 }</b>����</c:when><%-- ���ӻ󼼺���� �̵� --%>
				</c:choose>
			</div>
			</br>
			
			
			<div class="pay-payProduct">
			&nbsp;&nbsp;<b class="plus">+</b>
				<c:choose>
					<c:when test="${ pay.clubNo != 0 && pay.payNavigation != 1 }">�߰��� ���ӿ� ��<b class="payProduct-member">10</b>��</c:when><%-- ���ӿ�����Ʈ�� --%>
					<c:when test="${ pay.clubNo == 0 && pay.payNavigation != 1 }">�߰��� ���� ��<b class="payProduct-club">2</b>����</c:when><%-- ���Ӹ���Ʈ�� �̵� --%>
					<c:when test="${ pay.clubNo != 0 && pay.payNavigation == 1 }">�߰��� ���� ��<b class="payProduct-club">2</b>����</c:when><%-- ���ӻ󼼺���� �̵� --%>
				</c:choose>
			<b class="minus">-</b>
			<b class="result"></b>
			</div>
			</br>
			
			<div class="pay-totalPrice">
				�� �����ݾ� : <b class="totalPrice">5000</b>��
			</div>
			</br>
			
			<div>
				<input type="button" value="�����ϱ�">
				<input type="button" value="����ϱ�">
			</div>
		
		</div>
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	</form>

</body>

</html>


