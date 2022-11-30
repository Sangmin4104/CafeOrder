<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.user.ReviewDBBean"%>
<%@ page import="java.sql.Timestamp"%>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="article" scope="page" class="market.productshop.user.ReviewDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
    int menu_id = Integer.parseInt(request.getParameter("menu_id"));
    String mid = request.getParameter("mid");
    String menu_title = request.getParameter("menu_title");

    article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());

    ReviewDBBean dbPro = ReviewDBBean.getInstance();
    dbPro.insertArticle(article); 

%>
<script>
    setTimeout(function(){
	location.href = "list.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>";
	alert("답변이 완료되었습니다.");}, 200);
  </script>