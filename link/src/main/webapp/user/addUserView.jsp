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
	<input type="text" name="userId" value="userId">아이디
	<input type="text" name="password" value="password">비밀번호
	<input type="text" name="name" value="name">이름
	<input type="text" name="nickName" value=nickName>닉네임
	<input type="text" name="gender" value="gender">성별
	<input type="text" name="rrn" value="rrn">주민번호
	<input type="text" name="phoneNo" value="phoneNo">핸드폰번호
	<input type="text" name="email" value="email">이메일
	<input type="text" name="area1" value="area1">활동영역1
	<input type="text" name="area2" value="area2">활동영역2
	<input type="text" name="area3" value="area3">활동영역3
	<input type="text" name="category1" value="category1">카테고리1
	<input type="text" name="category2" value="category2">카테고리2
	<input type="text" name="category3" value="category3">카테고리3
	<input type="text" name="profilewriting" value="profilewriting">프로필글
	<input type="text" name="profileImage" value="profileImage">프로필사진
	<button type="button"></button>
	</from>
</body>
</html>