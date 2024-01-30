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
	
	String sql = 
			"SELECT * " 
            + "FROM TBL_STULIST S " 
            + "INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID "
            + "WHERE S.STU_ID = '" + stuId + "'";
	
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();
	%>
	
	<div> 학번 : <%= rs.getString("STU_ID") %> </div>
	<div> 이름 : <%= rs.getString("STU_NAME") %> </div>
	<div> 학과 : <%= rs.getString("STU_DEPT") %></div>
	<div> 과목명 : <%= rs.getString("SUBJECT") %></div>
	<div> 점수 : <%= rs.getString("GRADE") %></div>
	
	<div>
		<input type="button" value ="수정" onclick="updateBtn(<%= stuId %> )">
		<input type="button" value ="삭제" onclick="deleteBtn(<%= stuId %>)">
	</div>
	

</body>
</html>
<script>
	 function updateBtn(){
		 if(confirm("해당 학생을 '소프트웨어'과로 변경하시겠습니까?")){
			 location.href="student_update.jsp"
			}
	 }
	 
	 function deleteBtn(){
		 if(confirm("정말 삭제하시겠습니까?")){
				location.href="student_delete.jsp"	
			}
	 }
</script>