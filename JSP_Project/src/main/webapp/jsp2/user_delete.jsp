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
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");	
		
		String sql 
				= "DELETE FROM TBL_MEMBER "
				+ " WHERE USERID = '" + userId + "'";
		
		int cnt = stmt.executeUpdate(sql);
		
		if(cnt > 0){
			out.println("회원 탈퇴되었습니다.");			
		} else {
			out.println("다시 시도해주세요.");
		}
	%>
	<!-- <div>회원 탈퇴 완료!</div> -->

</body>
</html>