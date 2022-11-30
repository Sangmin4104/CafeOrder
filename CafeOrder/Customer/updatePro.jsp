<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.user.ReviewDBBean" %>
<%@ page import="java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="article" scope="page" class="market.productshop.user.BoardDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
  int menu_id = Integer.parseInt(request.getParameter("menu_id"));
  String pageNum = request.getParameter("pageNum");
  String menu_title = request.getParameter("menu_title");

	BoardDBBean dbPro = BoardDBBean.getInstance();
  int check = dbPro.updateArticle(article); 

  if(check==1){
%>
    <script>
    setTimeout(function(){
	location.href = "list.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>";
	alert("수정 되었습니다.");}, 200);
  </script>
<% }else{%>
      <script>      
        alert('비밀번호가 맞지 않습니다');
        history.go(-1);
     </script>
<%
  }
%> 