<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
	


</style>

<title>ó��</title>

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
			if(sel=="�弳"){
				
				punish=7;
				today2.setDate(today2.getDate()+punish);
				var year=today2.getFullYear();
				var mon=today2.getMonth()+1;
				var day=today2.getDate();
				$("#process_check").html("<�Ⱓ>"+"<h4 style='color:purple; '>"+today+"~"+year+"-"+mon+"-"+day+"</h4>");
			}
			if(sel=="���"){
				$("#process_check").html("������ġ");
			}
			if(sel=="����"){
				
				punish=3;
				today2.setDate(today2.getDate()+punish);
				var year=today2.getFullYear();
				var mon=today2.getMonth()+1;
				var day=today2.getDate();
				$("#process_check").html("<�Ⱓ>"+"<h4 style='color:purple;'>"+today+"~"+year+"-"+mon+"-"+day+"</h4>");
			}
			if(sel=="�ҹ���ù�"){
				
				punish=3;
				today2.setDate(today2.getDate()+punish);
				var year=today2.getFullYear();
				var mon=today2.getMonth()+1;
				var day=today2.getDate();
				$("#process_check").html("<�Ⱓ>"+"<h4 style='color:purple;'>"+today+"~"+year+"-"+mon+"-"+day+"</h4>");
			}
			
		});
		
		
		$("#process").click(function(){
			var RNO=$("#RNO").val();
			var RREPORTEDID=$("#RREPORTEDID",opener.document ).val();
			 var REMAIL=$("#REMAIL",opener.document ).val();
			var RID=$("#RID",opener.document ).val();

			var block= $("#Punishment").val();
			
			 if(block=="���"){
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
						alert("�Ű�ó���Ǿ����ϴ�.");
						self.close();
						//dele();
												
					},
					error : function() {
						alert("��������");
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
							alert("������ ó���Ǿ����ϴ�.");
							self.close();							
						},
						error : function(){
							alert("��������");
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
	
	<h2 style="padding-top:75px;">¡�� ��ġ</h2>
	<select  id="Punishment" name="">
	<option></option>
	<option value="�弳">�弳(7��)</option>
	<option value="���">���(����)</option>
	<option value="����">����(3��)</option>
	<option value="�ҹ���ù�">�ҹ���ù�(3��)</option>
	</select>
	</div>
	<div id="process_check" style="width=150px; padding-left:30px; padding-top:20px; text-align:center;">
	
	</div>
	<div style="text-align:center; padding-top:10px;"><input type="button" id="process" value="Ȯ��" size="3"></div>
</body>
</html>