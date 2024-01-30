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
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String subject = request.getParameter("subject");
		String grade = request.getParameter("grade");
		
		String stusql = 
			"INSERT INTO TBL_STULIST (STU_ID, STU_NAME, STU_DEPT) "
			+ "VALUES('"
			+ stuId + "','"
			+ stuName + "','"
			+ stuDept + "')";
		stmt.executeUpdate(stusql);
		
		String gradesql = 
			"INSERT INTO TBL_GRADE (SUBJECT, GRADE) "
			+ "VALUES('"
			+ subject + "','"
			+ grade + "')";
		stmt.executeUpdate(gradesql);
	%>


</body>
</html>
<script>
	alert("학생정보가 저장되었습니다.");
	window.history.back();
</script>