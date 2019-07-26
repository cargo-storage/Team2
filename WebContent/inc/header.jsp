<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
       	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css">
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-transparent fixed-top sticky-navigation navbar-light bg-white shadow-bottom" id="lambda-navbar">
        <a class="navbar-brand" href="${contextPath }/index.jsp">
            TEAM2 WAREHOUSE
        </a>
        <button class="navbar-toggler navbar-toggler-right border-0 collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
            <line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
        </button>
        <div class="navbar-collapse collapse" id="navbarCollapse" style="">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="#company">회사소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="${contextPath }/co/information.go">이용안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="${contextPath }/re/info.me?warehouse=A">예약안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="#market">중고장터</a>
                </li>
				<li class="nav-item">
					<a class="nav-link page-scroll" href="#faq">고객지원</a>
				</li>
				<c:set var="email" value="${sessionScope.mdto.email }"/>
	          	<c:set var="name" value="${sessionScope.mdto.name }"/>
	          	<c:set var="admin" value="${sessionScope.mdto.admin }"/>
	         	
				<c:if test="${admin == 1 }">
        		<li class="nav-item">
                	<a class="nav-link page-scroll" href="${contextPath}/ad/admin_main">관리자</a>
            	</li> 
	            </c:if>
               	<c:choose>
               	<c:when test="${email ne null }">
	               	<li class="nav-item dropdown">
				      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">마이페이지</a>
				      <div class="dropdown-menu" id="dropdown-menu">
				        <a class="dropdown-item" href="${contextPath }/me/mypage.me?category=info">내 정보</a>
				        <a class="dropdown-item" href="${contextPath }/me/memberStatus.me?category=status">사용 내역</a>
				        <a class="dropdown-item" href="${contextPath }/me/memberStatus.me?category=reservation">예약 현황</a>
				      </div>
				    </li>               
              		<a href="${contextPath }/me/logout.me" class="btn btn-navbar btn-primary trigger-btn">${name }님 환영합니다. 로그아웃 <i class="fas fa-sign-out-alt"></i></a>
               	</c:when>
               	<c:otherwise>
               		<div class="text-center">
						<a href="${contextPath}/co/login.go" class="btn btn-navbar btn-primary trigger-btn" data-toggle="modal">로그인/회원가입</a>
					</div>
              	</c:otherwise>
       			</c:choose>
              </ul>
        </div>
    </nav>
</body>
</html>
   