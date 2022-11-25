<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>sgworld-select</title>
	<%@ include file="rscs/basicRscs.jsp" %>
	<link href="/resources/common/css/userAdmin.css" rel="stylesheet">
</head>
<body>
	<div class="userAdminDiv">
		<button onclick="goUser()">USER</button>
		<button onclick="goAdmin()">ADMIN</button>
	</div>
</body>
</html>