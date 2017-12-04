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
	width: 50%;
}

.right-box {
	float: right;
	width: 50%;
}

font {
	color: #F05F40;
}
</style>
<!-- amCharts javascript sources -->
<script type="text/javascript"
	src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript"
	src="https://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript"
	src="https://www.amcharts.com/lib/3/themes/light.js"></script>


<!-- amCharts javascript code -->
<script type="text/javascript">
	AmCharts.makeChart("chartdiv", {
		"type" : "serial",
		"categoryField" : "category",
		"angle" : 30,
		"depth3D" : 30,
		"startDuration" : 1,
		"theme" : "light",
		"categoryAxis" : {
			"gridPosition" : "start"
		},
		"trendLines" : [],
		"graphs" : [ {
			"balloonText" : "[[title]] of [[category]]:[[value]]",
			"fillAlphas" : 1,
			"id" : "AmGraph-1",
			"title" : "준비자금",
			"type" : "column",
			"valueField" : "column-1"
		}, {
			"balloonText" : "[[title]] of [[category]]:[[value]]",
			"fillAlphas" : 1,
			"id" : "AmGraph-2",
			"title" : "부족자금",
			"type" : "column",
			"valueField" : "column-2"
		} ],
		"guides" : [],
		"valueAxes" : [ {
			"id" : "ValueAxis-1",
			"stackType" : "regular",
			"title" : "자금"
		} ],
		"allLabels" : [],
		"balloon" : {},
		"legend" : {
			"enabled" : true,
			"useGraphSettings" : true
		},
		"titles" : [ {
			"id" : "Title-1",
			"size" : 15,
			"text" : "주거 마련 자금 그래프"
		} ],
		"dataProvider" : [ {
			"category" : "총 필요자금",
			"column-1" : "${hvo.requireMoney }",
			"column-2" : ""
		}, {
			"category" : "부족자금 / 준비자금",
			"column-1" : "${hvo.totalMoney }",
			"column-2" : "${hvo.lackMoney }"
		} ]
	});
</script>
</head>
<body>
	<%@ include file="/resources/include/headerHouse.jsp"%>

	<h2 align="center"><font><%=session.getAttribute("name")%></font>님의 주거 자금 상황입니다.</h2>
	<hr id="redHr">
	<div class="left-box">
		<!-- 그래프 -->
		<div id="chartdiv" style="width: 100%; height: 400px;"></div>
	</div>

	<div class="right-box">
		<h4>목표 주거 금액을 위해 저축해야하는 연 금액은</h4>
		<h2>
			<font color="#F05F40">${hvo.yearSave }만원 입니다.</font>
		</h2>
		<h4>목표 주거 금액을 위해 저축해야하는 월 금액은</h4>
		<h2>
			<font color="#F05F40">${hvo.monthSave }만원 입니다.</font>
		</h2>
		<h4>월 저축가능 금액과 저축 금액을 통해 모을 수 있는 총 자금은</h4>
		<h2>
			<font color="#F05F40">${hvo.totalMoney }만원 입니다.</font>
		</h2>
		<h4>예상되는 부족 자금은</h4>
		<h2>
			<font color="#F05F40">${hvo.lackMoney }만원 입니다.</font>
		</h2>
	</div>
	</header>
	<br>
	<div align="center">
		<h4>
			<%=session.getAttribute("name")%> 님은 <font>${hvo.enterYear }년</font>도 즈음에 <font>${hvo.requireMoney }만원</font> 정도의 주거를 목표로 하고 있습니다.<br>
			현재 준비된 자금은 <font>${hvo.savedMoney }만원</font>이며, 준비된 자금과, 월 저축 가능 금액으로 모을 수 있는 금액은
			<font>${hvo.totalMoney }만원</font> 입니다.<br>
			따라서 <font>${hvo.lackMoney }만원</font>의 부족자금이 발생합니다.
		</h4>
		<hr id="redHr">
		<h4>
			부족한 주거자금을 보충하기 위해서는 매달 <font>${hvo.addMoney }만원</font>을 추가 저축해야 합니다.<br>
			부족 금액의 40%를 대출 받을 경우 매달 <font> ${hvo.addMoney2 }만원</font>을 추가 저축해야
			합니다.<br> 부족 금액의 60%를 대출 받을 경우 매달 <font>${hvo.addMoney3 }만원</font>을
			추가 저축해야 합니다.
		</h4>
		<hr>
		<input id="resultInput" type="submit" value="다시하기"
			onclick="location.href='<%=request.getContextPath()%>/house.do' " />
		
		<input id="resultInput" type="submit" value="메인으로" 
			onclick="location.href='<%=request.getContextPath() %>/result_main.do'"/>
			<br><br>
		
	</div>
	<br>
	<br>
</body>
</html>