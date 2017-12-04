<%@page import="spring.project.vo.RetireVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>은퇴자금설계</title>
<script type="text/javascript">
	function check_data() {
		if(document.getElementById("nowAge").value=="" ||document.getElementById("retireYear").value==""||
				document.getElementById("deathAge").value==""||document.getElementById("requireMoney").value==""||
				document.getElementById("savedMoney").value==""||document.getElementById("pension").value==""||
				document.getElementById("saveMoney").value==""||document.getElementById("rate").value==""){
			
			alert("항목을 모두 입력해주세요");
			return false;
		}
	}
</script>
</head>
<body>
	<%@ include file="/resources/include/headerRetire.jsp"%>
	
	<h2 align="center">은퇴자금 설계</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/retireCalc.do" onsubmit="return check_data()">
		<div id="userInput" align="center">
		<input type="hidden" name="name" id="name" value="<%=session.getAttribute("name") %>" /> 
			<table>
				<tr>
					<td><h3>1 .현재 나이는 어떻게 되나요?</h3></td>
					<td><input class="input1" name="nowAge" id="nowAge" value="<%=session.getAttribute("nowAge") %>" /> 살</td>
				</tr>
				<tr>
					<td><h3>2. 은퇴예상연도는 언제인가요?</h3></td>
					<td><input class="input1" name="retireYear" id="retireYear" /> 년도</td>
				</tr>
				<tr>
					<td><h3>3. 본인의 기대 수명은 언제인가요?</h3></td>
					<td><input class="input1" name="deathAge" id="deathAge" /> 살</td>
				</tr>
				<tr>
					<td><h3>4. 은퇴시 필요할 월 생활비는 얼마인가요?</h3></td>
					<td><input class="input1" name="requireMoney" id="requireMoney" /> 만원</td>
				</tr>
				<tr>
					<td><h3>5. 현재 준비된 은퇴자금은 얼마인가요?</h3></td>
					<td><input class="input1" name="savedMoney" id="savedMoney" /> 만원</td>
				</tr>
				<tr>
					<td><h3>6. 대략적인 퇴직금 예상금액은 얼마인가요?</h3></td>
					<td><input class="input1" name="pension" id="pension" /> 만원</td>
				</tr>
				<tr>
					<td><h3>7. 은퇴자금으로 월 저축 가능한 금액은 얼마인가요?</h3></td>
					<td><input class="input1" name="saveMoney" id="saveMoney" /> 만원</td>
				</tr>
				<tr>
					<td><h3>8. 기대 수익률은 얼마인가요?</h3></td>
					<td><input class="input1" name="rate" id="rate" /> %</td>
				</tr>
			</table>
			<br>
			<hr>
			<input id="resultInput" type="submit" value="결과보기"/>
			<br><br>
		</div>
	</form>


</body>
</html>