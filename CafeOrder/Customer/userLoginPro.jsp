<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.user.userlogDBBean"%>

<% request.setCharacterEncoding("utf-8");%>

<%
    String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String menu_id = request.getParameter("menu_id");
	
	userlogDBBean market = userlogDBBean.getInstance();
    int check = market.marketCheck(id,passwd); 

	// System.out.println(check);

	if(check == 1){
		session.setAttribute("id", id);
		response.sendRedirect("productList.jsp?menu_kind=all");
		
	}else if(check == 0){%>
    <script> 
	  alert('비밀번호가 맞지 않습니다.');
      history.go(-1);
	</script>
<% }else{ %>
	<script>
	  alert('아이디가 맞지 않습니다..');
	  history.go(-1);
	</script>
<% }%>