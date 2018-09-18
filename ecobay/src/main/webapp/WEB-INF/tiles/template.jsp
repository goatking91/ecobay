<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>ECObay</title>
     <style>
        #header{            
            width:100%;
            height: 100%;
        }
        #main{
            width:100%;
            min-height: 1000px;
        }
        #footer{
            width: 100%;           
        }
    </style>
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/resources/lib/bootstrap/css/bootstrap.min.css" id="bootstrap-css" /> 
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/resources/jquery-ui/jquery-ui.min.css">
	<script src="/resources/lib/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="/resources/lib/fontawesome/css/font-awesome.min.css">
    
    
</head>
<body>
    <div style="width:100%; height:100%;">
    <div id="header"><tiles:insertAttribute name="header" /></div>
    <div id="main"><tiles:insertAttribute name="body" /></div>    
    <div id="foot"><tiles:insertAttribute name="footer" /></div>
    </div>
 
    <script type="text/javascript">
        $(function() {
 
        });    
    </script>    
</body>
</html>