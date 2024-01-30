<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name ="commPop">
	<input name="commentNo" hidden>
		<%@ include file="dbconn.jsp"%>
		<%
			String boardNo = request.getParameter("boardNo");
			String userId = request.getParameter("userId");
		
			String Sql 
			= "SELECT * FROM TBL_COMMENT "
			+ " WHERE BOARDNO = " + boardNo;
			
			String sessionId = (String) session.getAttribute("userId");
			ResultSet rs = stmt.executeQuery(Sql);
		%>
		<% 
			while(rs.next()){
		%>
			<div>
				<span> <%= rs.getString("USERID") %> : </span>
				<span> <%= rs.getString("CMT") %></span>
				<input style="font-size :xx-small;" type="button" value="삭제" onclick="commDelete(<%= rs.getString("COMMENTNO") %>, <%= boardNo %>)">
				<input style="font-size :xx-small;" type="button" value="수정" onclick="commUpdate('<%= rs.getString("CMT") %>', <%= rs.getString("COMMENTNO") %>)">
			</div>
		<% 	
			};
		%>
		<hr>
		<div>
			<textarea name="comment" row="3" cols="30"></textarea>
			
			<input name="insertBtn" type="button" value="댓글저장" onclick = "fnComment(<%= boardNo %>, '<%= sessionId %>', 'add')">
			<input name="updateBtn" type="button" value="댓글수정" onclick = "fnComment(<%= boardNo %>, '<%= sessionId %>', 'update')" style="display: none;">
		</div>
	</form>

</body>
</html>
<script>
	var commentNo = "";
	
	/* function commAdd(boardNo, userId){
		var form = document.commPop;
		var comment = form.comment.value;
		location.href
			= "board_comment.jsp?boardNo="+boardNo"&comment="+comment"&userId="+userId;
	} */
	
	function fnComment(boardNo, userId, kind){
		var cmt = document.commPop.comment.value;
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
			link += "&commentNo="+document.commPop.commentNo.value;
		}
		location.href = link;
	}
	
	function commDelete(commentNo, boardNo){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href
			="board_comment_delete.jsp?boardNo="+boardNo+"&commentNo="+commentNo;			
		}
	}
	
	function commUpdate(comment, commentNo){
		var form = document.commPop;
		form.comment.value = comment;
		form.commentNo.value = commentNo;
		form.insertBtn.style.display = "none";
		form.updateBtn.style.display = "inline-block";
	}

</script>