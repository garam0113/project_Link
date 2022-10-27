<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 가능? -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>모임리스트</title>
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
 	 
 	 
 	 <!-- 따로 가능?? -->
 	 	<meta name="description" content="The Page Description">
		<style type="text/css">@-ms-viewport{width: device-width;}</style>
		<title>Beetle - Home page</title>
		<link rel="stylesheet" href="/resources/css/layers.min.css" media="screen">
		<link rel="stylesheet" href="/resources/css/font-awesome.min.css" media="screen">
		<link rel="stylesheet" href="/resources/css/style.css" media="screen">
 	 
 	 
 	 
 	 <style>
		body {
		    background-color: #f0f2f5;
		    color: #333;
		    font-size: 1.125em;
		    font-size: 15px;
		    font-family: 'Open Sans', sans-serif;
		    line-height: 0;
		}
		
		#main {
		    position: relative;
		    z-index: 10;
		    overflow: hidden;
		    background-color: #f0f2f5;
		}
		
		header {
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 9;
	    padding: 0.7rem;
	    width: 100%;
	    /* background-color: rgba(255, 255, 255, 0.97);
	    -webkit-box-shadow: 0 1px 0 rgb(0 0 0 / 10%);
	    -moz-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
	    box-shadow: 0 1px 0 rgb(0 0 0 / 10%); */
		}
		
		.darkover {
    	position: static;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
 	   background: rgba(0,0,0,0.35);
		}
		
		header.transparent {
    		background-color: #23242b;
		    -webkit-box-shadow: none;
		    -moz-box-shadow: none;
 	   		box-shadow: none;
		}
		.thumbnail {
			    display: block;
			    padding: 0px;
			    margin-bottom: 20px;
			    line-height: 1;
			    background-color: #fbfbfb;
			    border: 1px solid #5F0080;
			    border-radius: 4px;
			    -webkit-transition: border .2s ease-in-out;
			    -o-transition: border .2s ease-in-out;
			    transition: border .2s ease-in-out;
			}
		
		.thumbnail img { 
			min-height:200px;
			height:100px;
		    width: 250px;
		 }     
		 
		 div {
		 	clear: none;
		 }
		 
		 .btn {
		 	background-color: #fbfbfb;
		 	color: #BD76FF;
		 	border-color: #BD76FF;
		 }
		 
		 .club-cT {
		 		font-size: 
		 }
		
		 
/* 		 input[type=""], input:not([type]), input[type="text"], input[type="password"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], textarea, textarea.plain {
    display: block;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    margin-bottom: 0em;
    border: 2px solid rgba(0, 0, 0, 0.1);
    -webkit-border-radius: 0.333em;
    -moz-border-radius: 0.333em;
    border-radius: 0.333em;
    color: #333;
} */
		 
		 #pageNav {
		 	float: center;
		 }
		 
		 #toolbar {
		 	float: right !important;
		 }
		 
		 nav {
		 	float: none;
		 }
		 
		 
	 element.style {
    	float: right;
    	margin-bottom: 20px !important;
	    margin-top: 10px !important;
	}
	
	.keyword_search_area {
    padding: 18px 0 10px 20px;
    border: solid 1px #d8d8d8;
    background-color: #f8f8 !important;
    font-size: 12px;
	}
	
	section {
		background-color: #cf0cc90d !important;
		border: solid 1px #d8d8d8 !important;
		margin: 10px;
	}
	
		 
		 
	
	</style>
	
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script type="text/javascript">
	
	
	function fncGetClubList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/club/getClubList").submit();
	}
	
	//============================== 검색 이벤트 처리 ====================
	$(function(){
		$("button.btn.btn-search").on("click", function() {
			fncGetClubList(1);
		});	
	});
	
	//========== 가입현황 처리 ================
	$(function() {

		$("button.btn.btn-myList").on("click", function() {
			self.location="/club/getApprovalConditionList"
			
		});
	});
	
	$(function() {
		
		$("button.btn.btn-addClub").on("click", function() {
			self.location="/club/addClubView.jsp"
		});
	});
	
	
	function enterkey() {
		if(window.event.keyCode == 13) {
			//fncGetClubList(currentPage);
			fncGetClubList(1);
		}
	}
	
	function changeFn() {
		var category = document.getElementById("category");
		var value = (category.options[category.selectedIndex].value);
		alert("value = "+value);
	}
	
	function changeFn2() {
		var area = document.getElementById("area");
		var value = (area.options[area.selectedIndex].value);
		alert("value = "+value);
	}
	
	function resetBtn() {
		$("#searchArea")[0].reset();
	}
	
	
	
	//무한 페이징
	var currentPage = 1;
	$(window).scroll(function() {
		var maxHeight = $(document).height();
		var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
		
		if(currentScroll >= maxHeight) {
			
			currentPage++;
			
			$("input[name='currentPage']").val(currentPage);
			
			var searchCondition = $("option:selected").val();
			var searchKeyword = $("input[name='searchKeyword']").val();
			
			alert(searchCondiiton);
			alert(searchKeyword);
			
			$.ajax({
				url : "/clubRest/json/getClubList" ,
				type : "post" ,
				dataType : "json" ,
				data : JSON.stringify({
					currentPage : currentPage,
					searchCondition : searchCondition,
					searchKeyword : searchKeyword
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function( JSONData, status) {
					alert(status);
					
					console.log(JSONData.search);
					console.log(JSONData.clubPostList);
				} // end of success
			}); // end of ajax
		} // end of if
	}); // end of scroll
	
	</script>	
</head>


<%-- <jsp:include page="/toolbar.jsp" /> --%>

 <body class="page">

   <header role="banner" class="transparent light">
      <div class="row">
         <div
            class="nav-inner row-content buffer-left buffer-right even clear-after">
            <div id="brand">
               <h1 class="reset">
                  <!--<img src="img/logo.png" alt="logo">-->
                  <a href="/main.jsp">Link</a>
               </h1>
            </div>
            <!-- brand -->
            <a id="menu-toggle" href="#"><i class="fa fa-bars fa-lg"></i></a>
            <nav id="toolbar">
               <ul class="reset" role="navigation">
                  <li class="menu-item"><a href="/main.jsp">Home</a></li>
                  <li class="menu-item"><a href="/feed/getFeedList">Feed</a></li>
                  <li class="menu-item"><a href="/">Live</a></li>
                  <li class="menu-item"><a href="/club/getClubList">Club</a></li>
                  <li class="menu-item"><a
                     href="/myHome/getMyHome?userId=${sessionScope.user.userId}">MyHome</a></li>
                  <li class="menu-item"><a
                     href="/serviceCenter/serviceCenterHome.jsp">ServiceCenter</a></li>
                  <c:if test="${ empty sessionScope.user }">
                     <li class="menu-item"><a href="/user/login">로그인</a></li>
                     <li class="menu-item"><a href="/user/addUser">회원가입</a></li>
                  </c:if>
                  <c:if test="${!empty sessionScope.user }">
                     <li class="menu-item"><a
                        href="/user/logout?userId=${user.userId}">로그아웃</a></li>
                     <c:if test="${fn:trim(sessionScope.user.role) == '0' }">
                        <li class="menu-item"><a
                           href="/user/getUser?userId=${user.userId}">내정보보기</a></li>
                     </c:if>
                     <c:if test="${fn:trim(sessionScope.user.role) == '1' }">
                        <li class="menu-item"><a href="/user/getUserList">관리자페이지</a></li>
                     </c:if>
                  </c:if>
               </ul>
            </nav>
         </div>
         <!-- row-content -->
      </div>
      <!-- row -->
   </header>




<body class="blog masonry-style">
	

	<main role="main">
		
			<div id="intro-wrap" data-height="20">
				<div id="intro" class="preload darken">
					<div class="intro-item"
						style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>CLUB LIST</h2>
							<p>The meeting is waiting for you.. </p>
						</div>
						<!-- caption -->
					</div>
					<!-- intro -->
				</div>
				<!-- intro -->
			</div>
			<!-- intro-wrap -->
			
			
	
		<!--  화면구성 div Start /////////////////////////////////////-->
		<div class="container">
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	  	  <div id="main" class="row">
	    
		   <section class="keyword_search_area"> 
		    <div class="col-md-8 text-right" style="float: right;">
			    <form class="form-inline" name="detailForm" id="searchArea">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="border-color: #BD76FF;">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>모임이름</option>
						<%-- <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>모임카테고리</option> --%>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" onkeyup="enterkey()"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  style="border-color: #BD76FF; border-width: thin; margin-top: 14px;">
	    			<button type="button" class="btn btn-search">검색</button>
	    			<button type="button" class="btn btn-myList">내 모임 보기</button>
				  	<button type="button" class="btn btn-addClub">모임등록</button>
				  </div>
				  
				  <!-- <div class="form-group">
				  <button type="button" class="btn btn-primary">가입현황리스트</button>
				  <button type="button" class="btn btn-default">모임등록</button>
				  </div> -->
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
					
	    
	    	
	    	<table>
	    		<colgroup span="4" class="columns"></colgroup>
	    		<tr>
	    			<th>
	    				<select class="form-control" name="category" id="category" onchange="changeFn()" style="border-color: #BD76FF;">
	    					<option name="category" value="">카테고리</option>
	    					<option name="category" value="운동">운동</option>
	  						<option name="category" value="봉사활동">봉사활동</option>
	  						<option name="category" value="음식">음식</option>
							<option name="category" value="여행">여행</option>
							<option name="category" value="반려동물">반려동물</option>
							<option name="category" value="게임">게임</option>
							<option name="category" value="음악/댄스">음악/댄스</option>
							<option name="category" value="독서">독서</option>
							<option name="category" value="기타">기타</option>
	    				</select>
	    			</th>
	    			<th>
	    				<select class="form-control" name="area" id="area" onchange="changeFn2()" style="border-color: #BD76FF;">
	    					<option name="area" value="">지역</option>
	    					<option name="area" value="강남구">강남구</option>
							<option name="area" value="강동구">강동구</option>
							<option name="area" value="강북구">강북구</option>
							<option name="area" value="강서구">강서구</option>
							<option name="area" value="관악구">관악구</option>
							<option name="area" value="광진구">광진구</option>
							<option name="area" value="구로구">구로구</option>
							<option name="area" value="금천구">금천구</option>
							<option name="area" value="노원구">노원구</option>
							<option name="area" value="도봉구">도봉구</option>
							<option name="area" value="동대문구">동대문구</option>
							<option name="area" value="동작구">동작구</option>
							<option name="area" value="마포구">마포구</option>
							<option name="area" value="서대문구">서대문구</option>
							<option name="area" value="서초구">서초구</option>
							<option name="area" value="성동구">성동구</option>
							<option name="area" value="성북구">성북구</option>
							<option name="area" value="송파구">송팡구</option>
							<option name="area" value="양천구">양천구</option>
							<option name="area" value="영등포구">영등포구</option>
							<option name="area" value="용산구">용산구</option>
							<option name="area" value="은평구">은평구</option>
							<option name="area" value="종로구">종로구</option>
							<option name="area" value="중구">중구</option>
							<option name="area" value="중랑구">중랑구</option>
	    				</select>
	    			</th>
	    			<th>
	    				<button type="button" onclick="resetBtn()" class="btn btn-reset"><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>초기화</button>
	    			
	    			</th>
	    		</tr>
	    
	    			    	
	    	</table>
	    	</form>
	    	</div>
	    </section>
	    	
		
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


	<div id="main" class="row">
		  <c:forEach var="i" items="${clubList}">
		  	<div class="col-xs-4 col-md-3">	
				<div class="thumbnail" style="">
			  			<img src="/resources/image/uploadFiles/${i.clubImage}" class="img-rounded">
			  			<p class="club-cT"><strong>모임제목 : ${i.clubTitle}</strong></p>
				  		<p>${i.clubArea}</p>
				  		<%-- <p>현재인원 : ${i.currentMember}</p> --%>				  		
				  		<p>최대인원 : ${i.clubMaxMember}</p>
				  		<p>카테고리 : ${i.clubCategory }</p>
				  		<p>모임생성날짜 : ${i.clubRegDate}</p>
				  		<p><a href="/club/getClub?clubNo=${i.clubNo}" class="btn btn-btn" role="button" style="margin-left: 5px;">모임보기</a></p>			  	
				 </div>
				</div>						
	    	 </c:forEach>
		</div>	
				
      
	</div>
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
	
	<div id="pageNav" >
 	<jsp:include page="../common/pageNavigator_new2.jsp" />
 	</div>
 	
	</main>
	
</body>

</html>