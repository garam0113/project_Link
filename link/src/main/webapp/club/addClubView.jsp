<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
	
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">  
  <!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  
  <!-- addMeetingCss -->
  <link rel="stylesheet" href="/resources/css/addUser.css">
  
  
  	<!--  	jQuery UI toolTip 사용 JS -->
  <!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
  
  <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <!-- <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	
	
	
	<style>
	  body>div.container {
			border: 3px solid #D6CDB7;
			margin-top: 10px;
		}

		#btn_group button{
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
		color: #BD76FF;
    	border-color: #BD76FF;
    	background-color: #ffffff;
		}    
        
    </style>
    
<script type="text/javascript">


	function fncAddClub() {

		////////////////////////////////////////////////////
		//document.detailForm.action = '/addProduct.do';
		///////////////////////////////////////////////////

		$("form").submit();
	}


	$(function() {

		$("button.btn.btn-addClub").on("click", function() {
			//alert($("td.ct_btn01:contains('등록')").html());
			fncAddClub();
		});
	});

	// 	 function resetData() {
	// 		document.detailForm.reset();
	// 	} 

	$(function() {

		$("button.btn.btn-cancel").bind("click", function() {
			history.go(-1);
		});
	});
	
	function setThumbnail(event) {
		var fileInput = document.getElementById("clubImage");
		var file = fileInput.files[0];
		var reader = new FileReader();

		reader.onload = function(event) {
			$("#imga").attr("src", event.target.result);
		};
		
		console.log(file);
		reader.readAsDataURL(file);
		
	} 

	$(function() {
		$(".image").on("click", function() {
			$("#clubImage").click();		
		});
	});
	
	
	/* $.ajax({
			url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent('서울시 동대문구'),
			type: 'GET' ,
			headers: {'Authorization' : 'KakaoAK 6ee01fc9434961a580560a7920b95e95'} ,
			
			success:function(data) {
				console.log(data);
			},
			error : function(e) {
				console.log(e);
			}	
	}); */
	
	function getLocation() {
		if(navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(getAddressByCoords,redirectLocation, geo_options);
		} else {
			location.href = "/mbl/test/selectAddressList.do";
		}	
	}
	
	function getAddressByCoords(position) {
		var longitude = position.coords.longitude;
		var latitude = position.coords.latitude;
		console.log(longitude);
	    console.log(latitude);
	    //★★위도 경도 정보를 가지고 서버 사이드로 넘어가는 부분
		location.href = "/mbl/test/selectAddressList.do?longitude=" + longitude + "&latitude=" + latitude;
	}

	//에러났을 때
	function redirectLocation(error) {
		location.href = "/mbl/error/selectAddressList.do";
	}

	//타임아웃
	var geo_options = {
		maximumAge        : 5000, 
		timeout           : 3000
	};
	

</script>
</head>

<body>
	<form class="form-horizontal" method="post" action="/club/addClub" enctype="multipart/form-data">
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">모 임 등 록</h2>
					<p class="exTxt">새로운 모임을 등록해보세요...</p>
					<div class="join_form">
		
		<!-- <form class="form-horizontal" method="post" action="/club/addClub" enctype="multipart/form-data"> -->
		
			<div class="form-group">
				<label for="clubTitle" class="col-sm-offset-1 col-sm-3 control-label">모 임 제 목</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="clubTitle" name="clubTitle" placeholder="모임제목은 필수입니다" style="width:300px; border-color: #BD76FF;">
				</div>					
			</div>
			
			
		
			<div class="form-group">
				<label for="clubDetail" class="col-sm-offset-1 col-sm-3 control-label">모 임 설 명</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="clubDetail" name="clubDetail" placeholder="모임설명은 필수입니다. (최대 500자)" style="width:300px;
					border-color: #BD76FF;">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="clubCategory" class="col-sm-offset-1 col-sm-3 control-label" >모임카테고리</label>
				<div class="col-sm-4">
					<!-- <select class="form-control"> -->
					<select class="form-control" id="clubCategory" name="clubCategory" style="width:300px; border-color: #BD76FF;">
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
			</div>			
			
			<div class="form-group">
				<label for="clubArea" class="col-sm-offset-1 col-sm-3 control-label">활 동 영 역</label>
				<div class="col-sm-4">
<!-- 					<input type="text" class="form-control" id="clubArea" name="clubArea" style="width:300px;"> -->
					<select class="form-control" id="clubArea" name="clubArea" style="width:300px; border-color: #BD76FF;" >
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
				</div>		
			</div>			
			
			<div class="form-group">
				<label for="clubImage" class="col-sm-offset-1 col-sm-3 control-label">모임이미지</label>
				<div class="col-sm-4">
					<!-- <input type="file" name="file" class="file" id="clubImage" multiple="multiple"> -->
					<input type="file" name="file" class="file" id="clubImage" multiple="multiple" onchange="setThumbnail(event);" style="display: none;" class="form-file"/>
					<button id="im" type="button" class="image" style="border-style: hidden;"><img id="imga" src="/resources/image/uploadFiles/default.png" style="height: 300px; width: 300px;"/></button>
				</div>		
			</div>
			
			
			
			<div class="form-group" id="btn_group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-addClub">등 &nbsp;록</button>
					<button type="button" class="btn btn-cancel">취&nbsp;소</button>
		    </div>
			</div>
			</div>
		</div>
		</div>
		</div>	
			
		</form>	
		
		
</body>
</html>