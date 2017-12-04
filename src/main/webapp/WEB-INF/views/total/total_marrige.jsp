
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결혼</title>
</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	
	<h2 align="center">당신의 결혼 계획에 대해 말씀해주세요</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/total_edu.do">
		<div id="userInput" align="center">
			<input type="hidden" name="code" value="${vo.code }"/>
			<input type="hidden" name="id" value="<%=(String)session.getAttribute("id")%>"/>
			<input type="hidden" name="nowAge" value="${vo.nowAge }"/>
			<input type="hidden" name="gender" value="${vo.gender }"/>
			<input type="hidden" name="name" value="<%=(String)session.getAttribute("name")%>"/>
			<input type="hidden" name="invest_tot" value="${vo.invest_tot }"/>
			<h2>결혼에 대한 계획이 있으십니까?</h2>
			<input type="radio" id="gender_m" name="f_select" value="0" checked>
			<label for="gender_m"><img src="../<%=request.getContextPath() %>/resources/img/yes.png" width="70">	</label>
			<input type="radio" id="gender_f" name="f_select" value="1">
			<label for="gender_f"><img src="../<%=request.getContextPath() %>/resources/img/no.png"width="70"></label>
			<hr>
			
			<h2>언제 결혼할 예정이십니까?</h2>
			<input id="input1" name="goalTime" value="5" /> 년뒤
			<hr>
			<h2>예상 결혼비용은 얼마입니까?(평균 : 8000만원)</h2>
			<input id="input1" name="goalMoney"  value="8000"/> 만원
			<hr>
			<h2>지금껏 준비한 자금이 있으면 입력해주세요.</h2>
			<input id="input1" name="savedMoney"  value="0"/> 만원
			<br>
			<hr>
			<input id="resultInput" type="submit" value="다음단계로"/>
			<br><br>
		</div>
	</form>


</body>
</html>