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
</head>
<body>
<div class="container">
    <div class="alert alert-primary" role="alert">
        <h2 style="position:relative; top:15px;">로그인폼</h2>
        <a href = "../logon/managerLoginForm.jsp"><i class="fas fa-user-tie" style=" font-size:25px; color:#adb5bd; position:relative; top:-20px; left:1220px; "></i></a>
    </div>
    
    <form method="post" action="userLoginPro.jsp">
        <div class="mb-3 row">
            <label for="id" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="id" name="id" maxlength="50" style="ime-mode:inactive;" autocomplete="off" required>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="passwd" class="col-sm-2 col-form-label">비밀번호</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="passwd" name="passwd" maxlength="16" style="ime-mode:inactive;" autocomplete="off" required>
            </div>
        </div>
        <div class="mb-3 row">
            <input type="submit" class="btn btn-success" value="로그인">
        </div>
        
    </form>
    <div class="mb-3 row">
            <input type="submit" class="btn btn-primary" onclick="location='NewLoginForm.jsp'" value="회원가입">
        </div>
</div>
</body>
</html>