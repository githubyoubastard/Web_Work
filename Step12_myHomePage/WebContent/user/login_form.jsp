<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url=request.getParameter("url");
	if(url==null){
		url=request.getContextPath()+"/";
	}
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
	<h3>로그인</h3>
	
		<form action="login.jsp?url=<%=url %>" method="post" class="form-group">
			<div class="row">
				<div class="col-xs-6 col-sm-6 push-sm-4">
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" class="form-control"/>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6 col-sm-6">
					<label for="pwd">비밀번호</label>
					<input type="password" name="pwd" id="pwd" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6 col-sm-12">
					<button type="submit" class="btn btn-default">로그인</button>
				</div>	
			</div>
		</form>
</div>
</body>
</html>