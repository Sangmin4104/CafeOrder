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
  <h1 class="heading">회원가입</h1>

  <form method="post" action="NewLoginPro.jsp">
  <div class="input">
   <label for="id">Id</label>
   <input type="text" id="id" name="id" autocompleffte="o" required>
  </div>
  <div class="input">
   <label for="passwd">Password</label>
   <input type="password" id="passwd" name="passwd" autocomplete="off" required>
  </div>
  <div class="input">
   <label for="name">Name</label>
   <input type="text" id="name" name="name" autocomplete="off" required>
  </div>
  <div class="input">
   <label for="phonenum">Phonenum</label>
   <input type="text" id="phonenum" name="phonenum" autocomplete="off" required>
  </div>
  <div class="input">
   <label for="email">E-mail</label>
   <input type="text" id="email" name="email" autocomplete="off" required>
  </div>
  <div class="divider"></div>
  <button class="login-btn" style="position:relative; top:30px;">가입하기</button>
  
  <p class="meta-text" hidden>Too lazy ? Login with a social media account</p>
</form>
 <button class="login-btn" style="position:relative; top:20px;" Onclick='history.go(-1);'>뒤로가기</button>
 </div>
 
 
</div>
</body>
</html>