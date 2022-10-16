$(function() {
		$("#categryClick")
				.on(
						"click",
						function() {
							var category = $("#categorySelcet").val();

							console.log("선택한 값 : " + category);

							if (category != "선택"
									&& $("#ca").children().length < 3) {
								$("#categoryView1")
										.html(
												$("#ca")
														.append(
																"<div>"
																		+ category
				 														+ "  "
																		+ "<button class='cate''>삭제</button></div>"));

							}
							var category1 = $($("#ca").children()[0]).text()
									.replace("삭제", "").trim();
							var category2 = $($("#ca").children()[1]).text()
									.replace("삭제", "").trim();
							var category3 = $($("#ca").children()[2]).text()
									.replace("삭제", "").trim();

							$("#category1").val(category1);
							$("#category2").val(category2);
							$("#category3").val(category3);

							console.log($("#ca").children().length);

							console.log(category1);
							console.log(category2);
							console.log(category3);

							console.log("서버로 보낼 값 : " + $("#category1").val());
							console.log("서버로 보낼 값 : " + $("#category2").val());
							console.log("서버로 보낼 값 : " + $("#category3").val());

							if ($("#ca").children().length == 3) {
								swal.fire("최대3개까지 입니다.");
								return;
							}
						});

	});

	$(function() {

		$(document).on(
				"click",
				".cate",
				function() {

					console.log($(this).parent());

					$(this).parent().remove();

					var category1 = $($("#ca").children()[0]).text().replace(
							"삭제", "").trim();
					var category2 = $($("#ca").children()[1]).text().replace(
							"삭제", "").trim();
					var category3 = $($("#ca").children()[2]).text().replace(
							"삭제", "").trim();

					$("#category1").val(category1);
					$("#category2").val(category2);
					$("#category3").val(category3);

					console.log("서버로 보낼 값 : " + $("#category1").val());
					console.log("서버로 보낼 값 : " + $("#category2").val());
					console.log("서버로 보낼 값 : " + $("#category3").val());
				})
	})