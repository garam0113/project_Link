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
	$("input[value='����']").bind("click", function(){
		$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubPostNo="+${ map.getClubPost.clubPostNo }).submit();
	});
	$("input[value='����']").bind("click", function(){
		alert("���� �Խù� ��ȣ : " + ${ map.getClubPost.clubPostNo });
		$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo=2&clubPostNo="+${ map.getClubPost.clubPostNo }).submit();
	});
	$("input[value='����Ʈ���̵�']").bind("click", function(){
		location.href = "/clubPost/getClubPostList?clubNo=2&order=0";
	});
	$("a").bind("click", function(){
		location.href = "/clubPost/updateClubPost?clubNo="+${ map.getClubPost.clubNo }+"&clubPostNo="+${ map.getClubPost.clubPostNo }+"&heartCondition=1";
	});
});
</script>
</head>
<body>
<form></form>
<input type="button" value="����">
<input type="button" value="����">
<input type="button" value="����Ʈ���̵�">
<a href="#"><img alt="" src="abcd.jpg">��Ʈ</a></br>
<%-- ���� �Խù� ��� ȸ�� ���� : ${ map.getClubPost.user }</br> --%>
���� �Խù� ��� ȸ�� ���̵� : ${ map.getClubPost.user.userId }</br>
<%-- ���� �Խù� ��� ȸ�� �г��� : ${ map.getClubPost.user.nickName }</br> --%>
���� ��ȣ : ${ map.getClubPost.clubNo }</br>
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
���� �Խù� ��ϳ�¥ : ${ map.getClubPost.clubPostRegDate }</br>
���� �Խù� ������¥ : ${ map.getClubPost.clubPostUpdateDate }</br>
���� �Խù� ���ƿ� �� : ${ map.getClubPost.clubPostHeartCount }</br>
<%-- ���� �Խù� ��� ���� : ${ map.getClubPost.clubPostCommentCount }</br> --%>
<c:if test="${ map.getClubPost.clubPostCommentCount > 0 }">
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
���� �Խù� ��� ����Ʈ</br>
<c:forEach var="i" begin="0" end="${ map.getClubPost.clubPostCommentCount - 1 }" step="1">
<c:if test="${ map.getClubPostCommentList[i].parent == 64 }">
���� �Խù� ��ȣ : ${ map.getClubPostCommentList[i].clubPostNo }</br>
���� �Խù� ��� ��ȣ : ${ map.getClubPostCommentList[i].clubPostCommentNo }</br>
���� �Խù� ��� ȸ�� ���̵� : ${ map.getClubPostCommentList[i].user.userId }</br>
���� �Խù� ��� ȸ�� �г��� : ${ map.getClubPostCommentList[i].user.nickName }</br>
��� ���� : ${ map.getClubPostCommentList[i].commentContent }</br>
��� ��ϳ�¥ : ${ map.getClubPostCommentList[i].commentRegDate }</br>
��� ������¥ : ${ map.getClubPostCommentList[i].commentUpdateDate }</br>
��� ���ƿ� �� : ${ map.getClubPostCommentList[i].commentHeartCount }</br>
�Ű��� : ${ map.getClubPostCommentList[i].reportCondition }</br>
�������� : ${ map.getClubPostCommentList[i].deleteCondition }</br>
��� �θ��ȣ : ${ map.getClubPostCommentList[i].parent }</br>
��� ���� : ${ map.getClubPostCommentList[i].depth }</br>
��� ���� : ${ map.getClubPostCommentList[i].sequence }</br>
<a href="/clubPostRest/getClubPostCommentList?clubPostCommentNo=${ map.getClubPostCommentList[i].clubPostCommentNo }">��� �� : ${ map.getClubPostCommentList[i].commentCount }</a></br>
//////////////////////////////////////////////////////////////////////</br>
</c:if>
</c:forEach>
</c:if>
</body>
</html>




