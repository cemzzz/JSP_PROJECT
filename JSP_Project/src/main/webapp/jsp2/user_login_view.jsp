<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		String sql 
			= "SELECT * FROM TBL_MEMBER "
			+ "WHERE USERID = '" 
			+ userId + "' AND PWD = '"
			+ pwd + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		
		if(rs.next()){
			if(rs.getInt("CNT") >= 4){
				out.println ("5번 이상 로그인 시도 실패! 관리자에게 문의해주세요!");
			} else {
				session.setAttribute("userId", rs.getString("USERID"));
				session.setAttribute("userName", rs.getString("USERNAME"));
				session.setAttribute("status", rs.getString("STATUS"));
				
				
				if(rs.getString("STATUS").equals("A")){
					response.sendRedirect("user_list.jsp");
				}
				out.println("로그인 성공!");
				sql =
					"UPDATE TBL_MEMBER SET "
					+ "CNT = 0 "
					+ "WHERE USERID = '" + userId + "'";
				stmt.executeUpdate(sql);
		%>
			<form name="userInfo" action="user_update.jsp">
				<div>
					<input type="text" name="userId" value="<%= userId %>" hidden>
					<input type=button value="회원정보 수정" onclick="btn('u')">
					<input type=button value="회원탈퇴" onclick="btn('d')">
					<input type=button value="게시판" onclick="btn('g')">
				</div>
			</form>
		<%			
			}
		} else {
			String idsql =
				"SELECT * FROM TBL_MEMBER "
				+ "WHERE USERID = '" + userId + "'";
			ResultSet rsId = stmt.executeQuery(idsql);	
			if(rsId.next()){
				/*1. 아이디는 있는데 패스워드가 다를 경우  */
				int cnt = rsId.getInt("CNT");
				
				if((cnt+1) >= 5){
					out.println ("5번 이상 로그인 시도 실패! 관리자에게 문의해주세요!");
				}else {
					out.println ((cnt+1) + "번 이상 로그인 시도 실패!");	
					stmt.executeUpdate(
						"UPDATE TBL_MEMBER SET "
						+ "CNT = CNT+1 "
						+ "WHERE USERID = '" + userId + "'"
					);
				}
			}else {
				/* 2. 아이디가 없는 경우 */
				out.println("아이디를 확인해주세요!");
			}	
	%>
		<input type="button" value="되돌아가기" onclick="history.back()">
	<%	
 		}
	%>
		
</body>
</html>
<script>
	function btn(txt){
		var userInfo = document.userInfo;
		if(txt == 'u'){
			userInfo.action = "user_update.jsp";
		}else {
			userInfo.action = "user_delete.jsp";
		}
		
		if(txt == 'g'){
			userInfo.action = "board_list.jsp";
		}
		userInfo.submit();
	}
	
</script>