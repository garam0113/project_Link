<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<head>

<title>ȸ��������ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">
		
		//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
 	$("#sgr:contains('������')").on("click" , function() {
		//$(self.location).attr("href","/user/logout");
		self.location = "/myHome/getProfile?userId=${user.userId}"
	}); 
	$("#gg:contains('������Ʈ')").on("click" , function() {
		//$(self.location).attr("href","/user/logout");
		self.location = "/myHome/updateProfile?userId=${user.userId}"
	});
	$("#ff:contains('�ȷο츮��Ʈ')").on("click" , function() {
		//$(self.location).attr("href","/user/logout");
		self.location = "/myHome/getFollowList?userId=${user.userId}"
	}); 
	

 });
 		
 $(function(){


     $(".pp").on("click" , function() {
   
           var userId = $(".pp").html();
           //console.log(userId);
           //alert("����");
           // �̰Ծȵȴٴ°���?��������
           $(document).ready(function(){
        		$.ajax({
        			type: 'GET',   //get������� ���
        			url : '/myHomeRest/json/addFollow/'+userId,  //�̵��� jsp ���� �ּ�
        			dataType:'json',   //������������ �ޱ�
        			success: function(data){   //������ �ְ�ޱ� �������� ��� ������ ���
        	            //function(data)�� ���� �Ǹ� ���޹��� �����Ͱ� data�ȿ� ��Ƽ� ������ �ȴ�. 
        				//alert(data); 
        			    console.log("userId : "+data);
        			},
        			error:function(data){   //������ �ְ�ޱⰡ �������� ��� ������ ���
        				//alert('����');
        			}
        		})
        	});
              
     });
 });			
 
</script>
<style>
.calendar {
	margin: 0 auto;
	width: 1000px;
	display: flex;
	justify-content: center;
}
</style>

<style>
.image {
	margin: 0 auto;
	width: 400px;
	text-align: center;
}

.to {
	margin: 0;
	width: 350px;
	text-align: left;
}

.usertext {
	margin-right: 10px;
	padding: 10px;
	margin-left: -100px;
}

.calendertext {
	padding: 10px;
}
</style>



</head>

<body bgcolor="#ffffff" text="#000000">


<div class="calendar">

		<div class="usertext">
			<table width="300px" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 13px;" class="to">
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
                    
					<td width="104" class="ct_write">���̵�</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="105" class="pp">${user.userId}</td>  
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>

				<tr>
					<td width="104" class="ct_write">�̸�</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${user.nickName}</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">�ּ�</td>
					<td bgcolor="D6D6D6" width="1"></td>

				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">�̸���</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							
							
								
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>

				<tr>
					<td width="104" class="ct_write">��������</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td height="26">${club.clubTitle}</td>
					<td height="26">${user.nickName}</td>
					<td height="26">${user.phoneNo}</td>
					<td height="26">${club.clubDetail}</td>
					<td height="26">${club.clubArea}</td>
					<td height="26">${club.clubArea}</td> 
					<td>${feedList}</td>
					<td>${clubList}</td>

				</tr>
				<tr>
					<td width="104" class="ct_write">�ڱ�Ұ�</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<li><a href="#" id="ss">�ȷο�</a></li>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td width="104" class="ct_write">�ڱ�Ұ�</td>
					<td bgcolor="D6D6D6" width="1"></td>

					<td width="53%"></td>
					<td align="right">
						<table border="0" cellspacing="0" cellpadding="0">

							<li><a href="#" id="sgr">������</a></li>
							<li><a href="#" id="gg">������Ʈ</a></li>
							<li><a href="#" id="ff">�ȷο츮��Ʈ</a></li>
							<li><a href="#" id="zz">���ȸ���Ʈ</a></li>
<a href="/myHome/getMyHome?userId=user33" id="zz">����33</a></li>
							<tr>
           
								<!--	jQuery Event ó���� ����
					
						<a href="javascript:history.go(-1);">Ȯ��</a>
						
					-->
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class="calendertext">
			<jsp:include page="/myHome/calendar.jsp" />
		</div>
		<div>
			<td width="104" class="ct_write">�ڱ�Ұ�</td>
			<td bgcolor="D6D6D6" width="1"></td>

		</div>

		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-6 text-center"></div>
			
<p id="demo"></p><br>
<button type="button" class="abc" value="${user.userId}">Ŭ��</button>
<!-- json �ҷ��� p�±׿� �ֱ� -->
<script type="text/javascript">
$(document).ready(function() {
	$("button").click(function() {
		var userId = $(".abc").val();
		console.log($(".abc").val());
		alert("����");
		$.ajax({
			url : "/myHomeRest/json/getFollowList", // ���� ���Ŵ�? // �� �� ������
			type : "POST", // Ÿ���� �� ���Ŵ�?
			datatype : "json",
			 data		:  JSON.stringify({userId}),
			contentType : "application/json",
			success : function(data) { // ���ٿ� ���� �����
				alert('seccuss');	// ������ ������ ã�Ҵٴ� ��
			//	alert(data);  // [object Object],[object Object],[object Object]
				
			// �����͸� Ȯ���ϰ� ���� ��.
			//	let str = JSON.stringify(data); // <> parse()
			//	alert(str); 
           console.log(data.list[0].receiveId.nickName);
				$.each(data.list, function(index, item) { // ������ =item
					$("#demo").append(index + " "); // index�� ���������� 
					$("#demo").append(item.receiveId.userId + " ");
					$("#demo").append(item.receiveId.nickName + " ");
					$("#demo").append(item.receiveId.name + " ");
					$("#demo").append(item.receiveId.profileImage + "<br>");
					console.log(item.receiveId);
				});
			},
			error : function() {
				alert('error');			
			}
			
		});
		
		
	});
	
	
});


$(function(){
	$("#demo").on("click", function(){
		
		self.location ="/myHome/getMyHome?userId=" + $(this).text().trim();
	});
});


</script>		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
</body>

</html>