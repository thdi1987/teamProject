<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<html>
<head>
<title>강아지</title>
<!--  합쳐지고 최소화된 최신 CSS -->
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

<style type="text/css">
.ifp {
		border-left: 1px solid black;
		border-right: 1px solid black;
		border-bottom : 1px solid black;
		border-top : 1px solid black;
		background: white;
		height: 55rem;
		width: 50%;
		overflow: hidden;
		margin: 0 auto;
		text-align: center;
		
		}
.ifp .ifppm{
 	
	width: 300px;
	height: 25rem;
	
}	

.ifp .ifpp{
	font-size: 25px;
	color: blue; 
}

.ifp .ifc{
	font-size: 18px;
	height: 10rem;
	margin-top: 20px;
}	

</style>

</head>
<body>
<div id="wrap">

		<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top"
		style="background-color: whitesmoke; height:106px;">
		<div class="container"
			style="margin-left: 50px; width: 480px;">
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
				style="width: 1000px; height:200px;  margin-top: -20;">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/Notice/listUser"/>"
						style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size:16px;">공지사항</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/animalinfo/petInfo"/>"
						style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size:16px;">동물정보</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/freeboard/list"/>"
						style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">자유게시판</a>
					</li>
					<c:if test="${!empty authInfo}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/ParcelOut/list"/>"
							style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">분양게시판</a>
						</li>
					</c:if>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/Review/home"/>"
						style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">후기게시판</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/Service/listUser"/>"
						style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size:16px;">고객센터</a>
					</li>
					<c:if
						test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/message/list"/>"
							style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">마이페이지</a>
						</li>
					</c:if>
					<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/Notice/listSys"/>"
							style="height: 41px; width: 126px; padding-left: 15px; padding-right: 15px; font-size:16px;">관리자페이지</a>
						</li>
					</c:if>
					<c:if test="${!empty authInfo}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/message/list"/>"
							style="height: 41px;width: 180px;padding-left: 15px;padding-right: 15px;text-align: right;margin-left: 335px; font-size:16px;">${authInfo.id}</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/member/logout"/>"
							style="height: 41px; width: 96px; padding-left: 15px; padding-right: 15px; font-size:16px;">로그아웃</a>
						</li>
					</c:if>
					<c:if test="${empty authInfo}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/member/login"/>"
							style="height: 41px; width: 730px; padding-left: 15px; padding-right: 15px; text-align: right; font-size:16px;">로그인</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/member/agreement"/>"
							style="height: 41px; width: 96px; padding-left: 15px; padding-right: 15px; font-size:16px;">회원가입</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<div class = "ifp" style="padding-top: 80px;">
	<p class = "ifpp" >포메라니안</p> 
	
	<img class = "ifppm" src="<c:url value="/infoImg/pome.png"/>" >
	<div class = "ifc">
	<p>포메라니안은 스피츠의 한 종류로 폴란드 서부와 독일 북동부 지역의 중앙 유럽인 포메라니아 지역의 이름을 따서 지어졌다.</p>
	
	<p>포메라니안은 1.9kg ~ 3.5kg의 아담한 사이즈에 13~28cm밖에 되지않을 정도로 조그많고 털은 촘촘하지만 견고하답니다.</p>
	
	<p>포메라니안의 성격은 대체적으로 사교적이고 노는걸 좋아하면서 활발하다.</p>
	
	<p>가끔은 다른 강아지들에게 강함을 증명하고 싶어하여 공격적이기도 하다</p>
	
	<p>포메라니안의 수명은 대체적으로 12 ~ 16년정도 이고 식단과 운동을 병행하면 그 이상으로도 수명은 늘어난다 </p>
	</div>
	</div>
	
	<div class = ifp>
	<p class = ifpp>치와와<p> 
	
	<img class = ifppm src="<c:url value="/infoImg/chiwawa.jpg"/>" >
	<div class = "ifc">
	<p>치와와의 유래는 일반적으로 민속학과 고고학적 근거에 의해 지금의 멕시코 지역에서 유래 되었을것이라고 본다.</p>
	
	<p>치와와는 1.8 ~ 2.7kg의 사이즈에 13~22cm밖에 되지않을 정도로 조그맣고 귀는 크고 쫑끗하며 눈은 약간 볼록하게 보인다.</p>
	
	<p>치와와의 성격은 질투심이 많고 고집이 세고 작은 체구에도 불구하고 겁이 없다 </p>
	
	<p>주인을 포함한 누구에게도 쉽게 복종하지 않는 성격으로도 유명하다 </p>
	
	<p>치와와의 평균 수명은 12 ~ 16년정도 이다.</p>
	</div>
	</div>
	
	<div class = ifp>
	<p class = ifpp>말티즈<p> 
	
	<img class = ifppm src="<c:url value="/infoImg/malti.jpg"/>" >
	<div class = "ifc">
	<p>말티즈의 유래는 이탈리아 남부 몰타섬 품종이라 몰타의 형용사 형태인 'Maltese'에서 따서 몰티즈라고 불렸다는 설과 피난처, </p>
	
	<p> 항구를 뜻하는 셈족의 언어 'malat'에서 유래했다는 설이 있다 </p>
	
	<p>말티즈는 1.4 ~ 3.6kg 범위 안이며 키는 20~25cm 정도이며 평균적으로 2 ~ 3kg이다.</p>
	
	<p>말티즈의 성격은 상당히 까다롭고 예민하다 </p>
	
	<p>또한 사람 특히 어린 아이를 포함한 다른 동물들에게 공격적이며 성인에게도 심하게 달려드는 습성이 있기 때문이다.</p>
	
	<p>말티즈의 평균 수명은 12~ 15년 정도이다.</p>
	</div>
	</div>
	
	<div class = ifp>
	<p class = ifpp>알래스칸 말라뮤트</p> 

	<img class = ifppm src="<c:url value="/infoImg/malra.png"/>" >
	<div class = "ifc">
	<p>썰매를 끄는 개. 스피츠 계통으로 이누이트 중 마흘레뭇 족(Mahlemut)이 처음부터 이 목적으로 개량했기 때문에 이런 이름이 붙었다. </p>
	
	<p>알래스칸 말라뮤트는 30 ~ 50kg 정도의 대형견으로 키는 55 ~ 70cm 정도이다</p>
	
	<p>알래스칸 말라뮤트의 성격은 활동적인 데다 장난을 좋아하면서도 큰 말썽은 잘 안 부리는 편 이다 </p>
	
	<p>알래스칸 말라뮤트의 수명은 10 ~ 15년 정도이다.</p>	
	</div>
	</div>
	
	<div class = ifp>
	<p class = ifpp>퍼그</p>
	
	<img class = ifppm src="<c:url value="/infoImg/Pug.jpg"/>">
	<div class = "ifc">
	<p>원산지는 중국. 저래봬도 송나라 시대 황제가 키우는 군견 쯤 등장한 것으로 추정되며, </p>
	
	<p>원래 송나라에서 키우던 퍼그는 늑대를 닮은 굉장히 잘생긴 외모로 지금과는 상당히 다르게 생겼다 </p>
	
	<p>퍼그는 6 ~ 8kg 정도 키는 27~30 cm 정도이다.</p>
	
	<p>퍼그는 진지한 면이 있고 천역덕스러운 유머 감각을 가졌으며 퍼그는 고집도 있긴 하지만 보통 남을 기쁘게 하려고 한다. </p>

	<p>느긋한 태도를 가졌으며 보통 과하게 짖거나 땅을 파거나 물건을 씹지는 않는다.</p>
	
	<p>퍼그의 수명은 12 ~ 15년 정도이다.</p>
	</div>
	</div>	
	</div>
</body>

</html>