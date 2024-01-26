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
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String sql = 
				"SELECT * FROM " 
				+ " TBL_MEMBER WHERE USERID = '" + id + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){	
			if(rs.getString("PWD").equals(pwd)){
				out.println(rs.getString("USERNAME")+ "님 환영합니다.");
				%>
					<form action="update_user.jsp">
					<div>
						<input type="text" name = "id" value="<%= id %>" hidden >
						<input type="submit" value="회원정보 수정">
					</div>
					</form>
				<%
			}else{
				out.println("패스워드를 확인하세요.");
			}
		} else {
			out.println("없는 아이디 입니다.");
		}
	%>
	
	<!--ResultSet rs = stmt.executeQuery(sql); 데이터 조회할 때  -->
	<!-- stmt.executeUpdate(); 데이터 입력할 때  -->
</body>
</html>