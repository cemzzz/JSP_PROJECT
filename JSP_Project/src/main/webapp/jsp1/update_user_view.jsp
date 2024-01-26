<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String gender = request.getParameter("gender");
		
		String[] hobby = {};
		if(request.getParameterValues("hobby") != null){
			hobby = request.getParameterValues("hobby");
		}		
		String comment = request.getParameter("comment");
		String phone = phone1 + phone2 + phone3;
		
		String pwdStr = "";
		if(pwd != "" && pwd != null){
			pwdStr = "PWD = '" + pwd + "',";
		} else {
			pwdStr = "";
		}
		stmt.executeUpdate(
			"UPDATE TBL_MEMBER SET "
			+ pwdStr
			+ "USERNAME = '" + name + "',"
			+ "PHONE = '" + phone + "',"
			+ "GENDER = '" + gender + "',"
			+ "HOBBY1 = '" + (hobby.length>0 ? hobby[0] : "") + "',"
			+ "HOBBY2 = '" + (hobby.length>1 ? hobby[1] : "") + "',"
			+ "HOBBY3 = '" + (hobby.length>2 ? hobby[2] : "") + "',"
			+ "CMT = '" + comment+ "' "
			+ "WHERE USERID = '" + id + "'"
		); 
		
	%>
	
</body>
</html>