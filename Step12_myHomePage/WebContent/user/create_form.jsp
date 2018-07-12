<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>create_form</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h3>회원가입</h3>
		<form action="create.jsp" method="post" class="form-group">
			<div class="row">
				<div class="col-xs-6">
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" class="form-control"/>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6">
					<label for="pwd">비밀번호</label>
					<input type="password" name="pwd" id="pwd" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6">
					<label for="repwd">비밀번호 재확인</label>
					<input type="password" name="repwd" id="repwd" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6">
					<label for="email">이메일</label>
					<input type="text" name="email" id="email" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6">
					<button type="submit" class="btn btn-default">가입</button>
				</div>	
			</div>
		</form>
</div>
</body>
</html>