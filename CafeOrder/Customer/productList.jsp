<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.master.MenuDBBean"%>
<%@ page import="market.productshop.master.MenuDataBean"%>
<%@ page import="market.productshop.user.userlogDBBean"%>
<%@ page import="market.productshop.user.userlogDataBean"%>
<%@ page import="market.productshop.master.logDBBean"%>
<%@ page import="market.productshop.master.logDataBean"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<jsp:useBean id="users" class="market.productshop.user.userlogDataBean"/>
<jsp:setProperty name="users" property="*"/>
<jsp:useBean id="managers" class="market.productshop.master.logDataBean"/>
<jsp:setProperty name="managers" property="*"/>
<%
  String menu_kind = request.getParameter("menu_kind");
  String menu_id = request.getParameter("menu_id");
  String mid = request.getParameter("mid");
  String managerid = "han";
  userlogDBBean userPro = userlogDBBean.getInstance();
  userlogDataBean userInfo = userPro.getUsers((String)session.getAttribute("id"));

  logDBBean managerPro = logDBBean.getInstance();
  logDataBean managerInfo = managerPro.getManager((String)session.getAttribute("mid"));
%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Coupang Shopping Mall</title>
<link href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
<link href="../../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
<link href="../etc/style.css" rel="style  sheet">
</head>
<body style="background-image:url('../img/food.jfif'); background-size:cover;">
<div class="container">
  <div class="row">
    <div class="col-9 main">
<%
 List<MenuDataBean> menuLists = null;
 MenuDataBean menuList = null;
 String menu_kindName = "";
  
 MenuDBBean menuProcess = MenuDBBean.getInstance();
 
 menuLists = menuProcess.getmenus(menu_kind);
 if(menu_kind.equals("all"))
	  menu_kindName = "전체";
%>
<img src="../img/logo.png" style="width:300px; top:-20px; height:300px; position:relative; left:520px;">
<% if(managerid.equals(mid)) { %> 
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px; left:160px;">
        <a href = "../managerMain.jsp?mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;">음식메뉴</h3>
        <a style="position:relative; top:-65px; left:750px;  color:black;"><%=managerInfo.getmname()%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-62px; left:750px;"></i></a>
    <div class="d-grid gap-2">
    </div>
</div>
<%
for(int i=0;i<menuLists.size();i++){
  menuList = (MenuDataBean)menuLists.get(i);

  if(menuList == null) return;
%>

<div class="card mb-3" style="position:relative; top:-130px; left:160px;">
  <div class="row g-0">
    <div class="col-md-3 text-center">
      <a href="content.jsp?menu_id=<%=menuList.getmenu_id()%>&menu_kind=<%=menu_kind%>"><img src="../../imageFile/<%=menuList.getmenu_image()%>" class="img-fluid rounded-start img-thumbnail" style="max-width:160px" alt="..."></a>
    </div>
    <div class="col-md-9">
      <div class="card-body">
        <h5 class="card-title">
          <a href="content.jsp?menu_id=<%=menuList.getmenu_id()%>&menu_kind=<%=menu_kind%>"><%=menuList.getmenu_title()%></a>
        </h5>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">정가 : <%=NumberFormat.getInstance().format(menuList.getmenu_price())%>원
            / 판매가 : <strong class="text-danger">
            <%=NumberFormat.getInstance().format((int)(menuList.getmenu_price()*((double)(100-menuList.getdiscount_rate())/100)))%>
          </strong>원</li>
          <li class="list-group-item">음식설명 : <%=menuList.getmenu_content()%></li>
        </ul>
      </div>
      <a href = "list.jsp?menu_id=<%=menuList.getmenu_id()%>&mid=<%=mid%>&menu_title=<%=menuList.getmenu_title()%>" style="position:relative; top:-40px; left:650px;"><i class="fas fa-clipboard-list" style="font-size:30px; color:black;"></i></a>
    </div> 
  </div>
</div>
<%
 } 
%>
    </div>
  </div>
</div>
<%}%>

<% if((String)session.getAttribute("id")!=null) { %>
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px; left:160px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;">음식메뉴</h3>
        <a style="position:relative; top:-65px; left:750px;  color:black;"><%=(String)session.getAttribute("id")%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-62px; left:750px;"></i></a>
    <div class="d-grid gap-2">
    </div>
</div>
<%
for(int i=0;i<menuLists.size();i++){
  menuList = (MenuDataBean)menuLists.get(i);

  if(menuList == null) return;
%>

<div class="card mb-3" style="position:relative; top:-130px; left:160px;">
  <div class="row g-0">
    <div class="col-md-3 text-center">
      <a href="content.jsp?menu_id=<%=menuList.getmenu_id()%>&menu_kind=<%=menu_kind%>"><img src="../../imageFile/<%=menuList.getmenu_image()%>" class="img-fluid rounded-start img-thumbnail" style="max-width:160px" alt="..."></a>
    </div>
    <div class="col-md-9">
      <div class="card-body">
        <h5 class="card-title">
          <a href="content.jsp?menu_id=<%=menuList.getmenu_id()%>&menu_kind=<%=menu_kind%>"><%=menuList.getmenu_title()%></a>
        </h5>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">정가 : <%=NumberFormat.getInstance().format(menuList.getmenu_price())%>원
            / 판매가 : <strong class="text-danger">
            <%=NumberFormat.getInstance().format((int)(menuList.getmenu_price()*((double)(100-menuList.getdiscount_rate())/100)))%>
          </strong>원</li>
          <li class="list-group-item">음식설명 : <%=menuList.getmenu_content()%></li>
        </ul>
      </div>
      <a href = "list.jsp?menu_id=<%=menuList.getmenu_id()%>&mid=<%=mid%>&menu_title=<%=menuList.getmenu_title()%>" style="position:relative; top:-40px; left:650px;"><i class="fas fa-clipboard-list" style="font-size:30px; color:black;"></i></a>
    </div> 
  </div>
</div>
<%
 } 
%>
    </div>
  </div>
</div>
<%}%>
</body>
</html>
