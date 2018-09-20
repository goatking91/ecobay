<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<title>ECObay-AdminPage</title>
  	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/lib/jquery-ui/jquery-ui.min.js"></script> 
	<script src="/resources/lib/adminLTE/js/adminlte.min.js"></script>
    
	<link rel="stylesheet" href="/resources/lib/bootstrap/css/bootstrap.min.css" id="bootstrap-css">   
	<link rel="stylesheet" href="/resources/lib/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/lib/adminLTE/css/AdminLTE.min.css">
	<link rel="stylesheet" href="/resources/lib/jquery-ui/jquery-ui.min.css">
	<link rel="stylesheet" href="/resources/lib/adminLTE/css/skins/skin-blue.min.css">


	<!-- Google Font -->
	<link rel="stylesheet"
	      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	      
	 
     <style>
        #adminHeader{            
            width:100%;
        }
        #adminMain{
            width:100%;
            /* min-height: 1000px; */
        }
        #adminFoot{
            width: 100%;           
        }
    </style>
   
    
    
</head>
<body>
    <div style="width:100%; height:100%;">
	    <div id="adminHeader"><tiles:insertAttribute name="adminHeader" /></div>
	    <div id="adminMain"><tiles:insertAttribute name="adminBody" /></div>    
		<div id="adminFoot"><tiles:insertAttribute name="adminFooter" /></div>
    </div>
</body>
</html>

