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
		}
		
		/* Change background color of buttons on hover */
		.tab button:hover {
		  background-color: #ddd;
		}
		
		/* Create an active/current tablink class */
		.tab button.active {
		  background-color: #ccc;
		}
		
		/* Style the tab content */
		.tabcontent {
		  display: none;
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
			$("#emailSearchResult").hide();
			
			//이름 확인
			$("#name").blur(function(){
				var name = $(this).val();
				if(name ==''){
					$("#nameErr").text("필수 입력 사항입니다.");
				}else{
					var reg = /^[가-힣]{2,5}$/;
					if(!reg.test(name)){
						$("#nameErr").text("정확한 이름을 입력하세요.");
					}else{ $("#nameErr").text(''); }
				}
			});
			
			//휴대폰 확인
			$("#phone").blur(function(){
				var phone = $(this).val();
				if(phone ==''){
					$("#phoneErr").text("필수 입력 사항입니다.");
				}else{ 
					var reg = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
					if(!reg.test(phone)){
						$("#phoneErr").text("양식에 맞는 휴대폰 번호를 입력하세요");
					}else{ $("#phoneErr").text(''); }
				}
			});
			
		});
		
		function emailSearch(){
			var name = $("#name").val();
			var phone = $("#phone").val();
			
			if(name==''){
				alert("이름을 입력해주세요.");
			}else if(phone==''){
				alert("휴대폰 번호를 입력해주세요.");
			}else if($("#nameErr").text()!='' || $("#phoneErr").text()!=''){
				alert("오류 사항을 확인 후 다시 입력해주세요.");
			}else{
				$.ajax({
					type: "post",
					async: false,
					url: "${contextPath}/me/emailSearch.me",
					data: {name: name, phone: phone},
					dataType: 'text',
					success: function(data){
						alert(data);
						if(data == 0){
							alert("조건에 일치하는 회원이 없습니다.");
						}else{
							$("#emailSearchShow").hide();
							$("#emailSearchResult").show();
						}
					},
					error: function() {
				        alert("서버 내부 오류가 발생했습니다.");
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
			<div class="tab">
			  <button class="tablinks" id="emailTab" onclick="openFrom(event, 'emailSearch')">이메일 찾기</button>
			  <button class="tablinks" id="pwdTab"onclick="openFrom(event, 'pwdSearch')">비밀번호 찾기</button>
			</div>
			
			
			<div id="emailSearch" class="tabcontent">
				<div id="emailSearchShow">
					<p class="text-center font-weight-bold small">- <mark class="text-danger">이름</mark>과 <mark class="text-danger">전화번호</mark>를 통해 이메일을 찾을 수 있습니다 -</p>
					<div class="form-group">
						<label for="name">이름</label>
						<input type="text" class="form-control" id="name" placeholder="NAME">
						<span id="nameErr" class="help-block"></span>
					</div>
					<div class="form-group">
						<label for="phone">휴대폰 번호<span class="help-block">(010-1234-1234 형식)</span></label>
						<input type="text" class="form-control" id="phone" placeholder="PHONE(010-1234-1234 형식)">
						<span id="phoneErr" class="help-block"></span>
					</div>
					<div class="form-group">
						<input type="button" class="btn btn-primary btn-block btn-lg mt-5" onclick="emailSearch()" value="이메일 찾기">
					</div>
				</div>
				<div id="emailSearchResult">
					<h5 class="text-center font-weight-bold mt-3"><c:out value="${sessionScope.emailList.list[0].name }"/>회원님의 이메일 주소</h5>
					<div class="text-center" id="memberEmailList">
					<c:set var="startNum" value="0"/>
					<c:forEach var="i" items="${sessionScope.emailList.list }">
						<c:set var="startNum" value="${startNum+1 }"/>
						<span class="text-center font-weight-bold mr-4"><span id="memberEmail"><c:out value="${startNum }"/>. <c:out value="${i.email }"/></span></span>
						<span class="text-center text-danger">가입날짜: <span id="memberReg_date"><c:out value="${i.reg_date }"/></span></span><br>
					</c:forEach>
					<a href="${contextPath }/index.jsp" class="btn btn-primary btn-block btn-lg mt-3">로그인 하러 가기</a>
					</div>
				</div>
			</div>			
			<div id="pwdSearch" class="tabcontent">
			  <p class="text-center font-weight-bold small">- <mark class="text-danger">이메일</mark>을 통해 임시 비밀번호를 보내드립니다 - </p>
			  <div class="form-group">
			  	<label for="email">이메일</label>
			  	<input type="text" class="form-control" id="email" placeholder="EMAIL">
			  	<span id="pwdSearchErr" class="help-block"></span>
			  </div>
			  <div class="form-group">
					<input type="button" class="btn btn-primary btn-block btn-lg mt-5" onclick="emailSearch()" value="임시 비밀번호 발송">
				</div>
			</div>
			
			<script>
			function openFrom(evt, target) {
			  var i, tabcontent, tablinks;
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none";
			  }
			  tablinks = document.getElementsByClassName("tablinks");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }
			  document.getElementById(target).style.display = "block";
			  evt.currentTarget.className += " active";
			}
			document.getElementById("defaultOpen").click();
			</script>
		</div>
	</div>
    
	


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script src="js/scripts.js"></script>
</body>
</html>