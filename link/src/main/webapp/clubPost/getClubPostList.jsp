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
		$("button:contains('게시물 등록하기')").bind("click", function() {
			location.href = "/clubPost/addClubPostView?clubNo=10";
		});
		$("b:contains('최신순')").bind("click", function() {
			location.href = "/clubPostRest/getClubPostList?clubNo="+${ map.clubPostList[0].clubNo }+"&order=0";
		});
		$("b:contains('역최신순')").bind("click", function() {
			location.href = "/clubPostRest/getClubPostList?clubNo="+${ map.clubPostList[0].clubNo }+"&order=1";
		});
		$("b:contains('좋아요 많은순')").bind("click", function() {
			location.href = "/clubPostRest/getClubPostList?clubNo="+${ map.clubPostList[0].clubNo }+"&order=2";
		});
		$("b:contains('내가 작성한 게시물')").bind("click", function() {
			location.href = "/clubPostRest/getClubPostList?clubNo="+${ map.clubPostList[0].clubNo }+"&order=3";
		});
	});
</script>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="contains">
	<hr/><hr/><hr/>
	
		<div class="page-header text-info">
	       <h3>모임게시물리스트</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${ map.clubPostListCount } 건수, 현재 ${resultPage.currentPage} 페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>최신순</b>&nbsp;&nbsp;/&nbsp;&nbsp;
					<b>역최신순</b>&nbsp;&nbsp;/&nbsp;&nbsp;
					<b>좋아요 많은순</b>&nbsp;&nbsp;/&nbsp;&nbsp;
					<b>내가 작성한 게시물</b>	&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-default">게시물 등록하기</button>
		    	</p>
		    </div>
		    
			<%-- <div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm" action="/product/listProduct" method="post">
			 
			<div class="form-group">
				<select class="form-control" name="searchCondition" >
					<option value="0"  ${ ! empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" }>아이디</option>
					<option value="1"  ${ ! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>내용</option>
				</select>
			</div>
			 
			<div class="form-group">
				<label class="sr-only" for="searchKeyword">검색어</label>
				<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" value="${ ! empty search.searchKeyword ? search.searchKeyword : '' }"  >
			</div>
			
			<button type="button" class="btn btn-default">검색</button>
			
			<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<input type="hidden" name="order" value="${ search.order }">
			  
			</form>
			</div> --%>
	    	
		</div>		
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	
 	<!-- 썸네일로 list display start -->
	<div class="contains" id="container">
		<c:if test="${ map.clubPostListCount > 0}">
		<c:forEach var="i" begin="0" end="${ map.clubPostListCount - 1 }" step="1">
			<div class="col-md-4">
				<a href="javascript:getProductGo('${ list[i].prodNo }')">
					<img src="/images/uploadFiles/${ uploadList[i] }" height="350" width="350">
				</a>
				<p align="center" style="font-size: 30px">모임게시물 번호 : ${ map.clubPostList[i].clubPostNo }</p>
				<p align="center" style="font-size: 20px">제목 : ${ map.clubPostList[i].clubPostTitle }</p>
				<p align="center" style="font-size: 20px">좋아요 수 : ${ map.clubPostList[i].clubPostHeartCount }</p>
				<p align="center" style="font-size: 20px; color: red;">작성자 아이디 : ${ map.clubPostList[i].user.userId }</p>
			</div>
		</c:forEach>
		</c:if>
	</div> 	
	<!-- 썸네일로 list display end -->


	
</body>
</html>

