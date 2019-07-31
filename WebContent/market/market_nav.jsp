<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE>
		<div class="navbar navbar-expand-md navbar-dark navbar-transparent fixed-top sticky-navigation " id="uppernav">
		<div class="container">	
			<a class="logosm" href="../index.jsp">T2 <i class="fas fa-warehouse"></i></a>
	       <button class="navbar-toggler navbar-toggler-right border-0 collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
	           <line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
	       </button>
	       <div class="navbar-collapse collapse" id="navbarCollapse" style="">
	           <ul class="uppernav navbar-nav ml-auto">
	               <li class="nav-item">
<!-- 	                   <a class="nav-link" href="#company">회사소개</a> -->
	               </li>
	               <li class="nav-item">
<!-- 	                   <a class="nav-link" href="#houseinfo">이용안내</a> -->
	               </li>
	               <li class="nav-item">
	                   <a class="nav-link" href="${contextPath }/mk/market.do">MARKET HOME</a>
	               </li>
	               <li class="nav-item">
	                   <a class="nav-link" href="${contextPath }/mk/cart.do">장바구니</a>
	               </li>
	        <c:set var="email" value="${sessionScope.mdto.email }"/>
          	<c:set var="name" value="${sessionScope.mdto.name }"/>
          	<c:set var="admin" value="${sessionScope.mdto.admin }"/>
          		<c:if test="${admin == 1 }">
	        		<li class="nav-item">
	                	<a class="nav-link" href="${contextPath }/mk/uploaditem.do">게시글등록<small>(관리자)</small></a>
	            	</li> 
	            	<li class="nav-item">
	                	<a class="nav-link" href="${contextPath}/mk/show_items.do">물건등록<small>(관리자)</small></a>
	            	</li>
            	</c:if>
            	<c:choose>
               	<c:when test="${email != null }">
	               	<li class="nav-item">         
	              		<a href="${contextPath }/me/logout.me" class="nav-link"><small>로그아웃 <i class="fas fa-arrow-alt-circle-right"></i></small></a>
	              	</li>
               	</c:when>
               	<c:otherwise>
               		<li class="nav-item">
	                   <a class="nav-link" href="">로그인/회원가입</a>
	               </li>
              	</c:otherwise>
       		</c:choose>
	            </ul>
	        </div>
        </div>
	</div>