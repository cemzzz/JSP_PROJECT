<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="cmtDelete">
		<%@ include file="dbconn.jsp"%>
		<%
			String commentNo = request.getParameter("commentNo");
			String boardNo = request.getParameter("boardNo");
		
			String sql
				= "DELETE FROM TBL_COMMENT "
				+ " WHERE COMMENTNO = '" + commentNo + "'"; 
			
			stmt.executeUpdate(sql);
		%>
		<input name="boardNo" value="<%= boardNo %>" hidden>	
	</form>
</body>
</html>
<script>
	alert("삭제되었습니다!");
	history.back();
	/* var boardNo = document.cmtDelete.boardNo.value;
	location.href="board_view.jsp?boardNo="+boardNo; */
</script>