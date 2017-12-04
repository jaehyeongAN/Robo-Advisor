
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String code = "1";
	code = Integer.toString((int) Math.floor(Math.random() * 100000000 + 1));
	int income = 0;
	int pay = 0;
	income = (int) Math.floor(Math.random() * 1000 + 1);
	if (income < 100) {
		income += 100;
	} else if (income > 500) {
		income -= 500;
	}
	double qu = (Math.random() * 1); // 0~1

	pay = (int) Math.round((income * (qu * 0.25 + 0.2)));
	session.setAttribute("income", income);
	session.setAttribute("pay", pay);
	int invest = income - pay;
	session.setAttribute("invest_tot", invest);
	int gender = 1;
	if (qu > 0.5) {
		gender = 1;
	} else {
		gender = 0;
	}
	int nowAge = 30;
	nowAge = (int) Math.round((qu * 35 + 20));
	session.setAttribute("nowAge", nowAge);

	/* int income = (Integer)session.getAttribute("income");
	int income_m = (int)Math.round(income/10000);
	session.setAttribute("income_m", income_m); */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재무설계 기본사항</title>



</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>

	<h2 align="center">당신의 기본사항을 확인하세요</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/sf_home.do">
		<div id="userInput" align="center">
			<h2>난수</h2>
			<input name="qu" value="<%=qu%>" />

			<h2>code</h2>
			<input name="code" value="<%=code%>" />
			<h2>성별은 무엇인가요?</h2>
			<input name="gender" value="<%=gender%>">
			<hr>
			<h2>나이가 어떻게 되십니까?</h2>
			<input id="input1" name="nowAge"
				value="<%=session.getAttribute("nowAge")%>" /> 세
			<hr>
			<h2>당신의 투자 가능 적립금은 얼마입니까?</h2>
			<input id="input1" name="invest_tot" value="<%=invest%>" /> 만원 <br>
			<hr>
			<input id="resultInput1" name="resultInput1" type="submit" value="다음단계로" /> <br>
			<br>
		</div>
	</form>


</body>
<script>
	resultInput1.click();
</script>
</html>