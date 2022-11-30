<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.user.ReviewDBBean"%>
<%@ page import="market.productshop.user.ReviewDataBean"%>
<%@ page import="market.productshop.user.userlogDBBean"%>
<%@ page import="market.productshop.user.userlogDataBean"%>
<%@ page import="market.productshop.master.logDBBean"%>
<%@ page import="market.productshop.master.logDataBean"%>
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
<body style="background-image:url('../img/food.jfif'); background-size:cover;">
<%
  userlogDBBean userPro = userlogDBBean.getInstance();
  userlogDataBean userInfo = userPro.getUsers((String)session.getAttribute("id"));

  logDBBean managerPro = logDBBean.getInstance();
  logDataBean managerInfo = managerPro.getManager((String)session.getAttribute("mid"));

  int menu_id = Integer.parseInt(request.getParameter("menu_id"));
  int num = Integer.parseInt(request.getParameter("num"));
  String managerid="han";
  String pageNum = request.getParameter("pageNum");
  String mid = request.getParameter("mid");
  String menu_title = request.getParameter("menu_title");
  try{
      ReviewDBBean dbPro = ReviewDBBean.getInstance(); 
      ReviewDataBean article = dbPro.updateGetArticle(num);

%>
<img src="../img/logo.png" style="width:300px; top:-20px; height:300px; position:relative; left:620px;">
<% if(managerid.equals(mid)) { %> 
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;"><%=menu_title%> 리뷰수정</h3>
        <a style="position:relative; top:-50px; left:1110px;  color:black;"><%=managerInfo.getmname()%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-47px; left:1110px;"></i></a>
    <div class="d-grid gap-2">
        <a href="writeForm.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>"><i class="fas fa-clipboard-list" style="position:relative; top:-75px; left:1250px; font-size:25px; color:black;"></i></a>
    </div>
</div>

  <form method="post" action="updatePro.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>" onsubmit="return writeSave(this)">
    <input type="hidden" name="num" value="<%=article.getNum()%>">
    <table class="table table-hover table-bordered" style="position:relative; top:-130px;">
      <tbody>
      <tr bgcolor="white">
        <td class="table-warning">이 름</td>
        <td>
          <input type="text" class="form-control" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>" style="ime-mode:active;" readonly>
        </td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">제 목</td>
        <td>
          <input type="text" class="form-control" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>" style="ime-mode:active;" required>
        </td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">Email</td>
        <td>
          <input type="text" class="form-control" size="40" maxlength="30" name="email" value="<%=article.getEmail()%>" style="ime-mode:inactive;" readonly> 
        </td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">내 용</td>
        <td>
          <textarea name="content" class="form-control" rows="13" cols="40" style="ime-mode:active;" required><%=article.getContent()%></textarea>
        </td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">비밀번호</td>
        <td>
          <input type="password" class="form-control" size="8" maxlength="12" name="passwd" style="ime-mode:inactive;" required="required">
        </td>
      </tr>
      <tr bgcolor="white">      
      <td colspan="2" class="text-center"> 
        <input type="submit" class="btn btn-danger" value="글수정">  
        <input type="reset" class="btn btn-warning" value="다시작성">
        <a href="list.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>" class="btn btn-primary">목록보기</a>
      </td>
    </tr>
    </tbody>
    </table>
  </form>
<%}%>      
</div>
<script src="script.js"></script>


<% if((String)session.getAttribute("id")!=null) { %>
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;"><%=menu_title%> 리뷰수정</h3>
        <a style="position:relative; top:-50px; left:1110px;  color:black;"><%=(String)session.getAttribute("id")%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-47px; left:1110px;"></i></a>
    <div class="d-grid gap-2">
        <a href="writeForm.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>"><i class="fas fa-clipboard-list" style="position:relative; top:-75px; left:1250px; font-size:25px; color:black;"></i></a>
    </div>
</div>

  <form method="post" action="updatePro.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>" onsubmit="return writeSave(this)">
    <input type="hidden" name="num" value="<%=article.getNum()%>">
    <table class="table table-hover table-bordered" style="position:relative; top:-130px;">
      <tbody>
      <tr bgcolor="white">
        <td class="table-warning">이 름</td>
        <td>
          <input type="text" class="form-control" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>" style="ime-mode:active;" readonly>
        </td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">제 목</td>
        <td>
          <input type="text" class="form-control" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>" style="ime-mode:active;" required>
        </td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">Email</td>
        <td>
          <input type="text" class="form-control" size="40" maxlength="30" name="email" value="<%=article.getEmail()%>" style="ime-mode:inactive;" readonly> 
        </td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">내 용</td>
        <td>
          <textarea name="content" class="form-control" rows="13" cols="40" style="ime-mode:active;" required><%=article.getContent()%></textarea>
        </td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">비밀번호</td>
        <td>
          <input type="password" class="form-control" size="8" maxlength="12" name="passwd" style="ime-mode:inactive;" required="required">
        </td>
      </tr>
      <tr bgcolor="white">      
      <td colspan="2" class="text-center"> 
        <input type="submit" class="btn btn-danger" value="글수정">  
        <input type="reset" class="btn btn-warning" value="다시작성">
        <a href="list.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>" class="btn btn-primary">목록보기</a>
      </td>
    </tr>
    </tbody>
    </table>
  </form>
<%}%>
<%
}catch(Exception e){}%>      
</div>
<script src="script.js"></script>


</body>
</html>