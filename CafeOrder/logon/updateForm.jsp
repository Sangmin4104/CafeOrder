<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ch13.board.BoardDBBean"%>
<%@ page import="ch13.board.BoardDataBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
</head>
<body>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  try{
      BoardDBBean dbPro = BoardDBBean.getInstance(); 
      BoardDataBean article = dbPro.updateGetArticle(num);

%>
<div class="container">
  <div class="alert alert-primary" role="alert">
      <h1><i class="fas fa-eye"></i> 글수정</h1>
  </div>

  <form method="post" action="updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave(this)">
    <input type="hidden" name="num" value="<%=article.getNum()%>">
    <table class="table table-hover table-bordered">
      <tbody>
      <tr>
        <td class="table-primary">이 름</td>
        <td>
          <input type="text" class="form-control" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>" style="ime-mode:active;" required>
        </td>
      </tr>
      <tr>
        <td class="table-primary">제 목</td>
        <td>
          <input type="text" class="form-control" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>" style="ime-mode:active;" required>
        </td>
      </tr>
      <tr>
        <td class="table-primary">Email</td>
        <td>
          <input type="text" class="form-control" size="40" maxlength="30" name="email" value="<%=article.getEmail()%>" style="ime-mode:inactive;">
        </td>
      </tr>
      <tr>
        <td class="table-primary">내 용</td>
        <td>
          <textarea name="content" class="form-control" rows="13" cols="40" style="ime-mode:active;" required><%=article.getContent()%></textarea>
        </td>
      </tr>
      <tr>
        <td class="table-primary">비밀번호</td>
        <td>
          <input type="password" class="form-control" size="8" maxlength="12" name="passwd" style="ime-mode:inactive;" required="required">
        </td>
      </tr>
      <tr>      
      <td colspan="2" class="text-center"> 
        <input type="submit" class="btn btn-danger" value="글수정">  
        <input type="reset" class="btn btn-warning" value="다시작성">
        <a href="list.jsp?pageNum=<%=pageNum%>" class="btn btn-primary">목록보기</a>
      </td>
    </tr>
    </tbody>
    </table>
  </form>
<%
}catch(Exception e){}%>      
</div>
<script src="script.js"></script>
</body>
</html>