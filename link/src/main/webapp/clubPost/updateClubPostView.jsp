<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[value='�����Ϸ�']").bind("click", function(){
		$("form").submit();
	});
});
</script>
</head>
<body>
<form name="updateClubPost" method="post" action="/clubPost/updateClubPost">
<input type="text" name="clubPostNo" value="${ map.getClubPost.clubPostNo }"></br>
����<input type="text" name="clubPostTitle" value="${ map.getClubPost.clubPostTitle }"></br>
����<input type="text" name="clubPostContent" value="${ map.getClubPost.clubPostContent }"></br>
����1<input type="text" name="clubPostVideo1"></br>
����2<input type="text" name="clubPostVideo2"></br>
����3<input type="text" name="clubPostVideo3"></br>
�̹���1<input type="text" name="image1"></br>
�̹���2<input type="text" name="image2"></br>
�̹���3<input type="text" name="image3"></br>
�̹���4<input type="text" name="image4"></br>
�̹���5<input type="text" name="image5"></br>
�̹���6<input type="text" name="image6"></br>
�̹���7<input type="text" name="image7"></br>
�̹���8<input type="text" name="image8"></br>
�̹���9<input type="text" name="image9"></br>
�̹���10<input type="text" name="image10"></br>
<input type="button" value="�����Ϸ�">
</form>
���� �Խù� ��� ȸ�� ���̵� : ${ map.getClubPost.user.userId }</br>
���� �Խù� ��� ȸ�� �г��� : ${ map.getClubPost.user.nickName }</br>
���� �Խù� ��ȣ : ${ map.getClubPost.clubPostNo }</br>
���� �Խù� ���� : ${ map.getClubPost.clubPostTitle }</br>
���� �Խù� ���� : ${ map.getClubPost.clubPostContent }</br>
���� �Խù� ����1 : ${ map.getClubPost.clubPostVideo1 }</br>
���� �Խù� ����2 : ${ map.getClubPost.clubPostVideo2 }</br>
���� �Խù� ����3 : ${ map.getClubPost.clubPostVideo3 }</br>
���� �Խù� �̹���1 : ${ map.getClubPost.image1 }</br>
���� �Խù� �̹���2 : ${ map.getClubPost.image2 }</br>
���� �Խù� �̹���3 : ${ map.getClubPost.image3 }</br>
���� �Խù� �̹���4 : ${ map.getClubPost.image4 }</br>
���� �Խù� �̹���5 : ${ map.getClubPost.image5 }</br>
���� �Խù� �̹���6 : ${ map.getClubPost.image6 }</br>
���� �Խù� �̹���7 : ${ map.getClubPost.image7 }</br>
���� �Խù� �̹���8 : ${ map.getClubPost.image8 }</br>
���� �Խù� �̹���9 : ${ map.getClubPost.image9 }</br>
���� �Խù� �̹���10 : ${ map.getClubPost.image10 }</br>
</body>
</html>