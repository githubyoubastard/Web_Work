<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url=request.getRequestURI();
	String user=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mystyle.css" />
</head>
<body>
<div class="container">
	<%if(user!=null){ %>
		<p><strong><a href="user/private/userInfo.jsp"><%=user %></a></strong>로그인 중</p>
		<p><a href="user/logout.jsp">로그아웃</a></p>
	<%}else{ %>
		<a href="user/login_form.jsp?url=<%=url %>">로그인</a>
		<a href="user/create_form.jsp">회원가입</a>
	<%} %>
	<p><a href="board/qboard.jsp">질문 게시판</a></p>
</div>
</body>
</html>