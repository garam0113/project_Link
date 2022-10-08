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
		$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
	});
	$("input[value='����']").bind("click", function(){
		alert("���� �Խù� ��ȣ : " + ${ clubPost.getClubPost.clubPostNo });
		$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo=2&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
	});
	$("input[value='����Ʈ���̵�']").bind("click", function(){
		location.href = "/clubPost/getClubPostList?clubNo=2&order=0";
	});
	$("a[href='#']").bind("click", function(){
		//location.href = "/clubPostRest/updateClubPost?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }+"&heartCondition=1";
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
<%-- ���� �Խù� ��� ȸ�� ���� : ${ clubPost.getClubPost.user }</br> --%>
���� �Խù� ��� ȸ�� ���̵� : ${ clubPost.getClubPost.user.userId }</br>
<%-- ���� �Խù� ��� ȸ�� �г��� : ${ clubPost.getClubPost.user.nickName }</br> --%>
���� ��ȣ : ${ clubPost.getClubPost.clubNo }</br>
���� �Խù� ��ȣ : ${ clubPost.getClubPost.clubPostNo }</br>
���� �Խù� ���� : ${ clubPost.getClubPost.clubPostTitle }</br>
���� �Խù� ���� : ${ clubPost.getClubPost.clubPostContent }</br>
���� �Խù� ����1 : ${ clubPost.getClubPost.clubPostVideo1 }</br>
���� �Խù� ����2 : ${ clubPost.getClubPost.clubPostVideo2 }</br>
���� �Խù� ����3 : ${ clubPost.getClubPost.clubPostVideo3 }</br>
���� �Խù� �̹���1 : ${ clubPost.getClubPost.image1 }</br>
���� �Խù� �̹���2 : ${ clubPost.getClubPost.image2 }</br>
���� �Խù� �̹���3 : ${ clubPost.getClubPost.image3 }</br>
���� �Խù� �̹���4 : ${ clubPost.getClubPost.image4 }</br>
���� �Խù� �̹���5 : ${ clubPost.getClubPost.image5 }</br>
���� �Խù� �̹���6 : ${ clubPost.getClubPost.image6 }</br>
���� �Խù� �̹���7 : ${ clubPost.getClubPost.image7 }</br>
���� �Խù� �̹���8 : ${ clubPost.getClubPost.image8 }</br>
���� �Խù� �̹���9 : ${ clubPost.getClubPost.image9 }</br>
���� �Խù� �̹���10 : ${ clubPost.getClubPost.image10 }</br>
���� �Խù� ��ϳ�¥ : ${ clubPost.getClubPost.clubPostRegDate }</br>
���� �Խù� ������¥ : ${ clubPost.getClubPost.clubPostUpdateDate }</br>
���� �Խù� ���ƿ� �� : ${ clubPost.getClubPost.clubPostHeartCount }</br>
���� �Խù� ��� ���� : ${ clubPost.getClubPost.clubPostCommentCount }</br>
<c:if test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
���� �Խù� ��� ����Ʈ</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
<c:forEach var="i" begin="0" end="${ clubPost.getClubPost.clubPostCommentCount - 1 }" step="1">
<c:if test="${ clubPostComment.getClubPostCommentList[i].parent == clubPost.getClubPost.clubPostNo }">
���� �Խù� ��ȣ : ${ clubPostComment.getClubPostCommentList[i].clubPostNo }</br>
���� �Խù� ��� ��ȣ : ${ clubPostComment.getClubPostCommentList[i].clubPostCommentNo }</br>
���� �Խù� ��� ȸ�� ���̵� : ${ clubPostComment.getClubPostCommentList[i].user.userId }</br>
���� �Խù� ��� ȸ�� �г��� : ${ clubPostComment.getClubPostCommentList[i].user.nickName }</br>
��� ���� : ${ clubPostComment.getClubPostCommentList[i].commentContent }</br>
��� ��ϳ�¥ : ${ clubPostComment.getClubPostCommentList[i].commentRegDate }</br>
��� ������¥ : ${ clubPostComment.getClubPostCommentList[i].commentUpdateDate }</br>
��� ���ƿ� �� : ${ clubPostComment.getClubPostCommentList[i].commentHeartCount }</br>
�Ű��� : ${ clubPostComment.getClubPostCommentList[i].reportCondition }</br>
�������� : ${ clubPostComment.getClubPostCommentList[i].deleteCondition }</br>
��� �θ��ȣ : ${ clubPostComment.getClubPostCommentList[i].parent }</br>
��� ���� : ${ clubPostComment.getClubPostCommentList[i].depth }</br>
��� ���� : ${ clubPostComment.getClubPostCommentList[i].sequence }</br>
<%-- <a href="/clubPostRest/getClubPostCommentList?clubPostCommentNo=${ clubPostComment.getClubPostCommentList[i].clubPostCommentNo }&depth=0">��� �� : ${ clubPostComment.getClubPostCommentList[i].commentCount }</a></br> --%>
<a href="###">��� �� : ${ clubPostComment.getClubPostCommentList[i].commentCount }</a></br>
//////////////////////////////////////////////////////////////////////</br>
</c:if>
</c:forEach>
</c:if>
</body>
</html>




