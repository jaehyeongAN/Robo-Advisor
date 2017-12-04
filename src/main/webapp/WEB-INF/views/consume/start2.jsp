<%@page import="javax.xml.ws.Response"%>
<%@page import="spring.project.vo.MoneyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function calc() { //수식 계산 함수
		var total = 0;
		total += eval(document.getElementById("fixedHome").value);
		total += eval(document.getElementById("fixedFood").value);
		total += eval(document.getElementById("fixedCommunication").value);
		total += eval(document.getElementById("fixedTrans").value);
		total += eval(document.getElementById("fixedInsurance").value);
		total += eval(document.getElementById("fixedTax").value);

		fixedExpense.value = total;

	}
</script>

</head>
<body>
	<%@ include file="/resources/include/headerConsume.jsp"%>
<div align="center">
	<form method="post" action="./calc2.do" onsubmit="calc()">
		<!-- 첫 페이지의 두 개 값도 form에 넣어 같이 다음으로 전송 -->

		<h2>한달 고정지출</h2>
			<br>
		<input type="hidden" id="age" name="age" value="${vo.age}" /> <input
			type="hidden" id="fixedIncome" name="fixedIncome"
			value="${vo.fixedIncome}" /> <input type="hidden" id="flucIncome"
			name="flucIncome" value="${vo.flucIncome}" />


		
		<table id="plannerData2_table"
			 border="0" align="center">

			<tr>
				<th width="100px">1. 주거비용</th>
				<td width="150px"><input type="text" id="fixedHome" name="fixedHome"
					value="0" size="10">&nbsp;만원</td>
			</tr>
			<tr>
				<th >2. 식비</th>
				<td><input type="text" id="fixedFood" name="fixedFood"
					value="0" size="10">&nbsp;만원</td>
			</tr>
			<tr>
				<th >3. 통신비</th>
				<td><input type="text" id="fixedCommunication"
					name="fixedCommunication" value="0" size="10">&nbsp;만원</td>
			</tr>
			<tr>
				<th >4. 교통비</th>
				<td><input type="text" id="fixedTrans" name="fixedTrans"
					value="0" size="10">&nbsp;만원</td>
			</tr>
			<tr>
				<th >5. 보험료</th>
				<td><input type="text" id="fixedInsurance"
					name="fixedInsurance" value="0" size="10">&nbsp;만원</td>
			</tr>
			<tr>
				<th >6. 세금</th>
				<td><input type="text" id="fixedTax" name="fixedTax" value="0"
					size="10">&nbsp;만원</td>
			</tr>
			<tr>
				<th >7. 총 합계</th>
				<td><input type="text" id="fixedExpense" name="fixedExpense"
					value="0" readonly="readonly" size="10">&nbsp;만원
			</tr>

		</table>
		<br>
		<input type="button" id="resultInput" value="합계" onclick="calc();">
		<input type="submit" id="resultInput" value="확인"
					onclick="check();">
		
	</form>
	</div>
</body>
</html>