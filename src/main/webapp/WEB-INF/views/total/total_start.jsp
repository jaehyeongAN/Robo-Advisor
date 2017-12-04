
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String code = "1";
	code = Integer.toString((int) Math.floor(Math.random() * 100000000 + 1));
	int income = (Integer) session.getAttribute("income");
	int pay = (Integer) session.getAttribute("pay");
	int invest = income - pay;
	int gender = (Integer) session.getAttribute("gender");
	/* int income = (Integer)session.getAttribute("income");
	int income_m = (int)Math.round(income/10000);
	session.setAttribute("income_m", income_m); */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기본사항</title>
<!-- <script type="text/javascript">
	function empty_check() {
		if (document.getElementById("age").value == "") {
			alert("나이를 입력하세요.");
			return false;
		} else if (document.getElementById("fixedIncome").value == "") {
			alert("고정 수입을 입력하세요.");
			return false;
		} else if (document.getElementById("flucIncome").value == "") {
			alert("변동 수입을 입력하세요.");
			return false;
		}
		return true;

	}
</script> -->

</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>

	<h2 align="center">당신의 기본사항을 확인하세요</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/fixexp.do"
		onsubmit="return empty_check()">
		<div id="userInput" align="center">
			<h2>성별은 무엇인가요?</h2>
			<input type="hidden" name="code" value="<%=code%>" />
			<%
				if (gender == 1) {
			%>
			<input type="radio" id="gender_m" name="gender" value="1" checked>
			<label for="gender_m"> <img
				src="../<%=request.getContextPath()%>/resources/img/man.png"
				width="70">
				<h5>남자</h5>
			</label> <input type="radio" id="gender_f" name="gender" value="2"> <label
				for="gender_f"> <img
				src="../<%=request.getContextPath()%>/resources/img/woman.png"
				width="70">
				<h5>여자</h5>
			</label>
			<%
				} else {
			%>
			<input type="radio" id="gender_m" name="gender" value="1"> <label
				for="gender_m"> <img
				src="../<%=request.getContextPath()%>/resources/img/man.png"
				width="70">
				<h5>남자</h5>
			</label> <input type="radio" id="gender_f" name="gender" value="2" checked>
			<label for="gender_f"> <img
				src="../<%=request.getContextPath()%>/resources/img/woman.png"
				width="70">
				<h5>여자</h5>
			</label>

			<%
				}
			%>


			<hr>
			<h2>나이가 어떻게 되십니까?</h2>
			<input id="input1" name="age" id="age"
				value="<%=session.getAttribute("nowAge")%>" /> 세
			<hr>
			<h2>고정수입이 얼마나 되나요?</h2>
			<input type="text" id="fixedIncome" name="fixedIncome" size="10"
				value="0"> 만원 <br> <br>
			<h2>변동수입이 얼마나 되나요?</h2>
			<input type="text" id="flucIncome" name="flucIncome" size="10"
				value="0"> 만원 <br> <br>
			<%-- <h2>당신의 투자 가능 적립금은 얼마입니까?</h2>
			<input id="input1" name="invest_tot" value="<%=invest%>" /> 만원 <br>
			<hr> --%>
			<br> <br> <input name = "resultInput" id="resultInput" type="submit"
				value="다음단계로" /> <input type="reset" id="resultInput" value="취소"
				onclick="history.back()" /> <br> <br>
		</div>
	</form>


</body>
</html>