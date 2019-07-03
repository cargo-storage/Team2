<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 위, head부분은 공통 form으로 필요할 만한 것 넣었습니다. -->
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<title>Lambda - Free Bootstrap 4 Multipurpose Landing Page Template</title>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<!--Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	
	<!--vendors styles-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
	
	<!-- Bootstrap CSS / Color Scheme -->
	<link rel="stylesheet" href="css/default.css" id="theme-color">
	<!-- font-awesome CSS -->
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
<a href="${contextPath}/ex/Join.ex?go=12">시작하기</a><br>
<p>a태그에 설정된 경로 명: ${contextPath}/ex/Join.ex?go=12</p>
</body>
</html>