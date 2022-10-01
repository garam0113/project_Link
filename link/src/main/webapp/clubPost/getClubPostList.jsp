<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[name='addClubPostView']").bind("click", function(){
		location.href = "/clubPost/addClubPostView";
	});
});
</script>
</head>
<body>
<input type="button" name="addClubPostView" value="모임게시물등록">
</body>
</html>