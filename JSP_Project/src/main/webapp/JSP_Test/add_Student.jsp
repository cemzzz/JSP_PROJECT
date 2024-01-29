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
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		
		String sql = 
			"INSERT INTO STUDENT (STU_NO, STU_NAME, STU_DEPT) "
			+ "VALUES('"
			+ stuNo + "','"
			+ stuName + "','"
			+ stuDept + "')";
		stmt.executeUpdate(sql);
		/* 이거 add_student_save.jsp 만들어서 진행하기 */
	%>
	<form name="join" action="">
		<div>학번 : 
			<input type="text">
		</div>
		<div>이름 :
			 <input type="text">
		</div>
		<div>학과 : 
			<input type="text">
		</div>
		<input type="button" value="추가하기">	
	</form>
</body>
</html>