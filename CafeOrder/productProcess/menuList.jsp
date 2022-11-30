<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.master.MenuDBBean"%>
<%@ page import="market.productshop.master.MenuDataBean"%>
<%@ page import="market.productshop.master.logDBBean"%>
<%@ page import="market.productshop.master.logDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String mid ="";
logDBBean managerPro = logDBBean.getInstance();
logDataBean managerInfo = managerPro.getManager((String)session.getAttribute("mid"));
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
    String menu_kind = "";
    
    menu_kind = request.getParameter("menu_kind");

    MenuDBBean menuProcess = MenuDBBean.getInstance();

    menuList = menuProcess.getmenus(menu_kind);
 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>등록된 책 목록</title>
<link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link href="../../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="../etc/style.css">
</head>
<body style="background-image:url('../img/food.jfif'); background-size:cover;">
<%
   String menu_kindName="";

   if(menu_kind.equals("all")){
	   menu_kindName = "전체";
   }
%>
<img src="../img/logo.png" style="width:300px; top:-20px; height:300px; position:relative; left:620px;">
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;">상품관리</h3>
         <a href="menuRegisterForm.jsp" style="width:8%; position:relative; top:-65px; left:1220px;"><i class="fas fa-utensils" style="font-size:30px; color:black;"></i></a>
        <a style="position:relative; top:-65px; left:1080px;  color:black;"><%=managerInfo.getmname()%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-62px; left:1080px;"></i></a>
    <div class="d-grid gap-2">
    </div>
</div>
   <table class="table table-striped table-bordered table-hover" style="position:relative; top:-135px;"> 
      <thead>
         <tr class="alert alert-warning"; style="color:black;  text-align:center;"> 
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
   <tr bgcolor="white"; style="text-align:center;">
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
         <a href="menuUpdateForm.jsp?menu_id=<%=menu.getmenu_id()%>&menu_kind=<%=menu.getmenu_kind()%>"><i class="fas fa-retweet" style="color:black;"></i></a>
      </td>
      <td>
         <a href="menuDeletePro.jsp?menu_id=<%=menu.getmenu_id()%>"><i class="fas fa-trash-alt" style="color:black;"></i></a>
      </td>    
   </tr>
<%}%>
</tbody>
</table>
<%}%>

</div>
</body>
</html>

<% 
   
}catch(Exception e){
   e.printStackTrace();
}
%>