<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.master.logDBBean"%>

<% request.setCharacterEncoding("utf-8");%>

<%
    String mid = request.getParameter("mid");
	String mpasswd = request.getParameter("mpasswd");
	
	logDBBean market = logDBBean.getInstance();
    int check = market.marketCheck(mid,mpasswd); 

	// System.out.println(check);

	if(check == 1){
		session.setAttribute("mid", mid);
		response.sendRedirect("../managerMain.jsp?mid="+mid);
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