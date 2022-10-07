<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("button:contains('�Խù� ����ϱ�')").bind("click", function() {
			location.href = "/clubPost/addClubPostView?clubNo=10";
		});
		$("b:contains('�ֽż�')").bind("click", function() {
			location.href = "/clubPostRest/getClubPostList?clubNo="+${ map.clubPostList[0].clubNo }+"&order=0";
		});
		$("b:contains('���ֽż�')").bind("click", function() {
			location.href = "/clubPostRest/getClubPostList?clubNo="+${ map.clubPostList[0].clubNo }+"&order=1";
		});
		$("b:contains('���ƿ� ������')").bind("click", function() {
			location.href = "/clubPostRest/getClubPostList?clubNo="+${ map.clubPostList[0].clubNo }+"&order=2";
		});
		$("b:contains('���� �ۼ��� �Խù�')").bind("click", function() {
			location.href = "/clubPostRest/getClubPostList?clubNo="+${ map.clubPostList[0].clubNo }+"&order=3";
		});
	});
</script>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="contains">
	<hr/><hr/><hr/>
	
		<div class="page-header text-info">
	       <h3>���ӰԽù�����Ʈ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${ map.clubPostListCount } �Ǽ�, ���� ${resultPage.currentPage} ������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>�ֽż�</b>&nbsp;&nbsp;/&nbsp;&nbsp;
					<b>���ֽż�</b>&nbsp;&nbsp;/&nbsp;&nbsp;
					<b>���ƿ� ������</b>&nbsp;&nbsp;/&nbsp;&nbsp;
					<b>���� �ۼ��� �Խù�</b>	&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-default">�Խù� ����ϱ�</button>
		    	</p>
		    </div>
		    
			<%-- <div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm" action="/product/listProduct" method="post">
			 
			<div class="form-group">
				<select class="form-control" name="searchCondition" >
					<option value="0"  ${ ! empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" }>���̵�</option>
					<option value="1"  ${ ! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>����</option>
				</select>
			</div>
			 
			<div class="form-group">
				<label class="sr-only" for="searchKeyword">�˻���</label>
				<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���" value="${ ! empty search.searchKeyword ? search.searchKeyword : '' }"  >
			</div>
			
			<button type="button" class="btn btn-default">�˻�</button>
			
			<!-- PageNavigation ���� ������ ���� ������ �κ� -->
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<input type="hidden" name="order" value="${ search.order }">
			  
			</form>
			</div> --%>
	    	
		</div>		
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	
 	<!-- ����Ϸ� list display start -->
	<div class="contains" id="container">
		<c:if test="${ map.clubPostListCount > 0}">
		<c:forEach var="i" begin="0" end="${ map.clubPostListCount - 1 }" step="1">
			<div class="col-md-4">
				<a href="javascript:getProductGo('${ list[i].prodNo }')">
					<img src="/images/uploadFiles/${ uploadList[i] }" height="350" width="350">
				</a>
				<p align="center" style="font-size: 30px">���ӰԽù� ��ȣ : ${ map.clubPostList[i].clubPostNo }</p>
				<p align="center" style="font-size: 20px">���� : ${ map.clubPostList[i].clubPostTitle }</p>
				<p align="center" style="font-size: 20px">���ƿ� �� : ${ map.clubPostList[i].clubPostHeartCount }</p>
				<p align="center" style="font-size: 20px; color: red;">�ۼ��� ���̵� : ${ map.clubPostList[i].user.userId }</p>
			</div>
		</c:forEach>
		</c:if>
	</div> 	
	<!-- ����Ϸ� list display end -->


	
</body>
</html>

