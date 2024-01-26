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
		
		
		String sql = "SELECT * FROM TBL_BOARD WHERE BOARDNO = '" + boardNo + "' ";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		
		/* stmt.executeUpdate(
			    "UPDATE TBL_BOARD SET "
			    + "TITLE = '" + title + "', "
			    + "CONTENTS = '" + contents + "', "
			    + "UDATETIME = NOW() "
			    + "WHERE BOARDNO = '" + boardNo + "'"); */
	%>
	
	
	<form action="board_update_save.jsp">
		<input name = "boardNo" value="<%= boardNo %>" hidden>
		<div> 제목 : <input name="title" type ="text" value="<%= rs.getString("TITLE") %>"></div>
		<div> 내용 : </div>
			<textarea name="contents" rows ="20" cols="50"><%= rs.getString("CONTENTS") %></textarea>
		</div>
		<div>
			<input type="submit" value="수정 완료">
			<input type="button" value="취소" onclick ="history.back()">
		</div>	
	</form>

</body>
</html>