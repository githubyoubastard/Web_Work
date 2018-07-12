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
	boolean isSuccess=ClientsDao.getInstance().update(dto);
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
	<%if(isSuccess){%>
			<div>수정하였습니다.</div>
			<a href="../login_form.jsp">로그인</a>
	<%}else{ %>
			<div>다시 수정해주세요.</div>
			<a href="update_form.jsp">다시 수정하기</a>		
	<%} %>
	
</div>
</body>
</html>