<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<h2>당신의 꿈에 대해 들려 주세요</h2>
	<hr>
	<form method="post"  action="<%=request.getContextPath()%>/sf_con_calc.do">
	<h4>당신은 이름은?<input name = "name" id="name"></h4>
	<h4>당신은 나이는?<input name = "nowAge">세</h4>
	<h4>당신은?<input type="radio" name = "gender" value="1">남자<input type="radio" name = "gender" value="2">여자</h4>
	<h4>당신은 투자 가능 금액은?<input name = "income">만원</h4>
	<hr>
	<h4>어떤 집에 살고 싶습니까??</h4>
	<select name = "home_region">
		<option value=0>거주지역</option>
		<option value=1>서울</option>
		<option value=0.5>인천</option>
		<option value=0.6>경기</option>
		<option value=0.7>기타 수도권</option>
		<option value=0.5>5개광역시</option>
		<option value=0.4>기타지역</option>
	</select>
	<select name="home_type">
		<option value=0>주거형태</option>
		<option value=2152>아파트 매매</option>
		<option value=1582>아파트 전세</option>
		<option value=407>단독주택</option>
		<option value=849>연립주택</option>
	</select>
	면적 : <input name = "home_m">m제곱
	<br>
	<h4>현재 어떤집에 살고있습니까?</h4>
		<select name="home_select">
			<option value=0>부모님과거주</option>
			<option value=1>내집거주</option>
		</select>
		현재 집을 위해 모아둔자금은?(현재 집가격은?) : <input name="home_p">만원<br>
	<h4>몇년뒤에 실현되었으면?</h4><input name="home_n">년뒤
	<hr>
	
	<h4>결혼에 대한 계획이 있습니까?</h4>
		<input type="radio" name="marrige_ok" value=0>넵
		<input type="radio" name="marrige_ok" value=1>이미 결혼하였습니다.
	<h4>언제 결혼할 예정이십니까?</h4><input name="marrige_when">년뒤
	<h4>예상 결혼 비용은 얼마입니까?</h4><input name="marrige_howmuch" value=5000>만원
	
	<hr>
	<h4>당신의 자녀계획은?</h4>
	<h4>자녀는 몇명 정도 두실 계획이십니까?</h4><input name="edu_n">명
	<h4>첫째는 몇년뒤 가지실 계획이십니까?</h4><input name="edu_1">년뒤
	<h4>둘째는 몇년뒤 가지실 계획이십니까?</h4><input name="edu_2">년뒤
	<h4>셋째는 몇년뒤 가지실 계획이십니까?</h4><input name="edu_3">년뒤
	<h4>넷째는 몇년뒤 가지실 계획이십니까?</h4><input name="edu_4">년뒤
	<h4>다섯째는 몇년뒤 가지실 계획이십니까?</h4><input name="edu_5">년뒤
	<hr>
	<h4>은퇴 계획에 대해 말해주세요.</h4>
	<h4>현재 직장이십니까?</h4>
	<h6>예상퇴직금을 일시금으로 입력해 주십시오.</h6><input name="retire_pay">만원
	<h4>국민연금이 있습니까?</h4>
		<input type="radio" name="retire_pp" value=0>넵
		<input type="radio" name="retire_pp" value=1>아니오.
	<h4>은퇴 예상연도는? <input name="retire_y">년뒤</h4>
	<h4>은퇴 후 희망 월 생활비는? <input name="retire_p">만원</h4>
	<h4>현재 준비된 은퇴자금?(은퇴시 예상 금약으로 입력해 주세요) <input name="retire_a">만원</h4>
	<hr>
	<input type="submit" value="제출"/>
	</form>
	
</body>
</html>