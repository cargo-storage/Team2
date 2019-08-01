<%@page import="cargo.common.DTO.MemberDTO"%>
<%@page import="cargo.member.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	MemberDAO mdao = new MemberDAO();
	int state = mdao.LoginMember(email, pwd);
	
	if(state==1){
		MemberDTO mdto = mdao.getMember(email);
		if(mdto.getAdmin() == 1)
			state = 4; //회원이면서 관리자일 경우 state=4
	}
	
	out.print(state);

%>