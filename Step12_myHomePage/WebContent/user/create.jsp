<%@page import="test.clients.dao.ClientsDao"%>
<%@page import="test.clients.dto.ClientsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	ClientsDto dto=new ClientsDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	boolean createSuccess=ClientsDao.getInstance().insert(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<%if(createSuccess){ %>
			<p>회원가입 성공</p>
			<a href="login_form.jsp">로그인</a>
	<%}else{ %>
			<p>회원가입 실패</p>
			<a href="create_form.jsp">회원가입</a>
	<%} %>
</div>
</body>
</html>