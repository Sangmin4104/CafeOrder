<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.user.CustomerDBBean"%>
<jsp:useBean id="customer" class="market.productshop.user.CustomerDataBean"/>
<jsp:setProperty name="customer" property="*"/>
<% request.setCharacterEncoding("utf-8");%>

<%
    String id = request.getParameter("id");
	int passwd = Integer.parseInt(request.getParameter("passwd"));
	String name = request.getParameter("name");
	name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
	String phonenum = request.getParameter("phonenum");
	String email = request.getParameter("email");
	
	customer.setId(id);
	customer.setPasswd(passwd);
	customer.setName(name);
	customer.setPhonenum(phonenum);
	customer.setEmail(email);

	CustomerDBBean customers = CustomerDBBean.getInstance();
    customers.insertCustomer(customer);

	response.sendRedirect("managerLoginForm.jsp");
%>