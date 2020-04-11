<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
	


</style>

<title>처리</title>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		var today=new Date();
		var month=today.getMonth()+1;
		today=today.getFullYear()+"-"+month+"-"+today.getDate();
		var punish=0;

		
		$("#Punishment").change(function(){
			var today2=new Date();
			var year=today2.getFullYear();
			var mon=today2.getMonth()+1;
			
			var sel=$("#Punishment").val();
			if(sel=="욕설"){
				
				punish=7;
				today2.setDate(today2.getDate()+punish);
				var year=today2.getFullYear();
				var mon=today2.getMonth()+1;
				var day=today2.getDate();
				$("#process_check").html("<기간>"+"<h4 style='color:purple; '>"+today+"~"+year+"-"+mon+"-"+day+"</h4>");
			}
			if(sel=="사기"){
				$("#process_check").html("차단조치");
			}
			if(sel=="분쟁"){
				
				punish=3;
				today2.setDate(today2.getDate()+punish);
				var year=today2.getFullYear();
				var mon=today2.getMonth()+1;
				var day=today2.getDate();
				$("#process_check").html("<기간>"+"<h4 style='color:purple;'>"+today+"~"+year+"-"+mon+"-"+day+"</h4>");
			}
			if(sel=="불법계시물"){
				
				punish=3;
				today2.setDate(today2.getDate()+punish);
				var year=today2.getFullYear();
				var mon=today2.getMonth()+1;
				var day=today2.getDate();
				$("#process_check").html("<기간>"+"<h4 style='color:purple;'>"+today+"~"+year+"-"+mon+"-"+day+"</h4>");
			}
			
		});
		
		
		$("#process").click(function(){
			var RNO=$("#RNO").val();
			var RREPORTEDID=$("#RREPORTEDID",opener.document ).val();
			 var REMAIL=$("#REMAIL",opener.document ).val();
			var RID=$("#RID",opener.document ).val();

			var block= $("#Punishment").val();
			
			 if(block=="사기"){
				 punish=99;
			 }
			 else{
				 punish;
			 }
			alert(RNO+""+RREPORTEDID+""+punish);
			$.ajax({
					url : "${pageContext.request.contextPath}/report/process",
					type : "POST",
					data : {
						RNO : RNO,
						RREPORTEDID : RREPORTEDID,
						punish : punish,
						REMAIL : REMAIL,
						RID : RID
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
			
				function dele(){
					$.ajax({
						url : "${pageContext.request.contextPath}/report/delete",
						type : "POST",
						data :{
							RNO : RNO						
						},
						success : function(){
							alert("내역이 처리되었습니다.");
							self.close();							
						},
						error : function(){
							alert("서버에러");
						}
						
						
						
					});
					
					
				}
			
			
			
			});	
		});

</script>
</head>
<body>
<input type="hidden" value="${RNO}" id="RNO">
	<div class="" style="width=150px; text-align:center;">
	
	<h2 style="padding-top:75px;">징계 조치</h2>
	<select  id="Punishment" name="">
	<option></option>
	<option value="욕설">욕설(7일)</option>
	<option value="사기">사기(차단)</option>
	<option value="분쟁">분쟁(3일)</option>
	<option value="불법계시물">불법계시물(3일)</option>
	</select>
	</div>
	<div id="process_check" style="width=150px; padding-left:30px; padding-top:20px; text-align:center;">
	
	</div>
	<div style="text-align:center; padding-top:10px;"><input type="button" id="process" value="확인" size="3"></div>
</body>
</html>