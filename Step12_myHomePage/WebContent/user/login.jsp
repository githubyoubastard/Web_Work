<%@page import="test.clients.dao.ClientsDao"%>
<%@page import="test.clients.dto.ClientsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url=request.getParameter("url");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	ClientsDto dto=new ClientsDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isSuccess=ClientsDao.getInstance().isValid(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<%if(isSuccess){ session.setAttribute("id", id); %>
			<p><strong><%=dto.getId() %></strong>님 로그인 성공</p>
			<a href="<%=url %>">초기화면</a>
	<%}else{ %>
			<p>아이디 또는 비밀번호가 다릅니다.</p>
			<a href="login_form.jsp?url=<%=url %>">로그인</a>
	<%} %>
</div>
</body>
</html>