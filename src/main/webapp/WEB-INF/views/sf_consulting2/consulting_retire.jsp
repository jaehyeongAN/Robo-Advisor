
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	//목표시기
	double qu1 = (Math.random()*1); // 0~1
	int goalTime = 0;
	
	int nowAge = (Integer)session.getAttribute("nowAge");
	int goalAge =  (int) Math.round((qu1 * 15 + 55));
	goalTime = goalAge-nowAge;
	//월생활비
	int retire_p = 0; 
	double qu2 = (Math.random()*1); // 0~1
	retire_p =  (int) Math.round((qu1 * 100 + 100));
	//준비자금
	int savedMoney = 0;
	double qu3 = (Math.random()*1); // 0~1
	savedMoney = (int) Math.round((qu1 * 5000 + 5000));;
	//퇴직금
	int retire_pay = 0;
	double qu4 = (Math.random()*1); // 0~1
	retire_pay = (int) Math.round((qu1 * 15000 + 5000));;
	
	%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>은퇴설계</title>
</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	
	<h2 align="center">당신의 은퇴계획에 대해 말씀해 주세요.</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/sf_etc.do">
		<div id="userInput" align="center">
			<input type="hidden" name="code" value="${vo.code }"/>
			<input type="hidden" name="id" value="<%=(String)session.getAttribute("id")%>"/>
			<input type="hidden" name="nowAge" value="${vo.nowAge }"/>
			<input type="hidden" name="gender" value="${vo.gender }"/>
			<input type="hidden" name="name" value="<%=(String)session.getAttribute("name")%>"/>
			<input type="hidden" name="invest_tot" value="${vo.invest_tot }"/>
			<h3>은퇴 예상 연도는 몇년뒤 입니까?</h3>
			<input id="input1" name="goalTime"  value="<%=goalTime%>"/> 년뒤
			<hr>
			<h3>은퇴시 필요한 월 생활비는 얼마입니까?</h3>
			<input id="input1" name="retire_p"  value="<%=retire_p%>"/> 만원
			<hr>
			<h3>현재 준비된 은퇴자금은 얼마인가요?(은 퇴시 일시금으로 입력해주세요.)</h3>
			<input id="input1" name="savedMoney"  value="<%=savedMoney%>"/> 만원
			<hr>
			
			<h3>대략적인 퇴직금은 얼마로 예상되나요?</h3>
			<input id="input1" name="retire_pay"  value="<%=retire_pay%>"/> 만원
			<hr>
			
			<h3>국민연금에 가입되어 있나요?</h3>
			<input type="radio" id="gender_m" name="retire_g" value="1" checked>
			<label for="gender_m"><img src="../<%=request.getContextPath() %>/resources/img/yes.png" width="70">	</label>
			<input type="radio" id="gender_f" name="retire_g" value="2">
			<label for="gender_f"><img src="../<%=request.getContextPath() %>/resources/img/no.png"width="70"></label>
			
			<br>
			<hr>
			<input id="resultInput1" name="resultInput1" type="submit" value="다음단계로" /> <br>
			<br><br>
		</div>
	</form>


</body>
<script>
	resultInput1.click();
</script>
</html>