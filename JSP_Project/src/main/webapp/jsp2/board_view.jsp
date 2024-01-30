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
	<form name="boardView">
	<input name="commentNo" hidden>
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
				+ "WHERE B.BOARDNO = '" + boardNo + "'";
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
		
		<% 
			String sessionId = ""; // 리턴 값이 오브젝트 타입이여서 String 강제 변환
			String sessionStatus = "";
			String userId = rs.getString("USERID");
			if(request.isRequestedSessionIdValid()){
				sessionId = (String)session.getAttribute("userId");
				sessionStatus = (String)session.getAttribute("status");
			}
		%>
			<br>
			<hr>
		<%
			rs = stmt.executeQuery(
				"SELECT * FROM TBL_COMMENT "
				+ "WHERE BOARDNO = " + boardNo
			);
		%>
		<%	
			while(rs.next()){	
		%>
			<div>
				<span style='font-weight:bold;'> <%= rs.getString("USERID") %>: </span>
				<span style='display : inline-block; width : 300px;'> <%= rs.getString("CMT") %> </span>
				<span> <%= rs.getString("UDATETIME") %></span>
				<a href='#' onclick="cmtDelete('<%= rs.getString("COMMENTNO") %>', <%= boardNo %>)" style='text-decoration: none;'> ❌ </a>
				<a href='#' onclick="cmtUpdate('<%= rs.getString("CMT") %>', <%= rs.getString("COMMENTNO") %>)"  style='text-decoration: none;' >✏️ </a>
			</div>
		<%	
			}
		%>			
			<div>
				<textarea name="comment" rows="4" cols="100"></textarea>
				<!-- 수정 버튼 추가 및 이름 부여 -->
				<input name = "insertBtn" type="button" onclick="fnComment(<%= boardNo %>, '<%= sessionId %>', 'add')" value="댓글달기">
				<input name = "updateBtn" type="button" onclick="fnComment(<%= boardNo %>, '<%= sessionId %>', 'update')" value="수정하기" style="display:none;">		 
			</div>
		
		<% 
			if(userId.equals(sessionId) || "A".equals(sessionStatus)){	
		%>
			<input type="button" value="게시글 수정" onclick="boardUpdate(<%= boardNo %>)">
			<input type="button" value="게시글 삭제" onclick="boardDelete(<%= boardNo %>)">
		<% 		
			}
		%>
	</form>
</body>
</html>
<script>
	var commentNo = "";
	
	function boardDelete(boardNo){
		if(confirm("정말 삭제하겠습니까?")){
			location.href="board_delete.jsp?boardNo=" +boardNo;
		}
	}
	
	function boardUpdate(boardNo){
		if(confirm("수정하시겠습니까?")){
			location.href="board_update.jsp?boardNo=" +boardNo;		
		}
	}
	
	function fnComment(boardNo, userId, kind){
		var cmt = document.boardView.comment.value;
		if(cmt == "" || cmt == undefined){
			alert("댓글을 입력해주세요!");
			return;
		}
		if(userId =="" || userId == undefined || userId == "null"){
			alert("로그인 후 이용해 주세요!")
			location.href="user_login.jsp"
			return;
		}
		var link = "board_comment.jsp?boardNo="+boardNo+"&userId="+userId+"&comment="+cmt+"&kind="+kind;
		if(kind == "update"){
			link += "&commentNo="+document.boardView.commentNo.value;
		}
		location.href = link;
	}
	
	function cmtDelete(commentNo, boardNo){
		if(!confirm("정말 삭제하시겠습니까?")){
			return
		} 
		location.href
			="board_comment_delete.jsp?commentNo=" + commentNo + "&boardNo=" + boardNo;
	}
	
	function cmtUpdate(comment, commentNo){
		var form = document.boardView;
		form.comment.value = comment;
		form.insertBtn.style.display = "none";
		form.updateBtn.style.display = "inline-block";
		form.commentNo.value = commentNo;
	}
	
	/* function commUpdate (){
		var form = document.boardView;
		var comment = form.comment.value;
		var commentNo = form.commentNo.value;
		location.href
			="board_comment.jsp?comment="+comment+"&commentNo"+commentNo;
	} */
</script>