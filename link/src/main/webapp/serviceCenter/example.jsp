<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <!DOCTYPE html>   
 <html lang="ko">
 <head>   
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
* {
    margin: 0;
    padding: 0;
}

*:focus {
    outline: none;
}

html,
body {
    width: 100%;
    height: 100%;
}

body {
   background: white;
    display: flex;
    align-items: center;
    justify-content: center;
}
.phone {
    width: 360px;
    height: 720px;
    padding: 10px;
    background: #000000;
    border-radius: 30px;
    cursor: pointer;
    font-size: 14px;
    user-select: none;
}
.screen {
    background: #343434;
    width: 100%;
    height: 100%;
    border-radius: 20px;
    overflow: hidden;
}
.header-bar {
    background: #1f1f1f;
    width: calc(100% - 30px);
    height: 20px;
    padding: 0 15px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    color: white;
}
*::-webkit-scrollbar {
    width: 5px;
}
/* Track */
*::-webkit-scrollbar-track {
    background: white;
}
/* Handle */
*::-webkit-scrollbar-thumb {
    background: #888;
}
/* Handle on hover */
*::-webkit-scrollbar-thumb:hover {
    background: #555;
}
.footer-bar {
    background: #1f1f1f;
    width: 100%;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: space-evenly;
}
.screen-body {
    width: 100%;
    height: calc(100% - 50px);
     display: flex;
}
.phone-button {
    width: 100px;
    height: 20px;
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center center;
    filter: invert(100%);
    border-radius: 10px;
}
.phone-button:hover {
    background-color: rgb(255, 255, 255);
}
.screen-body > div {
    width: 100%;
    height: 100%;
    background-position: center center;
    background-repeat: no-repeat;
    background-size: cover;
}
</style>

        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
        <title>Phone</title>
        <link rel="stylesheet" href="css/index.css" />
    </head>
    <body>
    <div class="phone">
    	<div class="screen">
    	 <div class="header-bar">
            <div class="header-bar-left">스마트폰</div>
            <div class="header-bar-right">100% 🔋</div>
        </div>
        <div class="screen-body">
        	   <div class="lock-screen" style="background-image: url(/resources/image/uploadFiles/552653_472105_2937.jpg)">
            <div style="color: gray; text-align: center; margin-top: 600px">홈 버튼을 눌러서 잠금 해제</div>
        </div>
        </div>
        <div class="footer-bar">
        	<div class="footer-bar">
        <div
             class="phone-button"
             style="background-image: url(https://fonts.gstatic.com/s/i/materialiconsoutlined/menu/v13/24px.svg)"
             ></div>
        <div
             class="phone-button"
             style="background-image: url(https://fonts.gstatic.com/s/i/materialiconsoutlined/crop_square/v12/24px.svg)"
             ></div>
        <div
             class="phone-button"
             style="background-image: url(https://fonts.gstatic.com/s/i/materialiconsoutlined/arrow_back_ios/v14/24px.svg)"
             ></div>
    </div>
        </div>
    	</div>
   </div> 
   <jsp:include page="/user/login.jsp" />
   </body>
</html>