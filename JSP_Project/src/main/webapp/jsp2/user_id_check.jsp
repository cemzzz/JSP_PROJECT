<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="check">
		<%@ include file="dbconn.jsp"%>
		<%
			String userId = request.getParameter("userId");
			String sql 
				= "SELECT * FROM TBL_MEMBER "
				+ "WHERE USERID = '" + userId + "'";
			
			ResultSet rs = stmt.executeQuery(sql);
		%>	
		<% 
			if(rs.next()){ 
			out.print("중복된 아이디가 있습니다.");	
		%>
					<input name='userId'>
					<div>
						<input type="button" value="중복체크" onclick="idCheck()">
					</div>
		<% 
			} else{
				out.print("사용 가능한 아이디입니다.");	
		%>
			<input type="button" value="사용하기" onclick="popClose('<%= userId %>')">	
		<%
			}
		%>
	</form>
</body>
</html>
<script>
	function popClose(userId){
		opener.document.join.userId.value = userId;
		window.close();
	}
	
	function idCheck(){
		location.href= "user_id_check.jsp?userId=" + document.check.userId.value; 
	}
</script>