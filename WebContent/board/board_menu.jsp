<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
    
<!DOCTYPE html>

<%-- <!-- 왼쪽메뉴 -->
<nav id="page-wrapper">
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand"><b>고객지원</b></li>
      <li><a href="${contextPath}/bo/NoticeListAction.bo">공지사항</a></li>
      <li><a href="${contextPath}/bo/FAQ.bo">자주하는 질문</a></li>
      <li><a href="${contextPath}/bo/QuestionListAction.bo">문의 하기</a></li>
      <li><a href="#">1:1 실시간 상담</a></li>
      <li><a href="${contextPath}/bo/ViewMap.bo">오시는 길</a></li>
    </ul>
  </div>
</nav>
 --%>

<div class="col-sm-2 rounded p-5 text-center" id="sidebar">
	<ul class="p-0">
			<span class="text-muted text-uppercase">customer</span>
			<h1 class="mb-4">고객지원</h1>
		<li class="m-2"><h4><a href="${contextPath}/bo/NoticeListAction.bo">공지사항</a></h4></li>
		<li class="m-2"><h4><a href="${contextPath}/bo/FAQ.bo">자주하는 질문</a></h4></li>
		<li class="m-2"><h4><a href="${contextPath}/bo/QuestionListAction.bo">문의하기</a></h4></li>
		<li class="m-2"><h4><a href="#">1:1 실시간 상담</a></h4></h4></li>
		<li class="m-2"><h4><a href="${contextPath}/bo/ViewMap.bo">오시는 길</a></h4></li>
	</ul>
</div>
