<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse : collapse;
		text-align: center;
	}
	table{
	}
	td {
		width : 75%
		text-align: left;
	}
	th {
		background-color: #eee;
		width : 25%
	}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		String boardNo = request.getParameter("boardNo");
	
		stmt.executeUpdate(
			"UPDATE TBL_BOARD SET "
			+ "HIT = HIT+1 "
			+ "WHERE BOARDNO = " + boardNo
		);
	
		String sql 
			= "SELECT * FROM TBL_BOARD B "
			+ "INNER JOIN TBL_MEMBER M ON B.USERID = M.USERID "
			+ "WHERE BOARDNO = '" + boardNo + "'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		
	%>
	
	<table border="1">
		<tr>
			<th>제목</th>
			<td><%= rs.getString("TITLE") %></td>
		</tr>
		<tr>
			<th >작성자</th>
			<td ><%= rs.getString("USERNAME") %></td>
		</tr>
		<tr>
			<th >조회수</th>
			<td ><%= rs.getString("HIT") %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%= rs.getString("UDATETIME") %></td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
		</tr>
		<tr>
			<td colspan="2"><%= rs.getString("CONTENTS") %></td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="history.back()">
	
	<% 
		String sessionId = ""; // 리턴 값이 오브젝트 타입이여서 String 강제 변환
		String sessionStatus = "";
		String userId = rs.getString("USERID");
		if(request.isRequestedSessionIdValid()){
			sessionId = (String)session.getAttribute("userId");
			sessionStatus = (String)session.getAttribute("status");
		}
		
		if(userId.equals(sessionId) || "A".equals(sessionStatus)){	
	%>
		<input type="button" value="게시글 수정" onclick="boardUpdate(<%= boardNo %>)">
		<input type="button" value="게시글 삭제" onclick="boardDelete(<%= boardNo %>)">
	<% 		
		}
	%>
	
	
</body>
</html>
<script>
	function boardDelete(boardNo){
		if(confirm("정말 삭제하겠습니까?")){
			location.href="board_delete.jsp?boardNo=" +boardNo;
		}else{
			
		}
		userInfo.submit();
	}
	
	function boardUpdate(boardNo){
		if(confirm("수정하시겠습니까>")){
			location.href="board_update.jsp?boardNo=" +boardNo;		
		}
		userInfo.submit();
	}
</script>