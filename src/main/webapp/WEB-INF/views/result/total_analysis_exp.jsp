<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.left-box {
	float: left;
	width: 60%;
}

.right-box {
	float: right;
	width: 40%;
}

font {
	color: #F05F40;
	font-size: 25px;
}
</style>

<!-- amCharts javascript sources -->
<script type="text/javascript" src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/pie.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/serial.js"></script>

<!-- amCharts javascript code -->
<script type="text/javascript">
	AmCharts.makeChart("chartdiv",
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
					"column-1": "${vo.fixedExpense}"
				},
				{
					"category": "변동 지출",
					"column-1": "${vo.flucExpense}"
				},
				{
					"category": "저축 가능 금액",
					"column-1": "${vo.fixedIncome+vo.flucIncome-vo.fixedExpense-vo.flucExpense}"
				}
			]
		}
	);
</script>


<!-- amCharts javascript sources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js" type="text/javascript"></script>
<script src="https://www.amcharts.com/lib/3/serial.js" type="text/javascript"></script>


<!-- amCharts javascript code -->
<script type="text/javascript">
			AmCharts.makeChart("chartdiv2",
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
							"column-1": "${vo.fixedHome}",
							"column-2": "${exp.fixedHome}"
						},
						{
							"category": "식비",
							"column-1": "${vo.fixedFood}",
							"column-2": "${exp.fixedFood}"
						},
						{
							"category": "통신비",
							"column-1": "${vo.fixedCommunication}",
							"column-2": "${exp.fixedCommunication}"
						},
						{
							"category": "교통비",
							"column-1": "${vo.fixedTrans}",
							"column-2": "${exp.fixedTrans}"
						},
						{
							"category": "보험료",
							"column-1": "${vo.fixedInsurance}",
							"column-2": "${exp.fixedInsurance}"
						},
						{
							"category": "세금",
							"column-1": "${vo.fixedTax}",
							"column-2": "${exp.fixedTax}"
						},
						{
							"category": "생활용품비",
							"column-1": "${vo.flucLife}",
							"column-2": "${exp.flucLife}"
						},
						{
							"category": "의류미용비",
							"column-1": "${vo.flucBeauty}",
							"column-2": "${exp.flucBeauty}"
						},
						{
							"category": "문화레저비",
							"column-1": "${vo.flucLeisure}",
							"column-2": "${exp.flucLeisure}"
						},
						{
							"category": "의료비",
							"column-1": "${vo.flucMedical}",
							"column-2": "${exp.flucMedical}"
						},
						{
							"category": "경조사비",
							"column-1": "${vo.flucEvent}",
							"column-2": "${exp.flucEvent}"
						},
						{
							"category": "교육비",
							"column-1": "${vo.flucEdu}",
							"column-2": "${exp.flucEdu}"
						},
						{
							"category": "기타비용",
							"column-1": "${vo.flueEtc}",
							"column-2": "${exp.flueEtc}"
						},
					]
				}
			);
		</script>



</head>
<body>
<%@ include file="/resources/include/headerConsume.jsp"%>

		<input type="hidden" id="fixedIncome" name="fixedIncome" value="${vo.fixedIncome}"/>
	    <input type="hidden" id="flucIncome" name="flucIncome" value="${vo.flucIncome}"/>
	    <input type="hidden" id="fixedExpense" name="fixedExpense" value="${vo.fixedExpense}"/>
	    <input type="hidden" id="flucExpense" name="flucExpense" value="${vo.flucExpense}"/>
	<h2><font><%=session.getAttribute("name") %></font>님의 현재 소비상태는?</h2>
	<hr id=redHr>
	<!-- 그래프 div -->
	<div align="center">
	<div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
		<br>
		<table>
			<tr>
				<td width="200">총수입: <input type="text" id="sumIncome" name="sumIncome"
					value="${vo.fixedIncome+vo.flucIncome}" readonly="readonly" size="5"/>만원  
				</td>
				
				<td width="200">총지출: <input type="text" id="sumExpense" name="sumExpense"
					value="${vo.fixedExpense+vo.flucExpense}" readonly="readonly" size="5"/>만원  
				</td>
				
				<td width="200">수지차: <input type="text" id="diff" name="diff"
					value="${vo.fixedIncome+vo.flucIncome-vo.fixedExpense-vo.flucExpense}"
					readonly="readonly" size="5"/>만원
				</td>
			</tr>
		</table>
	</div><br>
	<h3><font><%=session.getAttribute("name") %></font>님의 평균연령대 소비와 비교해보세요!</h3>
	<br><br>
	<!-- 왼쪽 그래프 div -->
	<div class="left-box" align="center">
		<div id="chartdiv2" style="width: 70%; height: 400px; background-color: #FFFFFF;" ></div>
	</div>
	<!-- 오른쪽 div -->
	<div class="right-box" align="left">
		<br>
		<table>
			<tr>
				<td colspan="3">
					${dv.fixedHome}
				</td>
			</tr>
			<tr>
				<td colspan="3">
					${dv.fixedFood}		
				</td>
			</tr>
			<tr>
				<td colspan="3">
					${dv.communication}		
				</td>
			</tr>
			<tr>
				<td colspan="3">
					${dv.fixedTrans}		
				</td>
			</tr>
			<tr>
				<td colspan="3">
					${dv.fixedInsurance}		
				</td>
			</tr>
			
			<tr>
				<td colspan="3">
					${dv.fixedTax}		
				</td>
			</tr>
			
			<tr>
				<td colspan="3">
					${dv.flucLife}		
				</td>
			</tr>
			<tr>
				<td colspan="3">
					${dv.flucBeauty}		
				</td>
			</tr>
			<tr>
				<td colspan="3">
					${dv.flucLeisure}		
				</td>
			</tr>
			<tr>
				<td colspan="3">
					${dv.flucMedical}		
				</td>
			</tr>
			<tr>
				<td colspan="3">
					${dv.flucEvent}		
				</td>
			</tr>
			<tr>
				<td colspan="3">
					${dv.flueEtc}		
				</td>
			</tr>
			<tr>
				<td colspan="3">
					${dv.flucEdu}		
				</td>
			</tr>
		</table>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<input type="submit" id="resultInput" value="다음으로"
		onclick="location.href='<%=request.getContextPath()%>/total_resultt.do'"/> 
	<br><br><br><br><br><br><br>
</body>
</html>