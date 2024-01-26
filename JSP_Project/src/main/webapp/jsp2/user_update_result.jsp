<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 완료</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String userName = request.getParameter("userName");
		String gender = request.getParameter("gender");
		
		String pwdStr = "";
		if(pwd != null && !pwd.equals("")) {
			pwdStr = "PWD = '" + pwd + "',";
		}
		
		String sql = 
			"UPDATE TBL_MEMBER SET "
			+ pwdStr
			+ "USERNAME = '" + userName  + "',"
			+ "GENDER = '" + gender  + "' "
			+ "WHERE USERID = '" + userId + "'";
		stmt.executeUpdate(sql);
	%>
	<div>회원정보가 수정되었습니다.</div>
</body>
</html>