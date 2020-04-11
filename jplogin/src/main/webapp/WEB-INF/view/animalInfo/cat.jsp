<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
<title>고양이</title>
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
		height: 60rem;
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
	<p class = "ifpp">시베리안 포레스트</p> 
	
	<img class = "ifppm" src="<c:url value="/infoImg/fore.png"/>">
	<div class = "ifc">
	<p>시베리안 포레스트는 시베리아 원산의 자연발생한 중 ~ 대형, 중장모종 고양이 품종</p>
	
	<p>몸은 롱 앤 서브스탠셜 타입이다. 개체마다 털의 색, 털의 무늬, 털의 질감 등 차이가 많다.</p>
	
	<p>자연발생한 품종으로 무늬가 매우 다양하고, 지능이 높다. </p>
	
	<p>시베리아의 가혹한 환경에서 자연발생한 종인만큼 유전병이 없고 체력이 매우 뛰어나고, 골격이 크고 단단하며, 온몸이 근육질이다. </p>
	
	<p>시베리아의 추운 환경에 적응해야 했기 때문에 털이 3중모로 매우 풍성하다 </p>
	
	<p>시베리아 포레스트의 평균 수명은 15년 정도이다. </p>
	
	<p>병에 강하고 튼튼하며 상대적으로 나이가 들어서 새끼를 낳아도 사망률은 낮은편이다.</p>
	</div>
	</div>
	
	<div class = "ifp">
	<p class = "ifpp">페르시안<p> 
	
	<img class = "ifppm" src="<c:url value="/infoImg/Persian.jpg"/>" >
	<div class = "ifc">
	<p>페르시안의 유래는 고대 고양이 품종이며, 다른 고대 품종들처럼, 그 역사는 별로 잘 알려져 있지 않습니다 </p>
	
	<p>페르시안은 개성 넘치는 외모를 지닌 품종입니다. 몸통은 짧지만 두껍고 다리도 두꺼우며 목도 짧고 굵습니다.</p>
	
	<p> 꼬리도 짧고 귀는 작습니다. 얼굴은 둥글고 귀는 크고 둥근 편입니다. </p>
	
	<p>옆에서 보면 얼굴이 납작하며 코가 방향을 바꾸면서 마치 코 위에 채색된 살집이 있는 것처럼 보입니다.</p>
	
	<p>페르시안의 성격은 새끼 고양이의 활동성을 보여주는 온순한 고양이입니다.</p>
	
	<p>햇볕 아래에서 잠을 자다가 갑자기 흥분하면 방 주변을 달리다가 구르기도 합니다.</p>
	
	<p>페르시안의 평균 수명은 9 ~ 13년정도 이다.</p>
	</div>
	</div>
	
	<div class = "ifp">
	<p class = "ifpp">마우<p> 
		
	<img class = "ifppm" src="<c:url value="/infoImg/EgyptianMau.jpg"/>" >
	<div class = "ifc">
	<p>마우의 유래는 1953년, 한 귀족여성이 이집트에서 태비 고양이 한 마리를 이탈리아로 가지고 들어왔습니다.</p>
	
	<p>이 태비 고양이를 한 시리아 대사의 도움으로 이집트에서 이탈리아로 반입할 수 있었던 수컷 태비 고양이와 교배했습니다. </p>
	
	<p>1956년, 교배 후 태어난 한 쌍의 고양이 자손이 이 귀족여성에 의해 미국으로 들어 올 수 있었고,</p> 
	
	<p>드디어 이집션 마우라는 품종이 탄생하게 되었습니다.</p>
	
	<p>이집션 마우는 3.6 ~ 5.4kg 정도의 체중을 가지고있다. </p>
	
	<p>마우의 성격은높은 곳에 올라가 주위를 관찰하는 것을 좋아합니다. </p>
	
	<p>그들은 마치 자신들의 환경을 완전히 장악하고 있는 것처럼 행동합니다. </p>
	
	<p> 마우는 매우 강하며 활동적입니다. </p>
	
	<p> 하지만 친근하고 충직한 고양이입니다. </p>
	
	<p>마우의 평균 수명은 9~ 13년 정도이다.</p>
	</div>
	</div>
	
	<div class = "ifp">
	<p class = "ifpp">샴 고양이</p> 
	
	<img class = "ifppm" src="<c:url value="/infoImg/Siamese.jpg"/>" >
	<div class = "ifc">
	
	<p>샴 고양이는 샴왕의 전설 속의 사원의 고양이입니다. </p>
	
	<p>이 고양이는 우아한 아름다움으로 사랑을 받았을 뿐만 아니라 사원을 지키는 역할로도 이용되었습니다</p>
	
	<p>샴 고양이는 소형은 3.6kg 이며 중형은 3.6 ~ 5.4kg이다.</p>
	
	<p>샴 고양이는 아름다울 뿐만 아니라 상당히 영리합니다.</p>
	
	<p>샴 고양이의 평균 수명은 8 ~ 12년이다. </p>
	</div>
	</div>
	
	<div class = "ifp">
	<p class = "ifpp">브리티시 숏헤어</p> 
	
	<img class = "ifppm" src="<c:url value="/infoImg/BritishShorthair.jpg"/>" >
	<div class = "ifc">
	<p>브리티시 숏헤어는 영국의 농장과 거리 출신이지만 또한 cat fancy라는 잡지에 등장한 최초의 고양이로 알려져 있습니다 </p>
	
	<p>브리티시 숏헤어는 중형에서 대형의 고양이이며 매우 힘이 셉니다.</p>
	
	<p>브리티시 숏헤어는 큰 근육과 무거운 골격을 가지고 있습니다. </p> 
	
	<p>전체적인 외형은 둥글고 두툼합니다.</p>
	
	<p>브리티시 숏헤어는 까다롭지 않고 조용합니다. </p>
	
	<p>브리티시 숏헤어는 충성심히 강하고 사랑스러우며 모든 가족들과 친근하게 지낼 수 있습니다. </p>
	
	<p>브리티시 숏헤어의 수명은 7 ~ 12년 정도이다.</p>
	</div>
	</div>	
</div>
</body>

</html>