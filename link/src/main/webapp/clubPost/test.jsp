<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="The Page Description">
		<style type="text/css">@-ms-viewport{width: device-width;}</style>
		<title>Beetle - Works 4 Columns Alternative</title>
		<link rel="stylesheet" href="css/layers.min.css" media="screen">
		<link rel="stylesheet" href="css/font-awesome.min.css" media="screen"> 
		<link rel="stylesheet" href="style.css" media="screen">
		<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css'>
		<link rel="icon" href="favicon.ico">
		<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/apple-touch-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/apple-touch-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/apple-touch-icon-152x152.png">
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN 격자형식 리스트 출력에서 필요하다 ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		
		<script type="text/javascript">
			$(function() {
				$("button:contains('등록하기')").bind("click", function() {
					alert('등록하기');
					//swal.fire("아이디를 입력하셔야 합니다.");
					//self.location = "/clubPost/addClubPostView?clubNo=2";
					location.href = "/clubPost/addClubPostView?clubNo=2";
				});
				$("b:contains('최신순')").bind("click", function() {
					alert('최신순');
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=0";
				});
				$("b:contains('오래된순')").bind("click", function() {
					alert('오래된순');
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=1";
				});
				$("b:contains('좋아요 많은순')").bind("click", function() {
					alert('좋아요 많은순');
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=2";
				});
				$("b:contains('내가 작성한 게시물')").bind("click", function() {
					alert('내가 작성한 게시물');
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=3";
				});
				$("a:contains('검색')").bind("click", function() {
					alert('검색');
					$("input[name='currentPage']").val("1");
					$("form").submit();
				});
				
				//무한 페이징
				var currentPage = 1;
				$(window).scroll(function() {
					var maxHeight = $(document).height();
					var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
					
					if(currentScroll >= maxHeight) {
						
						currentPage++;
						//alert(currentPage);
						$("input[name='currentPage']").val(currentPage);
						
						var clubNo = "2";
						var searchCondition = $("option:selected").val();
						var searchKeyword = $("input[name='searchKeyword']").val();
						var order = $("input[name='order']").val();
						
						//alert(searchCondition);
						//alert(searchKeyword);
						//alert(order);
						
						$.ajax({
							url : "/clubPostRest/json/getClubPostList",
							type : "post",
							dataType : "json",
							data : JSON.stringify({
								pageUnit : clubNo,
								currentPage : currentPage,
								searchCondition : searchCondition,
								searchKeyword : searchKeyword,
								order : order
							}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function( JSONData, status ) {
								alert(status);
								
								console.log(JSONData.search);
								console.log(JSONData.clubPostListCount);
								console.log(JSONData.clubPostList);
							}// end of success
						});// end of ajax				
					}// end of if			
				}); // end of scroll
				
				
				
			});// end of function()
			
			//썸네일 클릭시 상세상품조회 페이지 or 상품수정 페이지로 이동
			function getClubPostGo(clubPostNo){
				location.href = "/clubPost/getClubPost?clubPostNo="+clubPostNo;
			}
		</script>
		
		<style type="text/css">
			.clubPostList-Thumbnail {
				background-color: blue;
			}
			.contains-order {
				font-size: 15px;
			}
		</style>
	</head>
<body class="portfolio">

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="js/plugins.js"></script>
	<script src="js/beetle.js"></script>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

		
	<main role="main">
		<div id="intro-wrap" class="full-height"><!-- 상단 검은색 공통 영역 -->
			<div id="intro" class="preload darken more-button">					
				<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
					<div class="caption">
						<h2>Tools</h2>
						<p>For me, the camera is a sketch book, an instrument of intuition and spontaneity.</p>
					</div><!-- caption -->	
					<div class="photocaption">
						<h4>A shot by <a href="http://madebyvadim.com/" target="blank" alt="Vadim Sherbakov">Vadim Sherbakov</a></h4>
					</div><!-- photocaption -->											
				</div>								
			</div><!-- intro -->
		</div><!-- intro-wrap -->
		
		<div id="main" class="row"><!-- 중간 개별영역 -->
		
			<div class="row-content buffer clear-after" style="background-color: green; padding-left: 0px; padding-right: 0px;">
			
				<div class="grid-items preload">
				
					<div class="column nine" style="background-color: yellow;">
					
						<div class="page-header text-info">
					    </div>
					    
					    <div class="contains-search">
					    
					    <div class="row" style="background-color: aqua;">
			
							<div class="row">
								<div class="col-md-4">.col-xs-6 .col-md-4</div>
								<div class="col-md-4">.col-xs-6 .col-md-4</div>
								<div class="col-md-4">.col-xs-6 .col-md-4</div>
							</div>
							
						</div>
						
						</div>
					
					</div>
				
				</div>
			
			</div>
		
		</div>
	</main>

	</body>

</html>
