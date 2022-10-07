<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>모임원리스트</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip 사용 JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	 
 	 <style>
	body {
		padding-top : 70px;
	}
	
	</style>

	<script type="text/javascript">
	
	function fncUpdateMemberRole() {
		
		$("form").attr("method", "POST").attr("action", "/club/updateMemberRole")
		alert("모임원 수정 화면")
		.submit();
	}
	
	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			alert("모임을 삭제하시겠습니까?");
			deleteClub();
			
		});
	});
	
	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function() {

		$("button.btn.btn-waring").on("click", function() {
			self.location="/club/updateClubView.jsp"
		});
	});
	
	
	
	</script>	
	
</head>

<body>
		

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>모임원리스트</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>모임이름</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>모임카테고리</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				  <div class="form-group">
					<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >수&nbsp;정</button>
					<a class="btn btn-primary btn" href="#" role="button">이&nbsp;전</a>
					<button type="button" class="btn btn-waring"  >대&nbsp;기</button>
					
		  			 </div>
				</div>	
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원 ID</th>
            <th align="left">회원 닉네임</th>
            <th align="left">모임직책</th>
            <th align="left">마지막 접속시간</th>
            <th align="left">모임가입날짜</th>
            <th align="left">승인상태</th>
          </tr>
        </thead>
       
		<tbody>
		<tr>
		<%-- ${clubList} --%>
		  <c:set var="i" value="0" />
		  <c:forEach var="i" items="${clubMemberList}">
		  <input type="hidden" name="clubUserNo" value="${clubUserNo}">
			<%-- <c:set var="i" value="${ i+1 }" /> --%>
			<tr>
			<td align="center">${i.clubUserNo}</td>
			  <td align="left">${i.userId}</td>
			  <td align="left">${user.nickName}</td>
			  <td align="left">${i.memberRole}</td>
			  <td align="left">${i.logoutDate}</td>
			  <td align="left">${i.joinRegDate}</td>
			  <td align="left">${i.approvalCondition}</td>
			</tr>
          </c:forEach>
        </tr>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
	
	
</body>

</html>