<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "market.productshop.master.MenuDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<%
  int menu_id = Integer.parseInt(request.getParameter("menu_id"));
  String menu_kind = request.getParameter("menu_kind");
 
  MenuDBBean menuProcess = MenuDBBean.getInstance();
  menuProcess.deletemenu(menu_id); 

  response.sendRedirect("menuList.jsp?menu_kind=all");
%>