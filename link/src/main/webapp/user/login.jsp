<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://accounts.google.com/gsi/client" async defer></script>
	
	<script type="text/javascript" src="/resources/javascript/kakaoLogin.js"></script>
	    
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
        	border: 0;
        	outline: 0;
            margin-top: 10px;
        }
        
        .button{
      		border: 0;
        	outline: 0;
        }
        
    </style>
    
    <script type="text/javascript">
  	 $(function() {
			$("button.btn.btn-primary").on("click", function() {
				login(); //�α���
			});
			
			$("a.btn.btn-primary.btn").on("click", function() {
				self.location = "/user/addUser"	//ȸ������
			});
			
			$(".ID").on("click", function() {
				var child;
				child = window.open("/user/getUserId", "_blank", "width = 800, height = 500");
			});
			
			$(".getPassword").on("click", function() {
				var child;
				child = window.open("/user/getPassword", "_blank", "width = 800, height = 500");
			});
			
		});
    
  	 function login() {
		 
  		 //const date = new Date();
  		 var id = $("#userId").val();
  		 var pw = $("#password").val();
  		 
  		 console.log("date : "+Date.now());
  		 
  		 if(id == null || id.length < 1){
  			 swal.fire("���̵� �Է����ּ���.");
  			 return;
  		 }
  		 
  		 if(pw == null || pw.length < 1){
  			 swal.fire("��й�ȣ�� �Է����ּ���.");
  			 return;
  		 }
  		 
  		 $.ajax("/userRest/json/getUser", {
  			 
  			 type : "POST",
  			 data : JSON.stringify({
  				 userId : id
  			 }),
  			 dataType : "json",
  			 contentType : "application/json",
  			 henders : {
  				 "Accept" : "applicattion/json"
  			 },
  			 success : function(Data, status) {
				
  				 console.log(Data.stopEndDate);
  				 
  				 if(Data.userId == ""){
  					 swal.fire("�������� �ʴ� ���̵��Դϴ�.");
  					 return;
  				 }else if(Data.userId != "" && pw != Data.password){
  					 swal.fire("��й�ȣ�� Ʋ���ϴ�.");
  					 return;
  				 }else if(Data.penaltyType == 2){
  					 swal.fire("ȸ���� �������� ����ڷ� �α����� ���ѵ˴ϴ�.");
  					 return;
  				 }else if(Data.penaltyType == 1 && Date.now() < Data.stopEndDate){
  					 swal.fire("ȸ���� ��������ڷ� ["+Data.stopStartDateString+" ~ "+Data.stopEndDateString+"���� �α����� ���ѵ˴ϴ�.");
  					 return;
  				 }
  				 else if(Data.userID != "" && pw == Data.password){
  					 
  					$("form").attr("method", "POST").attr("action", "/user/login").submit();
  				 }
			}
  		 });
  		 
	}
  	 
    </script>
</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/main.jsp">Link</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-6">
					<img src="/resources/image/logo-spring.png" class="img-rounded" width="100%" />
			</div>
	   	 	
	 	 	<div class="col-md-6">
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">�� &nbsp;&nbsp;�� &nbsp;&nbsp;��</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">�� �� ��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">�� �� �� ��</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="�н�����" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <a class="ID" >IDã��</a>&nbsp;/ 
					      <a class="getPassword">��й�ȣã��</a>
					    </div>
					  </div>

					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary"  >�� &nbsp;�� &nbsp;��</button>
					      <a class="btn btn-primary btn" href="#" role="button">ȸ &nbsp;�� &nbsp;�� &nbsp;��</a>
					    </div>
					  </div>

					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center"> 
					       <button class="button" type="button" onclick="kakaoLogin();"><img src="/resources/image/ko/kakao_login_medium_narrow.png" alt="īī������ �α���"/></button>
					       <input type="hidden" class="kakao" name="snsUserId" id="snsUserId">
					       <input type="hidden" class="snsType" name="addType" id="addType" value=>
					    </div>
					  </div>

					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					    <div id="naver_id_login">
						   <a id="naverIdLogin_loginButton" href="#">
							<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1" height="50"></a>
							</div>
							<input class="naver" type="hidden" id="snsUserId" name="snsUserId">
							<input class="naverType"type="hidden" id="addType" name="addType">
					    </div>
					  </div> 
					  <script type="text/javascript">
					 
					  var naver_id_login = new naver_id_login("Ml9RKhaCexgFbiAJLp0c", "http://192.168.0.183:8080/user/login.jsp");
					  	var state = naver_id_login.getUniqState();
					  	naver_id_login.setButton("green", 3, 50);
					  	naver_id_login.setDomain("http://192.168.0.183:8080/");
					  	naver_id_login.setState(state);
					  	naver_id_login.init_naver_id_login();
					  	console.log(naver_id_login);
				  		
					  	naver_id_login.get_naver_userprofile("naverSignInCallback()");
					  	
					  	function naverSignInCallback() {

						  	   console.log(naver_id_login.getProfileData('email'))
						  	   var snsId = naver_id_login.getProfileData('email');
						  	   console.log(snsId);
						  		
						  	   $(".naver").val(snsId);
						  	   $(".naverType").val(2);
						  		console.log($(".naverType").val());
						  		console.log($(".naver").val());  
						  	   
						  	   $("form").attr("method","POST").attr("action","/user/snsLogin").submit();
						  	  }
					  </script>
					</form>
			   	 </div>
				 
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>
</html>