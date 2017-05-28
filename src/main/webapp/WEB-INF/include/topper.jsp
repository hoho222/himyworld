<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 공통 환경을 잡는 jsp 파일 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="shortcut icon" href="http://localhost:8080/hiworld/resources/images/piglethead.ico">

<link rel="stylesheet" type="text/css" href="<c:url value='/css/paging.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/button.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/slider-style.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery.mmenu.all.css'/>" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<%-- <script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script> --%>
<script type="text/javascript" src="<c:url value='/js/jquery.mmenu.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/modernizr.custom.28468.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.cslider.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/login.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/table.js'/>"></script>

<title>Welecome to Hiworld!</title>
</head>
<body>
<c:set var="sessionId"><%= (String)session.getAttribute("loginId") %></c:set>
<c:set var="sessionName"><%= (String)session.getAttribute("loginName") %></c:set>
<div id="top"></div>
</body>
</html>