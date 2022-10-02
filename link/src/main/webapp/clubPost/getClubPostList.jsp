<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[value='모임게시물등록']").bind("click", function(){
		location.href = "/clubPost/addClubPostView";
	});
});
</script>
</head>
<body>
모임게시물 리스트 개수 : ${ map.clubPostListCount }</br>
<c:forEach var="i" begin="0" end="${ map.clubPostListCount - 1 }" step="1">
${ map.clubPostList[i].clubPostNo } - 
${ map.clubPostList[i].clubPostTitle } - 
${ map.clubPostList[i].clubPostContent } - 
${ map.clubPostList[i].user.nickName } - 
${ map.clubPostList[i].user.userId }</br>
</c:forEach>
<input type="button" value="모임게시물등록">
<%-- <a href="/clubPostRest/getClubPostListRecent/${ clubNo }">최신순</a> --%>
<a href="/clubPostRest/getClubPostListRecent?clubNo=10">최신순</a>
<a href="/clubPostRest/getClubPostListMySelf?clubNo=10">내가 작성한 게시물</a>
<a href="/clubPostRest/getClubPostListLike">좋아요 많은순</a>
<a href="/clubPostRest/getClubPostListMyHome">마이홈피</a>
</body>
</html>