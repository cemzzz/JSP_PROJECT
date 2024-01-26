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
		String userId = request.getParameter("userId");
		String sql =
			"UPDATE TBL_MEMBER SET "
			+ "CNT = 0 "
			+ "WHERE USERID = '" + userId + "'";
		stmt.executeUpdate(sql);
	%>
</body>
</html>
<script>
	alert("초기화 되었습니다.!");
	location.href="user_list.jsp";
</script>