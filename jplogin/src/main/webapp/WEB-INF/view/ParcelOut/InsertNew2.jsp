<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<title>분양등록</title>
</head>
<body>
	<h3 style="padding:10px 0 10px 400px;">분 양 등 록</h3>
	<form action="${pageContext.request.contextPath}/ParcelOut/insertfake"
		method="post" id="insert" name="insert" enctype="multipart/form-data" style="border:1px solid black;">
		<table class="table table-striped"
			style="text-align: left; border: 1px solid #dddddd;width:100%; line-height:100%; ">
			<tr>
				<td style="width: 20%; border-right: 1px solid black; padding:8px 0 8px 50px;" >
				작성자ID&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
				<input type="text" name="id" value="${authInfo.id}" readonly="readonly" size="30">
				</td>
				<td style="width: 20%; padding:8px 0 8px 50px">
				제목&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
				<input type="text" size="40" name="title" required="required">
				</td>
			</tr>
			<tr>
				<td style="width: 20%; border-right: 1px solid black; padding:8px 0 8px 50px;">
				분류 &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
				<select id="zoo" name="zoo"
					required="required" style="width:200px;">
						<option value=''></option>
						<option value="개">개</option>
						<option value="고양이">고양이</option>
						<option value="기타">기타</option>
				</select>
				</td>

				<td style="width: 20%; padding:8px 0 8px 50px">
				품종 &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
				<select id="zoo2" name="zoo2" required="required" style="width:200px;">
						<option value=''></option>
				</select>
				</td>
          </tr>
          <tr>
				<td style="width: 100%; padding:8px 0 8px 50px; border-right: 1px solid black;">
				크기  &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
				<select id="size" name="size" required="required" style="width:200px;">
						<option value=''></option>
						<option value="대형">대형</option>
						<option value="중형">중형</option>
						<option value="소형">소형</option>
				</select>
				</td>


				<td style="width: 100%; padding:8px 0 8px 50px">
				성별 &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
				<select id="gender" name="gender" required="required" style="width:200px;">
						<option value=''></option>
						<option value="남아">남아</option>
						<option value="여아">여아</option>
				</select>
				</td>

				<td></td>
			</tr>
			<tr>
				<td style="width: 20%; padding:8px 0 8px 50px; border-right: 1px solid black;">
				책임비 &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
				<input type="text" id="charge" name="charge" required="required" style="width:200px;">
			
				</td>
				<td style="width: 20%; padding:8px 0 8px 50px">
				지역 &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
				<select id="location" name="location"
					required="required" style="width:200px;">
						<option value=''></option>
						<option value="전국">전국</option>
						<option value="서울">서울</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
						<option value="인천">인천</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청남도">충청남도</option>
						<option value="충청북도">충청북도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="제주도">제주도</option>
				</select>
				</td>
			</tr>

			<tr>
				<td style="width: 20%; padding:8px 0 8px 50px;">중성화여부</td>
				<td colspan="5" style="border-left: 1px solid black;">
				<input type="radio" value="Y" name="netural"
					required="required"> 예 
				<input type="radio" value="N"
					name="netural" required="required">아니요</td>
			</tr>
			<tr>
				<td style="width: 20%; padding:8px 0 8px 50px;">
				반려동물 번호 확인
				<td colspan="5" id="regCheck" style="border-left: 1px solid black;">
				<input type="text" name="registration"
					id="registration" required="required"> <input type="button"
					id="regChk" value="동물등록번호 확인">
				</td>
				
			</tr>

			<tr>
				<td colspan="5">
					<div id="preview"></div>
				</td>
			</tr>

			<tr>
				<td style="width: 20%; padding:8px 0 8px 50px;">
				<input type="file" name="pic" id="pic" multiple
					required="required"></td>

				<td colspan="3" style="width: 20%; padding:8px 0 8px 50px;">
				<input type="button" value="이미지삭제" id="reset">
				</td>
			</tr>

			<tr>
				<td colspan="5"><textarea name="explain"
						required="required" style="resize: none; height:400px; width:100%"></textarea></td>
			</tr>
		</table>
	
	<div style="width:100%; height:100px; border:1px solid black; text-align:center; padding: 30px 100px;">
	 <input type="button" id=enrollment value="등록하기" style="width:100px; height:30px; margin: 0 50px 0 0;">
	 <input type="reset" value="취소" style="width:100px; height:30px; margin: 0 0 0 50px;">
	</div>
	</form>
	</body>
	<script>
	$(document).ready(function (e){
	var reg = false;
				
		$('#regChk').click(function() {
				$.ajax({url : "${pageContext.request.contextPath}/parcelOut/regCheck",
						type : "POST",
						data : {
							"registration" : $('#registration').val(),							
						},
							success : function(data) {
								if (data == 1 && $.trim($('#registration').val()) != '') {
									reg = true;
							       alert("확인되었습니다.");
							       $('#registration').attr("readonly",true);

								} else {
									 alert("등록번호를 확인해주세요.");
								}
							},
							error : function() {
								alert("서버에러");
							}
						});

			});
	
	
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
    //   $('#preview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change

    $("#reset").click(function(){
        $('#preview').empty();
    });

    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#preview');
        }
      });//arr.forEach
    }
    
       
    $("#zoo").on("change",function() {
		var ch = $("#zoo option:selected").val()
		if (ch == "") {
			$("#zoo2").html("");
		}
		if (ch == "고양이") {
			$("#zoo2").html('');
			$("#zoo2").append('<option value=></option><option value="노르웨이숲">노르웨이숲</option><option value="데본렉스">데본렉스</option><option value="라가머핀">라가머핀</option><option value="라팜">라팜</option><option value="랙돌">랙돌</option><option value="러시안블루">러시안블루</option>');
			$("#zoo2").append("<option value='라이코이'>라이코이</option><option value='맹크스'>맹크스</option><option value='메인쿤'>메인쿤</option><option value='민스킨'>민스킨</option><option value='먼치킨(고양이)'>먼치킨(고양이)</option><option value='발리네즈'>발리네즈</option>");
			$("#zoo2").append("<option value='버만'>버만</option><option value='버미즈'>버미즈</option><option value='봄베이'>봄베이</option><option value='브리티시 쇼트헤어'>브리티시 쇼트헤어</option><option value='브리티시 롱 헤어'>브리티시 롱 헤어</option><option value='시베리아'>시베리아</option>");
			$("#zoo2").append("<option value='샴'>샴</option><option value='샤트룩스'>샤트룩스</option><option value='셀커크 렉스'>셀커크 렉스</option><option value='소말리'>소말리</option><option value='스코티시 폴드'>스코티시 폴드</option><option value='스핑크스'>스핑크스</option><option value='싱가퓨라'>싱가퓨라</option>");
			$("#zoo2").append("<option value='스노우슈'>스노우슈</option><option value='아메리칸 밥테일'>아메리칸 밥테일</option><option value='아메리칸 쇼트헤어'>아메리칸 쇼트헤어</option><option value='아메리칸 와이어헤어'>아메리칸 와이어헤어</option><option value='아메리칸 컬'>아메리칸 컬v</option><option value='아비시니아'>아비시니아</option>");
			$("#zoo2").append("<option value='오리엔탈'>오리엔탈</option><option value='오시캣'>오시캣</option><option value='유러피안버미즈'>유러피안버미즈</option><option value='이그저틱'>이그저틱</option><option value='이집션마우'>이집션마우</option><option value='엑조틱 쇼트헤어'>엑조틱 쇼트헤어</option>");

		}
		if (ch == "개") {
			$("#zoo2").html('');
			$("#zoo2").append("<option value=></option><option value='불독'>불독</option><option value='고든 세터'>고든 세터</option><option value='골든 리트리버'>골든 리트리버</option><option value='그레이트 데인'>그레이트 데인</option><option value='네오폴리탄 마스티프'>네오폴리탄 마스티프</option><option value='노르웨이안 부훈트'>노르웨이안 부훈트</option>");
			$("#zoo2").append("<option value='노르웨이 엘크 하운드'>노르웨이 엘크 하운드</option><option value='닥스훈트'>닥스훈트</option><option value='달마시안'>달마시안</option><option value='댄디 딘몬트 테리어'>댄디 딘몬트 테리어</option><option value='라사압소'>라사압소</option><option value='라포니안 허더'>라포니안 허더</option><option value='래브라도 레트리버'>래브라도 레트리버</option>");
			$("#zoo2").append("<option value='마스티프'>마스티프</option><option value='맨체스터 테리어'>'맨체스터 테리어</option><option value='몰티즈'>몰티즈</option><option value='바센지'>바센지</option><option value='바셋 하운드'>바셋 하운드</option><option value='버니즈 마운틴 도그'>버니즈 마운틴 도그</option><option value='사모예드'>사모예드</option><option value='살루키'>살루키</option><option value='삽살개'>삽살개</option><option value='아나톨리아 셰퍼드'>아나톨리아 셰퍼드</option><option value='아메리칸 스태퍼드셔 테리어'>아메리칸 스태퍼드셔 테리어</option>");
			$("#zoo2").append("<option value='아메리칸 아키다'>아메리칸 아키다</option><option value='자이언트 슈나우저'>자이언트 슈나우저</option><option value='재퍼니스 친'>재퍼니스 친</option><option value='저먼 셰퍼드'>저먼 셰퍼드</option><option value='차우차우'>차우차우</option><option value='차이니스 샤페이'>차이니스 샤페이</option><option value='차이니스 크레스티드'>차이니스 크레스티드</option><option value='카디건 웰시 코기'>카디건 웰시 코기</option><option value='카발리에 킹 찰스 스패니얼'>카발리에 킹 찰스 스패니얼</option><option value='컬리코티드 레트리버'>컬리코티드 레트리버</option>");
			$("#zoo2").append("<option value='토이 폭스 테리어'>토이 폭스 테리어</option><option value='티베탄 마스티프'>티베탄 마스티프</option><option value='티베탄 스패니얼'>티베탄 스패니얼</option><option value='파라오 하운드'>파라오 하운드</option><option value='파슨 러셀 테리어'>파슨 러셀 테리어</option><option value='파피용'>파피용</option><option value='해리어'>해리어</option><option value='허배너스'>허배너스</option><option value='휘핏'>휘핏</option>");		
		}
		if (ch == "기타") {
			$("#zoo2").html('');
			$("#zoo2").append("<option value=></option><option value='아르마딜로'>아르마딜로</option><option value='앵무새'>앵무새</option><option value='토끼'>토끼</option><option value='햄스터'>햄스터</option><option value='뱀'>뱀</option>");

		}

	});
    
    
    
    
	$('#enrollment').click(function() {
		var charge =$("#charge").val();
		
		
		if (reg == false) {
			alert("동물등록번호를 확인해주세요.");
			return;
		}
		if(!charge){
			alert("무료는 0으로 입력해주세요");
			return;
		}	
		if(charge==0){
			$("#charge").val("무료");
		}		
			document.insert.submit();
			alert("분양글을 등록하셨습니다.")
			self.close();
			window.opener.location.reload();
		
		

		});
		
    
	
    
    
  });
</script>
</html>
