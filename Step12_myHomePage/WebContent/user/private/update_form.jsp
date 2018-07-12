<%@page import="test.clients.dao.ClientsDao"%>
<%@page import="test.clients.dto.ClientsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	ClientsDto dto=ClientsDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update_form</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.result{display: none; color:tomato;}
</style>
</head>
<body>
<div class="container">
	<form action="update.jsp" method="post" class="form-group" id="editForm">
		<input type="hidden" name="id" value="<%=id%>"/>
		<label for="id">아이디</label>
		<input type="text" id="id" value="<%=id%>" disabled="disabled" class="form-control"/>
		<label for="pwd">비밀번호</label>
		<input type="password" name="pwd" id="pwd" value="<%=dto.getPwd() %>" class="form-control" />
		<p class="result">비밀번호가 같지 않습니다.</p>
		<label for="pwd2">비밀번호 재확인</label>
		<input type="password" name="pwd2" id="pwd2" value="<%=dto.getPwd() %>" class="form-control" />
		<p class="result">비밀번호가 같지 않습니다.</p>
		<label for="email">이메일</label>
		<input type="text" name="email" id="email" value="<%=dto.getEmail() %>" class="form-control" />
		<button type="submit" class="btn btn-primary btn-xs">수정<i class="glyphicon glyphicon-pencil"></i></button>
	</form>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	$("#editForm").submit(function(){
		var pwd1=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		if(pwd1!=pwd2){
			return false;
			$(".result").css("display","block");
			alert("비밀번호가 같지 않습니다.");
		}
	});
</script>
</body>
</html>