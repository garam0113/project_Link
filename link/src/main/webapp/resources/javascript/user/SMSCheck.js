$(function smsCheck() {
	
	$("#sendPhoneNumber").on("click", function() {
		let phoneNo = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
		swal.fire("인증번호 발송 완료!");
		
		$.ajax({
			type: "GET",
			url: "/userRest/json/sendSMS",
			data: {
				"phoneNo" : phoneNo
			},
			
			success: function(res) {
				
				$("#checkBtn").click(function()	{
					if($.trim(res) == $("#inputCertifiedNumber").val()){
						Swal.fire("인증성공!", 
								"휴대폰인증이 정상적으로 완료되었습니다.",
								"success"
								)
								$("#checkNo").val(1);
					}else{
						Swal.fire({
							icon: "error",
							title: "인증오류",
							text: "인증번호가 올바르지 않습니다."
						})
					}
				})
			}
		})
	});
});