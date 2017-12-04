<%@page import="spring.project.vo.RetireVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>은퇴자금상황</title>
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
			"text" : "은퇴 설계 자금 그래프"
		} ],
		"dataProvider" : [ {
			"category" : "총 필요자금",
			"column-1" : "${rvo.requireTotal }",
			"column-2" : ""
		}, {
			"category" : "부족자금 / 준비자금",
			"column-1" : "${rvo.totalMoney }",
			"column-2" : "${rvo.lackMoney }"
		} ]
	});
</script>
</head>
<body>
	<%@ include file="/resources/include/headerRetire.jsp"%>
	
	<h2 align="center"><font><%=session.getAttribute("name")%></font>님의 현재 은퇴자금상황입니다.</h2>
	<hr id="redHr">
	<div class="left-box">
		<!-- 그래프 -->
		<div id="chartdiv" style="width: 100%; height: 400px;"></div>
	</div>
	
	<input type="hidden" id="id" value=<%=session.getAttribute("id") %>>
	<input type="hidden" id="regDate" value=<%=session.getAttribute("regDate") %>>
	
	<div class="right-box">
		<h3>은퇴전까지 모아야 할 총 금액은</h3>
		<h2>
			<font color="#F05F40">${rvo.requireTotal }만원 입니다.</font>
		</h2>
		<h3>
			연금, 퇴직금, 준비된 자금, 월 저축 가능 금액으로<br> 모을 수 있는 총 금액은
		</h3>
		<h2>
			<font color="#F05F40">${rvo.totalMoney }만원 입니다.</font>
		</h2>
		<h3>예상되는 부족 자금은</h3>
		<h2>
			<font color="#F05F40">${rvo.lackMoney }만원 입니다.</font>
		</h2>
	</div>
	</header>
	<br>
	<div align="center">
		<h4>
			<%=session.getAttribute("name")%>님은 현재 <font>${rvo.nowAge }세</font>이며 <font>${rvo.retireAge }세</font>에
			은퇴를 예상하고 있습니다. <br> 은퇴후 필요한 생활비로는 <font>${rvo.requireMoney }만원</font>을
			예상하고 있습니다.<br> 이를 기준으로 당신이 필요로 하는 은퇴 후 생활자금은 <font>${rvo.requireTotal }만원</font>이며,
			이중 준비된 자금은 <font>${rvo.savedMoney}만원</font>입니다. <br> 따라서 <font>${rvo.lackMoney }만원</font>의
			부족자금이 발생합니다.
		</h4>
		<hr id="redHr">
		<h4>
			부족한 은퇴자금을 보충하기 위해서는 매달 <font>${rvo.addMoney }만원</font>을 추가 저축해야 합니다.<br>
			부족 금액의 40%를 외부요소로 충당 할 경우 매달 <font> ${rvo.addMoney2 }만원</font>을 추가 저축해야
			합니다.<br> 부족 금액의 60%를 외부요소로 충당 할 경우 매달 <font>${rvo.addMoney3 }만원</font>을
			추가 저축해야 합니다.
		</h4>
		<hr>
		<input id="resultInput" type="submit" value="다시하기"
			onclick="location.href='<%=request.getContextPath()%>/retire.do'" />
		<input id="resultInput" type="submit" value="메인으로" 
			onclick="location.href='<%=request.getContextPath() %>/result_main.do'"/>
			<br><br>
		
			
	</div>
	<br>
	<br>
</body>
</html>