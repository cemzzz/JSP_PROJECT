<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse : collapse;
		text-align: center;
	}

</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		String sql = "SELECT * FROM TBL_MEMBER";
		String word = request.getParameter("keyword");
		String keyword = word != null ? word : "";
		
		if(keyword != null){
			sql += " WHERE USERNAME LIKE '%" + keyword + "%'"
					+ " OR USERID LIKE '%" + keyword + "%'"
					;
		}
		
		ResultSet rs = stmt.executeQuery(sql);
	%>
	<form name = "user_list">
		<div>
			검색 : 
			<input type="text" name="keyword">
			<input type="button" value="검색" onclick="search()">	
		</div>
			<table border="1">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>성별</th>
					<th>취미1</th>
					<th>취미2</th>
					<th>취미3</th>
					<th>수정</th>
					<th>삭제</th>
					<th>초기화</th>
				</tr>
		<%
			while(rs.next()){
		%>
			<tr>
				<td><%= rs.getString("USERID") %></td>
				<td><%= rs.getString("USERNAME") %></td>
				<td><%= rs.getString("PHONE") %></td>
				<td><%= rs.getString("GENDER") %></td>
				<td><%= rs.getString("HOBBY1") %></td>
				<td><%= rs.getString("HOBBY2") %></td>
				<td><%= rs.getString("HOBBY3") %></td>
				<td><input type= "button" value="수정" onclick="userUpdate('<%= rs.getString("USERID") %>')"></td>
				<td><input type= "button" value="삭제" onclick="userDelete('<%= rs.getString("USERID") %>')"></td>
				<td>
					<% 
						if(rs.getInt("CNT") >= 4){ 
					%>
						<input type= "button" value="초기화" onclick="userReset('<%= rs.getString("USERID") %>')">
					<%  
						} 
					%>	
				</td>
			</tr>
	<%		
		}
	%>		
		</table>
	</form>
	

</body>
</html>
<script>
 	function userUpdate(userId){
		location.href = "user_update.jsp?userId=" + userId;
	}
 	
 	function userDelete(userId){
		location.href = "user_delete.jsp?userId=" + userId;
	} 
 	
 	function userReset(userId){
 		location.href = "user_login_reset.jsp?userId=" + userId;
	} 
 	
 	var user = document.user_list;
 	function search(){
 		location.herf
 			="user_list.jsp?keyword=" + user.keyword.value;
 	}
 	
</script>