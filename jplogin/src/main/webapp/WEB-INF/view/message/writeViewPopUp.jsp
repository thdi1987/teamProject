<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>쪽지</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${pageContext.request.contextPath}/message/writemessagePopUp");
				formObj.attr("method", "post");
				formObj.submit();
				self.close();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
<body>
<div id ="root">
<header>
	<h1> 쪽지</h1>
</header>
<hr />

<div>
	<%@include file="nav.jsp" %>
</div>

<hr/>

<section id="container">
	<form name="writeForm" method="post" action="${pageContext.request.contextPath}/message/writemessagePopUp">
		<table>
			<tbody>

				<tr>
					<td>
						<label for ="msid">받는 사람</label><input type="text" id="msid" name="msid" title="받는 사람을 입력하세요"/>
					</td>
				</tr>	
				
				
				<tr>
					<td>
						<label for="mstitle">제목</label><input type="text" id="mstitle" name="mstitle" class="chk" title="제목을 입력하세요"/>
					</td>
				</tr>
				
				<tr>
					<td>
						<label for ="mscontens">내용</label><textarea id="mscontens" name="mscontens" class="chk" title="내용을 입력하세요"></textarea>
					</td>
				</tr>
				
				<tr>
					<td>
						<button class="write_btn" type="submit">전송</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</section>	
<hr/>				
</div>
</body>
</html>