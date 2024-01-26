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
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String userId = (String)session.getAttribute("userId");
		
		String sql =
			"INSERT INTO TBL_BOARD VALUES("
				+ "BBS_SEQ.NEXTVAL,"
				+ "'" + title + "',"
				+ "'" + contents + "',"
				+ "0,"
				+ "'" + userId + "',"
				+ "2,"
				+ "SYSDATE,"
				+ "SYSDATE)";
		stmt.executeUpdate(sql);
		
	%>

</body>
</html>
<script>
	alert("작성 완료했습니다.");
	location.href="board_list.jsp"
	
</script>