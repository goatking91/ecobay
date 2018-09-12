<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제목</title>
    <style>
        #header{            
            width:100%;
            height:100px;
        }
        #main{
            float:left;
            width:100%;
            min-height: 1000px;
        }
        #footer{
            width: 100%;
            height: 100px;            
        }
    </style>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css" /> 
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    
</head>
<body>
    <div style="width:100%; height:100%;">
    <div id="header"><tiles:insertAttribute name="header" /></div>
    <div id="main"><tiles:insertAttribute name="body" /></div>    
    <div id="footer"><tiles:insertAttribute name="footer" /></div>
    </div>
 
    <script type="text/javascript">
        $(function() {
 
        });    
    </script>    
</body>
</html>