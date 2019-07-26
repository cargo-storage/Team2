<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Lambda - Free Bootstrap 4 Multipurpose Landing Page Template</title>
        <meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 

        <!--Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

        <!--vendors styles-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">

        <!-- Bootstrap CSS / Color Scheme -->
        <link rel="stylesheet" href="../css/default.css" id="theme-color">
        <!-- font-awesome CSS -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <style>
           
   #page-wrapper {
    padding-left: 250px;
     padding-top: 83px;
     background-color: #999;
   }
  
  #sidebar-wrapper {
    position: fixed;
    width: 200px;
    height: 100%;
    margin-left: -250px;
    background: white;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 200px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #399;
  }
  
  .sidebar-nav li a:hover {
    color: #ff6600;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
 
  }
  .hr1 {
    border: 0;
    height: 1px;
    background: #ccc;
  }
  .hr2 {
    border: 0;
    height: 3px;
    background: #ccc;
  }
     
   </style>

           <jsp:include page="../inc/header.jsp"></jsp:include>
    </head>
    <body data-spy="scroll" data-target="#lambda-navbar" data-offset="0">


<!-- 왼쪽메뉴 -->
<nav id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="CustomerSupport.jsp">고객지원</a>
      </li>
      <li><a href="${contextPath}/bo/NoticeListAction.bo">공지사항</a></li>
      <li><a href="${contextPath}/bo/FAQ.bo">자주하는 질문</a></li>
      <li><a href="${contextPath}/bo/QuestionListAction.bo">문의 하기</a></li>
      <li><a href="#">1:1 실시간 상담</a></li>
      <li><a href="ViewMap.jsp">오시는 길</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->
</nav>
<!-- 왼쪽메뉴 -->

      <div class="container">
   <h1 align="center">공지사항</h1>
     <table class="table">
        <tbody>
     		<div><h3>${bnDTO.subject}</h3>
     		
			<div> ${bnDTO.name} <span> &nbsp;&nbsp;&nbsp;&nbsp;${bnDTO.date}</span></div>
			<hr class="hr1">
			<br>
			<div>${bnDTO.content}</div>
			<br>
			<hr class="hr2">
			</div>
		</tbody>
   </table>
      <div align="right">
      <c:if test="${bnDTO.email == sessionScope.mdto.email || sessionScope.mdto.admin==1}" >
         <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/bo/NoticeModifyFormAction.bo?no=${bnDTO.no}&email=${bnDTO.email}">수정</a>
         
         <a class="btn btn-primary btn-sm" id="del" href="${pageContext.request.contextPath}/bo/NoticeDelAction.bo?no=${bnDTO.no}&email=${bnDTO.email}">삭제</a>
      </c:if>
         <a class="btn btn-primary btn-sm" href="${contextPath}/bo/NoticeListAction.bo">목록</a>
      </div>
</div>

     
<jsp:include page="../inc/footer.jsp"></jsp:include>


        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>