<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "test.write.review.ReviewDataBean"%>
<%@ page import = "test.write.review.ReviewDBBean"%>
<%@ page import="java.text.SimpleDateFormat"%>

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
<body>
<%
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");
   String customerId = request.getParameter("customerId");

   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
      ReviewDBBean dbPro = ReviewDBBean.getInstance(); 
      ReviewDataBean review =  dbPro.getreview(num);
  
	  int ref=review.getRef();
	  int re_step=review.getRe_step();
	  int re_level=review.getRe_level();
%>
<div class="container">
  <div class="alert alert-primary" role="alert">
    <h1><i class="fas fa-eye"></i> 글내용 보기</h1>
  </div>

  <table class="table table-striped table-hover table-bordered">
    <tbody>
      <tr>
        <td>상품 이름</td>
        <td><%=review.getProduct_name()%></td>
        <td>조회수</td>
        <td><%=review.getReadCount()%></td>
      </tr>
      <tr>
        <td>작성자</td>
        <td><%=review.getCustomerName()%></td>
        <td>작성일</td>
        <td><%=sdf.format(review.getReg_date())%></td>
      </tr>
      <tr>
        <td>글제목</td>
        <td colspan="3"><%=review.getSubject()%></td>
      </tr>
      <tr>
        <td>글내용</td>
        <td colspan="3"><pre><%=review.getContent()%></pre></td>
      </tr>
      <tr>      
        <td colspan="4">
          <div class=" mx-auto"  > 
          <a href="updateForm.jsp?num=<%=review.getNum()%>&pageNum=<%=pageNum%>" class="btn btn-warning">글수정</a>
          <a href="deleteForm.jsp?num=<%=review.getNum()%>&pageNum=<%=pageNum%>" class="btn btn-danger">글삭제</a>
          <a href="writeForm.jsp?product_id=<%=review.getProduct_id()%>&customerId=<%=customerId%>&product_name=<%=review.getProduct_name()%>&num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>" class="btn btn-success">답글쓰기</a>
          <a href="viewList.jsp?pageNum=<%=pageNum%>" class="btn btn-primary">글목록</a>
          </div>
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