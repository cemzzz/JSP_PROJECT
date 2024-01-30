<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<form name="join" action="user_join_save.jsp" method="post">
		<div>
			아이디 :  <input type="text" name="userId">
			<input type="button" onclick="idCheck()" value="중복확인">
		</div>
		<div>비밀번호 : <input type="password" name="pwd"></div>
		<div>이름 :    <input type="text" name="userName"></div>
		<div> <span class="select_input"> 성별 : </span> 
			<label><input type= "radio" name="gender" value = "남자" checked>남자</label>
			<label><input type= "radio" name="gender" value = "여자">여자</label>
		</div>
		<input type="submit" value="가입">
	</form>

</body>
</html>

<script>
	var join = document.join;
	function idCheck(){
		var id = join.userId.value;
		if(id == "" || id == undefined){
			alert("아이디를 입력해주세요");
			return;
		}
		pop = window.open("user_id_check.jsp?userId=" + id, "join", "width=300, height=300");
	}
	
	
</script>