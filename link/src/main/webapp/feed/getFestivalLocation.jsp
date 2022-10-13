<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="EUC-KR">
	
	<title></title>
	
	<link rel="stylesheet" href="/resources/css/layers.min.css" media="screen">
	<link rel="stylesheet" href="/resources/css/font-awesome.min.css" media="screen">
	<link rel="stylesheet" href="/resources/css/style.css" media="screen">
	<link rel="stylesheet" href="/resources/css/mapStyle.css"> 
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	
	<script src="/resources/javascript/map/initMap.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	
		$(function(){
			
			$(".three:contains('음식점')").bind("click", function() {
				
				alert("음식점");
				
				showCafe();
				
			})
			
			$(".three:contains('주유소')").bind("click", function() {
				
				alert("주유소");
				
			})
			
			$(".three:contains('벼엉원')").bind("click", function() {
				
				alert("벼엉원");
				
			})
			
			$(".three:contains('놀이터')").bind("click", function() {
				
				alert("놀이터");
				
			})
			
		})
	
	</script>
	
</head>

	<style>
	
		#pac-input {
			max-width : 100%;
			width : 100%;
			height : 50px;
			background-color: rgba(255,255,255,0.15);
			max-width: 100%;
		    width: 100%;
		}
		
	</style>

<body>

	<jsp:include page="/toolbar.jsp" />

		<main role="main">
		
			<div id="intro-wrap" data-height="22.222">
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>The City of Dreams</h2>
							<p>If you’re any good at all, you know you can be better.</p>
						</div><!-- caption -->					
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
	
			<div id="main">
	
				<section class="row section">
					<div class="row-content buffer even clear-after">
					
						<div class="column twelve" align="center">
						</div>
										
						<div class="column eight">
							
							 <!-- [ 영국 런던을 중심으로 구글지도 만들기 ] -->
							<div id="map"></div>
							
							<script
								src="https://maps.googleapis.com/maps/api/js?
								key=AIzaSyDtYM84InYYv2cSOImZRZz9mIqZFEpfL9A&callback=initAutocomplete&libraries=places&v=weekly" 
								defer>
							</script>
								
							
						</div>
						
						<div class="column four last">
							<input class="buffer controls" type="text" id="pac-input" name="place" placeholder="search box">
						
							<section class="buffer row section">
								<div class="column twelve" align="center">
									<div class="column three" id="food">
										음식점
									</div>
									<div class="column three">주유소</div>
									<div class="column three">벼엉원</div>
									<div class="column three last">놀이터</div>
								</div>
							</section>
						</div>
						
					</div>
				</section>
				
			</div>
			
		</main>
	
</body>
</html>