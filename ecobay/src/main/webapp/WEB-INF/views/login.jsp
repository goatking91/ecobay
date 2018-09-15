<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>login Template for Bootstrap</title>
    <!-- Custom styles for this template -->
    <link href="/resources/css/login.css" rel="stylesheet">
</head>


<body class="text-center">
    <form class="form-signin" action="/login" method="post">
      <security:csrfInput />
      <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="text" name="member_id" id="member_id" class="form-control" placeholder="Email address" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" name="pwd" id="pwd" class="form-control" placeholder="Password" required>
      <div class="d-flex justify-content-between align-items-center">
      <span>
      	<input type="checkbox" value="remember-me"> 아이디 기억
      </span>	
      	<a href="#">아이디/비밀번호 찾기</a>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2018</p>
    </form>
  </body>
</html>