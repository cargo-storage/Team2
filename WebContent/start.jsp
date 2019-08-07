<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String login = request.getParameter("login");
	System.out.println(login);
	if(login=="true")	response.sendRedirect("/Team2/co/index.go?login=true");
	else	response.sendRedirect("/Team2/co/index.go");
%>
