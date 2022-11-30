<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.master.logDBBean"%>
<%@ page import="market.productshop.master.logDataBean"%>
<%
   String id = "";
   String mid = request.getParameter("mid");
   logDBBean managerPro = logDBBean.getInstance();
   logDataBean managerInfo = managerPro.getManager((String)session.getAttribute("mid"));
   try{
	   id = (String)session.getAttribute("mid");
	   
	   if(id==null || id.equals("")){
          response.sendRedirect("logon/managerLoginForm.jsp");
	   }else{
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>책관리</title>
<link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
</head>
<body style="background-image:url('img/food.jfif'); background-size:cover;">
<img src="img/logo.png" style="width:300px; top:-20px; height:300px; position:relative; left:620px;">
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;">상품관리</h3>
        <a style="position:relative; top:-65px; left:1150px;  color:black;"><%=managerInfo.getmname()%>님</a>
        <a href = "/book/GS25/logon/managerLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-62px; left:1150px;"></i></a>
    <div class="d-grid gap-2">
    </div>
</div>

  <div class="row" style="margin-top:20px; position:relative; top:-130px; width:84rem;" >
    <div class="col">
      <div class="card">
        <div class="card-header">상품관련 작업</div>
        <div class="card-body">
          <h5 class="card-title">상품관련 작업</h5>
          <a href="productProcess/menuRegisterForm.jsp" class="btn btn-primary">상품등록</a>
          <a href="productProcess/menuList.jsp?menu_kind=all" class="btn btn-warning">상품수정/삭제</a>
        </div>
      </div>
    </div><!--/.col-->
    <div class="col" style="margin-top:20px; position:relative; top:-20px; left:-25px; width:85rem;">
      <div class="card">
        <div class="card-header">상품관련 작업 및 후기 확인</div>
        <div class="card-body">
          <h5 class="card-title">상품관련 작업</h5>
          <a href="Customer/productList.jsp?menu_kind=all&mid=<%=mid%>" class="btn btn-success">상품 확인</a>
        </div>
      </div>
    </div><!--/.col-->
  </div>
</div>   
</body>
</html>
<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>