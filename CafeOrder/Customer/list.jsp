<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="market.productshop.user.ReviewDBBean"%>
<%@ page import="market.productshop.user.ReviewDataBean"%>
<%@ page import="market.productshop.user.userlogDBBean"%>
<%@ page import="market.productshop.user.userlogDataBean"%>
<%@ page import="market.productshop.master.logDBBean"%>
<%@ page import="market.productshop.master.logDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<jsp:useBean id="users" class="market.productshop.user.userlogDataBean"/>
<jsp:setProperty name="users" property="*"/>

<%
    request.setCharacterEncoding("utf-8");
    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    userlogDBBean userPro = userlogDBBean.getInstance();
    userlogDataBean userInfo = userPro.getUsers((String)session.getAttribute("id"));

    logDBBean managerPro = logDBBean.getInstance();
    logDataBean managerInfo = managerPro.getManager((String)session.getAttribute("mid"));
    
    String managerid="han";
    String pageNum = request.getParameter("pageNum");
    String mid = request.getParameter("mid");
    String menu_title = request.getParameter("menu_title");
    if (pageNum == null) {
        pageNum = "1";
    }
    
    
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;

    int menu_id = Integer.parseInt(request.getParameter("menu_id"));
    
    List<ReviewDataBean> articleList = null; 
    
    ReviewDBBean dbPro = ReviewDBBean.getInstance();
    count = dbPro.getArticleCount(menu_id);
    
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, pageSize, menu_id);
    }

	number = count-(currentPage-1)*pageSize;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link href="../../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
<link href="../../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
<link href="../etc/style2.css" rel="stylesheet">
</head>
<style>

</style>
<body style="background-image:url('../img/food.png'); background-size:cover;">
<img src="../img/logo.png" style="width:300px; top:-20px; height:300px; position:relative; left:620px;">

<% if(managerid.equals(mid)) { %> 
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;"><%=menu_title%> 리뷰(전체 글:<%=count%>)</h3>
        <a style="position:relative; top:-50px; left:1110px;  color:black;"><%=managerInfo.getmname()%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-47px; left:1110px;"></i></a>
    <div class="d-grid gap-2">
        <a href="writeForm.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>"><i class="fas fa-clipboard-list" style="position:relative; top:-75px; left:1250px; font-size:25px; color:black;"></i></a>
    </div>
</div>
 
<% if (count == 0) { %>

<div class="alert alert-danger" role="alert">
    게시판에 저장된 글이 없습니다.
</div>

<% } else {%>
<table class="table table-striped table-hover table-bordered" style="position:relative; top:-160px;">
    <thead>
        <tr class="table-warning">
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회</th>
            <th scope="col">IP</th>
        </tr>
    </thead>
    <tbody>
<%  
   for (int i = 0 ; i < articleList.size() ; i++) {
       ReviewDataBean article = articleList.get(i);
%>
   <tr  bgcolor="white">
    <td><%=i+1%></td>
    <td>
<%
	int wid=0; 
	if(article.getRe_level()>0){
	   wid = 10*(article.getRe_level());
%>
    <i class="fas fa-arrow-right" style="margin-left:<%=wid%>px"></i>
<% }%>     
        <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>&menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>" style="color:black;">
           <%=article.getSubject()%></a> 
<% if(article.getReadcount()>=20){%>
        <i class="fas fa-crown" style="-webkit-text-stroke: 1px #a1a1a1; color:yellow;"></i>
<%}%>
    </td>
    <td> 
       <a href="mailto:<%=article.getEmail()%>" style="color:black;"><%=article.getWriter()%></a>
    </td>
    <td><%=sdf.format(article.getReg_date())%></td>
    <td><%=article.getReadcount()%></td>
    <td><%=article.getIp()%></td>
  </tr>
<%}%>
    </tbody>
</table>
<%}%>

</div>
<%}%>

<% if((String)session.getAttribute("id")!=null) { %>
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;"><%=menu_title%> 리뷰(전체 글:<%=count%>)</h3>
        <a style="position:relative; top:-50px; left:1110px;  color:black;"><%=(String)session.getAttribute("id")%>님</a>
        <a href = "userLogout.jsp"><i class="fas fa-sign-out-alt" style="font-size:25px; color:black; position:relative; top:-47px; left:1110px;"></i></a>
    <div class="d-grid gap-2">
        <a href="writeForm.jsp?menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>"><i class="fas fa-clipboard-list" style="position:relative; top:-75px; left:1250px; font-size:25px; color:black;"></i></a>
    </div>
</div>
 
<% if (count == 0) { %>

<div class="alert alert-danger" role="alert">
    게시판에 저장된 글이 없습니다.
</div>

<% } else {%>
<table class="table table-striped table-hover table-bordered" style="position:relative; top:-160px;">
    <thead>
        <tr class="table-warning">
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회</th>
            <th scope="col">IP</th>
        </tr>
    </thead>
    <tbody>
<%  
   for (int i = 0 ; i < articleList.size() ; i++) {
       ReviewDataBean article = articleList.get(i);
%>
   <tr  bgcolor="white">
    <td><%=i+1%></td>
    <td>
<%
	int wid=0; 
	if(article.getRe_level()>0){
	   wid = 10*(article.getRe_level());
%>
    <i class="fas fa-arrow-right" style="margin-left:<%=wid%>px"></i>
<% }%>     
        <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>&menu_id=<%=menu_id%>&mid=<%=mid%>&menu_title=<%=menu_title%>" style="color:black;">
           <%=article.getSubject()%></a> 
<% if(article.getReadcount()>=20){%>
        <i class="fas fa-crown" style="-webkit-text-stroke: 1px #a1a1a1; color:yellow;"></i>
<%}%>
    </td>
    <td> 
       <a href="mailto:<%=article.getEmail()%>" style="color:black;"><%=article.getWriter()%></a>
    </td>
    <td><%=sdf.format(article.getReg_date())%></td>
    <td><%=article.getReadcount()%></td>
    <td><%=article.getIp()%></td>
  </tr>
<%}%>
    </tbody>
</table>
<%}%>

</div>
<%}%>
</body>
</html>