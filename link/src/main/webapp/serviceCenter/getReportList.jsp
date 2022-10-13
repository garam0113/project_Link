<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">

    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function(){
		$("td:nth-child(3)").on("click",function(){
			self.location ="/serviceCenter/getReport?no="+$(this).parent().find("td:eq(0)").text()
			
			
		});
		
		$("td.ct_btn01:contains('등록')").bind("click", function() {
			self.location = "../serviceCenter/addReportView.jsp";
		})
		
		
		
		
	});

	
	</script>
	
</head>

<body>
	

	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<jsp:include page="/toolbar.jsp" />
		<div class="page-header text-info">
	      <%--  ${menu.equals("manage") ? "상품관리" : "상품 목록 조회"} --%>
	       ${menu.equals("manage") ? "신고 리스트" : "신고 리스트2"}
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
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>내용</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value="0"/>
				  
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table table-striped" >
      
        <thead>
          <tr>
            <td align="center" width="1">No</td>
            <td/>
            <td align="center" width ="5">제목</td>
           
           	<td/>
            <td align="center" width ="3">신고처리상태</td>
            <td/>
            <td align="center" width="2">신고대상ID</td>
            <td/>
            <td align="center" width="2">신고접수날짜</td>
            
          </tr>
        </thead>
       
		<tbody>
		
			<c:set var = "i" value = "0" />
		<c:forEach var = "list" items = "${list}">
			<c:set var = "i" value = "${i + 1}" />
			<tr class="ct_list_pop">
				<td align="left" height="200" id="bb">${list.no}</td>
				
				<td></td>
				<td align="left" height="200" style="text-decoration:underline">
					${list.title}
				</td>
				<td></td>
				  <c:if test="${list.reportCondition=='1'}">
				<td align="left" height="200">처리완료</td>
				  </c:if>
				   <c:if test="${list.reportCondition=='0'}">
				<td align="left" height="200">대기중</td>
				  </c:if>
				<td></td>
				<td align="left" height="200">${list.user2.userId}</td>
				<td></td>
				<td align="left" height="200">${list.regDate}</td>
				<td align="center" height="200">
				
				</td>	
					
				<td></td>
			
			<if test="qandAOpenCondition == 0">
											WHERE USER_ID = {userId.userId}
											<if test="searchCondition != null">
													<if test="searchCondition == 0 and searchKeyword !='' ">
										 			AND	LOWER(QANDA_TITLE) LIKE LOWER('%${searchKeyword}%')
													</if>
													<if test="searchCondition == 1 and searchKeyword !='' ">
										 			AND	LOWER(QANDA_CONTENT) LIKE LOWER('%${searchKeyword}%')
													</if>
											</if>		
											</if>
	
        </c:forEach>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
	 
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">

					<table border="0" cellspacing="0" cellpadding="0">
						<tr>

							
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="ct_write01"><input type="hidden"
											id="Quantity" name="Quantity" value="1" /></td>
									</tr>
								</table>
								<td width="30"></td>
								<td background="/images/ct_btnbg02.gif" width="90"
									class="ct_btn01" style="padding-top: 3px;">등록</td>
							
							<td width="30"></td>

							<td width="14" height="23">
							<td background="/images/ct_btnbg02.gif" width="90"
								class="ct_btn01" style="padding-top: 3px;">이전</td>

							<td width="14" height="25"><img src="/images/ct_btnbg03.gif"
								width="14" height="23"></td>

						</tr>
					</table>

				</td>
			</tr>
		</table>
								
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>