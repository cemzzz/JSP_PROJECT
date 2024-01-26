<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	<%
		String userId = request.getParameter("userId");
		String sql 
			= "SELECT * FROM TBL_MEMBER " 
			+ "WHERE USERID = '" + userId + "'";
		
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		String Id = rs.getString("USERID");
		String userName = rs.getString("USERNAME"); 
		String gender = rs.getString("GENDER");
	
	%>
	
	<form action="user_update_result.jsp" method="post">
		<input name="userId" value= "<%= Id %>" hidden>
		<div>아이디 :  <input type="text" name="userId" value= "<%= Id %>" disabled></div>
		<div>비밀번호 : <input type="password" name="pwd"></div>
		<div>이름 :    <input type="text" name="userName" value= "<%= userName %>" ></div>
		<div> <span class="select_input"> 성별 : </span> 
			<% if(gender.equals("남성")){ %>
				<label><input type= "radio" name="gender" value = "남자" checked>남자</label>
				<label><input type= "radio" name="gender" value = "여자">여자</label>
			<% } else { %>
				<label><input type= "radio" name="gender" value = "남자">남자</label>
				<label><input type= "radio" name="gender" value = "여자" checked>여자</label>
			<% } %>
		</div>
		<input type="submit" onclick="" value="수정하기">
	</form>

</body>
</html>