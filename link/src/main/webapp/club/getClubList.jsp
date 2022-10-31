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
 	 
 	 
 	 <!-- alert! -->
 	 <!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> -->
 	 
 	 
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
    		/* background-color: #23242b; */
		    -webkit-box-shadow: none;
		    -moz-box-shadow: none;
 	   		box-shadow: none;
		}
		.thumbnail {
			    display: block;
			    padding: 0px;
			    margin-bottom: 40px;
			    line-height: 1;
			    background-color: #ffffff;
			    /* border: 1px solid #5F0080; */
			    border-radius: 10px;
			    -webkit-transition: border .2s ease-in-out;
			    -o-transition: border .2s ease-in-out;
			    transition: border .2s ease-in-out;
			}
		
		.thumbnail img { 
			min-height:200px;
			height:100px;
		    width: 254px;
		    border-radius: 20px;
		 }     
		 
		 div {
		 	clear: none;
		 }
		 
		 .club-cT {
		 		font-size: 
		 }
		 
		 element.style {
	    float: left;
	    border: 1px solid !important;
		}
		
		.btn{
	   background-color: white;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 83px !important;
	   color: #5F0080 !important;
	   font-size: 16px !important;
	   text-align: center;
	   border: solid 2px;
	}
	
	.btn:hover{
	   background-color: #5F0080;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 83px !important;
	   color: white !important;
	   font-size: 16px !important;
	}
		
		 #pageNav {
		 	float: none;
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
    background-color: #e1bfff00 !important;
    font-size: 12px;
	}
	
	section {
		background-color: #cf0cc90d !important;
		border: solid 1px #d8d8d8 !important;
		margin: 10px;
	}
	
	
	/*썸네일 애니메이션*/
	@keyframes post-ani {
	
    25% {
        transform: rotate(2deg) scale(1.01);
	    }
 
    50% {
        transform: rotate(0deg) scale(1);
    	}
 
    75% {
        transform: rotate(-2deg) scale(1.01);
    	}
	}
	.thumbnail:hover {
	opacity: 0.9;
	animation: post-ani 0.8s linear 1;
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
		
		$("#addClubBtn").on("click", function() {
			self.location="/club/addClubView.jsp"
		});
	});
	
	
	function enterkey() {
		if(window.event.keyCode == 13) {
			fncGetClubList(1);
		}
	}
	
	function changeFn() {
		var category = document.getElementById("clubCategory");
		var value = (category.options[category.selectedIndex].value);
		//alert("value = "+value);
	}
	
	function changeFn2() {
		var area = document.getElementById("clubArea");
		var value = (area.options[area.selectedIndex].value);
		//alert("value = "+value);
	}
	
	function resetBtn() {
		$("#searchArea")[0].reset();
	}
	
	
	
	//무한 페이징
	/* var currentPage = 1;
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
	}); // end of scroll */
	
	</script>	
</head>


<%-- <jsp:include page="/toolbar.jsp" /> --%>

  <body class="page">

   <header role="banner" class="transparent light">
      <div class="row">
         <div
            class="nav-inner row-content buffer-left buffer-right even clear-after" style="margin-left: 350px; font-size: 17.5px;">
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
		
			<!-- <div id="intro-wrap" data-height="20">
				<div id="intro" class="preload darken">
					<div class="intro-item"
						style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>CLUB LIST</h2>
							<p>The meeting is waiting for you.. </p>
						</div>
						caption
					</div>
					intro
				</div>
				intro
			</div>
			intro-wrap -->
			
			
	
		<!--  화면구성 div Start /////////////////////////////////////-->
		<div class="container">
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	  	  <div id="main" class="row">
	    
		   
		    <div class="col-md-8 text-right" style="float: left;">
			    <form class="form-inline" name="detailForm" id="searchArea" style="margin-top: 30px; margin-bottom: 30px; display: flex; height: 220px; border-radius: 10px; box-shadow: rgb(0 0 0 / 30%) 0px 7px 9px, rgb(0 0 0 / 22%) 0px 4px 5px;">
			    
				  <div class="form-group" id="selectTitle">
				    <select class="form-control" name="searchCondition" style="margin-top: 15px; margin-left: 10px; background-color: #f0f2f5;">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>모임이름</option>
					</select>
					
					<p><label for="clubArea" style="margin-top: 22px; text-align: center !important; margin-right: 34px;">지 역</label></p>
					
					<label for="clubCategory" style="margin-top: 22px; text-align: center !important; margin-right: 24px;">카테고리</label>
					
				  </div>
				  
				  <div class="form-group" id="selects" style="text-align: left;">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="모임 검색" onkeyup="enterkey()"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  style="border-width: thin; margin-top: 15px; margin-right: 70px; margin-left: 5px;">
				    			 
					<select class="form-control" name="clubArea" id="clubArea" onchange="changeFn2()" style="margin-right: 388px; margin-left: 10px;">
	    					<option value="">지역</option>
	    					<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강북구">강북구</option>
							<option value="강서구">강서구</option>
							<option value="관악구">관악구</option>
							<option value="광진구">광진구</option>
							<option value="구로구">구로구</option>
							<option value="금천구">금천구</option>
							<option value="노원구">노원구</option>
							<option value="도봉구">도봉구</option>
							<option value="동대문구">동대문구</option>
							<option value="동작구">동작구</option>
							<option value="마포구">마포구</option>
							<option value="서대문구">서대문구</option>
							<option value="서초구">서초구</option>
							<option value="성동구">성동구</option>
							<option value="성북구">성북구</option>
							<option value="송파구">송팡구</option>
							<option value="양천구">양천구</option>
							<option value="영등포구">영등포구</option>
							<option value="용산구">용산구</option>
							<option value="은평구">은평구</option>
							<option value="종로구">종로구</option>
							<option value="중구">중구</option>
							<option value="중랑구">중랑구</option>
	    				</select>	
	    				
	    				<select class="form-control" name="clubCategory" id="clubCategory" onchange="changeFn()" style="margin-top: 16px; margin-left: 10px;">
	    					<option value="">카테고리</option>
	    					<option value="운동">운동</option>
	  						<option value="봉사활동">봉사활동</option>
	  						<option value="음식">음식</option>
							<option value="여행">여행</option>
							<option value="반려동물">반려동물</option>
							<option value="게임">게임</option>
							<option value="음악/댄스">음악/댄스</option>
							<option value="독서">독서</option>
							<option value="기타">기타</option>
	    				</select>			    			 
					<p>
					
					<p>
					
						<button type="button" class="btn btn-search" >검색</button>
	    				<button type="button" onclick="resetBtn()" class="btn btn-reset"><span class="glyphicon glyphicon-repeat" aria-hidden="true" style="margin-top: 30px; margin-left: 50px !important; display: contents;"></span>초기화</button>
				  </div>
				  
				  <!-- <div class="form-group">
				  <button type="button" class="btn btn-primary">가입현황리스트</button>
				  <button type="button" class="btn btn-default">모임등록</button>
				  </div> -->
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
	    	    			
	    	</form>
	    	</div>
	    	
	    	
	    <!-- <div class="col-md-6 text-right" style="float: right;"> -->
	    	<!-- <button type="button" class="btn btn-myList" style="">내 모임 보기</button> -->
	  		<button type="button" class="btn btn-addClubBtn" id="addClubBtn" style="margin-top: 130px !important; margin-left: 50px !important;">모임등록</button>
	    <!-- </div> -->
	    	
	</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


	<div id="main" class="row">
		  <c:forEach var="i" items="${clubList}">
		  	<div class="col-xs-4 col-md-3">	
				<div class="thumbnail" style="box-shadow: rgb(0 0 0 / 30%) 0px 7px 9px, rgb(0 0 0 / 22%) 0px 4px 5px; border-radius: 20px;" onclick="location.href='/club/getClub?clubNo=${i.clubNo}'">
			  			<img src="/resources/image/uploadFiles/${i.clubImage}" class="img-rounded">
			  			<p class="club-cT" style="margin-left:10px;"><strong>${i.clubTitle}</strong></p>
				  		<p style="margin-left:10px;">${i.clubArea}</p>
				  		<p style="margin-left:10px;">최대인원 : ${i.clubMaxMember}</p>
				  		<p style="margin-left:10px;">${i.clubCategory }</p>
				  		<p style="margin-left:10px;">모임생성일 : ${i.clubRegDate}</p>
				</div>
				</div>						
	    	 </c:forEach>
		</div>	
				
      
	</div>
	  
 	
 	<!--  화면구성 div End /////////////////////////////////////-->
	
	<div id="pageNav" >
 	<jsp:include page="../common/pageNavigator_new2.jsp" />
 	</div>
 	
	</main>
	
</body>

</html>