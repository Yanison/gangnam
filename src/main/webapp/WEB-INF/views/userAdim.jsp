<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="rscs/basicRscs.jsp" %>
	<link href="/resources/common/css/userAdmin.css" rel="stylesheet">
</head>
<body>
<div class="userAdminDiv">
	<div class="userDiv">user</div> 
	<div class="adminDiv">Admin</div>
</div>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>