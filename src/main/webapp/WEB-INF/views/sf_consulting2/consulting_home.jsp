
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	double qu1 = (Math.random()*1); // 0~1
	double qu2 = (Math.random()*1); // 0~1
	double qu3 = (Math.random()*1); // 0~1
	double qu4 = (Math.random()*1); // 0~1
	int home_select = 0;
	double home_region = 0;
	int home_type = 0;
	int home_m = 0;
	
	if(qu1>0.3){
		home_select = 0;
	}else{
		home_select = 1;
	}
	
	if(home_select ==1){
		home_region=0;		home_type=0;		home_m=0;
	}else{
		if(qu2>0.65){home_region=1;}else if(qu2>0.55){home_region=0.5;}else if(qu2>0.3){home_region=0.6;
		}else if(qu2>0.1){home_region=0.7;}else{home_region=0.4;}
		
		if(qu3>0.5){home_type=2152;}else if(qu3>0.3){home_type=1582;}else if(qu3>0.15){home_type=407;
		}else{home_type=849;}
		
		home_m = (int) Math.round((qu4 * 25 + 20));
	}
	double qu5 = (Math.random()*1); // 0~1
	int goalTime = (int) Math.round((qu5 * 15 + 5));
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주거</title>
</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	
	<h2 align="center">당신의 주거 계획에 대하여 말씀해주세요.</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/sf_marrige.do">
		<div id="userInput" align="center">
			<h2>난수</h2>
			<input name="qu" value="<%=qu1%>"/>
			<input type="hidden" name="code" value="${vo.code }"/>
			<input type="hidden" name="id" value="<%=(String)session.getAttribute("id")%>"/>
			<input type="hidden" name="nowAge" value="${vo.nowAge }"/>
			<input type="hidden" name="gender" value="${vo.gender }"/>
			<input type="hidden" name="name" value="<%=(String)session.getAttribute("name")%>"/>
			<input type="hidden" name="invest_tot" value="${vo.invest_tot }"/>
			<h4>당신은 현재 어떤집에 살고있나요?
				<select name="home_select"  id="input1">
					<option value=0>부모님과거주</option>
					<option value=1>내집거주</option>
				</select><br></h4>
			<h4>현재 집을 위해 모아둔자금은?(현재 집가격은?) : <input  id="input1" name="savedMoney" value="0"/>만원</h4>
			<hr>
			<h2>어떤 집에 살고 싶으십니까?</h2>
			<!-- <h5><select name="home_region" id="input1" >
				<option value=0>거주지역</option>
				<option value=1>서울</option>
				<option value=0.5>인천</option>
				<option value=0.6>경기</option>
				<option value=0.7>기타 수도권</option>
				<option value=0.5>5개광역시</option>
				<option value=0.4>기타지역</option>
			</select> <select name="home_type" id="input1" >
				<option value=0>주거형태</option>
				<option value=2152>아파트 매매</option>
				<option value=1582>아파트 전세</option>
				<option value=407>단독주택</option>
				<option value=849>연립주택</option>
			</select>  -->
			거주지역 : <input name = "home_region" value = "<%=home_region %>"/>
			주거형태 : <input name = "home_type"  value = "<%=home_type%>"/>
			면적 : <input name="home_m" id="input1"  value="<%=home_m%>"/>평
			<hr>
			<h2>목표 시기는 언제입니까?</h2>
			<input id="input1" name="goalTime" value="<%=goalTime%>"/>년뒤
			<hr>
			<br>
			<input id="resultInput1" name="resultInput1" type="submit" value="다음단계로" /> <br>
			<br><br>
		</div>
	</form>


</body>
<script>
	resultInput1.click();
</script>
</html>