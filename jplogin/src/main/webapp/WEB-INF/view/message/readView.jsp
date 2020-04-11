<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>쪽지 내역</title>
</head>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");				

						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {

											location.href = "${pageContext.request.contextPath}/message/list?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										});
						
						// 삭제
						
						$('#delete_btn').click(function() {
                            var msnum = $('#msnum').val();


                                $.ajax({
                                        url : "${pageContext.request.contextPath}/message/delete",
                                        type : "POST",
                                        data : {
                                            msnum : msnum

                                        },
                                        success : function(data) {
                                                alert("삭제되었습니다.");
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
<body>
	<div class="container">
		<header>
			<h1 style="text-align:center;">쪽지 내역</h1>
		</header>
		<hr />

		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="msnum" name="msnum" value="${read.msnum}" />
				<input type="hidden" id="page" name="page" value="${scri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">
			</form>

			<div class="form-group">
				<label for="mstitle" class="col-sm-2 control-label">제목</label> <input
					type="text" id="mstitle" name="mstitle" class="form-control"
					value="${read.mstitle}" readonly="readonly" />
			</div>

			<div class="form-group">
				<label for="msid2" class="col-sm-2 control-label">보낸 사람</label> <input
					type="text" id="msid2" name="msid2" class="form-control"
					value="${read.msid2}" readonly="readonly" />
			</div>

			<div class="form-group">
				<label for="mscontens" class="col-sm-2 control-label">내용</label> <input
					type="text" id="mscontens" name="mscontens" class="form-control"
					value="${read.mscontens}" readonly="readonly" style="width:100%; height:400px; resize: none;"  />
			</div>

			<div style="text-align:center;">
				<input type="button" class="del" id="delete_btn" name="delete_btn" value = "삭&nbsp;&nbsp;&nbsp;제" style="margin: 0 0 0 260px;">
			</div>
		</section>
		<hr />
	</div>
</body>
</html>