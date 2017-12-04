
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재무설계 기본사항</title>

<!-- amCharts javascript sources -->
<script type="text/javascript"
	src="../<%=request.getContextPath()%>/resources/js/amcharts.js"></script>
<script type="text/javascript" 
	src="../<%=request.getContextPath()%>/resources/js/pie.js"></script>
<script type="text/javascript"
	src="../<%=request.getContextPath()%>/resources/js/light.js"></script>
<script type="text/javascript"
	src="../<%=request.getContextPath()%>/resources/js/serial.js"></script>
<script type="text/javascript"
	src="../<%=request.getContextPath()%>/resources/js/patterns.js"></script>
<script type="text/javascript"
	src="../<%=request.getContextPath()%>/resources/js/radar.js"></script>

<!-- amCharts javascript code -->
<script type="text/javascript">
			AmCharts.makeChart("chartdiv",
				{
					"type": "pie",
					"balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
					"titleField": "country",
					"valueField": "litres",
					"fontSize": 12,
					"theme": "light",
					"allLabels": [],
					"balloon": {},
					"titles": [],
					"dataProvider": [
						{
							"country": "변동지출",
							"litres": ${mvo.flucExpense},
						},
						{
							"country": "고정지출",
							"litres": ${mvo.fixedExpense}
						},
						{
							"country": "집",
							"litres": ${mvo2.realEstate}+${mvo2.realEstateFund}+${mvo2.apartmentApplication}
						},
						{
							"country": "결혼",
							"litres": ${mvo2.fixedDeposit}+${mvo2.bondFund}
						},
						{
							"country": "교육",
							"litres": ${mvo2.stockFund}
						},
						{
							"country": "은퇴",
							"litres": ${mvo2.personalAnnuitySavings}+${mvo2.variableAnnuities}+${mvo2.variableUniversalInsurance}
						},
						{
							"country": "리스크관리",
							"litres": ${mvo2.insurance}
						},
						{
							"country": "기타",
							"litres": ${mvo2.money}+${mvo2.mmf}+${mvo2.ordinaryDeposits}+${mvo2.savingsDeposits}
						}
					]
				}
			);
			AmCharts.makeChart("chartdiv2",
					{
						"type": "serial",
						"categoryField": "category",
						"autoMarginOffset": 40,
						"marginRight": 70,
						"marginTop": 70,
						"startDuration": 1,
						"backgroundColor": "#E7E7E7",
						"fontFamily": "맑은고딕",
						"fontSize": 13,
						"theme": "light",
						"categoryAxis": {
							"gridPosition": "start"
						},
						"chartCursor": {
							"enabled": true
						},
						"trendLines": [],
						"graphs": [
							{
								"balloonText": "[[title]] of [[category]]:[[value]]",
								"fillAlphas": 0.9,
								"id": "AmGraph-1",
								"title": "목표금액",
								"type": "column",
								"valueField": "surplus"
							},
							{
								"balloonText": "[[title]] of [[category]]:[[value]]",
								"fillAlphas": 0.9,
								"id": "AmGraph-2",
								"title": "달성금액",
								"type": "column",
								"valueField": "column-2"
							}
						],
						"guides": [],
						"valueAxes": [
							{
								"id": "ValueAxis-1",
								"title": "만원"
							}
						],
						"allLabels": [],
						"balloon": {},
						"legend": {
							"enabled": true,
							"labelWidth": 0
						},
						"titles": [],
						"dataProvider": [
							{
								"category": "Home",
								"column-2": ${moonstar[0]},
								"[object Window]": "",
								"surplus": ${vo_h.goalMoney}
							},
							{
								"category": "Marrige",
								"column-2": ${moonstar[1]},
								"[object Window]": "",
								"surplus": ${vo_m.goalMoney}
							},
							{
								"category": "Child",
								"column-2": ${moonstar[2]},
								"[object Window]": "",
								"surplus": ${vo_edu.goalMoney}
							},
							{
								"category": "Retire",
								"column-2": ${moonstar[3]},
								"[object Window]": "",
								"surplus": ${vo_r.goalMoney}
							},
							{
								"category": "Etc",
								"column-2": ${moonstar[4]},
								"[object Window]": "",
								"surplus": ${vo_etc.goalMoney}
							}
						]
					}
				);
			AmCharts.makeChart("chartdiv3",
					{
						"type": "pie",
						"balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
						"titleField": "country",
						"valueField": "litres",
						"fontSize": 12,
						"theme": "light",
						"allLabels": [],
						"balloon": {},
						"titles": [],
						"dataProvider": [
							{
								"country": "소비",
								"litres": ${portfolio[0]}
							},
							{
								"country": "단기 (추천상품 : CMA, 적금)",
								"litres": ${portfolio[1]}
							},
							{
								"country": "중기(추천상품 : 채권, 펀드)",
								"litres": ${portfolio[2]}
							},
							{
								"country": "장기(추천상품 : 연금, 적금)",
								"litres": ${portfolio[3]}
							},
							{
								"country": "위험관리",
								"litres": ${portfolio[4]}
							}
						]
					}
				);
			
			AmCharts.makeChart("chartdiv4",
					{
						"type": "radar",
						"categoryField": "country",
						"startDuration": 2,
						"fontSize": 13,
						"theme": "patterns",
						"graphs": [
							{
								"balloonText": "[[value]] ",
								"bullet": "round",
								"bulletSize": 9,
								"id": "AmGraph-1",
								"lineAlpha": 1,
								"lineThickness": 2,
								"valueField": "litres"
							}
						],
						"guides": [],
						"valueAxes": [
							{
								"axisTitleOffset": 20,
								"gridType": "circles",
								"id": "ValueAxis-1",
								"minimum": 0,
								"axisAlpha": 0.54,
								"dashLength": 3,
								"gridAlpha": 0.51
							}
						],
						"allLabels": [],
						"balloon": {},
						"titles": [],
						"dataProvider": [
							{
								"country": "수익성",
								"litres": ${portfolio_test[0]}
							},
							{
								"country": "안전성",
								"litres": ${portfolio_test[1]}
							},
							{
								"country": "유동성",
								"litres": ${portfolio_test[2]}
							}
						]
					}
				);
			
			
			AmCharts.makeChart("chartdiv5",
					{
						"type": "pie",
						"angle": 12,
						"balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
						"depth3D": 15,
						"innerRadius": "40%",
						"titleField": "category",
						"valueField": "column-1",
						"allLabels": [],
						"balloon": {},
						"legend": {
							"enabled": true,
							"align": "center",
							"markerType": "circle"
						},
						"titles": [],
						"dataProvider": [
							{
								"category": "고정 지출",
								"column-1": "${mvo.fixedExpense}"
							},
							{
								"category": "변동 지출",
								"column-1": "${mvo.flucExpense}"
							},
							{
								"category": "저축 가능 금액",
								"column-1": "${mvo.fixedIncome+mvo.flucIncome-mvo.fixedExpense-mvo.flucExpense}"
							}
						]
					}
				);
			
			AmCharts.makeChart("chartdiv6",
					{
						"type": "serial",
						"categoryField": "category",
						"startDuration": 1,
						"categoryAxis": {
							"gridPosition": "start"
						},
						"trendLines": [],
						"graphs": [
							{
								"balloonText": "[[title]] of [[category]]:[[value]]",
								"bullet": "round",
								"id": "AmGraph-1",
								"title": "고객의 소비량",
								"valueField": "column-1"
							},
							{
								"balloonText": "[[title]] of [[category]]:[[value]]",
								"bullet": "square",
								"id": "AmGraph-2",
								"title": "평균 소비량 ",
								"valueField": "column-2"
							}
						],
						"guides": [],
						"valueAxes": [
							{
								"id": "ValueAxis-1",
								"title": "지출"
							}
						],
						"allLabels": [],
						"balloon": {},
						"legend": {
							"enabled": true,
							"useGraphSettings": true
						},
						"titles": [
							{
								"id": "Title-1",
								"size": 15,
								"text": "소비량 비교"
							}
						],
						"dataProvider": [

							{
								"category": "주거비",
								"column-1": "${mvo.fixedHome}",
								"column-2": "${exp.fixedHome}"
							},
							{
								"category": "식비",
								"column-1": "${mvo.fixedFood}",
								"column-2": "${exp.fixedFood}"
							},
							{
								"category": "통신비",
								"column-1": "${mvo.fixedCommunication}",
								"column-2": "${exp.fixedCommunication}"
							},
							{
								"category": "교통비",
								"column-1": "${mvo.fixedTrans}",
								"column-2": "${exp.fixedTrans}"
							},
							{
								"category": "보험료",
								"column-1": "${mvo.fixedInsurance}",
								"column-2": "${exp.fixedInsurance}"
							},
							{
								"category": "세금",
								"column-1": "${mvo.fixedTax}",
								"column-2": "${exp.fixedTax}"
							},
							{
								"category": "생활용품비",
								"column-1": "${mvo.flucLife}",
								"column-2": "${exp.flucLife}"
							},
							{
								"category": "의류미용비",
								"column-1": "${mvo.flucBeauty}",
								"column-2": "${exp.flucBeauty}"
							},
							{
								"category": "문화레저비",
								"column-1": "${mvo.flucLeisure}",
								"column-2": "${exp.flucLeisure}"
							},
							{
								"category": "의료비",
								"column-1": "${mvo.flucMedical}",
								"column-2": "${exp.flucMedical}"
							},
							{
								"category": "경조사비",
								"column-1": "${mvo.flucEvent}",
								"column-2": "${exp.flucEvent}"
							},
							{
								"category": "교육비",
								"column-1": "${mvo.flucEdu}",
								"column-2": "${exp.flucEdu}"
							},
							{
								"category": "기타비용",
								"column-1": "${mvo.flueEtc}",
								"column-2": "${exp.flueEtc}"
							},
						]
					}
				);
				
		</script>


<style type="text/css">
	#resultInput2{
		border-collapse: collapse;
		border:1px #98C593;
		border-radius : 50px 50px 50px 50px;
		width: 190px; 
		height: 50px;
		font-size: 18px;
		background-color: #F05F40;
		color: white;
	}
</style>
</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	<h2>
		<font><%=session.getAttribute("name")%></font>님의 현재 소비상태는?
	</h2>
	
		<!-- 그래프 div -->
	<div align="center">
		<div id="chartdiv5"
			style="width: 100%; height: 400px; background-color: #FFFFFF;"></div>
		<br>
		<table>
			<tr>
				<td width="200">총수입: <input type="text" id="sumIncome"
					name="sumIncome" value="${mvo.fixedIncome+mvo.flucIncome}"
					readonly="readonly" size="5" />만원
				</td>

				<td width="200">총지출: <input type="text" id="sumExpense"
					name="sumExpense" value="${mvo.fixedExpense+mvo.flucExpense}"
					readonly="readonly" size="5" />만원
				</td>

				<td width="200">수지차: <input type="text" id="diff" name="diff"
					value="${mvo.fixedIncome+mvo.flucIncome-mvo.fixedExpense-mvo.flucExpense}"
					readonly="readonly" size="5" />만원
				</td>
			</tr>
		</table>
	</div>
	
	<hr id="redHr">
	<h3 align="center">포트폴리오</h3>
	<div id="chartdiv"
		style="width: 100%; height: 400px; background-color: #E7E7E7;"></div>


	<input type="hidden" id="fixedIncome" name="fixedIncome"
		value="${mvo.fixedIncome}" />
	<input type="hidden" id="flucIncome" name="flucIncome"
		value="${mvo.flucIncome}" />
	<input type="hidden" id="fixedExpense" name="fixedExpense"
		value="${mvo.fixedExpense}" />
	<input type="hidden" id="flucExpense" name="flucExpense"
		value="${mvo.flucExpense}" />

	<hr id=redHr>

	<hr id="redHr">
	<h3 align="center">재무목표별 잉여/부족 자금</h3>
	<div id="chartdiv2"
		style="width: 100%; height: 400px; background-color: #E7E7E7;"></div>


	<br>
	<h3>
		<font><%=session.getAttribute("name")%></font>님의 평균연령대 소비와 비교해보세요!
	</h3>
	<br>
	<br>
	<!-- 왼쪽 그래프 div -->
	<div class="left-box" align="center">
		<div id="chartdiv6"
			style="width: 70%; height: 400px; background-color: #FFFFFF;"></div>
	</div>
	<!-- 오른쪽 div -->
	<div class="right-box" align="left">
		<br>

		<br>



	</div>
	<div id="userInput" align="center">
		<form action='<%=request.getContextPath()%>/total_result2.do'>
			<input type="hidden" name="id" value="${vo_h.id }" /> <input
				type="hidden" name="code" id="code" value="${vvo.code }" /> <input
				type="hidden" name="id"
				value="<%=(String) session.getAttribute("id")%>" /> <input
				type="hidden" name="nowAge" value="${vvo.nowAge }" /> <input
				type="hidden" name="gender" value="${vvo.gender }" /> <input
				type="hidden" name="name"
				value="<%=(String) session.getAttribute("name")%>" /> <input
				type="hidden" name="invest_tot" value="${vvo.invest_tot }" /> <input
				type="hidden" name="retire_p" value="${vvo.retire_p }" /> <input
				type="hidden" name="retire_pay" value="${vvo.retire_pay }" /> <input
				type="hidden" name="retire_g" value="${vvo.retire_g }" /> <input
				type="hidden" id="input1" name="etc_goal" value="${vvo.etc_goal}" />
			<input type="hidden" id="input1" name="goalTime"
				value="${vvo.goalTime}" /> <input type="hidden" id="input1"
				name="goalMoney" value="${vvo.goalMoney}" /> <input
				id="resultInput2" type="submit" value="추천 포트폴리오 보기" />
		</form>
		<br>
		<br>
	</div>

</body>
</html>