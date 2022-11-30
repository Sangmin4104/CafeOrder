<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  int menu_id = Integer.parseInt(request.getParameter("menu_id"));
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String mid = request.getParameter("mid");
  String menu_title = request.getParameter("menu_title");
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
<link href="../style.css" rel="stylesheet">
</head>
<body style="background-image:url('../img/food.png'); background-size:cover;">
<img src="../img/logo.png" style="width:300px; top:-20px; height:300px; position:relative; left:620px;">
<div class="container">
<div class="alert alert-warning" role="alert" style="height:100%; position:relative; top:-50px;">
        <a href = "productList.jsp?menu_kind=all&mid=<%=mid%>" style="position:relative; top:5px;"><i class="fas fa-arrow-left" style="color:black;"></i></a>
        <h3 style="position:relative; top:-25px; left:30px; color:black;"><%=menu_title%> 리뷰</h3>
  </div>
</div>

  <form method="post" action="deletePro.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>" onsubmit="return deleteSave(this)"> 
    <input type="hidden" name="num" value="<%=num%>">
    <table class="table table-hover table-bordered" style="position:relative; width:84.4%; top:-90px; left:120px;">
      <tr bgcolor="white">
        <td><strong>비밀번호를 입력해 주세요.</strong></td>
      </tr>
      <tr bgcolor="white">
        <td>비밀번호 :   
          <input type="password" name="passwd" class="form-control" size="8" maxlength="12" required>
        </td>
    </tr>
    <tr bgcolor="white">
        <td class="text-center">
          <input type="submit" class="btn btn-danger" value="글삭제">
          <a href="list.jsp?pageNum=<%=pageNum%>&menu_id=<%=menu_id%>&menu_title=<%=menu_title%>" class="btn btn-primary">글목록</a> 
      </td>
    </tr>  
    </table> 
  </form>
</div>
<script>    
  function deleteSave(obj){	
    if(!obj.passwd.value){
      alert('비밀번호를 입력하십시요.');
      obj.passwd.focus();
      return false;
    }
  }    
</script>
</body>
</html>