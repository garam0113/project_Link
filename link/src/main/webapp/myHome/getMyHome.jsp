<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>

	<title>ȸ��������ȸ</title>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		
		//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
		$(function(){
			
			$("td.ct_btn01:contains('����')").bind("click", function(){
				
				self.location = "/user/updateUser?userId=${user.userId}"
						
			});
			
			$("td.ct_btn01:contains('Ȯ��')").bind("click", function(){
				
				history.go(-1);
				
			});
			
		});
	
	</script>
<style>
.calendar
{
  margin: 0 auto;
  width: 480px;
  display: flex;
 justify-content: center;
}

</style>

<style>
.image
{
  margin: 0 auto;
  width: 200px;
  text-align: center;
}
.to
{
  margin: 0;
  width: 350px;
  text-align: left;
}
.usertext{
    margin-right: 10px;
    padding: 10px;
    margin-left: -100px;}
.calendertext{
	padding: 10px;
}
</style>
</head>

<body bgcolor="#ffffff" text="#000000">



<div class="image"><img src="/images/images.png"></div>
				
				
<div class="calendar">

<div class="usertext">
<table width="300px" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;" class="to">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
<div><img src="/images/uploadFiles/${user.image}"  class="img-response" /></div>
		<td width="104" class="ct_write">
			���̵� 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${user.userId}</td>
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			�̸� 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.userName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�ּ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.addr}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�޴���ȭ��ȣ</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.phone}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�̸��� </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">${user.email}</td>
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
		<td class="ct_write01">${user.regDate}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�ڱ�Ұ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.profile}</td>
	</tr>
	</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
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
<jsp:include page="/myHome/calendar.jsp"/>
</div> 
<div>

</div>
	
	




</body>

</html>