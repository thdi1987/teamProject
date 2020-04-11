<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양동물 정보</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">




<script>
		$(document)
				.ready(
						function() {
							page = 0;
							
												$(function(){
		  					    $.contextMenu({
		  					        selector: '.left',
		  					        trigger: 'left',
		  					        callback: function(key, options) {
		  					            var m = key;
		  					          // $(".left[${pageContext.request.contextPath}/message/writerViewPopUp]").attr("target","_black")	  					       
		  					       		if(m=="1"){	          
		  					            window.open('${pageContext.request.contextPath}/message/writerViewMypage','_black','width=500,height=500');
		  					           
		  					       		}
		  					          	if(m=="2"){
		  					          		var RPID=$("#MPNO").val();	
		  					          		var MPID =$("#MPID").val();
		  					          		alert(RPID+""+MPID);
			  					            window.open('${pageContext.request.contextPath}/report/writeReport/','_black','width=500,height=500');
		  					          		
		  					          	}
		  					            window.console && console.log(m) || alert(m);
		  					        },
		  					        items: {
		  					            "1": {name: "쪽지보내기",icon: "fas fa-envelope-square"},
	  					           		"2": {name: "신고",icon: "fas fa-envelope-square"}
		  					        }
		  					    });
							});
							
							
							$('#delete').click(function(){
								var deleteYN = confirm("삭제하시겠습니까?");
								if (deleteYN == true) {
								$.ajax({
									url: "${pageContext.request.contextPath}/parcelOut/deleteMyPage",
									type: "POST",							
									data:{
										MPNO:$('#MPNO').val()
									},
									success: function(data){						
											alert("삭제되었습니다.");
											self.close();
											opener.window.location.reload();
									},
									error: function(){
										alert("서버에러");
									}
								});
								}
							});
							
							$("#UPDATE").click(function(){
								var num = $("#MPNO").val();
								window
									.open("${pageContext.request.contextPath}/parcelOut/updateForm/"
										+ num,'_blank','width=700 height=700');
							});						

							$("#ADOPTION")
									.click(
											function() {
												var num = $("#MPNO").val();
												window
														.open("${pageContext.request.contextPath}/ParcelOut/adoption/num="
																+ num ,'_blank','width=800 height=800');

											});

							$("#comment_btn").unbind("click").click(
									function(e) {
										e.preventDefault();
										fn_insertComment();
									});

						
						});

		function fn_insertComment() {
			var PCWRITER = $("#PCWRITER").val();
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/ParcelOut/bbs/insertComment",
						data : {
							MPNO : $("#MPNO").val(),
							PCCONTENTS : $("#PCCONTENTS").val(),
							PCWRITER : PCWRITER
						},
						error : function(error) {
							alert("에러1");
						},
						success : function(data) {
							$("#PCCONTENTS").val("");
							window.location.reload();
						}
					});

		}

	</script>

</head>

<body>


	<c:forEach items="${petInfo}" var="info" varStatus="status">
		<input type="hidden" id="MPNO" name="MPNO"
			value='<c:out value="${info.MPNO}"/>' />
		<input type="hidden" id="PCWRITER" name="PCWRITER"
			value="${authInfo.id}" />
		<input type="hidden" id="MPID" value="${info.MPID}">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td style="width: 20%;">아이디</td>
					<td colspan="3"
						style="border-left: 1px solid black; border-right: 1px solid black;">
						<a class="left" id="ms">${info.MPID}</a></td>

					<td style="width: 20%;">글 제목</td>
					<td colspan="3" style="border-left: 1px solid black;"><c:out
							value="${info.MPTITLE}" /></td>

				</tr>
				<tr>
					<td style="width: 20%;">종족</td>
					<td colspan="3"
						style="border-left: 1px solid black; border-right: 1px solid black;"><c:out
							value="${info.MPDIVISION}" /></td>

					<td style="width: 20%;">품종</td>
					<td colspan="3" style="border-left: 1px solid black;"><c:out
							value="${info.MPKIND}" /></td>
				</tr>
				<tr>
					<td style="width: 20%;">크기</td>
					<td colspan="3"
						style="border-left: 1px solid black; border-right: 1px solid black;"><c:out
							value="${info.MPSIZE}" /></td>

					<td style="width: 20%;">성별</td>
					<td colspan="3" style="border-left: 1px solid black;"><c:out
							value="${info.MPGENDER}" /></td>
				</tr>
				<tr>
					<td style="width: 20%;">책임비</td>
					<td colspan="3"
						style="border-left: 1px solid black; border-right: 1px solid black;"><c:out
							value="${info.MPDEPOSIT}" /></td>
					<td style="width: 20%;">중성화 여부</td>
					<td colspan="3"
						style="border-left: 1px solid black; border-right: 1px solid black;"><c:out
							value="${info.MPNEUTRAL}" /></td>
				</tr>
				<tr>
					<td style="width: 20%;">작성일</td>
					<td colspan="5" style="border-left: 1px solid black;"><c:out
							value="${info.MPTIME}" /></td>
				</tr>
				<%-- <tr>
					<td>작성일</td>
					<td colspan="3" style="border-left: 1px solid black;"><fmt:formatDate
							value="${info.MPTIME}" pattern="yyyy-MM-dd" /></td>
				</tr> --%>
				<tr>
					<td>이미지</td>
					<td colspan="5"
						style="height: 420px; text-align: left; border-left: 1px solid black; overflow-y: scroll;">
						<c:forEach items="${multiPic}" var="pic" varStatus="loop">
							<img src="<c:url value='/upload/${pic.PFILENAME}'/>"
								width="660px" height="400px" />
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>내 용</td>
					<td colspan="5"
						style="height: 600px; text-align: left; border-left: 1px solid black;">
						<c:out value="${info.MPCONTENT}" />
					</td>
				</tr>
			</tbody>
		</table>
	<div
		style="border: 1px solid black; height: 200px; text-align: center;">
		<c:if
			test="${!empty authInfo and authInfo.division == 'B1' or !empty authInfo and authInfo.division == 'A1'}">
			<tr style="height: 200px;">
				<td style="height: 200px;"><input type="button" value="입양신청하기"
					id="ADOPTION"
					style="height: 75px; width: 200px; margin: 6rem 1.5rem 0;"></td>
			</tr>
		</c:if>
		<c:if test="${!empty authInfo and authInfo.id == info.MPID }">
			<tr style="height: 200px;">
				<td style="height: 200px;"><input type="button" value="수정"
					id="UPDATE"
					style="height: 75px; width: 200px; margin: 6rem 1.5rem 0;"></td>
			</tr>
		</c:if>
		<c:if test="${!empty authInfo and authInfo.id == info.MPID }">
			<tr style="height: 200px;">
				<td style="height: 200px;"><input type="button" value="삭제"
					id="delete"
					style="height: 75px; width: 200px; margin: 6rem 1.5rem 0;"></td>
			</tr>
		</c:if>
	</div>
	</c:forEach>
	<form name="replyForm" method="post" class="form-horizontal"
		style="border: 1px solid black; height: 250px">
		<div class="form-group"
			style="margin: 10px 150px 0 0; width: 800px; height: 200px;">
			<label for="frcontent" class="col-sm-2 control-label">댓글 내용</label>
			<div class="col-sm-10">
				<textarea id="PCCONTENTS" name="PCCONTENTS" class="form-control"
					required="required"
					style="width: 600px; height: 200px; float: left; resize: none;"></textarea>
			</div>
		</div>
		<div class="form-group" style="float: right; margin: -200px 20px 0 0;">
			<div class="col-sm-offset-1 col-sm-10">
				<button type="button" class="btn btn-success" id="comment_btn"
					style="width: 90px; height: 90px;">작성</button>
			</div>
		</div>
	</form>
	<!-- <table>
		<tbody style="width: 860px; text-align:center; margin: 30px 0 50px 0;">
			<tr style="width:50%; margin:0 auto;">
				<th style="width:5%">작성자</th>
				<th style="width:5%">내&nbsp;&nbsp;용</th>
				<th style="width:5%">작성일</th>
			</tr>
		</tbody>
	</table>		
	<div class="board_view" id="comment_table"
		style="width: 860px; text-align: center;">
		<div id="reply_list" style="height:100px; line-height: 100%; font-size:30px; margin: 0 30px 0">
		</div>
	</div> -->
	<form action="/ParcelOut/bbs/viewComment/{mpno}" >
	<div id="reply" style="width: 1140px;">
		<div class="replyList" style="list-style: none;">
			<c:forEach items="${replyList}" var="replyList">
				<div
					style="border-bottom: 1px solid #ccc; border-left: 1px solid black; border-right: 1px solid black; width: 1138px;">
					<div style="margin: 0 0 0 30px; font-size: 20px">
						${replyList.PCWRITER}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						${replyList.PCTIME}
							
					</div>
					<br>
					<div style="margin: 0 0 0 30px; font-size: 40px">${replyList.PCCONTENTS}</div>

				</div>
			</c:forEach>
		</div>
	</div>
	</form>
	
</body>
</html>