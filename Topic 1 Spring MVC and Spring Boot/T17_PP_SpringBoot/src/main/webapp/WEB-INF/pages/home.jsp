<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>

<link href="${pageContext.request.contextPath}/resources/static/style.css" type="text/css" rel="stylesheet"/>

</head>
<body>

<p>${pageContext.request.contextPath}</p>
<h1>Home</h1>
<p>Message : ${MESSAGE}</p>

<%= request.getAttribute("MESSAGE") %>

</body>
</html>