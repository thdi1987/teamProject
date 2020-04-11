<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub14.css">
<!--  부트 스트랩 적용 위치 -->

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 부트 스트랩 적용 위치 -->


<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>분양자 신청</title>
</head>
<body>

   <div id="Trim">
	 <div class="Trimer">
	 <h1 style="margin: 2rem 0 0 6rem;">
	  <b> 분양자 신청</b>
	</h1>
	<section id="container">
	<form name="writeForm" method="post" action="${pageContext.request.contextPath}/Buyer/write" >
            <ul class="join_box">
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관</li>
                        <li class="checkBtn">
                            <input type="checkbox" required="required"  value="1" name="agree" id="agree" style="margin:-18px 0 0 0"> 
                        </li>
                    </ul>
                    <textarea>허위정보를 이용하여 분양회원으로 변경하시거나, 분양게시판에 허위사실을 기재하여 피해가 발생할 시 민-형사상 처벌을 받을 수 있습니다.
                    </textarea>              
            </ul>
            <table class="table table-hover"
						style="width: 800px; float: right; margin: 0 0 95px 0;">
					<tbody>
						<tr>
							<td>계좌번호</td>
							<td colspan="2" style="border-left:1px solid black;"><select id="BCODE" name="BCODE" required="required"  style="margin: 0 0 0 1rem;">
									<option value="B1">우리은행</option>
									<option value="B2">국민은행</option>
									<option value="B3">신한은행</option>
									<option value="B4">하나은행</option>
									<option value="B5">케이뱅크</option>
									<option value="B6">카카오뱅크</option>
									<option value="B7">KDB산업은행</option>
									<option value="B8">IBK기업은행</option>
									<option value="B9">회원수협</option>
									<option value="B10">농-축협</option>
									<option value="B11">산림조합</option>
									<option value="B12">새마을금고</option>
									<option value="B13">신용협동조합</option>
									<option value="B14">대구은행</option>
									<option value="B15">부산은행</option>
									<option value="B16">경남은행</option>
									<option value="B17">광주은행</option>
									<option value="B18">전북은행</option>
									<option value="B19">제주은행</option>
							</select> <input id="BBANK" name="BBANK" type="text" required="required"  style="width: 181px;"></td>
						</tr>
						<tr>
							<td>동물등록번호</td>
							<td style=" border-left:1px solid black;"><input id="BPET" name="BPET" type="text"  required="required"  style="margin: 0 0 0 4rem;"><input type="button" id="regChk" value="동물등록번호 확인"></td>
							<td colspan=3 id="regCheck"></td>
						</tr>
					</tbody>
					</table>
            <div class="footBtwrap clearfix">
                <input class="fpmgBt2" type="button" id="buyerUp" name="buyerUp" style="margin: 0 0 0 25rem; width:30rem; height:7rem; border-radius: 1rem; " value = "신청">
            </div>
        </form>
        </section>
      </div>
      </div>
</body>
<script type="text/javascript">
$(document).ready(function(e){	
	
	var reg = false;
	var agree=$("#agree").val();
	
	$("#buyerUp").click(function(){
		if($("input:checkbox[id='agree']").is(":checked")){
			
		}
		else {
			alert("이용약관을 체크해주세요");
			$("#agree").focus();
			return;
		}
		
		 if($("#BBANK").val() == ''){					
			alert("계좌번호를 입력해주세요");
			$("#BBANK").focus();
			return;
		} 
		 else if($("#BPET").val() == ''){
			alert("동물등록번호 입력해주세요.");
			$("#BPET").focus();
			return;
		}
		
		 else if(!reg){
			alert("동물등록번호를 확인해주세요.");
			return;
		}
		
			
	
		var BCODE = $('#BCODE').val();	
		var BBANK = $('#BBANK').val();	
		var BPET = $('#BPET').val();	
			$.ajax({
					url : "${pageContext.request.contextPath}/Buyer/write",
					type : "POST",
					data : {
						BCODE : BCODE,
						BBANK : BBANK,
						BPET : BPET
					},
					success : function(data) {	
						
							alert("신청이 완료되었습니다.");
							window.opener.location.reload();
							self.close();
							
													
						
					},
					error : function() {
						alert("서버에러");
					}
				});
		});
	
	$('#regChk').click(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/member/buyerCheck",
			type: "POST",
			data:{
				"BPET":$('#BPET').val(),				
			},
			success: function(data){
				if(data == 1 && $.trim($('#BPET').val()) != ''){
					reg=true;
					$('#BPET').attr("readonly",true);
					var html="<tr><td colspan='3' style='color: green'>확인되었습니다.</td></tr>";
					$('#regCheck').empty();
					$('#regCheck').append(html);
					
				}else{
					var html="<tr><td colspan='3' style='color: red'>등록된 동물번호가 없습니다.</td></tr>";
					$('#regCheck').empty();
					$('#regCheck').append(html);
				}
			},
			error: function(){
				alert("서버에러");
			}
		});
		

	});
});	
	
</script>
</html>