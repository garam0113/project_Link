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
	$("button:contains('��������')").bind("click", function(){
		location.href = "/serviceCenter/getNoticeList";
	});
	
	$("button:contains('Q&A')").bind("click", function(){
		location.href = "/serviceCenter/getQandAList";
	});
	
	$("button:contains('���Ű���')").bind("click", function(){
		location.href = "/serviceCenter/getReportList";
	});
	
	$("button:contains('��Q&A����')").bind("click", function(){
		location.href = "/serviceCenter/getQandAList";
	});
	
	$("button:contains('�Ű���')").bind("click", function(){
		location.href = "/serviceCenter/getReportList";
	});
	
	
	
});
</script>
<title>������ </title>
</head>
<body>

<h2>�����͸� ���� �ñ����� �ذ��ϼ���</h2>

<button>��������</button>

<button>Q&A</button>
<button>�Ű���</button>
<button>���Ű���</button>
<button>��Q&A����</button>



</body>
</html>