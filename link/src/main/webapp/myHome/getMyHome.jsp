<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className) 
	$(".glyphicon glyphicon-user").on("click" , function() {
		
		self.location = "/myHome/updateProfile?userId="${user.userId}
	});
	
	
 });


$(function(){


    $(".btn btn-success btn-sm").on("click" , function() {
  
          var userId = $(".btn btn-success btn-sm").html();
          //console.log(userId);
          alert("팔로우");
          $(document).ready(function(){
       		$.ajax({
       			type: 'GET',   //get방식으로 명시
       			url : '/myHomeRest/json/addFollow/'+userId,  //이동할 jsp 파일 주소
       			dataType:'json',   //문자형식으로 받기
       			success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
       	            //function(data)를 쓰게 되면 전달받은 데이터가 data안에 담아서 들어오게 된다. 
       				//alert(data); 
       			    console.log("userId : "+data);
       			},
       			error:function(data){   //데이터 주고받기가 실패했을 경우 실행할 결과
       				//alert('실패');
       			}
       		})
       	});
             
    });
});			

</script>

<style>
#calendar{
    margin-left: 100px;
    margin-top: 50px;
	width: 700px;
	display: inline-block;
	justify-content: center;
	
}
.container {
  
  float: left;
  margin-left:300px;
  
}

/* Profile container */
.profile {
  margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
  padding: 20px 0 10px 0;
 
}

.profile-userpic img {
  float: left;
  margin: 0 auto;
  width: 50%;
  height: 40%;
  -webkit-border-radius: 50% !important;
  -moz-border-radius: 50% !important;
  border-radius: 50% !important;
}

.profile-usertitle {
  text-align: center;
  margin-top: 20px;
  margin-right:200px;
}

.profile-usertitle-name {
  color: #5b9bd1;
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 7px;

}

.profile-usertitle-job {
  text-transform: uppercase;
  color: #5b9bd1;
  font-size: 12px;
  font-weight: 600;
  margin-bottom: 15px;
}

.profile-userbuttons {
  float:left;
  text-align: center;
  margin-top: 10px;
  margin-left: 10px;
}

.profile-userbuttons .btn {
  text-transform: uppercase;
  font-size: 11px;
  font-weight: 600;
  padding: 6px 15px;
  margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
  margin-right: 0px;
}
    
.profile-usermenu {
  margin-top: 30px;
}

.profile-usermenu ul li {
  border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
  border-bottom: none;
}

.profile-usermenu ul li a {
  color: #5b9bd1;
  font-size: 14px;
  font-weight: 400;
}

.profile-usermenu ul li a i {
  margin-right: 8px;
  font-size: 14px;
}

.profile-usermenu ul li a:hover {
  background-color: #fafcfd;
  color: #5b9bd1;
}

.profile-usermenu ul li.active {
  border-bottom: none;
}

.profile-usermenu ul li.active a {
  color: #5b9bd1;
 
  margin-left: -2px;
}

/* Profile Content */
.profile-content {
  padding: 20px;
  
  min-height: 460px;
}
.comment-section{
    margin-left: 100px;
    margin-top: 50px;
	width: 700px;
	display: inline-block;
	justify-content: center;

}
.single-comment{
   padding-left : 0;
}
</style>
</head>
	

	<body class="blog masonry-style">

		<jsp:include page="/toolbar.jsp" />

		<main role="main">
			<div id="intro-wrap" data-height="27.778">
				<div id="intro" class="preload darken">
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>MyBlog</h2>
							<p>Write down your daily life</p>
						</div><!-- caption -->								
					</div><!-- intro -->
				</div><!-- intro -->				
			</div><!-- intro-wrap -->

			<div id="main" class="row">
			<div id="calendar" >
			
			<jsp:include page="/myHome/calendar.jsp" />
			</div>
			
<div class="container" >
    <div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR USERPIC -->
				<div class="profile-userpic">
					<img src="https://m.citybreeze.co.kr/file_data/ctbreeze/2022/04/19/ac007ff0b38eec2ee299876fbc2cbca8.jpg" class="img-responsive" alt="">
				</div>
				<br>
				<br>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						${user.nickName }
					</div>
					<div class="profile-usertitle-job">
						${user.profileWriting }
					</div>
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
				<c:if test="${ empty user }">
					<button type="button" class="btn btn-success btn-sm">Follow</button>
					<button type="button" class="btn btn-danger btn-sm">Message</button>
			    </c:if>
			    
					<br>
					<br>
					
				</div>
				<!-- END SIDEBAR BUTTONS -->
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav">
						<li class="active">
							<a href="/club/getClubList">
							<i class="glyphicon glyphicon-home"></i>
							내 모임 </a>
						</li>
						<li>
							<a href="/myHome/updateProfile?userId=${user.userId }">
							<i class="glyphicon glyphicon-user"></i>
							프로필 수정 </a>
						</li>
						<li>
							<a href="#" target="_blank">
							<i class="glyphicon glyphicon-ok"></i>
							Tasks </a>
						</li>
						<li>
							<a href="#">
							<i class="glyphicon glyphicon-flag"></i>
							Help </a>
						</li>
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
		<div class="col-md-9">
            <div class="profile-content">
			   ${user.profileWriting}
            </div>
		</div>
	</div>
</div>
<div class="comment-section">
						<h3 id="comments">19 Comments</h3>
						<ul class="comment-list plain">
							<li class="comment">
								<div class="single-comment">
									<div class="comment-author">
										<img src="http://placehold.it/60x60" class="avatar" alt="">
										<cite><a href="#">${user.nickName }</a></cite>
										<span class="says">says:</span>
									</div><!-- comment-author -->
									<div class="comment-meta">
										<time datetime="2013-03-23 19:58">March 23, 2013 at 7:58 pm</time> / <a href="#" class="reply">Reply</a>
									</div><!-- comment-meta -->
									<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
								</div><!-- single-comment -->
								<ul class="children plain">
									<li class="comment">
										<div class="single-comment">
											<div class="comment-author">
												<img src="http://placehold.it/60x60" class="avatar" alt="">
												<cite><a href="#">Mark Robben</a></cite>
												<span class="says">says:</span>
											</div><!-- comment-author -->
											<div class="comment-meta">
												<time datetime="2013-03-23 19:58">March 23, 2013 at 7:58 pm</time> / <a href="#" class="reply">Reply</a>
											</div><!-- comment-meta -->
											<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
										</div><!-- single-comment -->
										<ul class="children plain">
											<li class="comment">
												<div class="single-comment">
													<div class="comment-author">
														<img src="http://placehold.it/60x60" class="avatar" alt="">
														<cite><a href="#">Mark Robben</a></cite>
														<span class="says">says:</span>
													</div><!-- comment-author -->
													<div class="comment-meta">
														<time datetime="2013-03-23 19:58">March 23, 2013 at 7:58 pm</time> / <a href="#" class="reply">Reply</a>
													</div><!-- comment-meta -->
													<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
												</div><!-- single-comment -->
											</li>
										</ul>										
									</li>
								</ul>								
							</li>
							<li class="comment">
								<div class="single-comment">
									<div class="comment-author">
										<img src="http://placehold.it/60x60" class="avatar" alt="">
										<cite><a href="#">Mark Robben</a></cite>
										<span class="says">says:</span>
									</div><!-- comment-author -->
									<div class="comment-meta">
										<time datetime="2013-03-23 19:58">March 23, 2013 at 7:58 pm</time> / <a href="#" class="reply">Reply</a>
									</div><!-- comment-meta -->
									<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
								</div><!-- single-comment -->
							</li>	
							<li class="comment">
								<div class="single-comment">
									<div class="comment-author">
										<img src="http://placehold.it/60x60" class="avatar" alt="">
										<cite><a href="#">Mark Robben</a></cite>
										<span class="says">says:</span>
									</div><!-- comment-author -->
									<div class="comment-meta">
										<time datetime="2013-03-23 19:58">March 23, 2013 at 7:58 pm</time> / <a href="#" class="reply">Reply</a>
									</div><!-- comment-meta -->
									<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
								</div><!-- single-comment -->
							</li>													
						</ul>
						</div>
				

				

		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>		
		<script src="js/plugins.js"></script>
		<script src="js/beetle.js"></script>

	</body>

</html>