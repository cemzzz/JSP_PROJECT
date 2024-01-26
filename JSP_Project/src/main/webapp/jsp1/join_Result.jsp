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
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String gender = request.getParameter("gender");
		
		String [] hobby = {};
		if(request.getParameterValues("hobby").length > 0){
			hobby = request.getParameterValues("hobby");
		}
		
		String comment = request.getParameter("comment");
		String phone = phone1+phone2+phone3;
		
		out.println();
		
		stmt.executeUpdate(
			    "INSERT INTO TBL_MEMBER VALUES('" 
					+ id + "','" 
			    	+ pwd + "','" 
					+ name + "','" 
			    	+ phone + "','"
					+ gender + "','" 
			    	+ (hobby.length>0 ? hobby[0] : "") + "','" 
					+ (hobby.length>1 ? hobby[1] : "") + "','" 
			    	+ (hobby.length>2 ? hobby[2] : "") + "','" 
					+ comment + "')"
			);
	%>
	
	
	<div> 아이디 : <%= id %> </div>
	<div> 비밀번호 : <%= pwd %> </div>
	<div> 비번확인 : <%= pwd2 %> </div>
	<div> 이름 : <%= name %> </div>
	<div> 핸드폰 번호 : 
		<%=phone1%>-<%=phone2%>-<%=phone3%>
	</div>
	<div> 성별 : <%= gender %> </div>
	<div> 취미 :
  		<% for(int i = 0; i < hobby.length; i++) { %>
    		<%= hobby[i] %>
  			<% } %>
</div>
	<div> 가입인사 : <%= comment %></div>
</body>
</html>