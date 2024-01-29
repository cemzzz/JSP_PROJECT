<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<%@ include file="dbconn.jsp"%>
		<%
		String sql = 
			"SELECT STU_NO, STU_NAME, STU_DEPT "
			+ "FROM STUDENT";
		
		ResultSet rs = stmt.executeQuery(sql);
		%>
		
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
			</tr>
		<%
		while(rs.next()){
		%>
			<tr>
				<td><%= rs.getString("STU_NO") %></td>
				<td><%= rs.getString("STU_NAME") %></td>
				<td><%= rs.getString("STU_DEPT") %></td>
			</tr>
		
		<%
		}		
		%>
		</table>
		<div>
			<input type ="button" value="학생 추가" onclick="addStudent()">		
		</div>
	</form>

</body>
</html>
<script>
	function addStudent(){
		location.href="add_Student.jsp";
	}
</script>