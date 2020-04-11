<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양동물 정보 </title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
  
<body>
<c:forEach items="${petInfo}" var="info" varStatus="status">
<input type="hidden" id="MPNO" name = "MPNO" value='<c:out value="${info.MPNO}"/>'/>
<input type="hidden" id="PCWRITER" name = "PCWRITER" value="${authInfo.id}"/>
<table border="1">
<tr>
<td>${info.MPID}  </td> <td>${info.MPTITLE}</td>
</tr>
<tr>
<td>${info.MPDIVISION}</td> <td>${info.MPKIND}</td><td>${info.MPSIZE}</td><td>${info.MPGENDER}</td>
<td>${info.MPDEPOSIT}</td>
</tr>

<tr>
<td>${info.MPNEUTRAL}</td> <td>${info.MPTIME}</td>
</tr>
</c:forEach>
<tr>
</tr>

<tr>
<c:forEach items="${multiPic}" var="pic" varStatus="loop">
<td><img src="<c:url value='/upload/${pic.PFILENAME}'/>" width="130px" height="130px" />
</td>
</c:forEach>
<c:forEach items="${petInfo}" var="info" varStatus="status">
<td>
${info.MPCONTENT}
</td>
</c:forEach>
</tr>
<table class="board_view" id="comment_table">
		
		<tbody id="reply_list">
		
		</tbody>
		<tr>
		<td><input type="button" value="더보기" onclick="fn_viewComment()"></td>
		</tr>
			
		
	</table>	
  			<script>
  				$(document).ready(function(){				
  					 page=0;
  					 
  					 $("#ADOPTION").click(function(){	
  						 var num=$("#MPNO").val();  						
  						 window.open("${pageContext.request.contextPath}/ParcelOut/adoption/num="+num);
  					
  						 
  					 });
  					 
  					 
  					 
 				
  					$("#comment_btn").unbind("click").click(function(e){
  						e.preventDefault();
  						fn_insertComment();
  					});
  				
  				if($("reply_list").children().length < 1)
  					{
  					fn_viewComment();
  					}
  					});
  				
  				function fn_insertComment(){
  					var PCWRITER=$("#PCWRITER").val();  					
  					$.ajax({
  						type :"post",
  						url: "${pageContext.request.contextPath}/ParcelOut/bbs/insertComment",
  						data :{
  							MPNO : $("#MPNO").val(),		
  							PCCONTENTS : $("#PCCONTENTS").val(),	
  							PCWRITER : PCWRITER							
  						},
  						error : function(error){
  							alert("에러1");						
  						},
  						success : function(data){											
  							$("#PCCONTENTS").val("");
  							fn_viewComment(); 						
  							} 															
  					});
  					
  				}
  									
  					function fn_viewComment(){											
  						page+=5 						 						
  						$.ajax({
  							type :"post",
  							url : "${pageContext.request.contextPath}/ParcelOut/bbs/viewComment",
  							data : {
  								MPNO : "${MPNO}",
  								page : page
  							},
  							success : function(data){  								
  								$("#reply_list").children().remove();
  								
  								$(data).each(function(i){
  									var str="<tr>"
  	  								/* +"<td>"+data[i].PCNUM+"</td>"  */
  									+"<td>"+data[i].PCWRITER+"</td>"
  									+ "<td>" + data[i].PCCONTENTS +"</td>"
  									+"<td>"+data[i].PCTIME+"<tr>"									
  									$("#reply_list").append(str);
  								
  									
								});	  								
  								
  							},error:function(request,status,error){
  								alert('code='+request.status+"message"+ request.responseText + " error = " + error);
  							},
  							complete : function(data){
  								
  							}
  							
  						});
				
  					}
 
		
			</script>
			
			

</body>
</html>