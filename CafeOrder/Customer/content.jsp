<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="market.productshop.user.ReviewDataBean" %>
<%@ page import="market.productshop.user.ReviewDBBean" %>
<%@ page import="market.productshop.user.userlogDBBean" %>
<%@ page import="market.productshop.user.userlogDataBean"%>
<%@ page import="market.productshop.master.logDBBean" %>
<%@ page import="market.productshop.master.logDataBean"%>
<%@ page import="java.text.SimpleDateFormat" %>

<jsp:useBean id="users" class="market.productshop.user.userlogDataBean"/>
<jsp:setProperty name="users" property="*"/>

<jsp:useBean id="managers" class="market.productshop.master.logDataBean"/>
<jsp:setProperty name="managers" property="*"/>


<%request.setCharacterEncoding("utf-8");%>

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

  String managerid="han";
  String mid = request.getParameter("mid");
  
  int menu_id = Integer.parseInt(request.getParameter("menu_id"));
  int num = Integer.parseInt(request.getParameter("num"));
  String menu_title = request.getParameter("menu_title");
  String pageNum = request.getParameter("pageNum");
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

  try{
    ReviewDBBean dbPro = ReviewDBBean.getInstance(); 
    ReviewDataBean article = dbPro.getArticle(num);

    int ref=article.getRef();
    int re_step=article.getRe_step();
    int re_level=article.getRe_level();
%>
<img src="../img/logo.png" style="width:300px; top:-20px; height:300px; position:relative; left:620px;">
<% if(managerid.equals(mid)) { %> 
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;"><%=menu_title%> 리뷰</h3>
        <a style="position:relative; top:-50px; left:1110px;  color:black;"><%=managerInfo.getmname()%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-47px; left:1110px;"></i></a>
    <div class="d-grid gap-2">
        <a href="writeForm.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>"><i class="fas fa-clipboard-list" style="position:relative; top:-75px; left:1250px; font-size:25px; color:black;"></i></a>
    </div>
</div>
  
  <table class="table table-hover table-bordered" style="position:relative; top:-150px;">
    <tbody> 
      <tr bgcolor="white">
        <td class="table-warning">글번호</td>
        <td><%=article.getNum()%></td>
        <td class="table-warning">조회수</td>
        <td><%=article.getReadcount()%></td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">아이디</td>
        <td><%=article.getWriter()%></td>
        <td class="table-warning">작성일</td>
        <td><%=sdf.format(article.getReg_date())%></td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">후기제목</td>
        <td colspan="3"><%=article.getSubject()%></td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">후기내용</td>
        <td colspan="3"><pre><%=article.getContent()%></pre></td>
      </tr>
      <tr bgcolor="white">      
        <td colspan="4" class="text-center"> 
        

          <a href="mdeletePro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>" class="btn btn-danger">글삭제</a>
          <a href="ReviewwriteForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>" class="btn btn-success">답글쓰기</a>
          <a href="list.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>" class="btn btn-primary">글목록</a>
<% } %>

<% if(userInfo.getid().equals(article.getWriter())) { %>
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;"><%=menu_title%> 리뷰</h3>
        <a style="position:relative; top:-50px; left:1110px;  color:black;"><%=(String)session.getAttribute("id")%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-47px; left:1110px;"></i></a>
    <div class="d-grid gap-2">
        <a href="writeForm.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>"><i class="fas fa-clipboard-list" style="position:relative; top:-75px; left:1250px; font-size:25px; color:black;"></i></a>
    </div>
</div>
  
  <table class="table table-hover table-bordered" style="position:relative; top:-150px;">
    <tbody> 
      <tr bgcolor="white">
        <td class="table-warning">글번호</td>
        <td><%=article.getNum()%></td>
        <td class="table-warning">조회수</td>
        <td><%=article.getReadcount()%></td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">아이디</td>
        <td><%=article.getWriter()%></td>
        <td class="table-warning">작성일</td>
        <td><%=sdf.format(article.getReg_date())%></td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">후기제목</td>
        <td colspan="3"><%=article.getSubject()%></td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">후기내용</td>
        <td colspan="3"><pre><%=article.getContent()%></pre></td>
      </tr>
      <tr bgcolor="white">      
        <td colspan="4" class="text-center"> 
          <a href="updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>" class="btn btn-warning">글수정</a>
          <a href="deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>&mid=<%=mid%>" class="btn btn-danger">글삭제</a>
          <a href="ReviewwriteForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>" class="btn btn-success">답글쓰기</a>
          <a href="list.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>" class="btn btn-primary">글목록</a>
<% }  %>

<% if(!userInfo.getid().equals(article.getWriter())) { %>
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;"><%=menu_title%> 리뷰</h3>
        <a style="position:relative; top:-50px; left:1110px;  color:black;"><%=(String)session.getAttribute("id")%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-47px; left:1110px;"></i></a>
    <div class="d-grid gap-2">
        <a href="writeForm.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>"><i class="fas fa-clipboard-list" style="position:relative; top:-75px; left:1250px; font-size:25px; color:black;"></i></a>
    </div>
</div>
  
  <table class="table table-hover table-bordered" style="position:relative; top:-150px;">
    <tbody> 
      <tr bgcolor="white">
        <td class="table-warning">글번호</td>
        <td><%=article.getNum()%></td>
        <td class="table-warning">조회수</td>
        <td><%=article.getReadcount()%></td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">아이디</td>
        <td><%=article.getWriter()%></td>
        <td class="table-warning">작성일</td>
        <td><%=sdf.format(article.getReg_date())%></td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">후기제목</td>
        <td colspan="3"><%=article.getSubject()%></td>
      </tr>
      <tr bgcolor="white">
        <td class="table-warning">후기내용</td>
        <td colspan="3"><pre><%=article.getContent()%></pre></td>
      </tr>
      <tr bgcolor="white">      
        <td colspan="4" class="text-center"> 
          <a href="ReviewwriteForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>" class="btn btn-success">답글쓰기</a>
          <a href="list.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>" class="btn btn-primary">글목록</a>
<% }  %>
        </td>
      </tr>
    </tbody>
  </table>
<%
 }catch(Exception e){} 
 %>
 
</div>     
</body>
</html>