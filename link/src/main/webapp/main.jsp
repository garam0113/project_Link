<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/toolbar.jsp" />
<a href="/clubPost/getCurrentClubPostList">모임게시물리스트</a>
<hr/>
<a href="/club/getClubList">모임리스트</a>
<hr/>
<a href="/club/getMeetingList">모임일정리스트</a>
<hr/>
<a href="/club/addClubView.jsp">모임등록</a>
<hr/>
<a href="/club/addMeetingView.jsp">모임일정등록</a>
</body>
</html>