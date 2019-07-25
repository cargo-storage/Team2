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
	
	<!-- Bootstrap CSS / Color Scheme -->
    <link rel="stylesheet" href="${contextPath }/css/default.css" id="theme-color">
    
	<!-- font-awesome CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css">
	<link href="${contextPath }/css/font.css" rel="stylesheet">
	
	<!-- jquery.js -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- Page level plugin CSS -->
	<link href="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link href="${contextPath}/vendor/datatables/select.bootstrap4.min.css" rel="stylesheet">
	
	<style>
		section{
		margin-top: 83px;
		}
		#sidebar{
			background-color: #f8f9fa;
			height: 1000px;
		}
		ul{
			list-style: none;
		}
		
		ul li{
			font-size: 20px;
		}
		
		@media(max-width: 1489px){
			#sidebar{
				display: none;
			}
		}
		
		#sidebar ul li a{
			color: darkslategrey;
		}
		
		#sidebar ul li a:HOVER{
			color: #00953e;
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
</head>
<body>
	
<jsp:include page="../inc/header.jsp"/>

<c:set var="content" value="${param.content}"/>
		
<c:if test="${content eq null}">
	<c:set var="content" value="memberInfo.jsp"/>
</c:if>
<c:if test="${content eq 'leave' }">
	<c:set var="content" value="leaveMember.jsp"/>
</c:if> 
<c:choose>   
	<c:when test="${sessionScope.mdto.email==null }">
		<script type="text/javascript">
			alert("로그인 후 이용 가능합니다.");
			location.href="${contextPath}/co/login.go"
		</script>
	</c:when>
</c:choose>
<section>
	<div class="container-fuild">
		<div class="row">
			<div class="col-sm-2 rounded p-5 text-center" id="sidebar">
				<ul class="p-0">
					<span class="text-muted text-uppercase">MY PAGE</span>
					<h1 class="mb-4">마이페이지</h1>
					<li class="m-2"><a href="${contextPath }/me/mypage?category=info"><h4><i class="fas fa-user-circle"></i> 내 정보</a></h4></li>
					<li class="m-2"><a href="${contextPath }/me/memberStatus?category=status"><h4><i class="fas fa-warehouse"></i> 사용 현황</a></h4></li>
					<li class="m-2"><a href="${contextPath }/me/memberStatus?category=reservation"><h4><i class="far fa-calendar-alt"></i> 예약 현황</a></h4></li>
					<li class="m-2"><a href="${contextPath }/me/mypage?category=leave"><h4><i class="fas fa-cut"></i> 회원 탈퇴</a></h4></li>
				</ul>
			</div>
			<div class="col-sm-10 mr-auto ml-auto" id="content">
				 <jsp:include page="${content }"/> 
			</div>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>

	
	<!-- Bootstrap core JavaScript-->
	<script src="${contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="${contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${contextPath}/js/sb-admin.js"></script>

	<!-- Demo scripts for this page-->
	<script src="${contextPath}/js/datatables-custom.js"></script>
</body>
</html>