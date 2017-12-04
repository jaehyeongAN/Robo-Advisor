<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주거 마련 자금 설계</title>
<script type="text/javascript">
function check_data() {
	if(document.getElementById("enterYear").value=="" ||document.getElementById("requireMoney").value==""||
			document.getElementById("savedMoney").value==""||document.getElementById("saveMoney").value==""||
			document.getElementById("rate").value==""){
		
		alert("항목을 모두 입력해주세요");
		return false;
	}
} 
</script>
<style type="text/css">
	select{
		width: 200px;
		height: 40px;
	}
</style>
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
	<%@ include file="/resources/include/headerHouse.jsp"%>
	
	<h2 align="center">주거 마련 자금 설계</h2>
	<hr id="redHr">
	<!-- amChart -->
	<div>
		<div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
	</div>
	
	<form method="post" action = "<%=request.getContextPath()%>/houseCalc.do"  onsubmit="check_date()">
		<div id="userInput" align="center">
		<input type="hidden" name="name" id="name" value="<%=session.getAttribute("name") %>" />
		<input type="hidden" name="enterYear" id="enterYear"  value = "${enterYear }"/>

			<table >
				<tr>
					<td colspan="4"><h3>1. <font style="color: #F05F40"><%=session.getAttribute("name") %></font>님이 원하는 주거의 예상 집값은 </h3></td>
					<td><input class="input1" name="requireMoney" id="requireMoney" value="${value.get(21)}"> 만원</td>
				</tr>
				<tr>
					<td colspan="4"><h3>2. 주거마련을 위해 준비된 자금은 얼마인가요?</h3></td>
					<td><input class="input1" name="savedMoney" id="savedMoney" /> 만원</td>
				</tr>
				<tr>
					<td colspan="4"><h3>3. 주거마련을 위해 월저축 가능 금액은 얼마인가요?</h3></td>
					<td><input class="input1" name="saveMoney" id="saveMoney" /> 만원</td>
				</tr>
				<tr>
					<td colspan="4"><h3>4. 기대 수익률은 얼마인가요?</h3></td>
					<td><input class="input1" name="rate" id="rate" /> %</td>
				</tr>
				<tr>
					<td colspan="4"><h3>5. 상환방식을 선택하세요.</h3></td>
					<td>
						<select name = "rpay_type_nm" id ="rpay_type">
							<option value="분할상환방식">분할상환방식</option>
							<option value="만기일시상환방식">만기일시상환방식</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="4"><h3>6. 금리 유형을 선택하세요.</h3></td> 
					<td>
						<select name = "lend_rate_type_nm" id ="lend_rate_type" >
							<option value="변동금리">변동금리</option>
							<option value="고정금리">고정금리</option>
						</select>
					</td>
				</tr>
				
			</table>
			<input id="resultInput" type="submit" value="결과보기" />
			<br>
		</div>
		
	</form>

</body>
</html>