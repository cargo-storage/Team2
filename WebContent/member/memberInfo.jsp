<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
			<div class="row p-5 rounded">
				<div class="col-sm-9 col-lg-6 mt-0 ml-auto mr-auto">
		            <div class="col-md-7 col-sm-9 mx-auto text-center mb-5">
		                <span class="text-muted text-uppercase">INFORMATION</span>
		                <h2 class="display-4">내 정보 확인</h2>
		                <p class="lead"><a href="${contextPath }/me/modifyMember.me">내 정보 수정하기  <i class="fas fa-arrow-alt-circle-right"></i></a></p>
					</div>
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="email" class="form-control" id="email" name="email" value="${sessionScope.mdto.email }" readonly>
						<span id="emailErr" class="help-block"></span>
					</div>
					<div class="form-group">
						<label for="name">성명</label>
						<input type="text" class="form-control" id="name" name="name" value="${sessionScope.mdto.name }">
						<span id="nameErr" class="help-block"></span>
					</div>
					<div class="form-group">
						<label for="phone">휴대폰 번호</label>
						<input type="tel" class="form-control" id="phone" name="phone" value="${sessionScope.mdto.phone }">
						<span id="phoneErr" class="help-block"></span>
					</div>
					<div class="form-group">
						<label for="detailAddr">집 주소</label>
						<div style="width:100%; margin-bottom: 5px;">
							<input type="text" id="postCode" name="postCode" class="post" value="${sessionScope.mdto.postCode }" readonly>
							<input type="button" onclick="execPostcode()" class="post_btn" value="우편번호 찾기">
						</div>
						<div style="width:100%; margin-bottom: 5px;">
							<input type="text" id="roadAddr" name="roadAddr" class="post post1" value="${sessionScope.mdto.roadAddr }" readonly>
						</div>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="detailAddr" name="detailAddr" class="post post1" value="${sessionScope.mdto.detailAddr }">
						<span id="addrErr" class="help-block clear"></span>	
					</div>
				</div>						
			</div>
		</div>

</body>
</html>