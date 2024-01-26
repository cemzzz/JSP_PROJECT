<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		if(request.isRequestedSessionIdValid()){
			out.println("세션있음");
			
			/* 세션 별도로 제거  */
			/* 
			session.removeAttribute("userId");
			session.removeAttribute("userName");
			session.removeAttribute("status"); 
			*/
			
			/* 세션 한번에 제거  */
			session.invalidate();
		} else {
			out.println("세션없음");
		}
	%>
	<form action="user_login_view.jsp">
		<div>아이디 : <input type="text" name="userId"></div>
		<div>패스워드 : <input type="password" name="pwd"></div>
		<input type="submit" value="로그인">	
	</form>

</body>
</html>