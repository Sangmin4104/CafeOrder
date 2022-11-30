<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="market.productshop.master.logDBBean"%>
<%@ page import="market.productshop.master.logDataBean"%>
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
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품등록</title>
<link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link href="../../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../etc/style.css">
</head>
<body style="background-image:url('../img/food.jfif'); background-size:cover;">
<img src="../img/logo.png" style="width:300px; top:-20px; height:300px; position:relative; left:620px;">
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;">상품관리</h3>
        <a style="position:relative; top:-65px; left:1150px;  color:black;"><%=managerInfo.getmname()%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-62px; left:1150px;"></i></a>

         <form method="post" action="menuRegisterPro.jsp" enctype="multipart/form-data" onsubmit="return checkForm(this)">
            <table class="table table-striped table-bordered table-hover" style="position:relative; top:-40px;">
               <tbody bgcolor="white";>
               <tr>
                  <td class="table-warning">분류 선택</td>
                  <td>
                     <select name="menu_kind" class="form-select">
                        <option value="한식">한식</option>
                        <option value="중식">중식</option>
                        <option value="일식">일식</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td class="table-warning">음식명</td>
                  <td>
                     <input type="text" class="form-control" maxlength="50" name="menu_title">
                  </td>
               </tr>
               <tr>
                  <td class="table-warning">가 격</td>
                  <td>
                     <div class="input-group mb-3">
                        <input type="text" class="form-control" maxlength="9" name="menu_price">
                        <span class="input-group-text">원</span>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td class="table-warning">수량</td>
                  <td>
                     <div class="input-group mb-3">
                        <input type="number" class="form-control" min="1" name="menu_count">
                        <span class="input-group-text">개</span>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td class="table-warning">이미지</td>
                  <td>
                     <input type="file" class="form-control" name="menu_image">
                  </td>
               </tr>
               <tr>
                  <td class="table-warning">내 용</td>
                  <td>
                     <textarea name="menu_content" class="form-control" rows="10"></textarea> 
                  </td>
               </tr>
               <tr>
                  <td class="table-warning">오늘의 할인</td>
                  <td>
                     <div class="input-group mb-3">
                        <input type="text" class="form-control" maxlength="2" name="discount_rate">
                        <span class="input-group-text">%</span>
                     </div>
                  </td>
               </tr>
               <tr>      
                  <td colspan="2" class="text-center"> 
                     <input type="submit" value="상품등록" class="btn btn-success">  
                     <input type="reset" value="다시작성" class="btn btn-warning">
                     <a href="menuList.jsp?menu_kind=all" class="btn btn-primary">음식목록</a>
                  </td>
               </tr>
            </tbody>
         </table>         
      </form>
   </div>
</div>   
</div>
<script src="../../etc/script.js"></script>
</body>
</html>
<% 
	}
}catch(Exception e){
	e.printStackTrace();
}
%>