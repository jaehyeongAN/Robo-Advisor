
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
							"country": "Home",
							"litres": ${vo_h.positiveMoney}
						},
						{
							"country": "Marrige",
							"litres": ${vo_m.positiveMoney}
						},
						{
							"country": "Child",
							"litres": ${vo_edu.positiveMoney}
						},
						{
							"country": "Retire",
							"litres": ${vo_r.positiveMoney}
						},
						{
							"country": "Etc",
							"litres": ${vo_etc.positiveMoney}
						},
						{
							"country": "Risk_Management",
							"litres": ${insurance_p}
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
								"column-2": ${vo_h.goalMoney}-${vo_h.shortageMoney}+${vo_h.surplusMoney},
								"[object Window]": "",
								"surplus": ${vo_h.goalMoney}
							},
							{
								"category": "Marrige",
								"column-2": ${vo_m.goalMoney}-${vo_m.shortageMoney}+${vo_m.surplusMoney},
								"[object Window]": "",
								"surplus": ${vo_m.goalMoney}
							},
							{
								"category": "Child",
								"column-2": ${vo_edu.goalMoney}-${vo_edu.shortageMoney}+${vo_edu.surplusMoney},
								"[object Window]": "",
								"surplus": ${vo_edu.goalMoney}
							},
							{
								"category": "Retire",
								"column-2": ${vo_r.goalMoney}-${vo_r.shortageMoney}+${vo_r.surplusMoney},
								"[object Window]": "",
								"surplus": ${vo_r.goalMoney}
							},
							{
								"category": "Etc",
								"column-2": ${vo_etc.goalMoney}-${vo_etc.shortageMoney}+${vo_etc.surplusMoney},
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
								"country": "단기 (추천상품 : CMA, 적금, MMF)",
								"litres": ${portfolio[1]}
							},
							{
								"country": "중기(추천상품 : 채권, 펀드, 주식, 주택청약)",
								"litres": ${portfolio[2]}
							},
							{
								"country": "장기(추천상품 : 연금, 부동산펀드, 부동산, 변액연금, 유니버셜보험)",
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
			AmCharts.makeChart("chartdiv7",
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
				
		</script>


</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>

		<h2 align="center">당신의 재무설계 결과 포트폴리오입니다!</h2>
	<table>
		<tr>
			<td>ww</td>
			<td>ww</td>
		</tr>
	</table>
	<hr id="redHr">
	<h3 align="center">현재 포트폴리오</h3>
	<div id="chartdiv7"
		style="width: 100%; height: 400px; background-color: #E7E7E7;"></div>
	
	<hr id="redHr">
	<h3 align="center">추천 포트 폴리오</h3>
	<div id="chartdiv3" style="width: 100%; height: 400px; background-color: #E7E7E7;"></div>
	

	<hr id="redHr">
	<h3 align="center">추천 월 저축가능액 자산 분배도</h3>
	<div id="chartdiv" style="width: 100%; height: 400px; background-color: #E7E7E7;" ></div>
	
	<hr id="redHr">
	<h3 align="center">추천 재무목표별 잉여/부족 자금</h3>
	<div id="chartdiv2" style="width: 100%; height: 400px; background-color: #E7E7E7;" ></div>
	
	<hr id="redHr">
	<h3 align="center">추천 포트 폴리오 진단</h3>
	<div id="chartdiv4"
		style="width: 100%; height: 400px; background-color: #E7E7E7;"></div>

	<hr id="redHr">
	<div id="userInput" align="center">
		<h4>혹시 재무설계결과가 마음에 들지 않으십니까?</h4>
		<h4>혹은 전문가의 설명이나 조언이 듣고 싶습니까?</h4>
		<h4>동의를 체크해 주시면 빠른시일내에 재무설계 전문가의 설명을 받을수 있습니다.</h4>
		<input type="radio" id="gender_m" name="f_select" value="0" checked>
		<label for="gender_m"><img
			src="../<%=request.getContextPath()%>/resources/img/agree.png"
			width="70"> </label> <input type="radio" id="gender_f" name="f_select"
			value="1"> <label for="gender_f"><img
			src="../<%=request.getContextPath()%>/resources/img/no.png"
			width="70"></label> <br>
		<br>
	</div>


	<input type="hidden" id="fixedIncome" name="fixedIncome"
		value="${mvo.fixedIncome}" />
	<input type="hidden" id="flucIncome" name="flucIncome"
		value="${mvo.flucIncome}" />
	<input type="hidden" id="fixedExpense" name="fixedExpense"
		value="${mvo.fixedExpense}" />
	<input type="hidden" id="flucExpense" name="flucExpense"
		value="${mvo.flucExpense}" />


	</div>
	<br>

		<br>

		<br>



	</div>
	<div id="userInput" align="center">
		<input id="resultInput" type="submit" value="메인으로"
			onclick="location.href='<%=request.getContextPath()%>/total_main.do'" />
		<br>
		<br>
	</div>

</body>
</html>