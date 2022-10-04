<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[value='수정완료']").bind("click", function(){
		$("form").submit();
	});
});
</script>
</head>
<body>
<form name="updateClubPost" method="post" action="/clubPost/updateClubPost">
<input type="text" name="clubPostNo" value="${ map.getClubPost.clubPostNo }"></br>
제목<input type="text" name="clubPostTitle" value="${ map.getClubPost.clubPostTitle }"></br>
내용<input type="text" name="clubPostContent" value="${ map.getClubPost.clubPostContent }"></br>
영상1<input type="text" name="clubPostVideo1"></br>
영상2<input type="text" name="clubPostVideo2"></br>
영상3<input type="text" name="clubPostVideo3"></br>
이미지1<input type="text" name="image1"></br>
이미지2<input type="text" name="image2"></br>
이미지3<input type="text" name="image3"></br>
이미지4<input type="text" name="image4"></br>
이미지5<input type="text" name="image5"></br>
이미지6<input type="text" name="image6"></br>
이미지7<input type="text" name="image7"></br>
이미지8<input type="text" name="image8"></br>
이미지9<input type="text" name="image9"></br>
이미지10<input type="text" name="image10"></br>
<input type="button" value="수정완료">
</form>
모임 게시물 등록 회원 아이디 : ${ map.getClubPost.user.userId }</br>
모임 게시물 등록 회원 닉네임 : ${ map.getClubPost.user.nickName }</br>
모임 게시물 번호 : ${ map.getClubPost.clubPostNo }</br>
모임 게시물 제목 : ${ map.getClubPost.clubPostTitle }</br>
모임 게시물 내용 : ${ map.getClubPost.clubPostContent }</br>
모임 게시물 영상1 : ${ map.getClubPost.clubPostVideo1 }</br>
모임 게시물 영상2 : ${ map.getClubPost.clubPostVideo2 }</br>
모임 게시물 영상3 : ${ map.getClubPost.clubPostVideo3 }</br>
모임 게시물 이미지1 : ${ map.getClubPost.image1 }</br>
모임 게시물 이미지2 : ${ map.getClubPost.image2 }</br>
모임 게시물 이미지3 : ${ map.getClubPost.image3 }</br>
모임 게시물 이미지4 : ${ map.getClubPost.image4 }</br>
모임 게시물 이미지5 : ${ map.getClubPost.image5 }</br>
모임 게시물 이미지6 : ${ map.getClubPost.image6 }</br>
모임 게시물 이미지7 : ${ map.getClubPost.image7 }</br>
모임 게시물 이미지8 : ${ map.getClubPost.image8 }</br>
모임 게시물 이미지9 : ${ map.getClubPost.image9 }</br>
모임 게시물 이미지10 : ${ map.getClubPost.image10 }</br>
</body>
</html>