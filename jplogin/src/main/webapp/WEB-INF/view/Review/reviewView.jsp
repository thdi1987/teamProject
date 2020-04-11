<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html style="background: #ccc; width: 100%; height: 100%;">

<head>
	<title>작성자 화면</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>

<link href="../css/bootstrapNav.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../csstest/modern-business.css" rel="stylesheet">

<script src="../csstest/jquery.js"></script>
<script src="../csstest/bootstrap.bundle.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>


	
<style>
 body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
 ul { padding:0; margin:0; list-style:none;  }

 div#root { width:90%; margin:0 auto; }
 
 header#header { font-size:60px; padding:20px 0; }
 header#header h1 a { color:#000; font-weight:bold; }
 
 nav#nav { padding:10px; text-align:right; }
 nav#nav ul li { display:inline-block; margin-left:10px; }

 section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 section#container::after { content:""; display:block; clear:both; }
 aside { float:left; width:200px; }
 div#container_box { float:right; width:calc(100% - 200px - 20px); }
 
 aside ul li { text-align:center; margin-bottom:10px; }
 aside ul li a { display:block; width:100%; padding:10px 0;}
 aside ul li a:hover { background:#eee; }
 
 footer#footer { background:#f9f9f9; padding:20px; }
 footer#footer ul li { display:inline-block; margin-right:10px; }
</style>

<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='petcontents'] { display:block; }
input { width:150px; }
textarea#petcontents { width:400px; height:180px; }

.oriImg {width:500px; height:auto;}
.thumbImg {}
</style>

</head>
<body>
<div id="root" style="background: #ccc; width: 100%; height: 100%;">
		<!-- Navigation -->
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top"
			style="background-color: whitesmoke; height: 106px;">
			<div class="container" style="margin-left: 50px; width: 480px;">
				<a class="navbar-brand" href="<c:url value="/main"/>"
					style="margin-right: 50px; margin-top: 0; height: 86.25px;"><img
					src="<c:url value="/img/logo-side3.png"/>"></a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive"
					style="width: 1000px; height: 200px; margin-top: -20;">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/Notice/listUser"/>"
							style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size: 16px;">공지사항</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/animalinfo/petInfo"/>"
							style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size: 16px;">동물정보</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/freeboard/list"/>"
							style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size: 16px;">자유게시판</a>
						</li>
						<c:if test="${!empty authInfo}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/ParcelOut/list"/>"
								style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size: 16px;">분양게시판</a>
							</li>
						</c:if>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/Review/home"/>"
							style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size: 16px;">후기게시판</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/Service/listUser"/>"
							style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size: 16px;">고객센터</a>
						</li>
						<c:if
							test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/message/list"/>"
								style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size: 16px;">마이페이지</a>
							</li>
						</c:if>
						<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/Notice/listSys"/>"
								style="height: 41px; width: 126px; padding-left: 15px; padding-right: 15px; font-size: 16px;">관리자페이지</a>
							</li>
						</c:if>
						<c:if test="${!empty authInfo}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/message/list"/>"
								style="height: 41px; width: 180px; padding-left: 15px; padding-right: 15px; text-align: right; margin-left: 335px; font-size: 16px;">${authInfo.id}</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/member/logout"/>"
								style="height: 41px; width: 96px; padding-left: 15px; padding-right: 15px; font-size: 16px;">로그아웃</a>
							</li>
						</c:if>
						<c:if test="${empty authInfo}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/member/login"/>"
								style="height: 41px; width: 730px; padding-left: 15px; padding-right: 15px; text-align: right; font-size: 16px;">로그인</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/member/agreement"/>"
								style="height: 41px; width: 96px; padding-left: 15px; padding-right: 15px; font-size: 16px;">회원가입</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	
<hr class="sidebar-divider d-none d-md-block">

		<div class="container-fluid">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"
					style="padding-top: 120px; font-size: 30px;">후기게시판</h1>
			</div>

			<hr class="sidebar-divider d-none d-md-block">

			<section id="container">
				<aside style="height: 300px; background: #EEEEEE">
					<div id="aside" style="background: #EEEEEE; font-size: 20px;">
						<%@ include file="../Review/reviewAside.jsp"%>
					</div>
				</aside>
				<div id="container_box">
				 <h2 style="font-size:30px; padding-bottom: 10px;">후기 조회</h2>
					<!-- 	<h2>후기 목록</h2> -->
			
			<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="n" value="${reviews.petnum}" />
			<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd; background:white;">
							<tbody>
								<tr>
									<td style="width: 20%;">분류</td>
									<td colspan="3" style="border-left: 1px solid black;"><c:out
											value="${reviews.petcatename}" /></td>
								</tr>
								<%-- <tr>
									<td>작성자</td>
									<td colspan="3" style="border-left: 1px solid black;"><c:out
											value="${read.mname}" /></td>
								</tr> --%>
								<tr>
									<td>제목</td>
									<td colspan="3" style="border-left: 1px solid black;"><c:out
											value="${reviews.petname}" /></td>
								</tr>
								<tr>
									<td>원본 사진</td>
									<td colspan="3"
										style="height: 600px; text-align: left; border-left: 1px solid black;">
										<img src="${pageContext.request.contextPath}/${reviews.petimage}" class="oriImg"/></td>
								</tr>
								<tr>
									<td>썸네일</td>
									<td colspan="3"
										style="height: 600px; text-align: left; border-left: 1px solid black;">
										<img src="${pageContext.request.contextPath}/${reviews.petthumbimage}" class="thumbImg"/></td>
								</tr>
								<tr>
									<td>내용</td>
									<td colspan="3"
										style="height: 600px; text-align: left; border-left: 1px solid black;"><c:out
											value="${view.petcontents}" /></td>
								</tr>
							</tbody>
						</table>
			
			<div class="inputArea" style="width:100%; height:200px;" >
 			<button type="button" id="modify_Btn" class="btn btn-warning" style="width:200px; height:50px; margin:30px 0 0 700px;">수정</button>
			<button type="button" id="delete_Btn" class="btn btn-danger" style="width:200px; height:50px; margin:30px 0 0 100px;">삭제</button>
 
 			<script>
 				var formObj = $("form[role='form']");
  
			    $("#modify_Btn").click(function(){
			   		formObj.attr("action", "${pageContext.request.contextPath}/Review/reviewModify");
			   		formObj.attr("method", "get")
			   		formObj.submit();
			  	});
  
  				$("#delete_Btn").click(function(){  
  					
  					var con = confirm("정말로 삭제하시겠습니까?")
  					
  					if(con){
   					formObj.attr("action", "${pageContext.request.contextPath}/Review/reviewDelete");
   					formObj.submit();
  					}
  				});
			 </script>
			
			</div>
			
			
			</form>
<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
 
 if(jsonData[i].level == "1") {
  cate1Obj = new Object();  //초기화
  cate1Obj.petcatecode = jsonData[i].petcatecode;
  cate1Obj.petcatename = jsonData[i].petcatename;
  cate1Arr.push(cate1Obj);
 }
}

// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")

for(var i = 0; i < cate1Arr.length; i++) {
 cate1Select.append("<option value='" + cate1Arr[i].petcatecode + "'>"
      + cate1Arr[i].petcatename + "</option>"); 
}

$(document).on("change", "select.category1", function(){

	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 
	 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	 for(var i = 0; i < jsonData.length; i++) {
	  
	  if(jsonData[i].level == "2") {
	   cate2Obj = new Object();  //초기화
	   cate2Obj.petcatecode = jsonData[i].petcatecode;
	   cate2Obj.petcatename = jsonData[i].petcatename;
	   cate2Obj.petcatecoderef = jsonData[i].petcatecoderef;
	   
	   cate2Arr.push(cate2Obj);
	  }
	 }
	 
	 var cate2Select = $("select.category2");
	 
	 /*
	 for(var i = 0; i < cate2Arr.length; i++) {
	   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	        + cate2Arr[i].cateName + "</option>");
	 }
	 */
	 
	 cate2Select.children().remove();

	 $("option:selected", this).each(function(){
	  
	  var selectVal = $(this).val();  
	  
	  cate2Select.append("<option value='" + selectVal + "'>전체</option>");
	  
	  for(var i = 0; i < cate2Arr.length; i++) {
	   if(selectVal == cate2Arr[i].petcatecoderef) {
	    cate2Select.append("<option value='" + cate2Arr[i].petcatecode + "'>"
	         + cate2Arr[i].petcatename + "</option>");
	   }
	  }
	  
	 });
	 
	});
 
 </script>
           </div>
			</section>
		</div>
</div>
</body>
</html>