<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>ECObay</title>
    <style type="text/css">
    	#main{
    		width:100%;
    	}
    </style>
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/resources/lib/bootstrap/css/bootstrap.min.css" id="bootstrap-css" /> 
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/resources/lib/jquery-ui/jquery-ui.min.css">
	<script src="/resources/lib/jquery-ui/jquery-ui.min.js"></script>
</head>
<body>
    <div id="main"><tiles:insertAttribute name="body" /></div>
        
    <script type="text/javascript">
        $(function() {
                  
        });    
    </script>    
</body>
</html>
