<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주거 마련 자금 설계</title>

<style type="text/css">
	select{
		width: 200px;
		height: 40px;
	}
	#resultInput2{
		border-collapse: collapse;
		border:1px #98C593;
		border-radius : 50px 50px 50px 50px;
		width: 120px; 
		height: 50px;
		font-size: 18px;
		background-color: #F05F40;
		color: white;
	}

</style>
</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	
	<form method="post" action = "<%=request.getContextPath()%>/total_time.do">
		<h2 align="center">살고 싶은 집값 예상하기</h2>
		<hr id="redHr">
	
		<input type="hidden" name="code" value="${vo.code }"/>
		<input type="hidden" name="id" value="<%=(String)session.getAttribute("id")%>"/>
		<input type="hidden" name="nowAge" value="<%=session.getAttribute("nowAge")%>"/>
		<input type="hidden" name="gender" value="${vo.gender }"/>
		<input type="hidden" name="name" value="<%=(String)session.getAttribute("name")%>"/>
		<input type="hidden" name="invest_tot" value="${vo.invest_tot }"/>
		
		<div id="userInput" align="center">
		
			<table >
				<tr>
					<td colspan="4"><h3>예상 입주 시기는 언제인가요?</h3></td>
					<td><input class="input1" name="enterYear" id="enterYear" /> 년 후</td>
				</tr>
				<tr>
					<td colspan="4"><h3>목표하는 주거 지역, 형태를 선택하세요.</h3></td>
				</tr>
				<tr>
					<td colspan="2">
						<select name='add' id='add' >
							<option value=0>거주지역</option>
							<option value='add1'>강남구</option>
							<option value='add1'>강동구</option>
							<option value='add1'>양천구</option>
							<option value='add1'>강서구</option>
							<option value='add1'>마포구</option>
							
							<option value='add2'>강북구</option>
							<option value='add2'>동작구</option>
							<option value='add2'>용산구</option>
							<option value='add2'>영등포구</option>
							<option value='add2'>금천구</option>
							
							<option value='add3'>구로구</option>
							<option value='add3'>은평구</option>
							<option value='add3'>노원구</option>
							<option value='add3'>송파구</option>
							<option value='add3'>종로구</option>
							
							<option value='add4'>성동구</option>
							<option value='add4'>서대문구</option>
							<option value='add4'>광진구</option>
							<option value='add4'>관악구</option>
							<option value='add4'>서초구</option>
							
							<option value='add5'>성북구</option>
							<option value='add5'>중랑구</option>
							<option value='add5'>동대문구</option>
							<option value='add5'>도봉구</option>
							<option value='add5'>중구</option>
						</select>
					</td>
					<td>
						<select name='type' id='type'>
							<option value=0>주거형태</option>
							<option value="APT">아파트</option>
							<option value="mult_house"'>다세대 연립</option>
						</select>
					</td>
					<td>
						<select name='jugeao' id='jugeao'>
							<option value=0>계약형태</option>
							<option value='mm'>매매</option>
							<option value='jeonse'>전세</option>
							<option value='month'>월세</option> 
						</select>
					</td>
					<td>
						<select name='peongsu' id='peongsu'>
							<option value=0>면적</option>	
							<option value=60>18평 이하</option>
							<option value=85>18평~25평</option>
							<option value=102>85평~30평</option>
							<option value=135>30평~40평</option>
							<option value=136>40평 이상</option>
						</select>
					</td>
				</tr>
			</table>
			<br><br>
			<input id="resultInput2" type="submit" value="예상집값보기" />
			<br>
		</div>
		
	</form>

</body>
</html>