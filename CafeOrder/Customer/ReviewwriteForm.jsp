<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.user.userlogDBBean"%>
<%@ page import="market.productshop.user.userlogDataBean"%>
<%@ page import="market.productshop.master.logDBBean"%>
<%@ page import="market.productshop.master.logDataBean"%>
<%@ page import="market.productshop.user.ReviewDBBean"%>
<%@ page import="market.productshop.user.ReviewDataBean"%>
<jsp:useBean id="users" class="market.productshop.user.userlogDataBean"/>
<jsp:setProperty name="users" property="*"/>
<jsp:useBean id="managers" class="market.productshop.master.logDataBean"/>
<jsp:setProperty name="managers" property="*"/>
<jsp:useBean id="board" class="market.productshop.user.ReviewDataBean"/>
<jsp:setProperty name="board" property="*"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link href="../../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
<link href="../../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
<link href="../style.css" rel="stylesheet">
</head>
<body style="background-image:url('../img/food.png'); background-size:cover;">
<% 
  userlogDBBean userPro = userlogDBBean.getInstance();
  userlogDataBean userInfo = userPro.getUsers((String)session.getAttribute("id"));

  logDBBean managerPro = logDBBean.getInstance();
  logDataBean managerInfo = managerPro.getManager((String)session.getAttribute("mid"));
  
  String managerid = "han";
  String mid = request.getParameter("mid");
  String menu_title = request.getParameter("menu_title");
  int menu_id = Integer.parseInt(request.getParameter("menu_id"));
  int num = 0, ref = 1, re_step = 0, re_level = 0;
  String strV = "";
  try{
    ReviewDBBean dbPro = ReviewDBBean.getInstance(); 
    ReviewDataBean article = dbPro.getArticle(num);

    if(request.getParameter("num")!=null){
      num=Integer.parseInt(request.getParameter("num"));
      ref=Integer.parseInt(request.getParameter("ref"));
      re_step=Integer.parseInt(request.getParameter("re_step"));
      re_level=Integer.parseInt(request.getParameter("re_level"));
    }
%>
<img src="../img/logo.png" style="width:300px; top:-20px; height:300px; position:relative; left:620px;">
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;"><%=menu_title%> 리뷰</h3>
  </div>
</div>

  <form method="post" action="ReviewwritePro.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>" onsubmit="return writeSave(this)">
    <input type="hidden" name="num" value="<%=num%>">
    <input type="hidden" name="ref" value="<%=ref%>">
    <input type="hidden" name="re_step" value="<%=re_step%>">
    <input type="hidden" name="re_level" value="<%=re_level%>">

    <table class="table table-hover table-bordered" style="position:relative; width:85.3%; top:-90px; left:112px;">
      <tbody>
      <tr bgcolor="white">
      </tr>
      <tr bgcolor="white">
<% if(managerid.equals(mid)) { %> 
        <td class="table-warning">이 름</td>
        <td>
          <input type="text" class="form-control" size="10" maxlength="10"  name="writer" value="<%=managerInfo.getmname()%>" style="ime-mode:active;" readonly>
        </td><!--active:한글-->
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">제 목</td>
        <td>
        <%
          if(request.getParameter("num")==null) 
          strV = "";
          else
          strV = "[답변]";
        %>
          <input type="text" class="form-control" size="40" maxlength="50" name="subject" value="<%=strV%>" style="ime-mode:active;">
        </td>	
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">Email</td>
        <td>
          <input type="text" class="form-control" size="40" maxlength="30" name="email" value="<%=managerInfo.getmemail()%>" style="ime-mode:inactive;" readonly>
        </td><!--inactive:영문-->
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">내 용</td>
        <td>
          <textarea name="content" class="form-control" rows="13" cols="40" style="ime-mode:active;"></textarea> 
        </td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">비밀번호</td>
        <td>
          <input type="password" class="form-control" size="8" maxlength="12" name="passwd" style="ime-mode:inactive;"> 
        </td>
      </tr>
      <tr bgcolor="white">      
        <td colspan="2" class="text-center"> 
          <input type="submit" class="btn btn-success" value="글쓰기" >  
          <input type="reset" class="btn btn-warning" value="다시작성">
          <a href="list.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>" class="btn btn-primary">목록보기</a>
        </td>
      </tr>
<% } %>
<% if((String)session.getAttribute("id")!=null) { %>
        <td class="table-warning">이 름</td>
        <td>
          <input type="text" class="form-control" size="10" maxlength="10"  name="writer" value="<%=userInfo.getid()%>" style="ime-mode:active;" readonly>
        </td><!--active:한글-->
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">제 목</td>
        <td>
        <%
          if(request.getParameter("num")==null) 
          strV = "";
          else
          strV = "[답변]";
        %>
          <input type="text" class="form-control" size="40" maxlength="50" name="subject" value="<%=strV%>" style="ime-mode:active;">
        </td>	
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">Email</td>
        <td>
          <input type="text" class="form-control" size="40" maxlength="30" name="email" value="<%=userInfo.getemail()%>" style="ime-mode:inactive;" readonly>
        </td><!--inactive:영문-->
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">내 용</td>
        <td>
          <textarea name="content" class="form-control" rows="13" cols="40" style="ime-mode:active;"></textarea> 
        </td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">비밀번호</td>
        <td>
          <input type="password" class="form-control" size="8" maxlength="12" name="passwd" style="ime-mode:inactive;"> 
        </td>
      </tr>
      <tr bgcolor="white">      
        <td colspan="2" class="text-center"> 
          <input type="submit" class="btn btn-success" value="글쓰기" >  
          <input type="reset" class="btn btn-warning" value="다시작성">
          <a href="list.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>" class="btn btn-primary">목록보기</a>
        </td>
      </tr>
<%}%>
      </tbody>
    </table>    
 <%
  }catch(Exception e){}
%>     
</form>  
</div>
<script src="script.js"></script>
</body>
</html>