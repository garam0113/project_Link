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
		
		<!--  font -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
		
		<!--  ///////////////////////// jQuery CDN////////////////////////// -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		
		<script type="text/javascript">
			$(function() {
				$("a:contains('����ϱ�')").bind("click", function() {
					location.href = "/clubPost/addClubPostView?clubNo="+${ clubNo };
				});
				$("b:contains('�ֽż�')").bind("click", function() {
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubNo }+"&order=0";
				});
				$("b:contains('�����ȼ�')").bind("click", function() {
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubNo }+"&order=1";
				});
				$("b:contains('���ƿ� ������')").bind("click", function() {
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubNo }+"&order=2";
				});
				$("b:contains('���� �ۼ��� �Խù�')").bind("click", function() {
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubNo }+"&order=3";
				});
				$("a:contains('�˻�')").bind("click", function() {
					$("input[name='currentPage']").val("1");
					$("form").submit();
				});
				
				//���� ����¡
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
								//alert(status);
								//console.log(JSONData.clubPostList);
								//console.log(JSONData.clubPostList.length);

								$.each( JSONData, function( item, el ) {
									console.log( item );
									console.log( el );
									//var check = (JSONData.clubPostList.clubPostVideo1 == null)? false: true
											
									var display = "";
									
									console.log( display );
									$(".col-md-4").append( display );
								});
								
								$("input[name='order']").val( JSONData.search.order );
								
							}// end of success
						});// end of ajax				
					}// end of if			
				}); // end of scroll
				
				
				
			});// end of function()
			
			//����� Ŭ���� �󼼻�ǰ��ȸ ������ or ��ǰ���� �������� �̵�
			function getClubPostGo(clubNo, clubPostNo){
				location.href = "/clubPost/getClubPost?clubNo="+clubNo+"&clubPostNo="+clubPostNo;
			}
			
			// �г���, �����ʻ��� Ŭ���� �ش� ������ ����Ȩ�Ƿ� �̵�
			function getMyHomeGo(userId){
				location.href = "/myHome/getYourHome?userId="+userId;
			}
		</script>
		
		<style type="text/css">
			.clubPostList-Thumbnail {
				background-color: blue;
			}
			.contains-order {
				font-size: 15px;
			}
			.row{
				font-family: 'Single Day', cursive;
			}
			.club-post-add{
				float: right;
				box-shadow: rgba(95, 0, 128, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
				border-radius: 10px;
				padding: 10px;
				margin: 10px;
				width: 65px;
				background-color: #5F0080;
				color: white;
				font-size: 20px;
			}
			.club-post-cancle{
				box-shadow: rgba(95, 0, 128, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
				border-radius: 10px;
				padding: 1rem;
				background-color: white;
				color: #5F0080;
				font-size: 25px;
				border-color: #5F0080;
			}
			.contains-order{
				font-size: 30px;
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
			<div id="intro-wrap" class="full-height"><!-- ��� ������ ���� ���� -->
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

			<div id="main" class="row"><!-- �߰� �������� -->
			
				<div class="row-content buffer clear-after" style="padding-right: 0px;">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px;">
						<li data-group="advertising">
							<a href="/club/getMeetingList">���� ����</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList">���� �Խù�</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList">���ӿ�</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/chatRoomList">���� ä��</a>
						</li>
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">����</a>
						</li> --%>
					</ul>
					
					
					
					<div class="grid-items preload">
					
					
							<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
						<div class="column nine">
							    
							    <!-- table ���� �˻� Start /////////////////////////////////////-->
							    <div class="contains-search">
							    
								    <div class="contains-order">
								    	<p class="text-primary" style="width: 87%">
								    		��ü  ${ clubPostListCount } �Ǽ�, ���� ${ search.currentPage } ������<br>
											<b>�ֽż�</b>&nbsp;/&nbsp;
											<b>�����ȼ�</b>&nbsp;/&nbsp;
											<b>���ƿ� ������</b>&nbsp;/&nbsp;
											<b>���� �ۼ��� �Խù�</b>
											<!-- <a href="/clubPost/getClubNoticeList">���Ӱ�������</a> -->
											<input type="button" class="club-post-add" value="����ϱ�">
								    	</p>
								    </div>
								    
									<div class="contains-search" >
										<form class="form-inline" name="detailForm" action="/clubPost/getClubPostList" method="post">
											
											<!-- PageNavigation ���� ������ ���� ������ �κ� -->
											<input type="hidden" name="currentPage" value=""/>
											<input type="hidden" name="order" value="${ search.order }">
										  
										</form>
									</div>
							    	
							    </div>
							    <!-- table ���� �˻� Start /////////////////////////////////////-->
							    
							    
							    
							    <!-- ����Ϸ� list display start -->
								<div class="row">
									<c:set var="i" value="${ clubPostList }"></c:set>
									<c:if test="${ clubPostListCount > 0}">
									<c:forEach var="i" begin="0" end="${ fn:length(clubPostList) - 1 }" step="1">
										<div class="col-md-4">
											<a href="javascript:getClubPostGo('${ clubPostList[i].clubNo }','${ clubPostList[i].clubPostNo }')">
												<c:if test="${ empty clubPostList[i].clubPostVideo1 }">
													<img src="/resources/image/uploadFiles/${ clubPostList[i].image1 }" height="400" width="700">
												</c:if>
												<c:if test="${ ! empty clubPostList[i].clubPostVideo1 }">
													<img src="https://img.youtube.com/vi/${ clubPostList[i].clubPostVideo1 }/mqdefault.jpg" alt="���� ������Դϴ�." height="400" width="700">
												</c:if>
											</a>
											
											<div style="display: flex; width: 87%;">
												<div style="flex:1;">
													<a href="javascript:getMyHomeGo('${ clubPostList[i].user.userId }')">
														<img src="/resources/image/uploadFiles/${ clubPostList[i].user.profileImage }" height="100" width="100">
													</a>
												</div>
												<div style="flex:1;">
													<a href="javascript:getMyHomeGo('${ clubPostList[i].user.userId }')">
														<p align="center" style="font-size: 30px; color: red;">${ clubPostList[i].user.nickName }</p>
													</a>
												</div>
												<div style="flex:1;">
													<p align="center" style="font-size: 30px">${ clubPostList[i].clubPostHeartCount }</p>
												</div>
												<div style="flex:1;">
													<!-- heartCondition�� ���� �Խù� ��ȣ�� ������ �ش� ������ ���ƿ��ߴ� / 0�̸� ���ƿ� ���ߴ� -->
													<img src="/resources/image/uploadFiles/${ clubPostList[i].heartCondition != 0 ? 'heart.jpg' : 'no_heart.jpg' }" height="50" width="50">
												</div>
												
											</div>
											<div style="width: 87%;">
												<p align="center" style="font-size: 30px">${ clubPostList[i].clubPostTitle }</p>
											</div>
										</div>
									</c:forEach>
									
									</c:if>
									<c:if test="${ clubPostListCount == 0}">
										<h4>�ش�Ǵ� �Խù��� �����ϴ�.</h4>
									</c:if>
								</div>
								<!-- ����Ϸ� list display end -->
							    
							    
							    
							
						
						</div><!-- grid-items -->
						<!--  ȭ�鱸�� div End /////////////////////////////////////-->
						
						
						
						
						
						<aside role="complementary" class="sidebar column three last">
							<div class="widget widget_search">
								<form role="search">
									<span class="pre-input"><i class="icon icon-search"></i></span>
									
										<div style="float: left; width: 65%;">
											<input type="text"  name="searchKeyword" placeholder="������ �Է�" class="plain buffer" value="${ ! empty search.searchKeyword ? search.searchKeyword : '' }">
										</div>
									
										<%-- <div class="form-group" style="flex: 1;">
											<select class="form-control" name="searchCondition" >
												<option value="0"  ${ ! empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" }>���̵�</option>
												<option value="1"  ${ ! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>����</option>
											</select>
										</div> --%>
										
										<div style="display: inline-block;">
											<input type="button" class="club-post-cancle" value="�˻�">
										</div>
									
								</form>
							</div>
						</aside>
						
						
						
					</div>
				</div><!-- row-content -->
			</div><!-- row -->
		</main><!-- main -->
		
		
		
		

		<footer role="contentinfo"><!-- �ϴ� ������ ���� -->
			<div class="row">
				<div class="row-content buffer clear-after">
					<section id="top-footer">
						<div class="widget column three">
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
		</footer>

</body>
</html>