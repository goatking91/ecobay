<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<script src = "/resources/lib/chart.js-2.7.3/dist/Chart.bundle.js"></script>
<script src = "/resources/lib/chart.js-2.7.3/dist/Chart.bundle.min.js"></script>
<script src = "/resources/lib/chart.js-2.7.3/dist/Chart.js"></script>
<script src = "/resources/lib/chart.js-2.7.3/dist/Chart.min.js"></script>

<div class="content-wrapper">
	<!-- 페이지 헤더(제목) -->
	<section class="content-header">
		<h1>
			Admin Login
			<small>Admin Login</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active"><a href="/admin/login.do">Login</a></li>
		</ol>
	</section>
	<!-- /페이지 헤더(제목) -->


	<!-- 내용 -->
	<section class="content container">
	<div class="row">
    	<div class="col-md-12">
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Login</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" action="/admin/login" method="post">
             <security:csrfInput />
              <div class="box-body">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Admin ID</label>

                  <div class="col-sm-12">
                    <input type="email" class="form-control" id="inputEmail3" placeholder="관리자ID를 입력해주세요." name="member_id">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Password</label>

                  <div class="col-sm-12">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="관리자 비밀번호를 입력해주세요." name="pwd">
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="button" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-info pull-right">Sign in</button>
              </div>
              <!-- /.box-footer -->
            </form>
      	</div>
      </div>
	</div>
	</section>
	<!-- /내용 -->
</div>
</html>
