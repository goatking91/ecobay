<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제목</title>
    
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css" /> 
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div id="main"><tiles:insertAttribute name="body" /></div>
        
    <script type="text/javascript">
        $(function() {
                  
        });    
    </script>    
</body>
</html>
