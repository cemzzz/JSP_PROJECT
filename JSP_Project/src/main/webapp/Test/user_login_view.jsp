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
		String pwd = request.getParameter("pwd");

		String sql = 
				"SELECT * FROM TBL_MEMBER "
				+ "WHERE USERID = '" 
				+ userId + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			if(rs.getString("PWD").equals(pwd)){
				out.println("로그인되었습니다.");
		%> 		<form action ="user_update.jsp">
					<input type="text" name="userId" value="<%= userId %>" hidden>
					<input type="submit" value="회원정보 수정">
				</form>								<% 
			}else{
				out.println("비밀번호를 확인해주세요");
			}
		}else{
			out.println("없는 아이디 입니다.");
		}
	%>

</body>
</html>