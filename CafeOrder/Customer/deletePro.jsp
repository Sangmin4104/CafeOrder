<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.user.ReviewDataBean" %>
<%@ page import="market.productshop.user.ReviewDBBean" %>

<%@ page import="java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<%
  int menu_id = Integer.parseInt(request.getParameter("menu_id"));
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");
  String menu_title = request.getParameter("menu_title");


  ReviewDBBean dbPro = ReviewDBBean.getInstance(); 
  int check = dbPro.deleteArticle(num, passwd);

  if(check==1){
%>
  <script>
    setTimeout(function(){
	location.href = "list.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>";
	alert("삭제 되었습니다.");}, 200);
  </script>
<%}else{%>
  <script>            
      alert('비밀번호가 맞지 않습니다');
      history.go(-1);
  </script>
<%} %>