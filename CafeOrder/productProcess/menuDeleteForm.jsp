<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.master.MenuDBBean"%>
<%@ page import="market.productshop.master.MenuDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String mid ="";
try{
	mid = (String)session.getAttribute("mid");
	if(mid==null || mid.equals("")){
       response.sendRedirect("../logon/managerLoginForm.jsp");
	}else{
%> 

<%!
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    List<MenuDataBean> menuList = null; 
    int number = 0;
    String menu_id = "";
    
    menu_id = request.getParameter("menu_id");

    MenuDBBean menuProcess = MenuDBBean.getInstance();

    menuList = menuProcess.getmenus(menu_id);

 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>등록된 책 목록</title>
<link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../../etc/style.css">
</head>
<body>

<div class="container">
   <div class="d-grid gap-2">
      <a href="../managerMain.jsp" class="btn btn-secondary">관리자 메인으로</a>
   </div>


   <div class="d-grid gap-2">
      <a href="menuRegisterForm.jsp" class="btn btn-primary">음식 등록</a>
   </div>




   <table class="table table-striped table-bordered table-hover"> 
      <thead>
         <tr class="table-info"> 
            <th>번호</th> 
            <th>음식종류</th> 
            <th>제목</th> 
            <th>가격</th>  
            <th>수량</th>  
            <th>음식이미지</th> 
            <th>설명</th> 
            <th>할인율</th> 
            <th>수정</th> 
            <th>삭제</th>          
         </tr>
      </thead>
      <tbody>
<%  
    for (int i=0; i<menuList.size(); i++) {
      MenuDataBean menu = (MenuDataBean)menuList.get(i);
      if(menu == null) return; 
%>
   <tr>
      <td class="text-center"><%=++number%></td> 
      <td class="text-center"><%=menu.getmenu_kind()%></td> 
      <td><%=menu.getmenu_title()%></td>
      <td>
         <script>
            document.write(new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(<%=menu.getmenu_price()%>));
         </script>  
         </td> 
      <td>
      <% if(menu.getmenu_count()==0) {%>
         <span class="text-danger"><%="일시품절"%></span>
      <% }else{ %>
         <%=menu.getmenu_count()%>
      <%} %>
      </td> 
      <td><%=menu.getmenu_image()%></td>
      <td><%=menu.getmenu_content()%></td>
      <td class="text-right"><%=menu.getdiscount_rate()%></td>
      <td>
         <a href="menuDeletePro.jsp?menu_id=<%=menu.getmenu_id()%>&menu_kind=<%=menu.getmenu_kind()%>" class="btn btn-danger btn-sm">삭제</a>
      </td>    
   </tr>
<%}%>
</tbody>
</table>
<%}%>

<div class="d-grid gap-2">
   <a href="../managerMain.jsp" class="btn btn-secondary">관리자 메인으로</a>
</div>

</div>
</body>
</html>

<% 
   
}catch(Exception e){
   e.printStackTrace();
}
%>