
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기타목돈마련</title>
</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	
	<h2 align="center">기타 목돈 계획이 있으면 말씀해 주세요.</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/sf_result.do">
		<div id="userInput" align="center">
			<input type="hidden" name="code" value="${vo.code }"/>
			<input type="hidden" name="id" value="<%=(String)session.getAttribute("id")%>"/>
			<input type="hidden" name="nowAge" value="${vo.nowAge }"/>
			<input type="hidden" name="gender" value="${vo.gender }"/>
			<input type="hidden" name="name" value="<%=(String)session.getAttribute("name")%>"/>
			<input type="hidden" name="invest_tot" value="${vo.invest_tot }"/>
			<input type="hidden" name="retire_p" value="${vo.retire_p }"/>
			<input type="hidden" name="retire_pay" value="${vo.retire_pay }"/>
			<input type="hidden" name="retire_g" value="${vo.retire_g }"/>
			<h3>무엇을 위한 자금인가요?</h3>
			<input id="input1" name="etc_goal"  value="자녀결혼자금"/> 
			<hr>
			<h3>목돈이 필요한 시기는 언제입니까?</h3>
			<input id="input1" name="goalTime" value="20"/> 년뒤
			<h3>목표금액은 얼마입니까?</h3>
			<hr>
			<input id="input1" name="goalMoney" value="10000"/> 만원
			
			<hr>
			<input id="resultInput" type="submit" value="다음단계로"/>
			<br><br>
		</div>
	</form>


</body>
</html>