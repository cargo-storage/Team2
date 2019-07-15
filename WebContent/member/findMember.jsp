<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("utf-8"); %>  

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>TEAM2 WAREHOUSE RESERVATION</title>
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<!--Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	
	<!--vendors styles-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
	
	<!-- Bootstrap CSS / Color Scheme -->
	<link rel="stylesheet" href="${contextPath }/css/default.css" id="theme-color">
	<!-- font-awesome CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css">
	<link href="${contextPath }/css/font.css" rel="stylesheet">
	
	<!-- jquery.js -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- bootstrap.min.js -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<style>
		/* Style the tab */
		.tab {
		  overflow: hidden;
		  border: 1px solid #ccc;
		  background-color: #f1f1f1;
		}
		
		/* Style the buttons inside the tab */
		.tab button {
		  background-color: inherit;
		  float: left;
		  border: none;
		  outline: none;
		  cursor: pointer;
		  padding: 14px 16px;
		  transition: 0.3s;
		  font-size: 17px;
		  border-top: 5px solid #f1f1f1;
		}
		
		/* Change background color of buttons on hover */
		.tab button:hover {
		  background-color: #ddd;
		  border-top: 5px solid #ddd;
		}
		
		/* Create an active/current tablink class */
		.tab button.active {
		  border-top: 5px solid #00c583;
		}
		
		/* Style the tab content */
		.tabcontent {
		  padding: 20px 26px;
		  border: 1px solid #ccc;
		  border-top: none;
		}
		
		.help-block {
			color: red;
			font-size: 12px;
		}
	</style>	
	<script type="text/javascript">
		$(function(){			
			//이름 확인
			$("#name").blur(function(){
				var name = $(this).val();
				var reg = /^[가-힣]{2,5}$/;
				if(!reg.test(name)){
					$("#nameErr").text("정확한 이름을 입력하세요.");
				}else{ $("#nameErr").text(''); }
			});
			
			//휴대폰 확인
			$("#phone").blur(function(){
				var phone = $(this).val();
				var reg = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
				if(!reg.test(phone)){
					$("#phoneErr").text("양식에 맞는 휴대폰 번호를 입력하세요");
				}else{ $("#phoneErr").text(''); }
			});
			
			//이메일 확인
			$("#email").blur(function(){
				var email = $(this).val();
				var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if(!reg.test(email)){
					$("#emailErr").text("이메일 형식이 맞지 않습니다.");
				}
			});
		});
		
		function emailSearch(){
			var name = $("#name").val();
			var phone = $("#phone").val();
			
			if(name ==''){
				$("#nameErr").text("필수 입력 사항입니다.");
			}
			else if(phone ==''){
				$("#phoneErr").text("필수 입력 사항입니다.");
			}
			else if($("#nameErr").text()!='' || $("#phoneErr").text()!=''){
				alert("오류 사항을 확인 후 다시 입력해주세요.");
				return false;
			}
		}
		
		function pwdSearch(){
			var email = $("#email").val();
			if(email==''){
				$("#emailErr").text("이메일을 입력해주세요.");
			}else if($("#emailErr").text()!=''){
				alert("오류 사항을 확인 후 다시 입력해주세요.");
				return false;
			}else{
				$.ajax({
					type: "post",
					async: false,
					url: "${contextPath}/me/pwdSearch.me",
					data: {email: email},
					success: function(data){ // 0: 실패, 1: 성공, -1: 이메일은 존재하나 메일 발송에 실패한 경우
						if(data == 0){
							alert("해당 이메일로 등록된 회원이 없습니다.");
						}else if(data == -1){
							alert("임시 비밀번호 발급에 실패했습니다. \n다시 시도해주시기 바랍니다.");
						}else{
							alert(email+"로 임시 비밀번호를 발급했습니다. \n다시 로그인 해주시기 바랍니다.");
							location.href="${contextPath}/index.jsp";
						}
					},
					error: function(){
						alert("서버 내부 에러가 발생했습니다.");
					}
				});
			}	
		}
	</script>
</head>

<body class="bg-light">

<!--navigation in page-->
<%@include file="../inc/header.jsp" %>
<div class="container">
	<div class="col-sm-9 col-lg-6" style="margin: 150px auto 0;">
			<h1 class="text-center">회원 정보 찾기</h1><br><br>
			<c:if test="${param.find eq 'email' }">
			<div class="tab">
				<button class="tablinks active" onclick="location.href='${contextPath}/member/findMember.jsp?find=email'">이메일 찾기</button>
				<button class="tablinks" onclick="location.href='${contextPath}/member/findMember.jsp?find=pwd'">비밀번호 찾기</button>
			</div>
			<div id="emailSearch" class="tabcontent">
			<c:choose>
				<c:when test="${empty requestScope.emailList }">
				<div id="emailSearchShow">
					<p class="text-center font-weight-bold small">- <mark class="text-danger">이름</mark>과 <mark class="text-danger">전화번호</mark>를 통해 이메일을 찾을 수 있습니다 -</p>
					<form action="${contextPath }/me/emailSearch.me" method="post" onsubmit="return emailSearch()">
						<div class="form-group">
							<label for="name">이름</label>
							<input type="text" class="form-control" id="name" name="name" placeholder="NAME">
							<span id="nameErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="phone">휴대폰 번호<span class="help-block">(010-1234-1234 형식)</span></label>
							<input type="text" class="form-control" id="phone" name="phone" placeholder="PHONE(010-1234-1234 형식)">
							<span id="phoneErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<button class="btn btn-primary btn-block btn-lg mt-5">이메일 찾기</button>
						</div>
					</form>
				</div>
				</c:when>
				<c:otherwise>
					<div id="emailSearchResult">
						<h5 class="text-center font-weight-bold mt-3"><c:out value="${requestScope.emailList.list[0].name }"/>회원님의 이메일 주소</h5>
						<div class="text-center" id="memberEmailList">
						<c:set var="startNum" value="0"/>
						<c:forEach var="i" items="${requestScope.emailList.list }">
							<c:set var="startNum" value="${startNum+1 }"/>
							<span class="text-center font-weight-bold mr-4"><span id="memberEmail"><c:out value="${startNum }"/>. <c:out value="${i.email }"/></span></span>
							<span class="text-center text-danger">가입날짜: <span id="memberReg_date"><c:out value="${i.reg_date }"/></span></span><br>
						</c:forEach>
						<a href="${contextPath }/index.jsp" class="btn btn-primary btn-block btn-lg mt-3">로그인 하러 가기</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
			</c:if>
			<c:if test="${param.find eq 'pwd' }">
			<div class="tab">
				<button class="tablinks" onclick="location.href='${contextPath}/member/findMember.jsp?find=email'">이메일 찾기</button>
				<button class="tablinks active" onclick="location.href='${contextPath}/member/findMember.jsp?find=pwd'">비밀번호 찾기</button>
			</div>		
			<div id="pwdSearch" class="tabcontent">
			  <p class="text-center font-weight-bold small">- <mark class="text-danger">이메일</mark>을 통해 임시 비밀번호를 보내드립니다 - </p>
			  <div class="form-group">
			  	<label for="email">이메일</label>
			  	<input type="text" class="form-control" id="email" placeholder="EMAIL">
			  	<span id="pwdSearchErr" class="help-block"></span>
			  </div>
			  <div class="form-group">
					<input type="button" class="btn btn-primary btn-block btn-lg mt-5" onclick="pwdSearch()" value="임시 비밀번호 발송">
				</div>
			</div>
			</c:if>
		</div>
	</div>
    
	


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
</body>
</html>