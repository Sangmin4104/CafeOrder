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
<link href="style.css" rel="stylesheet">
</head>
<body style="background-image:url('../img/food.jfif'); background-size:cover;">
<div class="main">
 <div class="login">
  <h1 class="heading"  style=" position:relative; top:20px;">Login</h1>
   <a href = "../logon/managerLoginForm.jsp"><i class="fas fa-user-tie" style=" font-size:25px; color:#adb5bd; position:relative; top:-20px; left:200px; "></i></a>

  <form method="post" action="userLoginPro.jsp">
  <div class="input">
   <label for="id">Id</label>
   <input type="text" id="id" name="id" autocomplete="off" required>
  </div>
  <div class="input">
   <label for="passwd">Password</label>
   <input type="password" id="passwd" name="passwd" autocomplete="off" required>
  </div>
  <div class="divider"></div>
  <button class="login-btn" style="position:relative; top:30px;">Log In</button>
  
  <p class="meta-text" hidden>Too lazy ? Login with a social media account</p>
</form>
 <button class="login-btn" style="position:relative; top:20px;" Onclick="location='NewLoginForm.jsp'">Sign Up</button>
 </div>
 
 
</div>
</body>
</html>