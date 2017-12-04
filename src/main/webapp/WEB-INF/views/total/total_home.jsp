
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주거</title>

<!-- amCharts javascript sources -->
<script type="text/javascript" src="../<%=request.getContextPath() %>/resources/js/amcharts.js"></script>
<script type="text/javascript" src="../<%=request.getContextPath() %>/resources/js/serial.js"></script>
<script type="text/javascript" src="../<%=request.getContextPath() %>/resources/js/light.js"></script>


<!-- amCharts javascript code -->
<script type="text/javascript">
	AmCharts.makeChart("chartdiv",
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
					"id": "AmGraph-1",
					"tabIndex": -1,
					"title": "예측치",
					"type": "smoothedLine",
					"valueField": "column-1"
				},
				{
					"balloonText": "[[title]] of [[category]]:[[value]]",
					"id": "AmGraph-2",
					"lineColor": "#008000",
					"title": "신뢰수준 80%(Lo)",
					"type": "smoothedLine",
					"valueField": "column-2"
				},
				{
					"id": "AmGraph-3",
					"lineColor": "#008000",
					"title": "신뢰수준 80%(Hi)",
					"type": "smoothedLine",
					"valueField": "column-3"
				},
				{
					"fixedColumnWidth": -1,
					"id": "AmGraph-4",
					"lineColor": "#9400D3",
					"title": "신뢰수준 95%(Lo)",
					"type": "smoothedLine",
					"valueField": "column-4"
				},
				{
					"id": "AmGraph-5",
					"lineColor": "#9400D3",
					"title": "신뢰수준 95%(Hi)",
					"type": "smoothedLine",
					"valueField": "column-5"
				}
			],
			"guides": [],
			"valueAxes": [
				{
					"id": "ValueAxis-1",
					"title": "가격"
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
					"text": "부동산 가격 시계열 예측 결과"
				}
			],
			"dataProvider": [
				{
					"category": "현재가격",
					"column-1": "${value.get(0)}",
					"column-2": "${value.get(0)}",
					"column-3": "${value.get(0)}",
					"column-4": "${value.get(0)}",
					"column-5": "${value.get(0)}"
				},
				{
					"category": "5년 뒤",
					"column-1": "${value.get(1)}",
					"column-2": "${value.get(2)}",
					"column-3": "${value.get(3)}",
					"column-4": "${value.get(4)}",
					"column-5": "${value.get(5)}"
				},
				{
					"category": "10년 뒤",
					"column-1": "${value.get(6)}",
					"column-2": "${value.get(7)}",
					"column-3": "${value.get(8)}",
					"column-4": "${value.get(9)}",
					"column-5": "${value.get(10)}"
				},
				{
					"category": "15년 뒤",
					"column-1": "${value.get(11)}",
					"column-2": "${value.get(12)}",
					"column-3": "${value.get(13)}",
					"column-4": "${value.get(14)}",
					"column-5": "${value.get(15)}"
				},
				{
					"category": "20년 뒤",
					"column-1": "${value.get(16)}",
					"column-2": "${value.get(17)}",
					"column-3": "${value.get(18)}",
					"column-4": "${value.get(19)}",
					"column-5": "${value.get(20)}"
				},
				{
					"category": "예상가격",
					"column-1": "${value.get(21)}",
					"column-2": "${value.get(22)}",
					"column-3": "${value.get(23)}",
					"column-4": "${value.get(24)}",
					"column-5": "${value.get(25)}"
				}
			]
		}
	);
</script>

</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	
	<h2 align="center">당신의 주거 계획에 대하여 말씀해주세요.</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/total_marrige.do">
		<div id="userInput" align="center">
			<input type="hidden" name="code" value="${vo.code }"/>
			<input type="hidden" name="id" value="<%=(String)session.getAttribute("id")%>"/>
			<input type="hidden" name="nowAge" value="<%=session.getAttribute("nowAge")%>"/>
			<input type="hidden" name="gender" value="${vo.gender }"/>
			<input type="hidden" name="name" value="<%=(String)session.getAttribute("name")%>"/>
			<input type="hidden" name="invest_tot" value="${vo.invest_tot }"/>
			<h4>당신은 현재 어떤집에 살고있나요?
				<select name="home_select"  id="input1">
					<option value=0>부모님과거주</option>
					<option value=1>내집거주</option>
				</select><br></h4>
			<h4>현재 집을 위해 모아둔자금은?(현재 집가격은?) : <input  id="input1" name="savedMoney" value="5000"/>만원</h4>
			<hr>
			
			<input type="hidden" name="home_region" value="0"/>
			<input type="hidden" name="home_type" value="0"/>
			<input type="hidden" name="home_m" value="0"/>
			<!-- amChart -->
		<div>
			<div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
		</div>
		<h3>예상 집값은 </h3>
		<input class="input1" name="goalMoney"  value="${value.get(21)}"> 만원
			<hr>
			<h2>목표 시기는 언제입니까?</h2>
			<input id="input1" name="goalTime" value="${vo.goalTime }"/>년뒤
			<hr>
			<br>
			<input id="resultInput" type="submit" value="다음단계로"/>
			<br><br>
		</div>
	</form>


</body>
</html>