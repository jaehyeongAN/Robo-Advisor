<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/resources/include/header5.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<style type="text/css">

body { 
	margin-left: auto; 
	margin-right: auto;

}
.center-box {
	margin-left: auto; 
	margin-right: auto;
	position: relative;
	top: 20px;
	width: 50%;
}
input{
	margin-left: auto; 
	margin-right: auto;
	margin : 5px 5px 5px 60px;
}
th{
	padding-left: 70px;
}
.bottom{
	margin : 10px auto;
}
font {
	color: #F05F40;
	font-size: 25px;
}
</style>



</head>
<body>
	<div class="center-box">
	<form method="post" action="join_ok.do" onsubmit="return check()">
		<table align="center">
			<tr>
				<th>아이디</th>
				<td><input type="text" id="id" name="id"></td>
				<!-- <td><input type="button" id="resultInput" value="중복확인" onclick="return ajaxSend()"> </td> -->
				
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pwd" name="pwd"></td>
				
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="pwd2" name="pwd2"></td>
				
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="name" name="name"></td>
			
			</tr>
			<tr>
				<th>성별</th>
				<td> <!-- 남 : 1, 여 : 2 -->
					<input type="radio" name="gender" value="1" checked="checked"> 남
					<input type="radio" name="gender" value="2"> 여
				</td>
			
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="address" name="address"></td>
				
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" id="birthDate" name="birthDate"></td>
				
			</tr>
			<tr>	
				<td></td>
				<td colspan="2"><h7>(예) 1989년1월1일 -> 890101로 입력</h7></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><input type="text" id="phone" name="phone"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2"><h7>번호만 입력 (-,/ 등 입력불가)</h7></td>
			</tr>
			<tr>
				<th>결혼여부</th>
				<td> <!-- 기혼 : 1 미혼 : 2 -->
					<input type="radio" name="marriageCheck" value="1" checked="checked"> 기혼
					<input type="radio" name="marriageCheck" value="2"> 미혼
				</td>
			</tr>
			<tr>
				<th>수입</th>
				<td><input type="text" id="income" name="income"></td>
				<td>(만원)</td>
			</tr>
			<tr>
				<th>지출</th>
				<td><input type="text" id="pay" name="pay"></td>
				<td>(만원)</td>
			</tr>
			<tr>
				<th>투자성향</th>
				<td> <!-- 위험 : 3 중간 : 2 안전: 1 -->
					<input type="radio" name="myStyle" value="3"> 위험
					<input type="radio" name="myStyle" value="2" checked="checked"> 중간
					<input type="radio" name="myStyle" value="1"> 안전
				</td>
			</tr>
			<tr><td style="height: 20px"></td></tr>
			<tr align="center">
				<td colspan="3" align="center"> 
				<div align="center">
					<input type="submit" id="input2" class="bottom" value="회원가입" align="center">
					<input type="reset" id="input2" class="bottom" value="취소" onclick="cancel_ok" align="center"></div>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>