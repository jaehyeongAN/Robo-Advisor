<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
처리과정에서 다음과 같은 예외가 발생했습니다.
${exception.message}
<%
	Throwable exception = (Throwable)request.getAttribute("exception");
	exception.printStackTrace();
%>
</body>
</html>