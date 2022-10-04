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
		$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubPostNo=20").submit();
	});
	$("input[value='����']").bind("click", function(){
		$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo=10&clubPostNo=20").submit();
	});
});
</script>
</head>
<body>
<input type="button" value="����">
<input type="button" value="����">
���� �Խù� ��� ȸ�� ���� : ${ map.getClubPost.user }</br>
���� �Խù� ��� ȸ�� ���̵� : ${ map.getClubPost.user.userId }</br>
���� �Խù� ��� ȸ�� �г��� : ${ map.getClubPost.user.nickName }</br>
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
���� �Խù� ���ƿ� �� : ${ map.getClubPost.clubPostLikeCount }</br>
���� �Խù� ��� ���� : ${ map.getClubPost.clubPostCommentCount }</br>
<c:if test="${ map.getClubPost.clubPostCommentCount > 0 }">
	private int feedNo;						// �ǵ��ȣ</br>
	private int feedCommentNo;				// �ǵ��۹�ȣ</br>
	private int clubNo;						// ���ӹ�ȣ</br>
	private int clubPostNo;					// ���ӰԽù���ȣ</br>
	private int clubPostCommentNo;			// ���ӰԽù���۹�ȣ</br>
	private User user;						// �ۼ����� ��� ����</br>
	private String commentContent;			// ��۳���</br>
	private String commentRegDate;			// ��۵�ϳ�¥</br>
	private String commentUpdateDate;		// ��ۼ�����¥</br>
	private int commentLikeCount;			// ��� ���ƿ� ��</br>
	private int commentCount;				// ��� ��</br>
	private String reportCondition;			// �Ű��� 0-false 1-true</br>
	private String deleteCondition;			// �������� 0-false 1-true</br>
	private int parent;						// ���� ��� ��ȣ</br>
	private int depth;						// ��� ����</br>
	private int sequence;					// ��� ����</br>
���� �Խù� ��� ����Ʈ</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
<c:forEach var="i" begin="0" end="${ map.getClubPost.clubPostCommentCount - 1 }" step="1">
<c:if test="${ map.getClubPostCommentList[i].parent == 0 }">
���� �Խù� ��ȣ : ${ map.getClubPostCommentList[i].clubPostNo }</br>
���� �Խù� ��� ��ȣ : ${ map.getClubPostCommentList[i].clubPostCommentNo }</br>
���� �Խù� ��� ȸ�� ���̵� : ${ map.getClubPostCommentList[i].user.userId }</br>
���� �Խù� ��� ȸ�� �г��� : ${ map.getClubPostCommentList[i].user.nickName }</br>
��� ���� : ${ map.getClubPostCommentList[i].commentContent }</br>
��� ��ϳ�¥ : ${ map.getClubPostCommentList[i].commentRegDate }</br>
��� ������¥ : ${ map.getClubPostCommentList[i].commentUpdateDate }</br>
��� ���ƿ� �� : ${ map.getClubPostCommentList[i].commentLikeCount }</br>
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




