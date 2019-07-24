<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="../index.jsp">TEAM2 WAREHOUSE</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow mx-1">
				<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
					<i class="fas fa-bell fa-fw"></i> 
					<span class="badge badge-danger">9+</span>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
					<a class="dropdown-item" href="#">Action</a>
					<a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
			</li>
			<li class="nav-item dropdown no-arrow mx-1">
				<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
					<i class="fas fa-envelope fa-fw"></i> 
					<span class="badge badge-danger">7</span>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
					<a class="dropdown-item" href="#">Action</a> 
					<a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
			</li>
			<li class="nav-item dropdown no-arrow">
				<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-user-circle fa-fw"></i>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a>
					<a class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Logout</a>
				</div>
			</li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="${contextPath}/ad/admin_main">
					<i class="fas fa-fw fa-user-cog"></i>&nbsp;&nbsp;&nbsp;<span>관리자 종합 메뉴</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="admin-start.jsp"
				id="listTables" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-table"></i> <span>상세 관리</span>
				</a>
				<div class="dropdown-menu" aria-labelledby="listTables">
					<h6 class="dropdown-header">창고 :</h6>
						<a class="dropdown-item" href="${contextPath}/ad/listTables?category=items">창고 현황 관리</a> 
						<a class="dropdown-item" href="${contextPath}/ad/overdue_admin">연체 관리</a>
						<br>
					<h6 class="dropdown-header">예약 :</h6>
						<a class="dropdown-item" href="${contextPath}/ad/listTables?category=reservation">예약 내역 관리</a>
						<br>
					<h6 class="dropdown-header">종료 :</h6>
						<a class="dropdown-item" href="${contextPath}/ad/listTables?category=closed">종료된 보관 기록 열람</a>
						<br>
					<h6 class="dropdown-header">회원 :</h6>
						<a class="dropdown-item" href="${contextPath}/ad/member_admin">회원 정보 관리</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-folder"></i> <span>Pages</span>
				</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Login Screens:</h6>
						<a class="dropdown-item" href="login.html">Login</a>
						<a class="dropdown-item" href="register.html">Register</a>
						<a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
						<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Other Pages:</h6>
						<a class="dropdown-item" href="404.html">404 Page</a>
						<a class="dropdown-item" href="blank.html">Blank Page</a>
				</div>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
				</a>
			</li>
			
		</ul>
		