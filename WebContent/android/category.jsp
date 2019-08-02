<%@page import="cargo.admin.DTO.AdminDTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cargo.member.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

   String email = request.getParameter("email");
   String category = request.getParameter("category");
   
   MemberDAO mdao = new MemberDAO();
   ArrayList<AdminDTO> list = mdao.memberStatus("lee@cargo.kr", "status");
   
   JSONArray jList = new JSONArray();
   
   for(AdminDTO adto : list){
      JSONObject obj = new JSONObject();
      
      obj.put("state", adto.getState());
      obj.put("item", adto.getItem());
      obj.put("house", adto.getHouse());
      obj.put("res_day", ""+adto.getRes_day());
      obj.put("start_day", ""+adto.getStart_day());
      obj.put("end_day", ""+adto.getEnd_day());
      obj.put("return_day", ""+adto.getReturn_day());
      obj.put("payment", adto.getPayment());
      obj.put("item_price", adto.getItem_price());
      
      jList.add(obj);

   }
   
   out.print(jList);
%>