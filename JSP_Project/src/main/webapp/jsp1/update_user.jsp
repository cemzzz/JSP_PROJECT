<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>회원가입</title>
<style>
	div {
		margin : 5px 0px;
	}
	.txt_input{
		width: 80px;
		display : inline-block;
	}
	
	.select_input{
		width: 73px;
		display : inline-block;
	}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%!
		String checkBox(String[] hobby){
			String tag = "";
			String list[] = {"독서", "운동", "영화"};
			boolean flg = false;
			for(int i=0; i<list.length; i++){
				for(int j=0; j<hobby.length; j++){
					if(hobby[j] != null && hobby[j].equals(list[i])){
						flg = true;
					}
				}
				if(flg){
					tag += "<label><input type='checkbox' name='hobby' value='" + list[i] + "' checked>" + list[i] + "</label>";
				} else {
					tag += "<label><input type='checkbox' name='hobby' value='" + list[i] + "'>" + list[i] + "</label>";
				}
				flg = false;
			}
			return tag;
		}
	%>
	<%
		String id = request.getParameter("id");
		String sql = "SELECT * FROM" 
			+ " TBL_MEMBER WHERE USERID = '" + id + "'";
		
		ResultSet rs =  stmt.executeQuery(sql);
		rs.next();
		String userId = rs.getString("USERID");
		String userName = rs.getString("USERNAME");
		String phone = rs.getString("PHONE");
		String phone1 = phone.substring(0,3);
		String phone2 = phone.substring(3,7);
		String phone3 = phone.substring(7,11);
		String gender = rs.getString("GENDER");
		String hobby[] = {rs.getString("HOBBY1"), rs.getString("HOBBY2"), rs.getString("HOBBY3")};
/* 		String hobby1 = rs.getString("HOBBY1");
		String hobby2 = rs.getString("HOBBY2");
		String hobby3 = rs.getString("HOBBY3"); */
		
		String comment = rs.getString("CMT");
	%>
	<h3>정보수정</h3>
	<form action="update_user_view.jsp" name="join">
		<div> <span class="txt_input">아이디 : </span><input type="text" name="id" value="<%= userId %>" disabled> </div>
		<div> <span class="txt_input">비밀번호 : </span><input type="password" name="pwd"></div>
		<div> <span class="txt_input">비번확인 : </span><input type="password" name="pwd2"></div>
		<div> <span class="txt_input">이 름 : </span><input type="text" name="name" value="<%= userName %>"></div>

		<div><span class="select_input">연락처 :</span>
            <select name="phone1" >
                <%
                	String arr[] = {"010", "011", "016", "017", "019"};
			 		for(int i=0; i<arr.length; i++){
			 			if(phone1.equals(arr[i])){
			 				out.print("<option value='"+ phone1 +"' selected>"+phone1+"</option>");
			 			}else{
			 				out.print("<option value='"+arr[i]+"'>"+arr[i]+"</option>");
			 			}
			 		}
			 	%>
            </select>

            - <input type="text" maxlength="4" size="4" name="phone2" value=<%= phone2 %>> 
            - <input type="text" maxlength="4" size="4" name="phone3" value=<%= phone3 %>>
        </div>
		<div> <span class="select_input">성 별 :</span> 
			<% if(gender.equals("남성")){ %> 
				<label><input type="radio" name="gender" value="남성" checked>남성 </label>
				<label><input type="radio" name="gender" value="여성" >여성 </label>	
			<% } else { %>
				<label><input type="radio" name="gender" value="남성">남성 </label>
				<label><input type="radio" name="gender" value="여성" checked>여성 </label>
			<% } %>
			
        </div>
		<div><span class="select_input">취 미 :</span>
		
		<%	out.println(checkBox(hobby)); %>
		
        </div>
        <div>
            <textarea name="comment" cols="30" ><%= comment %></textarea>
        </div>
		<div>	
            <input type="button" onclick="check()" value="수정하기">
        </div>
	</form>
</body>
</html>
<script>
	var join = document.join; // form 태그를 의미
	function check() {
		const regType = /^[a-zA-Z0-9]*$/g;
		
		if(join.pwd.value != "" && join.pwd.value.length < 6) {
			alert("패스워드는 6글자 이상이어야 합니다!");
			join.pwd.focus();
			return;
		}
		if(join.pwd.value != join.pwd2.value) {
			alert("패스워드 입력값이 같아야 합니다!");
			join.pwd2.focus();
			return;
		}
	
		join.submit();
	}
</script>