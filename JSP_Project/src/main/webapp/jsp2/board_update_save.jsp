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
	String boardNo = request.getParameter("boardNo");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	String sql
			= "UPDATE TBL_BOARD SET "
			+ "TITLE = '" + title + "', "
			+ "CONTENTS = '" + contents + "', "
			+ "UDATETIME = SYSDATE "
			+ "WHERE BOARDNO = " + boardNo;
		
	 stmt.executeUpdate(sql);
	%>

</body>
</html>
<script>
	alert("게시글 수정이 완료했습니다.");
	location.href="board_list.jsp"
</script>
