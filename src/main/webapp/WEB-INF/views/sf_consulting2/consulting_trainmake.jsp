<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재무설계 트레이닝 데이터 만들기</title>
</head>

<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	
	<h2 align="center">에러다..</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/sf_start.do">
		<div id="userInput" align="center">
			
			<input id="resultInput1" name="resultInput1" type="submit" value="다음단계로" /> <br>
			<br><br>
		</div>
	</form>


</body>
<script>
	resultInput1.click();
</script>
</html>