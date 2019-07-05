<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("utf-8"); %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

	function showInfo(btn){
		var houseName = btn.value;
		$.ajax({
			type : 'POST',
			url  : '/Team2/reserve/moreInfo',
			data: {house: houseName}, 	
			success: function(data, textStatus){
				var jsonInfo = JSON.parse(data);
				var resInfo = "예약정보<br>"
				for(var i in jsonInfo.reservations){
					resInfo += jsonInfo.reservations[i].house+"<br>";
					resInfo += jsonInfo.reservations[i].start_day+"<br>";
					resInfo += jsonInfo.reservations[i].end_day+"<br>";
				}
				$("#info").html(resInfo);
			},
			error: function(data, textStatus){
				alert("ERROR!!");
			}
		});
	}
</script>

<style type="text/css">

.button{
	width: 60px;
	height: 60px;	
	border: 0;
}
.notEmpty{
	background-color: #ff3333;
}

</style>

</head>
<body>
<table>

<c:choose>
	<c:when test="${requestScope.hList == null }"><tr><td colspan="5">nothing</td></tr></c:when>
	<c:when test="${hList !=null }">
		<c:set var="i" value="0"/>
		<c:forEach var="hDTO" items="${hList }">
			<c:if test="${i%5==0}">
				<tr>
			</c:if>
			<c:choose>
				<c:when test="${hDTO.isEmpty==1 }">
					<td>
						<input type="button" value="${hDTO.house }" class="button notEmpty" onclick="showInfo(this)">
					</td>
				</c:when>
				<c:when test="${hDTO.isEmpty==0 }">
					<td><input type="button" value="${hDTO.house }" class="button" onclick="showInfo(this)"></td>
				</c:when>
			</c:choose>
			<c:set var="i" value="${i+1 }"/>
		</c:forEach>
	</c:when>
</c:choose>
</table>

<div id="info">

</div>
</body>
</html>