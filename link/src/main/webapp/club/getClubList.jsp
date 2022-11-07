<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 가능? -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<title>모임리스트</title>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<!-- alert! -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<!-- 따로 가능?? -->
<meta name="description" content="The Page Description">
<style type="text/css">
@
-ms-viewport {
	width: device-width;
}
</style>
<title>Beetle - Home page</title>
<link rel="stylesheet" href="/resources/css/layers.min.css" media="screen">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="/resources/css/style.css" media="screen">



<style>
body {
	background-color: #EBEDF0;
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
	background-color: #EBEDF0;
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
	background: rgba(0, 0, 0, 0.35);
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
	/* border-radius: 10px; */
	-webkit-transition: border .2s ease-in-out;
	-o-transition: border .2s ease-in-out;
	transition: border .2s ease-in-out;
	height: 400px;
	font-size: 0.9rem !important;
}

.thumbnail img {
	min-height: 200px;
	height: 100px;
	width: 254px;
	/* border-radius: 20px; */
}

div {
	clear: none !important;
}

div.row {
	margin-left: 0 !important;
}

.club-cT {
	font-size:
}

element.style {
	float: left;
	border: 1px solid !important;
}

.btn {
	background-color: white;
	box-shadow: rgba(102, 051, 102, 0.3) 0px 9px 8px, rgba(95, 0, 128, 0.22) 0px 5px 2px;
	border-radius: 15px;
	padding: 8px;
	width: 70px !important;
	height: 30px !importatn;
	color: #5F0080 !important;
	font-size: 15px !important;
	text-align: center;
	border: solid 2px purple;
}

.btn:hover {
	background-color: #5F0080;
	box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	border-radius: 15px;
	padding: 8px;
	width: 70px !important;
	height: 30px !importatn;
	color: white !important;
	font-size: 15px !important;
	border: solid 2px white;
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

	50%
	{
		transform:rotate(0deg)
		scale(1);
	}
	75%
	{
		transform:rotate(-2deg)
		scale(1.01);
	}
}
.thumbnail:hover {
	opacity: 0.9;
	animation: post-ani 0.8s linear 1;
	cursor:pointer;
}

/* 알림부분 */
header {
	display: flex;
}

.alarmHead {
	float: right;
	display: flex;
	align-items: center;
	margin: 5px;
}

.alarmImg {
	display: inline-flex;
	width: 25px;
	height: 25px;
	
}

.text-center {
    display: flex;
    justify-content: center;
}



/* SCROLL */

html {
	-ms-overflow-style:none !important;
}

html::-webkit-scrollbar {
	display:none !important;
}

/* SCROLL */



</style>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script type="text/javascript">
	
	
	function fncGetClubList(currentPage) {
		
		
		$("#currentPage1").val(currentPage)
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
			
			var totalApprovalConditionCount = $("input[name='totalApprovalConditionCount']").val();
			var joinClubLimit = $("input[name='joinClubLimit']").val();
			
			//alert(totalApprovalConditionCount);
			//alert(joinClubLimit);
			
			if(totalApprovalConditionCount < joinClubLimit) {
				self.location="/club/addClubView.jsp"
			} else {
				
				Swal.fire({
					title: '모임 최대 한도 수를 초과하였습니다.' ,
					text: "결제를 통해 모임 한도를 늘릴 수 있습니다." ,
					icon: 'warning',
					showCancelButton: false,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
				}).then((result) => {
					if(result.value){
						
						self.location="/clubPost/addPayView"
					}
				})
			}	
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

<%-- SOCKET IO --%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<%-- SOCKET IO --%>



<%-- <jsp:include page="/toolbar.jsp" /> --%>

<body class="page">



	<%-- ///////////////////// 채팅에 필요한 코딩 //////////////////////// --%>
	<%-- 채팅을 위한 소켓 --%>
	<script src="http://192.168.0.74:3000/socket.io/socket.io.js"></script>
	<%-- 채팅 js --%>
	<script src="/resources/javascript/chat/chat.js"></script>
	<%-- 채팅 css --%>
	<link rel="stylesheet" href="/resources/css/chat/chat.css" type="text/css" media="screen" title="no title">
	<%-- ///////////////////// 채팅에 필요한 코딩 //////////////////////// --%>
	
	

	<jsp:include page="/toolbar.jsp" />


	<!-- <main role="main"> -->

		<div id="main">
				
			<%-- chat.js에서 사용위해서 --%>
			<input type="hidden" id="session_userId" value="${ sessionScope.user.userId }">
			<input type="hidden" id="session_profileImage" value="${ sessionScope.user.profileImage }">
			<input type="hidden" id="session_nickName" value="${ sessionScope.user.nickName }">
			<%-- chat.js에서 사용위해서 --%>
			<%-- 채팅 --%>
			<jsp:include page="/chat/chat.jsp" />
			<%-- 채팅 --%>

			<!--  화면구성 div Start /////////////////////////////////////-->
			<div class="container">
		
				<div style="width: 1140px; height: 550px; overflow: hidden;">
					<img src="/resources/image/uploadFiles/clubMainImage5.jpg" width="100%">
				</div>

				<div style="margin-top: 50px; margin-bottom: 40px;">
				
					<div>
						<form class="form-inline" name="detailForm" id="searchArea">
	
							<c:if test="${ (search.searchKeyword != '1') and (search.searchKeyword != '2')}">
							<div style="display: grid; grid-template-columns: 1fr 3fr 2fr 2fr 1fr 1fr 1fr;">
							
								<div>
									<select class="form-control" name="searchCondition" style="margin-right: 10px;">
										<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>모임이름</option>
									</select>
								</div>
								
								<div>
									<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="모임 검색" autocomplete="off" onkeyup="enterkey()" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
								</div>
								
								<div>
									<label for="clubArea">지 역</label>
									<select class="form-control" name="clubArea" id="clubArea" onchange="changeFn2()">
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
										<option value="송파구">송파구</option>
										<option value="양천구">양천구</option>
										<option value="영등포구">영등포구</option>
										<option value="용산구">용산구</option>
										<option value="은평구">은평구</option>
										<option value="종로구">종로구</option>
										<option value="중구">중구</option>
										<option value="중랑구">중랑구</option>
									</select>
								</div>
								
								<div>
									<label for="clubCategory">카테고리</label>
									<select class="form-control" name="clubCategory" id="clubCategory" onchange="changeFn()">
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
								</div>
								
								<div></div>
								
								<div style="margin-right: 10px;">
									<button type="button" class="btn btn-search">검색</button>
								</div>
								
								<div>
									<button type="button" onclick="resetBtn()" class="btn btn-reset">
										<span class="glyphicon glyphicon-repeat" aria-hidden="true" style="display: contents;">전체</span>
									</button>
								</div>
							</div>
							</c:if>

							<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
							<input type="hidden" id="currentPage1" name="currentPage" value="1" />

						</form>
					</div>
					<!-- table 위쪽 검색 Start /////////////////////////////////////-->
					<%-- <div id="main" class="row" style="width: 800px; background-color: aqua;">
					
					
	
						<div class="col-md-8 text-right" style="float: left; background-color: orange;">
							<form class="form-inline" name="detailForm" id="searchArea" style="margin-top: 30px; margin-bottom: 30px; display: flex; height: 220px; border-radius: 10px; box-shadow: rgb(0 0 0/ 30%) 0px 7px 9px, rgb(0 0 0/ 22%) 0px 4px 5px; background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);">
	
								<c:if test="${ (search.searchKeyword != '1') and (search.searchKeyword != '2')}">
	
	
									<div class="form-group" id="selectTitle">
										<select class="form-control" name="searchCondition" style="margin-top: 15px; margin-left: 10px; background-color: #f0f2f5;">
											<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>모임이름</option>
										</select>
	
										<p>
											<label for="clubArea" style="margin-top: 22px; text-align: center !important; margin-right: 34px;">지 역</label>
										</p>
	
										<label for="clubCategory" style="margin-top: 22px; text-align: center !important; margin-right: 24px;">카테고리</label>
	
									</div>
	
									<div class="form-group" id="selects" style="text-align: left;">
										<label class="sr-only" for="searchKeyword">검색어</label>
										<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="모임 검색" autocomplete="off" onkeyup="enterkey()" value="${! empty search.searchKeyword ? search.searchKeyword : '' }" style="border-width: thin; margin-top: 15px; margin-right: 70px; margin-left: 10px;">
	
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
											<option value="송파구">송파구</option>
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
	
											<button type="button" class="btn btn-search">검색</button>
											<button type="button" onclick="resetBtn()" class="btn btn-reset">
												<span class="glyphicon glyphicon-repeat" aria-hidden="true" style="margin-top: 30px; margin-left: 50px !important; display: contents;"></span>초기화
											</button>
									</div>
								</c:if>
	
								<c:if test="${ (search.searchKeyword == '1') or (search.searchKeyword == '2')}">
								</c:if>
	
								<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
								<input type="hidden" id="currentPage1" name="currentPage" value="1" />
	
							</form>
						</div>
	
						
	
						<!-- <button type="button" class="btn btn-addClubBtn" id="addClubBtn" style="margin-top: 130px !important; margin-left: 50px !important;">모임개설
		  		
		  		</button> -->
						<!-- </div> -->
	
					</div> --%>
					<input type="hidden" id="totalApprovalConditionCount" name="totalApprovalConditionCount" value="${totalApprovalConditionCount}">
					<input type="hidden" id="joinClubLimit" name="joinClubLimit" value="${sessionScope.user.joinClubLimit}">
				</div>
				<!-- table 위쪽 검색 Start /////////////////////////////////////-->

				<!-- <div class="thumbnail" style="box-shadow: rgb(0 0 0 / 30%) 0px 7px 9px, rgb(0 0 0 / 22%) 0px 4px 5px; border-radius: 20px; margin-left: 909px; height: 245px; margin-top: -248px;" onclick="location.href='/club/addClubView.jsp'"> -->
				<!-- <div class="thumbnail" id="addClubBtn" style="box-shadow: rgb(0 0 0/ 30%) 0px 7px 9px, rgb(0 0 0/ 22%) 0px 4px 5px; border-radius: 20px; margin-left: 909px; height: 245px; margin-top: -248px; transform: translate(-33px, 0px);">
					<img src="/resources/image/uploadFiles/addButton1.png" style="width: 308px;">
					<p style="margin-top: 20px; margin-left: 11px;">
						<strong>모임개설</strong>
				</div> -->


				<div id="main" class="row">
					<c:forEach var="i" items="${clubList}">
						<div class="col-xs-4 col-md-3">
							<div class="thumbnail" style="box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;" onclick="location.href='/club/getClub?clubNo=${i.clubNo}'">
								<img src="/resources/image/uploadFiles/${i.clubImage}" class="img-rounded">
								<p class="club-cT" style="margin-left: 10px;">
									<strong>${i.clubTitle}</strong>
								</p>
								<p style="margin-left: 10px;">${i.clubArea}</p>
								<p style="margin-left: 10px;">최대인원 : ${i.clubMaxMember}</p>
								<p style="margin-left: 10px;">${i.clubCategory }</p>
								<p style="margin-left: 10px;">모임생성일 : ${i.clubRegDate}</p>
							</div>
						</div>
					</c:forEach>
				</div>


			</div>


			<!--  화면구성 div End /////////////////////////////////////-->

			<jsp:include page="../common/pageNavigator_new2.jsp" />

		</div>
	<!-- </main> -->
	
	<div style="height: 500px; overflow: hidden;">
		<div>
			<img src="/resources/image/uploadFiles/footerImage3.jpg" width="100%">
		</div>
		<div class="row" style="position: absolute; top: 100px; left: 100px;">
			<div class="row-content buffer clear-after">
				<section id="top-footer">
					<div class="widget column three"><!-- la class="widget" è forse generata utomaticamente da wp -->
						<h4>Menu</h4>
						<ul class="plain">
							<li><a href="home-01.html">Home</a></li>
							<li><a href="works-3-columns.html">Portfolio</a></li>
							<li><a href="blog-4-columns-masonry.html">Blog</a></li>
							<li><a href="resume.html">Resume</a></li>
							<li><a href="file:///Users/pasqualevitiello/My%20Folder/Job/Envato/PR%20Themeforest/Flattie/Markup/Beetle/contact.html">Contact</a></li>
						</ul>
					</div>
					<div class="widget column three">
						<h4>Archives</h4>
						<ul class="plain">
							<li><a href="#">March 2014</a></li>
							<li><a href="#">April 2014</a></li>
							<li><a href="#">May 2014</a></li>
							<li><a href="#">June 2014</a></li>
							<li><a href="#">July 2014</a></li>
						</ul>
					</div>								
					<div class="widget column three">
						<h4>Widget</h4>
						<p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
					</div>				
					<div class="widget meta-social column three">
						<h4>Follow Us</h4>
						<ul class="inline">
							<li><a href="#" class="twitter-share border-box"><i class="fa fa-twitter fa-lg"></i></a></li>
							<li><a href="#" class="facebook-share border-box"><i class="fa fa-facebook fa-lg"></i></a></li>
							<li><a href="#" class="pinterest-share border-box"><i class="fa fa-pinterest fa-lg"></i></a></li>
						</ul>
					</div>														
				</section><!-- top-footer -->
				<section id="bottom-footer">
					<p class="keep-left">&copy; 2014 <a href="http://mokaine.com/" alt="Mokaine Lab">Mokaine</a>. All Rights Reserved.</p>
					<p class="keep-right">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
				</section><!-- bottom-footer -->			
			</div><!-- row-content -->	
		</div><!-- row -->	
	</div>

</body>

</html>