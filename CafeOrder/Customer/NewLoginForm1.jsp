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
</head>
<body>
<div class="container">
    <div class="alert alert-primary" role="alert">
        <h2>회원가입</h2>
    </div>
    
    <form method="post" action="NewLoginPro.jsp">
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
            <label for="name" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="name" name="name" maxlength="16" style="ime-mode:inactive;" autocomplete="off" required>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="phonenum" class="col-sm-2 col-form-label">휴대폰 번호</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="phonenum" name="phonenum" maxlength="16" style="ime-mode:inactive;" autocomplete="off" required>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="email" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="email" name="email" maxlength="30" style="ime-mode:inactive;" autocomplete="off" required>
            </div>
        </div>
        <div class="mb-3 row">
            <input type="submit" class="btn btn-success" value="가입하기">
        </div>
        <div class="mb-3 row">
            <input type="submit" class="btn btn-success" value="뒤로가기">
        </div>
    </form>
</div>
</body>
</html>