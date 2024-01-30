<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse : collapse;
		text-align: center;
	}
	th {
		background-color: #eee;
	}
</style>
</head>
<body>
	<form>
		<%@ include file="dbconn.jsp"%>
		<%
		request.setCharacterEncoding("UTF-8");
		String sql = 
				"SELECT S.STU_ID, STU_NAME, STU_DEPT, AVG(GRADE) AS GRADE " 
	            + "FROM TBL_STULIST S " 
	            + "INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID " 
	            + "GROUP BY S.STU_ID, STU_NAME, STU_DEPT "
	            + "ORDER BY GRADE DESC";
	            
		
		ResultSet rs = stmt.executeQuery(sql);
			
		%>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>평균 점수</th>
			</tr>
		<%
			while(rs.next()){
		%>
			<tr>
				<td><%= rs.getString("STU_ID") %></td>
				<td>
					<a href="stu_status.jsp?stuId=<%= rs.getString("STU_ID") %>">
						<%= rs.getString("STU_NAME") %>
					</a>
				</td>
				<td><%= rs.getString("STU_DEPT") %></td>
				<td><%= rs.getString("GRADE") %></td>
			</tr>
		<% 
		}
		%>
	</table>
	<input type ="button" value="학생추가" onclick="addStudent()">
	</form>


</body>
</html>

<script>

	function addStudent(){
		location.href="add_student.jsp";
	}

</script>