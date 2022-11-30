<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import="market.productshop.master.logDBBean"%>
<%@ page import="market.productshop.master.logDataBean"%>
<%@ page import="market.productshop.master.MenuDBBean"%>
<%@ page import="market.productshop.master.MenuDataBean"%>

<%@ include file="../etc/color.jspf"%> 
 
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
<%
int menu_id = Integer.parseInt(request.getParameter("menu_id"));
String menu_kind = request.getParameter("menu_kind");
try{
	MenuDBBean menuProcess = MenuDBBean.getInstance();
    MenuDataBean menu =  menuProcess.getmenu(menu_id); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품수정</title>
<link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link href="../../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
<link href="../etc/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../etc/script.js"></script>
</head>
<body style="background-image:url('../img/food.jfif'); background-size:cover;">
<img src="../img/logo.png" style="width:300px; top:-20px; height:300px; position:relative; left:620px;">
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;">상품관리</h3>
        <a style="position:relative; top:-65px; left:1150px;  color:black;"><%=managerInfo.getmname()%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-62px; left:1150px;"></i></a>

<form method="post" name="writeform" action="menuUpdatePro.jsp"  enctype="multipart/form-data">
<table class="table table-striped table-bordered table-hover" style="position:relative; top:-40px;">
   <tr>
    <td class="table-warning" align="right" colspan="2" bgcolor="<%=value_c%>">
	    <a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
	    <a href="menuList.jsp?menu_kind=<%=menu_kind%>">목록으로</a>
   </td>
   </tr>
   <tr>
    <td  width="100"  bgcolor="<%=value_c%>">분류 선택</td>
    <td  width="400"  align="left">
       <select name="menu_kind">
           <option value="한식" 
             <%if (menu.getmenu_kind().equals("한식")) {%>selected<%} %>
              >한식</option>
           <option value="중식" 
             <%if (menu.getmenu_kind().equals("중식")) {%>selected<%} %>
           >중식</option>
           <option value="일식" 
             <%if (menu.getmenu_kind().equals("일식")) {%>selected<%} %>
             >일식</option>
       </select>
    </td>
  </tr>
  <tr>
    <td class="table-warning" width="100"  bgcolor="<%=value_c%>">음식명</td>
    <td  width="400" align="left">
        <input type="text" size="50" maxlength="50" name="menu_title" 
            value="<%=menu.getmenu_title() %>">
        <input type="hidden" name="menu_id" value="<%=menu_id%>"></td>
  </tr>
  <tr>
    <td class="table-warning" width="100"  bgcolor="<%=value_c%>">가 격</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="9" name="menu_price" 
          value="<%=menu.getmenu_price() %>">원</td>
  </tr>
  <tr>
    <td class="table-warning" width="100"  bgcolor="<%=value_c%>">수량</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="5" name="menu_count" 
          value="<%=menu.getmenu_count() %>">개</td>
  </tr>
  <tr>
    <td class="table-warning" width="100"  bgcolor="<%=value_c%>">이미지</td>
    <td  width="400" align="left">
        <input type="file" name="menu_image"><%=menu.getmenu_image() %></td>
  </tr>
  <tr>
    <td class="table-warning" width="100"  bgcolor="<%=value_c%>">내 용</td>
    <td  width="400" align="left">
     <textarea name="menu_content" rows="13" 
         cols="40"><%=menu.getmenu_content() %></textarea> </td>
  </tr>
 <tr>
    <td class="table-warning" width="100"  bgcolor="<%=value_c%>">할인율</td>
    <td  width="400" align="left">
        <input type="text" size="5" maxlength="2" name="discount_rate" 
          value="<%=menu.getdiscount_rate() %>">%</td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
  <input type="submit" value="책수정" onclick="updateCheckForm(this.form)">  
  <input type="reset" value="다시작성">
</td></tr></table>         
</form>   
<%
}catch(Exception e){
	e.printStackTrace();
}%>         
</body>
</html>
<% 
  }
}catch(Exception e){
	e.printStackTrace();
}
%>