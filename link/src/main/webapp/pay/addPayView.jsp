<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>		
		<script src="js/plugins.js"></script>
		<script src="js/beetle.js"></script>
		
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!--  font -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
		
		
		<script type="text/javascript">
		$(function(){
			$("input[value='결제하기']").bind("click", function(){
				requestPayment();
			});
			$("input[value='취소하기']").bind("click", function(){
				history.go(-1);
			});
			
			$(".plus").bind("click", function(){
				
				//var updateClubMemberCount = parseInt( $(".payProduct-member").text() );
				var updateClubMemberCount = $(".payProduct-member").text();
				var updateClubCount = parseInt( $(".payProduct-club").text() );
				var totalPrice = parseInt( $(".totalPrice").text() );
				var clubNo = $("input[name='clubNo']").val();
				var maxPay = $("#maxPay").val();
				
				//alert( maxPay );
				//alert( clubNo );			
				//alert( updateClubMemberCount );
				//alert( updateClubCount );
				//alert( totalPrice );
				
				if( maxPay == totalPrice ){
					alert('if');
					${ pay.clubNo } == 0 ? $(".result").text( "한명당 최대로 가입 할 수 있는 모임은 10개입니다" ): $(".result").text( "하나의 모임당 최대 모임원은 50명입니다" );
				}else{
					alert('else');
					if( clubNo != 0 ){
						// 회원이 모입가입신청 했을때
						alert('if');
						$(".payProduct-club").text( parseInt( updateClubCount ) + 2 );
						$(".return-club-limit").text( parseInt( $(".return-club-limit").text() ) + 2 );
					}else{
						alert('else');
						$(".payProduct-member").text( updateClubMemberCount + 10 );
						$(".return-max-member").text( parseInt( $(".return-max-member").text() ) + 10 );
					}
					$(".totalPrice").text( totalPrice + 5000 );
					$(".result").text( "" );
				}
				
			});//end of plus
			
			$(".minus").bind("click", function(){
				
				var updateClubMemberCount = $(".payProduct-member").text();
				var updateClubCount = $(".payProduct-club").text();
				var totalPrice = $(".totalPrice").text();
				var clubNo = $("input[name='clubNo']").val();
				var max_member = $(".return-max-member").text();
				
				if( totalPrice == 5000 ){
					alert('if');
					$(".result").text( "최소 결제 금액은 5000원입니다" );
				}else{
					alert('else');
					if( clubNo == 0 ){
						alert('if');
						$(".payProduct-club").text( parseInt( updateClubCount - 2 ) );
						$(".return-club-limit").text( parseInt( $(".return-club-limit").text() ) - 2 );
					}else{
						alert('else');
						alert(updateClubMemberCount);
						alert(max_member);
						$(".payProduct-member").text( updateClubMemberCount - 10 );
						$(".return-max-member").text( parseInt( max_member ) - 10 );
					}
					$(".totalPrice").text( totalPrice - 5000 );
					$(".result").text( "" );
				}
				
			});//end of minus
		});
	</script>
	<style type="text/css">
	
		/* 메인화면 */
		.row{
			font-family: 'Single Day', cursive;
		}
		
		/* 메인화면 */
		.pay-main{
			/* box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px; */
			border-radius: 100px;
			font-size: 25px;;
		}
		.pay-header{
			background-color: #f2e3ff;
			/* box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px; */
			box-shadow: rgba(95, 0, 128, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
			border-radius: 10px;
			padding: 1rem;
			width: 950px;
		}
		.pay-body{
			display: grid;
			grid-template-columns: 2fr 5fr;
			box-shadow: rgba(95, 0, 128, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
			border-radius: 10px;
			padding: 1rem;
			background-color: #f2f3ff;
		}
		.pay-body-text{
			/* background-color: blue; */
		}
		.pay-body-content{
			/* background-color: orange; */
		}
		.pay-body-updown{
		}
		.glyphicon.glyphicon-plus{
			/* background-color: red; */
			font-size: 2rem;
			box-shadow: rgba(95, 0, 128, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
			border-radius: 10px;
			margin: 1rem;
			padding: 1rem;
			width: 70px;
			background-color: white;
			color: #5F0080;
			border-color: #5F0080;
		}
		.glyphicon.glyphicon-minus{
			/* background-color: yellow; */
			font-size: 2rem;
			box-shadow: rgba(95, 0, 128, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
			border-radius: 10px;
			margin: 1rem;
			padding: 1rem;
			width: 70px;
			background-color: white;
			color: #5F0080;
			border-color: #5F0080;
		}
		.payProduct-member{
			/* background-color: purple; */
			font-size: 4rem;
		}
		.totalPrice{
			font-size: 4rem;
		}
		.submit {
			box-shadow: rgba(95, 0, 128, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
			border-radius: 10px;
			margin: 1rem;
			padding: 1rem;
			width: 100px;
			background-color: #5F0080;
			color: white;
			font-size: 2rem;
		}
		.cancle {
			border-color: #5F0080;
			box-shadow: rgba(95, 0, 128, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
			border-radius: 10px;
			margin: 1rem;
			padding: 1rem;
			width: 100px;
			background-color: white;
			color: #5F0080;
			font-size: 2rem;
		}
	</style>
		
	</head>

	<body class="single single-post">

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/toolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->

		<main role="main">
			<div id="intro-wrap">
			</div><!-- intro-wrap -->

			<div id="main" class="row">
				<div class="row-content buffer-left buffer-right buffer-bottom">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px; font-size: 3rem;">
						<li data-group="advertising">
							<a href="/club/getMeetingList">모임 일정</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList">모임 게시물</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList">모임원</a>
						</li>
						<li data-group="infographics">
							<a href="#">모임 채팅</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubNo }">결제</a>
						</li>
					</ul>
					
					
					
					
					
					
							
					<form name="addPayForm" method="post" action="/clubPost/addPay">
					
					
						<div class="pay-main">
							<div class="pay-header">
								<div>5000원당 결제해택<br>10명의 모임원을 추가 할 수 있다&nbsp;&nbsp;(하나의 모임당 최대 모임원수는 50명)<br>
								2개의 모임에 가입 할 수 있다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(한명의 회원당 최대 가입 할 수 있는 모임수는 10개)</div>
							</div>
							<br>
							<div class="pay-body">
								<div class="pay-body-text">
									<div>결제방법</div><br><br><br><br><br>
									<div>모임이름</div><br>
									<div>추가 모임원 수</div><br>
									<div>총 결제금액</div>
								</div>
								<div class="pay-body-content">
									<div>
										<div><input type="radio" name="payOption" pg="danal_tpay" pay_method="card" value="신용카드">&nbsp;&nbsp;신용카드</div>
										<div><input type="radio" name="payOption" pg="kakaopay" pay_method="card" value="카카오페이">&nbsp;&nbsp;&nbsp;&nbsp;카카오페이</div>
										<div><input type="radio" name="payOption" pg="kcp" pay_method="phone" value="휴대폰결제">&nbsp;&nbsp;휴대폰결제</div>
										<div><input type="radio" name="payOption" pg="tosspay" pay_method="card" value="토스페이">&nbsp;&nbsp;&nbsp;&nbsp;토스페이</div>
										<div><input type="radio" name="payOption" pg="kcp" pay_method="trans" value="실시간 계좌이체">&nbsp;&nbsp;&nbsp;&nbsp;실시간 계좌이체</div>
									</div>
									<br>
									
									<div><span>${ returnClub.clubTitle }</span>의 현재 모임원 수 <span>10</span>명</div>
									<div class="pay-body-updown">
										<span class="glyphicon glyphicon-minus"></span>
										<span class="payProduct-member">10</span>
										<span class="glyphicon glyphicon-plus"></span>명
									</div>
									<div>
										<span class="totalPrice">5000</span>원
									</div>
									<div>
										<div><input type="button" class="submit" value="결제하기">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="cancle" value="이전으로"></div>
									</div>
								</div>							
							</div>
						</div>
						
						
						
	
						<br><br><br>
						<input type="text" name="payProduct" value="">
						<input type="text" name="totalPrice" value="">
						<input type="text" name="merchant_uid" value="">
						<input type="text" name="updateClubMemberCount" value="0">
						<input type="text" name="updateClubCount" value="0">
						<input type="text" name="clubNo" value="${ pay.clubNo }">
						<input type="text" id="maxPay" value="${ pay.maxPay }">
						<input type="text" name="payNavigation" value="${ pay.payNavigation }">
					
					
					
					</form>
					
					
					
					
					
					
					
				</div><!-- row-content -->
			</div><!-- row -->
		</main><!-- main -->
		
		

		<footer role="contentinfo">
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
