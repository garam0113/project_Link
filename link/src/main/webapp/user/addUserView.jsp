<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function fncAddUser() {
	$("form").attr("method", "POST").attr("action", "/user/addUser")
	.submit();
}
</script>
</head>
<body>
	<from>
	<input type="text" name="userId" value="userId">���̵�
	<input type="text" name="password" value="password">��й�ȣ
	<input type="text" name="name" value="name">�̸�
	<input type="text" name="nickName" value=nickName>�г���
	<input type="text" name="gender" value="gender">����
	<input type="text" name="rrn" value="rrn">�ֹι�ȣ
	<input type="text" name="phoneNo" value="phoneNo">�ڵ�����ȣ
	<input type="text" name="email" value="email">�̸���
	<input type="text" name="area1" value="area1">Ȱ������1
	<input type="text" name="area2" value="area2">Ȱ������2
	<input type="text" name="area3" value="area3">Ȱ������3
	<input type="text" name="category1" value="category1">ī�װ�1
	<input type="text" name="category2" value="category2">ī�װ�2
	<input type="text" name="category3" value="category3">ī�װ�3
	<input type="text" name="profilewriting" value="profilewriting">�����ʱ�
	<input type="text" name="profileImage" value="profileImage">�����ʻ���
	<button type="button"></button>
	</from>
</body>
</html>