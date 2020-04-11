<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
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
<title>신고</title>
</head>

<body>
	<div class="container">
		<section id="container">
			<div class="Notice">
				<h1>신&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고</h1>
			</div>				
																	
				<input type="hidden" id="RID" name="RID" value="${authInfo.id}">
				<input type="hidden" id="REMAIL" name="REMAIL" value="${authInfo.email}">
			
				
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<tbody>

						<tr>
							<td>신고</td>
							<td colspan="3" style="border-left: 1px solid black;">
							<select id="RDECLAR" name="RDECLAR" title="받는 사람을 입력하세요" required="required" style="float: left; width: 600px; height: 50px; margin: 0 0 0 23px; border-radius: 1rem;">
								<option value="욕설">욕설</option>
								<option value="사기">사기</option>
								<option value="분쟁">분쟁</option>
								<option value="불법계시물">불법계시물</option>
							</select>
							</td>
						</tr>

						<tr>
							<td>제목</td>
							<td colspan="3" style="border-left: 1px solid black;">
							<input type="text" id="RTITLE" name="RTITLE" class="chk" title="제목을 입력하세요" required="required" style="float: left; width: 600px; height: 50px; margin: 0 0 0 23px; border-radius: 1rem;"/></td>
						</tr>

						<tr>
							<td>내용</td>
							<td colspan="3" style="border-left: 1px solid black;">
							<textarea id="REPORT" name="RREPORT" class="chk"
									title="내용을 입력하세요" required="required"
									style="float: left; width: 600px; height: 600px; border-radius: 1rem; margin: 0 0 0 23px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div>
					<input class="write" id="report_btn" type="button" value="전송" style="margin: 0 0 0 260px;"></button>
				</div>
			
		</section>
	</div>
</body>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#report_btn").click(function(){
							var RPID=$("#MPNO",opener.document ).val();
							var RREPORTEDID=$("#MPID",opener.document ).val();						
							var RID =$("#RID").val();						
							//var RREPORTEDID =$("#RREPORTEDID").val();
							//var REMAIL=$("#REMAIL",opener.document ).val();				
							
								$.ajax({								
									url : "${pageContext.request.contextPath}/report/insert",
									type : "POST",
									data : {									
											RID : RID,										
											RREPORTEDID : RREPORTEDID,
											RDECLAR :$("#RDECLAR").val(),
											REMAIL : REMAIL,
											RPID : RPID,
											RTITLE : $("#RTITLE").val(),
											RREPORT : $("#REPORT").val(),
											MSID : $("#msid").val(),
											MSTITLE : $("#mscontens").val(),
											REMAIL : $("#REMAIL").val()
										},
										success : function(data) {					
											alert("신고처리되었습니다.");
											self.close();
											//dele();
																	
										},
										error : function() {
											alert("서버에러");
										}
									});	
								
								
								
								
								
								
								
								
						
							});
				
					})

</script>
</html>






