<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script>
$(document).ready(function(){
    $("#adop").click(function(){

        var MPNO =$("#listNum").val();
        var MPTITLE=$("#title").val();
        var MPCONTENT=$("#MPCONTENT").val();
        var AdoptId=$("#adoptId").val();


        $.ajax({
            url : "${pageContext.request.contextPath}/ParcelOut/adoptionInsert",
            type : "POST",
            data : {
                MPNO : MPNO,
                MPTITLE : MPTITLE,
                MPCONTENT : MPCONTENT,
                AdoptId : AdoptId

            },
            success : function(data) {
                alert("처리되었습니다.");
                self.close();
                window.opener.open('','_self').close();
                window.opener.opener.location.href="${pageContext.request.contextPath}/adopt/listSys";

            },
            error : function() {
                alert("서버에러");
            }
        });



    });
});
</script>



<meta charset="UTF-8">
<title>입양 신청</title>
</head>
<body>


	<form
		action="${pageContext.request.contextPath}/ParcelOut/adoptionInsert"
		id="adoption">
		<c:forEach items="${petInfo}" var="info" varStatus="status">
			<input type="hidden" id="listNum" name="MPNO"
				value='<c:out value="${info.MPNO}"/>' />
			<input type="hidden" id="adoptId" name="adoptId"
				value="${authInfo.id}" />
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						<td colspan="5">분양자 ${info.MPID}님의 반려동물을 ${authInfo.id}님이
							입양합니다</td>
					</tr>
					<tr>
						<td style="width: 20%;">제목 :</td>
						<td colspan="3" style="border-left: 1px solid black;">
						<input type="text" name="MPTITLE" id="title" required="required" style="width:100%;"></td>

					</tr>
					<tr>
						<td colspan="5">분양 신청 동물 정보</td>
					</tr>
					<tr>
						<td style="width: 20%;">분류 :</td>
						<td colspan="3" style="border-left: 1px solid black;"><c:out
								value="${info.MPDIVISION}"/></td>
					</tr>
					<tr>
						<td style="width: 20%;">품종:</td>
						<td colspan="3"
							style="border-left: 1px solid black; border-right: 1px solid black;"><c:out
								value="${info.MPKIND}" /></td>
					</tr>
					<tr>
						<td style="width: 20%;">사이즈:</td>
						<td colspan="3" style="border-left: 1px solid black;"><c:out
								value="${info.MPSIZE}" /></td>
					</tr>
					<tr>
						<td style="width: 20%;">지역:</td>
						<td colspan="3"
							style="border-left: 1px solid black; border-right: 1px solid black;"><c:out
								value="${info.MPLOCATION}" /></td>
					</tr>
					<tr>
						<td style="width: 20%;">성별:</td>
						<td colspan="3"
							style="border-left: 1px solid black; border-right: 1px solid black;"><c:out
								value="${info.MPGENDER}" /></td>
					</tr>
					<tr>
						<td colspan="5">${info.MPID}님 에게 전할 말을 적어주세요</td>
					</tr>
					<tr>
						<td colspan="5" style="height: 600px; text-align: left; border-left: 1px solid black;">
						<textarea name="MPCONTENT" id="MPCONTENT" required="required" style="width:950px; height:630px;resize: none;">
                        </textarea>
                        </td>
					</tr>
				</tbody>
				<%-- <tr>
					<td>분양자 ${info.MPID}님의 반려동물을 ${authInfo.id}님이 입양합니다</td>
				</tr>
				<tr>
					<td>제목:<input type="text" name="MPTITLE" id="title"
						required="required"></td>
				</tr>

				<tr>
					<td>분양 신청 동물 정보</td>
				</tr>

				<tr>
					<td><br> 분류:${info.MPDIVISION} <br> 품종:<c:out
							value='${info.MPKIND}' /> <br> 사이즈:${info.MPSIZE} <br>
						지역:${info.MPLOCATION} <br> 성별:${info.MPGENDER}</td>
				</tr>
				<tr>
					<th>${info.MPID}님 에게 전할 말을 적어주세요</th>
				</tr>

				<tr>
					<td></c:forEach> <textarea rows="10" cols="50" name="MPCONTENT"
							required="required">
</textarea></td> 
				</tr> --%>
			</table>
		</c:forEach>
		<div style="width:950px; text-align:center; padding:0 0 20px 0;">
		<input type="button" id="adop" value="신청" style="width:120px; height:40px;">&nbsp; &nbsp;
		<input type="reset" value="취소" style="width:120px; height:40px;">
		</div>
	</form>
</body>







</html>