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
		total += eval(document.getElementById("flucLife").value);
		total += eval(document.getElementById("flucBeauty").value);
		total += eval(document.getElementById("flucLeisure").value);
		total += eval(document.getElementById("flucMedical").value);
		total += eval(document.getElementById("flucEvent").value);
		total += eval(document.getElementById("flucEdu").value);
		total += eval(document.getElementById("flueEtc").value);

		flucExpense.value = total;
	}
</script>

</head>
<body>
	<%@ include file="/resources/include/headerConsume.jsp"%>
	<div align="center">
		<form method="post" action="./disEx.do" onsubmit="calc()">
			<!-- 첫 페이지의 두 개 값도 form에 넣어 같이 다음으로 전송 -->
			<input type="hidden" id="age" name="age" value="${vo.age}" /> <input
				type="hidden" id="fixedIncome" name="fixedIncome"
				value="${vo.fixedIncome}" /> <input type="hidden" id="flucIncome"
				name="flucIncome" value="${vo.flucIncome}" /> <input type="hidden"
				id="sumIncome" name="sumIncome" value="${vo.sumIncome}" /> <input
				type="hidden" id="fixedHome" name="fixedHome"
				value="${vo.fixedHome}" /> <input type="hidden" id="fixedFood"
				name="fixedFood" value="${vo.fixedFood}" /> <input type="hidden"
				id="fixedCommunication" name="fixedCommunication"
				value="${vo.fixedCommunication}" /> <input type="hidden"
				id="fixedTrans" name="fixedTrans" value="${vo.fixedTrans}" /> <input
				type="hidden" id="fixedInsurance" name="fixedInsurance"
				value="${vo.fixedInsurance}" /> <input type="hidden" id="fixedTax"
				name="fixedTax" value="${vo.fixedTax}" /> <input type="hidden"
				id="fixedExpense" name="fixedExpense" value="${vo.fixedExpense}" />

			<h2>한달 변동지출</h2>
			<br>
				<table id="plannerData2_table">
					<tr>
						<th>1. 생활용품</th>
						<td><input type="text" id="flucLife" name="flucLife"
							value="0" size="10">&nbsp;만원</td>
					</tr>
					<tr>
						<th>2. 의류미용</th>
						<td><input type="text" id="flucBeauty" name="flucBeauty"
							value="0" size="10">&nbsp;만원</td>
					</tr>
					<tr>
						<th>3. 문화레저</th>
						<td><input type="text" id="flucLeisure" name="flucLeisure"
							value="0" size="10">&nbsp;만원</td>
					</tr>
					<tr>
						<th>4. 의료비</th>
						<td><input type="text" id="flucMedical" name="flucMedical"
							value="0" size="10">&nbsp;만원</td>
					</tr>
					<tr>
						<th>5. 경조사비</th>
						<td><input type="text" id="flucEvent" name="flucEvent"
							value="0" size="10">&nbsp;만원</td>
					</tr>

					<tr>
						<th>6. 교육비</th>
						<td><input type="text" id="flucEdu" name="flucEdu" value="0"
							size="10">&nbsp;만원</td>
					</tr>

					<tr>
						<th>7. 기타비용</th>
						<td><input type="text" id="flueEtc" name="flueEtc" value="0"
							size="10">&nbsp;만원</td>
					</tr>


					<tr>
						<th>합     계</th>
						<td><input type="text" id="flucExpense" name="flucExpense"
							id="flucExpense" readonly="readonly" size="10" value="0">&nbsp;만원</td>
					</tr>

				</table>
				<br>
					<input type="button" id="resultInput" name="result" value="합계"
							onclick="calc()" />
							&nbsp&nbsp&nbsp&nbsp&nbsp
					<input type="submit" id="resultInput" value="전송" />	

				<table width="200px">


				</table>
			</fieldset>
		</form>
	</div>

</body>
</html>