<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="cmtAdd">
		<%@ include file="dbconn.jsp"%>
		<%	
			String boardNo = request.getParameter("boardNo");
			String userId = request.getParameter("userId");
			String comment = request.getParameter("comment");
			String commentNo = request.getParameter("commentNo");
			String kind = request.getParameter("kind");
			
			
			String sql = 
				"INSERT INTO TBL_COMMENT VALUES("
					+ "COMMENT_SEQ.NEXTVAL, "
					+ "'" + boardNo + "',"
					+ "'" + comment + "',"
					+ "'" + userId + "',"
					+ "'N',"
					+ "null,"
					+ "SYSDATE,"
					+ "SYSDATE )";
			/* stmt.executeUpdate(sql); */
			
			String updateSql 
				= "UPDATE TBL_COMMENT SET"
				+ " CMT = '" + comment + "'"
				+ ", UDATETIME = SYSDATE"
				+ " WHERE COMMENTNO = " + commentNo;
			
			if(kind.equals("add")){
				stmt.executeUpdate(sql);
			} else {
				stmt.executeUpdate(updateSql);
			} 
			
		%>
	</form>

</body>
</html>
<script>
	
</script>