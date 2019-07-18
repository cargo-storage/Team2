<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>MY PAGE - TEAM2 WAREHOUSE</title>
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<!--Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	
	<!-- Bootstrap CSS / Color Scheme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath }/css/default.css" id="theme-color">
	<!-- font-awesome CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css">
	<link href="${contextPath }/css/font.css" rel="stylesheet">
	
	<!-- jquery.js -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<style>
	
		.background{
			background-color: rgba( 255, 255, 255, 0.9);
		}
		.post {
			height: calc(1.5em + .75rem + 2px);
			padding: .375rem .75rem;
			font-weight: 400;
			line-height: 1.5;
			color: #495057;
			background-color: #fff;
			background-clip: padding-box;
			border: 1px solid #ced4da;
			border-radius: .25rem;
			transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
		}
		
		.post_btn{
			height: calc(1.5em + .75rem + 2px);
			padding: .375rem .75rem;
		}
		
		.post1 {
			width: 100%;
		}
	</style>
	<script type="text/javascript">
		alert(${contextPath});
	</script>
	<!-- Page level plugin CSS-->
<link href="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body>
	<%-- <c:choose>   
		<c:when test="${sessionScope.mdto.email==null }">
			<script type="text/javascript">
				alert("로그인 후 이용 가능합니다.");
				history.back();
			</script>
		</c:when>
	</c:choose> --%>
<jsp:include page="../inc/header.jsp"/>

<c:set var="content" value="${param.content}"/>
		
<c:if test="${content eq null}">
	<c:set var="content" value="memberInfo.jsp"/>
</c:if>
<c:if test="${content eq 'leave' }">
	<c:set var="content" value="leaveMember.jsp"/>
</c:if> 
<section class="py-7">
	<div class="container-fuild">
		<div class="row">
			<div class="col-sm-2" id="sidebar">
				<ul>
					<h2><i class="fas fa-user-cog"></i> 마이페이지</h2>
					<li><a href="${contextPath }/member/mypage.jsp">내 정보</a></li>
					<li><a href="${contextPath }/me/memberList.me?category=status">사용 내역</a></li>
					<li><a href="${contextPath }/me/memberList.me?category=reservation">예약 현황</a></li>
					<li><a href="${contextPath }/member/mypage.jsp?content=leave">회원 탈퇴</a></li>
					
				</ul>
			</div>
			<div class="col-sm-10" id="content">
				 <jsp:include page="${content }"/> 
			</div>
		</div>
	</div>
</section>
</body>
</html>