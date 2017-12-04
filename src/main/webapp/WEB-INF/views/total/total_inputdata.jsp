<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
/* 	function calc() { //수식 계산 함수
		var total = 0;
		total += eval(document.getElementById("flucLife").value);
		total += eval(document.getElementById("flucBeauty").value);
		total += eval(document.getElementById("flucLeisure").value);
		total += eval(document.getElementById("flucMedical").value);
		total += eval(document.getElementById("flucEvent").value);
		total += eval(document.getElementById("flucEdu").value);
		total += eval(document.getElementById("flueEtc").value);

		flucExpense.value = total;
	} */
</script>

</head>
<body>
	<%@ include file="/resources/include/headerConsume.jsp"%>
	<div align="center"><!-- 
		<form method="post" action="./disEx.do" onsubmit="calc()"> -->
		<form method="post" action="./total_home.do">
			<!-- 첫 페이지의 두 개 값도 form에 넣어 같이 다음으로 전송 -->
<%-- 			<input type="hidden" id="age" name="age" value="${vo.age}" /> <input
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
 --%>
			<h2>현재 투자 중인 포트폴리오는?</h2>
			<h4>현재 투자 가능금액은 ${invest_tot } 만원 입니다.</h4>
			<br>
				<table id="plannerData2_table">
					<tr>
						<th>1</th>
						<th>현금성 자산</th>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<th>현금</th>
						<td><input type="text" id="money" name="money"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					</tr>
					<tr>
						<th></th>
						<th>MMF</th>
						<td><input type="text" id="mmf" name="mmf"
							value="0" size="10">&nbsp;만원</td>
					<tr>

					<tr>
						<th></th>
						<th>보통예금</th>
						<td><input type="text" id="ordinaryDeposits" name="ordinaryDeposits"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					<tr>
						<th></th>
						<th>저축예금</th>
						<td><input type="text" id="savingsDeposits" name="savingsDeposits"
							value="0" size="10">&nbsp;만원</td>
					</tr>
					<tr>
						<th>2</th>
						<th>투자자산</th>
						<td></td>
					</tr>
					
					<tr>
						<th></th>
						<th>정기예금</th>
						<td><input type="text" id="fixedDeposit" name="fixedDeposit"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					<tr>
						<th></th>
						<th>채권형</th>
						<td><input type="text" id="bondFund" name="bondFund"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					<tr>
						<th>3</th>
						<th>펀드</th>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<th>주식형 펀드</th>
						<td><input type="text" id="stockFund" name="stockFund"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					<tr>
						<th></th>
						<th>부동산</th>
						<td><input type="text" id="realEstate" name="realEstate"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					<tr>
						<th></th>
						<th>부동산 펀드</th>
						<td><input type="text" id="realEstateFund" name="realEstateFund"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					<tr>
						<th></th>
						<th>주택청약</th>
						<td><input type="text" id="apartmentApplication" name="apartmentApplication"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					<tr>
						<th>4</th>
						<th>은퇴자산</th>
						<td></td>
					<tr>
					<tr>
						<th></th>
						<th>개인연금저축</th>
						<td><input type="text" id="personalAnnuitySavings" name="personalAnnuitySavings"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					<tr>
						<th></th>
						<th>보험</th>
						<td><input type="text" id="insurance" name="insurance"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					<tr>
						<th></th>
						<th>변액 연금 보험</th>
						<td><input type="text" id="variableAnnuities" name="variableAnnuities"
							value="0" size="10">&nbsp;만원</td>
					<tr>
					<tr>
						<th></th>
						<th>변액 유니버셜 보험</th>
						<td><input type="text" id="variableUniversalInsurance" name="variableUniversalInsurance"
							value="0" size="10">&nbsp;만원</td>
					</tr>
<!-- 					<tr>
						<th>합     계</th>
						<td><input type="text" id="total	" name="total"
							id="flucExpense" readonly="readonly" size="10" value="0">&nbsp;만원</td>
					</tr> -->

				</table>
				<br>
					<!-- <input type="button" id="resultInput" name="result" value="합계"
							onclick="calc()" />
							&nbsp&nbsp&nbsp&nbsp&nbsp -->
					<input type="submit" id="resultInput" value="전송" />	

				<table width="200px">


				</table>
			</fieldset>
		</form>
	</div>

</body>
</html>