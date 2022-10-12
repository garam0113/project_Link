<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("button:contains('공지사항')").bind("click", function(){
		location.href = "/serviceCenter/getNoticeList";
	});
	
	$("button:contains('Q&A')").bind("click", function(){
		location.href = "/serviceCenter/getQandAList";
	});
	
	$("button:contains('내신고보기')").bind("click", function(){
		location.href = "/serviceCenter/getReportList";
	});
	
	$("button:contains('내Q&A보기')").bind("click", function(){
		location.href = "/serviceCenter/getQandAList";
	});
	
	$("button:contains('신고목록')").bind("click", function(){
		location.href = "/serviceCenter/getReportList";
	});
	
	
	
});
</script>
<title>고객센터 </title>
</head>
<body>

<h2>고객센터를 통해 궁금증을 해결하세요</h2>

<button>공지사항</button>

<button>Q&A</button>
<button>신고목록</button>
<button>내신고보기</button>
<button>내Q&A보기</button>



</body>
</html>