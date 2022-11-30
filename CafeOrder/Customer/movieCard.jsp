<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="movie.manager.master.MovieDBBean" %>
<%@ page import="movie.manager.master.MovieDataBean" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List"%>
<%!
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../../etc/style.css">
</head>
<style>
.mlist {
    display: flex;
    position: relative;
    float: left;
    width: 17rem;
    height: 500px;
    margin-left: 50px;
    margin-top: 10px;
    margin-bottom: 10px;
    text-align: center;
}
</style>
<body>
<div class="container">
    <div class="title" style="margin-top: 20px;">
       <h2><b>전체 목록</b></h2> <hr>
     </div>
    
<%
  MovieDataBean movieLists[] = null;
  int number = 0;
  String genreName = "";
  
  MovieDBBean movieProcess = MovieDBBean.getInstance();
  for(int i=1; i<=3; i++){
	  movieLists = movieProcess.getMovies(i+"00",3);

    if(movieLists[0] == null) return; 
     
    if(movieLists[0].getGenre().equals("100")){
      genreName = "액션";
    }else if(movieLists[0].getGenre().equals("200")){
      genreName = "애니메이션";  
    }else if(movieLists[0].getGenre().equals("300")){
      genreName = "스릴러";
    }

    int count = movieProcess.getMovieCount();

%>

<%             
  for(int j=0; j<movieLists.length; j++){
%>

<div class="mlist">
  <div class="card mb-3">
    <div class="card-img-top">
      <div class="card-body">
        <a href="update.jsp?m_id=<%=movieLists[j].getM_id()%>&genre=<%=movieLists[0].getGenre()%>">
          <img src="../../../imageFile/<%=movieLists[j].getM_img()%>"  
          class="img-fluid rounded-start" style="max-width:150px" alt="..."></a>
      </div>

      <div>
        <div class="card-body">
          <h5 class="card-title">
            <a href="update.jsp?m_id=<%=movieLists[j].getM_id()%>&genre=<%=movieLists[0].getGenre()%>" style= "text-decoration:none; color: black;"><b><%=movieLists[j].getTitle() %></b></a></h5>
          <ul class="list-group list-group-flush" >
            <li class="list-group-item">감독 : <%=movieLists[j].getProducer()%></li>
            <li class="list-group-item">개봉 : <%=movieLists[j].getPublishing_date()%></li>
            <li class="list-group-item">등록일 : <%=sdf.format(movieLists[j].getReg_date())%></td></li>
            <a href="update.jsp?m_id=<%=movieLists[j].getM_id()%>&genre=<%=movieLists[0].getGenre()%>" class="btn btn-danger" style="position:relative; margin-bottom: 5px;">관리 하기</a>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<%
  
  }
}
%>