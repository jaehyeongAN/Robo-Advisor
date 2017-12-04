
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재무설계 기본사항</title>

<!-- amCharts javascript sources -->
		<script type="text/javascript" src="../<%=request.getContextPath() %>/resources/js/amcharts.js"></script>
		<script type="text/javascript" src="../<%=request.getContextPath() %>/resources/js/pie.js"></script>
		<script type="text/javascript" src="../<%=request.getContextPath() %>/resources/js/light.js"></script>
		<script type="text/javascript" src="../<%=request.getContextPath() %>/resources/js/serial.js"></script>
		<script type="text/javascript" src="../<%=request.getContextPath() %>/resources/js/patterns.js"></script>
		<script type="text/javascript" src="../<%=request.getContextPath() %>/resources/js/radar	.js"></script>

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
			
			resultInput1.click();
		</script>


</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	
	<h2 align="center">당신의 재무설계 결과 입니다!</h2>
	<form method="post" action="<%=request.getContextPath()%>/sf_start.do">
	<input id="resultInput1" name="resultInput1" type="submit" value="다음단계로" /><br>
</form>
	
	<hr id="redHr">
	<h3 align="center">월 저축가능액 자산 분배도</h3>
	<div id="chartdiv" style="width: 100%; height: 400px; background-color: #E7E7E7;" ></div>
	
	<hr id="redHr">
	<h3 align="center">재무목표별 잉여/부족 자금</h3>
	<div id="chartdiv2" style="width: 100%; height: 400px; background-color: #E7E7E7;" ></div>
	
	<hr id="redHr">
	<h3 align="center">추천 포트 폴리오</h3>
	<div id="chartdiv3" style="width: 100%; height: 400px; background-color: #E7E7E7;" ></div>
	
	<hr id="redHr">
	<h3 align="center">포트 폴리오 진단</h3>
	<div id="chartdiv4" style="width: 100%; height: 400px; background-color: #E7E7E7;" ></div>
	
	<hr id="redHr">
	<div id="userInput" align="center">
			<h4>혹시 재무설계결과가 마음에 들지 않으십니까?</h4>
			<h4>혹은 전문가의 설명이나 조언이 듣고 싶습니까?</h4>
			<h4>동의를 체크해 주시면 빠른시일내에 재무설계 전문가의 설명을 받을수 있습니다.</h4>
			<input type="radio" id="gender_m" name="f_select" value="0" checked>
			<label for="gender_m"><img src="../<%=request.getContextPath() %>/resources/img/agree.png" width="70">	</label>
			<input type="radio" id="gender_f" name="f_select" value="1">
			<label for="gender_f"><img src="../<%=request.getContextPath() %>/resources/img/no.png"width="70"></label>
			<br><br>
		</div>
		<div id="userInput" align="center">
			
			
			<br><br>
		</div>

</body>


</html>