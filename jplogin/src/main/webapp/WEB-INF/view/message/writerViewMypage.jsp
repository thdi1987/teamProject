<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub13.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 부트 스트랩 적용 위치 -->

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>쪽지</title>
</head>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#message_btn').click(function() {
							var msid = $('#msid').val();
							var mstitle = $('#mstitle').val();
							var mscontens = $('#mscontens').val();
							
								$.ajax({
										url : "${pageContext.request.contextPath}/message/writemessageMypage",
										type : "POST",
										data : {
											msid : msid,
											mstitle : mstitle,
											mscontens : mscontens
										},
										success : function(data) {									
												alert("등록되었습니다.");
												window.opener.location.reload();
												window.opener.self.close();
												self.close();
												
												
											
										},
										error : function() {
											alert("서버에러");
										}
									});
							});
						});
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body>
	<div class="container">
		<section id="container">
			<div class="Notice">
				<h1>쪽&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지</h1>
			</div>


			<form name="writeForm" method="post"
				action="${pageContext.request.contextPath}/message/writemessageMypage">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<tbody>

						<tr>
							<td>받는사람</td>
							<td colspan="3" style="border-left: 1px solid black;">
							<input type="text" id="msid" name="msid" title="받는 사람을 입력하세요" required="required" style="float: left; width: 600px; height: 50px; margin: 0 0 0 23px; border-radius: 1rem;"/></td>
						</tr>

						<tr>
							<td>제목</td>
							<td colspan="3" style="border-left: 1px solid black;">
							<input type="text" id="mstitle" name="mstitle" class="chk" title="제목을 입력하세요" required="required" style="float: left; width: 600px; height: 50px; margin: 0 0 0 23px; border-radius: 1rem;"/></td>
						</tr>

						<tr>
							<td>내용</td>
							<td colspan="3" style="border-left: 1px solid black;">
							<textarea id="mscontens" name="mscontens" class="chk"
									title="내용을 입력하세요" required="required"
									style="float: left; width: 600px; height: 600px; border-radius: 1rem; margin: 0 0 0 23px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div>
					 <input type="button" class="write" id="message_btn" name="message_btn" value = "전&nbsp;&nbsp;&nbsp;송" style="margin: 0 0 0 260px;">
				</div>
			</form>
		</section>
	</div>
</body>
</html>