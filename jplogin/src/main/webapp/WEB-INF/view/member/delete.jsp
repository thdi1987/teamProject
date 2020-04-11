<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub.css">
<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>


		<div id="ee">
			<div class="eeI">
				<h1>회원삭제</h1>
				<hr>
				<form id="delete" name="delete"
					action="${pageContext.request.contextPath}/member/delete"
					method="post">
					<table class="Form">
						<tbody>
							<tr>
								<th class="esss">아이디</th>
							</tr>
							<tr>
								<td class="essss"><input type="text" id="MID" name="MID" size="40" style="height:30px;"></td>
							</tr>
							<tr>
								<td class="essss"><input type="button" id="deletebtn" name="deletebtn"
									value="회원삭제"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>		
	
</body>
<script type="text/javascript">	
	
	$(document)
	.ready(
			function() {					
				
	$('#deletebtn').click(function() {
		var MID = $('#MID').val();			
			$.ajax({
					url : "${pageContext.request.contextPath}/member/delete",
					type : "POST",
					data : {
						MID : MID
						
					},
					success : function(data) {									
							alert("회원이 삭제되었습니다.");
							window.opener.location.reload();
							self.close();
						
					},
					error : function() {
						alert("서버에러");
					}
				});
		});
	});
</script>

</html>