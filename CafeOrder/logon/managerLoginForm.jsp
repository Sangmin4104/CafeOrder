<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<!-- <link rel="stylesheet" href="../../../assets/bootstrap-5.1.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
<link href="mstyle.css" rel="stylesheet">
</head>
<body style="background-image:url('../img/food.jfif'); background-size:cover;">
<div class="main">
 <div class="login">
  <h1 class="heading" style="position:relative; top:20px;">Login</h1>
   <a href = "../Customer/userLoginForm.jsp"><i class="fas fa-user" style=" font-size:25px; color:#adb5bd; position:relative; top:-20px; left:200px; "></i></a>

  <form method="post" action="managerLoginPro.jsp">
  <div class="input">
   <label for="mid">아이디</label>
   <input type="text" id="mid" name="mid" autocomplete="off" required>
  </div>
  <div class="input">
   <label for="mpasswd">패스워드</label>
   <input type="password" id="mpasswd" name="mpasswd" autocomplete="off" required>
  </div>
  <p class="meta-text" style="text-align:center; color:black;">관리자 외 입력금지</p>
  <div class="divider"></div>
  <button class="login-btn" style="position:relative; top:30px;">로그인</button>
  
  
  
</form>

 
 
</div>
</body>
</html>