<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외처리</title>
<script>



      function window_onload(){

         setTimeout('go_url()',5000)

      }

      function go_url(){

         location.href="<c:url value="/main"/>"  

      }



  </script>


</head>
<body onload="javascript:window_onload()">
<div style="text-align: center;">
<h3>서비스에 불편을 드려 죄송합니다. 최대한 빨리 해결하도록 노력하겠습니다.</h3><br/>
<img  src="<c:url value="/img/error.jpg"/>"><br/>
<h3>5초후에 메인페이지로 이동합니다.</h3>
</div>


</body>
</html>