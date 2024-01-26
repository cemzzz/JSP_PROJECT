<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		
		String sql = 
				"SELECT * FROM TBL_MEMBER "
				+ "WHERE USERID = '" 
				+ userId + "'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		String id = rs.getString("USERID");
		/* String pwd = rs.getString("pwd"); */
		String name = rs.getString("USERNAME");
		String gender = rs.getString("GENDER");
		
		
	%>
		<form action="user_update_result.jsp" method="post">
			<input name="userId" value= "<%= id %>" hidden>
			<div>아이디 : <input type="text" name="userId" value="<%= id %>"disabled></div>
			<div>비밀번호 : <input type="password" name="pwd"></div>
			<div>이름 : <input type="text" name="userName" value="<%= name %>"></div>
			<div><span class="select_input"> 성별 : </span>
				<% if(gender.equals("남자")) { %>
					<label><input type="radio" value="남자" name="gender" checked> 남자 </label>
					<label><input type="radio" value="여자" name="gender"> 여자 </label>			
				<%} else{ %>
					<label><input type="radio" value="남자" name="gender"> 남자 </label>
					<label><input type="radio" value="여자" name="gender" checked> 여자 </label>		
				<% } %>
			</div>
			<input type="submit" value="수정하기"></div>
		</form>
		
</body>
</html>