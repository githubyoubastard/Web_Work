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
<title>사용자 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
<table class="table table-bordered">
	<thead>
		<tr>
			<th>항목</th>
			<th>정보</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>아이디</td>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<td>가입날짜</td>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</tbody>
</table>

	<a href="update_form.jsp">
		<button class="btn btn-warning">수정
			<i class="glyphicon glyphicon-pencil"></i>
		</button>
	</a>
	
	<a href="javascript:deleteConfirm()">
		<button class="btn btn-danger">삭제
			<i class="glyphicon glyphicon-remove"></i>
		</button>
	</a>

</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	function deleteConfirm(){
		var isConfirm=confirm("회원 정보를 삭제 하시겠습니까?");
		if(isConfirm){
			location.href="delete.jsp";
		}
	}
</script>	
</body>
</html>