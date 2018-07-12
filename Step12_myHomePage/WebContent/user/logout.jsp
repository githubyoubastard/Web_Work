<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cPath=request.getContextPath();
	String id=(String)session.getAttribute("id");
	session.invalidate();
	response.sendRedirect(cPath+"/");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
<p>로그아웃</p>
</body>
</html>