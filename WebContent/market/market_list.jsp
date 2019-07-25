<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>

<c:forEach var="bdto" items="${requestScope.boardList }">
<div class="col-md-4">
	<div class="blog-entry ftco-animate">
		
		<a href="${contextPath }/mk/showcontent.do?no=${bdto.no}" class="img"
		style="background-image: url(${contextPath}/market/uploaded/${bdto.image }); background-size: contain;"></a>
		
		<div class="text text-2 pt-2 mt-3">
	         <h3 class="mb-2"><a href="single.html">${bdto.title }</a></h3>
	         <div class="meta-wrap">
				<p class="meta">
	         		<span>${bdto.date}</span>
<%-- 	         		<span><a href="single.html">${bdto.price }</a></span> --%>
<!-- 	         		<span>5 Comment</span> -->
	         	</p>
	        	</div>
	         <p class="mb-4">${bdto.content }</p>
	    </div>
	</div>
</div>
</c:forEach>