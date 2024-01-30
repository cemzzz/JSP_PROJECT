<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form>
		<div> 학번 :
			<input type="text">
		</div>
		<div> 이름 :
			<input type="text">
		</div>
		<div> 학과 :
			<input type="text">
		</div>
		<div> 과목 :
			<input type="text">
		</div>
		<div> 점수 :
			<input type="text">
		</div>
		<input type="button" value="학생 등록하기" onclick="save()">
	</form>

</body>
</html>
<script>
	function save(){
		location.href="add_student_save.jsp";
	}
</script>