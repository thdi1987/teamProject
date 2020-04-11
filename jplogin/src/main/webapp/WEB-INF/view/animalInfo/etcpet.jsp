<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<html>
<head>
<title>기타 동물</title>
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
		height: 70rem;
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


#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
}
</style>

<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
</script>
<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
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
	<div class = "ifp" style="padding-top: 80px;" >
	<p class = "ifpp">햄스터</p>
	 
	<img class = "ifppm" src="<c:url value="/infoImg/golden.jpg"/>" >
	<div class = "ifc">
	<p>설치목 비단털쥐과 비단털쥐아과 시리아햄스터속(Mesocricetus)의 생물을 말한다</p>
	
	<p>1839년에 영국의 생물학자인 조지 로버트 워터하우스(George Robert Waterhouse)에 의해 처음 시리아에서 발견되었다.</p>
	
	<p>시리아 햄스터의 종류로는 세피아, 시나몬, 로언, 베이지, 블랙, 엄블로즈 등이 있다. </p>
	
	<p>겁이 좀 많은 편이라 작은 소리에도 자지러지게 놀라는 경향이 있다. 이는 어릴 때 그 정도가 심하고 성체가 되면 덜해진다.</p>
	
	<p>지능은 다른 햄스터와 크게 다를바 없이 낮은 편이다.</p>
	
	<p>시리아 햄스터의 수명은 2 ~ 3년 정도이다. </p>
	</div>
	</div>
	
	<div class = "ifp" >
	<p class = "ifpp">토끼<p> 

	<img class = "ifppm" src="<c:url value="/infoImg/rabbit.jpg"/>" >
	<div class = "ifc">
	<p>포유류 토낏과에 속하는 동물이다. </p>  
	
	<p>귀가 길고 꼬리가 짧으며, 앞다리보다 훨씬 긴 뒷다리를 써서 깡충깡충 뛰어다닌다. </p>
	
	<p>입과 코는 작으며, 입모양이 'ㅅ' 모양. 얼굴은 약간 달걀형에 가깝다. </p>
	
	<p>토끼의 품종은 앙고라, 롭이어, 렉스, 더치, 라이온헤드등이 있다.</p>
	
	<p>토끼는 후각이 뛰어나고 청각이 좋습니다. </p>
	
	<p>토끼의 평균 수명은 6 ~ 8 년정도이다. 토끼마다 수명은 다르다.</p>
	</div>
	</div>
	
	<div class = "ifp" >
	<p class = "ifpp">뱀<p> 

	<img class = "ifppm" src="<c:url value="/infoImg/snake.jpg"/>" >
	<div class = "ifc">
	<p>파충류 이궁아강 뱀목 뱀아목에 속하는 동물의 총칭. 옛말 또는 사투리로 비얌, 배암이라고도 한다.</p>
	
	<p>파충류로서의 장점으로 털날림도 없고 은근히 까탈스러운 도마뱀들처럼 특별한 환경을 요구하지도 않는다. </p>
	
	<p>발정기가 오거나 소리를 내는 동물도 아니니 사육장만 있으면 어떠한 주거환경에서라도 충분히 키울 수 있다.</p> 
	
	<p>또한 질병에도 강한 편이라 병원 데려갈 일이 극히 드물다. </p>
	
	<p>우리나라에서는 킹스네이크, 콘스네이크, 볼파이톤을 주로 키운다 </p>
	
	<p>뱀 크기에 맞는 잠금이 가능한 사육장, 바닥재 또는 매트, 물그릇, 은신처, 열원이면 충분하다. </p>
	</div>
	</div>
	
	<div class = "ifp" >
	<p class = "ifpp">앵무새</p> 
	 
	<img class = "ifppm" src="<c:url value="/infoImg/conure.jpg"/>" >
	<div class = "ifc">
	<p>앵무새란 앵무목의 모든 새에 대한 총칭. 
	
	<p>같은 조류의 목 단위인 참새목에 속하는 종류만 해도 한 둘이 아니듯, </p>
	
	<p>앵무목에는 앵무새과(약 372종), 관앵무과(왕관앵무, 유황앵무 등), </p>
	
	<p>뉴질랜드앵무과(케아앵무, 카카포 등)가 포함된다.</p>
	
	<p>앵무새는 대형종, 중형종, 소형종으로 나뉜다.</p>
	
	<p>대형종에는 금강앵무, 대본청, 카카포, 케아 등이 있다. </p>
	
	<p>중형종에는 왕관앵무 , 코뉴어, 카이큐, 퀘이커 등이 있다.</p>
	
	<p>소형종에는 모란앵무, 사랑앵무, 사자나미 등이있다.</p>
	
	<p>조류원 또는 개인 가정이나 정식수입업체에 의뢰해서 분양받을 수 있다. </p> 
	
	<p>그러나 일부 종은 사이테스로 보호받으니 서류 없이 키우는 것은 불법이다.</p>
	
	<p>앵무새의 평균 수명은 10 ~ 80년 사이로 앵무새 마다 수명은 다 다르다. </p>
	</div>
	</div>
	
	<div class = "ifp" >
	<p class = "ifpp">라쿤</p> 
	
	<img class = "ifppm" src="<c:url value="/infoImg/racoon.jpg"/>" >
	<div class = "ifc">
	<p>라쿤은 주로 북, 중앙아메리카에 서식하고 있다.</p>
	
	<p>몸길이는 45 ~ 70cm, 꼬리길이 20 ~ 26cm, 어깨 높이 30 ~ 35cm,</p>
	
	<p> 뒷발 길이 10 ~ 20cm, 귀 길이 4 ~ 6cm, 몸무게 8 ~ 10kg의 신체구조를 가지고 있다. </p>
	
	<p>라쿤의 외모는 너구리와 비슷하고 몸 윤곽은 곡선형에 가까우며 엉덩이는 어깨보다 약간 높은게 특징이다.</p>
	
	<p>애완용 라쿤은 노멀 라쿤 과 브론디 라쿤으로 나누어진다. </p>
	
	<p>노멀 라쿤의 경우 호기심이 많으며 끈기와 의지가 강한 동물이다. </p>
	
	<p>브론디 라쿤의 경우 순정적이고 주인이 만지는 것에 호의적이며 노멀 라쿤에 비해 끈기가 부족하다 </p>
	
	<p>라쿤의 평균 수명은 10 ~ 20년 사이로 보통은 15년으로 알려져있다. </p> 
	
	<a id="MOVE_TOP_BTN" href="#">TOP</a>
	</div>
	</div>
	
</body>

</html>