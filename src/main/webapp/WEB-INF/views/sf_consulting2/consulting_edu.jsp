
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	double qu1 = (Math.random()*1); // 0~1
	int edu_n = 0;
	int edu_1 = 0;
	int edu_2 = 0;
	if(qu1>0.9){
		edu_n = 0;
	}else if(qu1>0.45){
		edu_n=1;	}else if(qu1>0.2){edu_n=2;}else if(qu1>0.1){edu_n=3;}else{edu_n=4;}
	if(edu_n==0){
		edu_1 = 0;
		edu_2 = 0;
	}else if(edu_n==1){
		double qu = (Math.random()*1); // 0~1
		edu_1 = (int) Math.round((qu * 10 + 3));
	}else if(edu_n>=2){
		double qu = (Math.random()*1); // 0~1
		double qu3 = (Math.random()*1); // 0~1
		edu_1 = (int) Math.round((qu * 10 + 3));
		edu_2 = (int) Math.round((qu3 * 5 + edu_1));
	}
	
	%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자녀설계</title>
</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	
	<h2 align="center">당신의 자녀 계획에 대해 말씀해 주세요.</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/sf_retire.do">
		<div id="userInput" align="center">
			<input type="hidden" name="code" value="${vo.code }"/>
			<input type="hidden" name="id" value="<%=(String)session.getAttribute("id")%>"/>
			<input type="hidden" name="nowAge" value="${vo.nowAge }"/>
			<input type="hidden" name="gender" value="${vo.gender }"/>
			<input type="hidden" name="name" value="<%=(String)session.getAttribute("name")%>"/>
			<input type="hidden" name="invest_tot" value="${vo.invest_tot }"/>
			<h3>자녀는 몇명정도 두실 계획이십니까?</h3>
			<input id="input1" name="edu_n"  value="<%=edu_n%>"/> 명
			<hr>
			<h3>첫째 자녀는 몇년뒤 가지실 계획이십니까?</h3>
			<input id="input1" name="edu_1"  value="<%=edu_1%>"/> 년뒤
			<h3>둘째 자녀는 몇년뒤 가지실 계획이십니까?</h3>
			<input id="input1" name="edu_2"  value="<%=edu_2%>"/> 년뒤
			
			<h3>셋째부 터는 입력안하셔도 됩니다.</h3>
			<hr>
			<h3>미래의 자녀를 위해 모아둔 금액을 입력해주세요</h3>
			<input id="input1" name="savedMoney"  value="0"/>만원
			<br>
			<hr>
			<input id="resultInput1" name="resultInput1" type="submit" value="다음단계로" /> <br>
			<br><br>
		</div>
	</form>


</body>
<script>
	resultInput1.click();
</script>
</html>