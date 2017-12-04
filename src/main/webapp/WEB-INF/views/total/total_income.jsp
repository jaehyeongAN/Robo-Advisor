<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>finance consulting</title>

<!-- Bootstrap Core CSS -->
<link href="../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="../../resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="resources/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="../../resources/css/creative.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	function empty_check() {
		if (document.getElementById("age").value == "") {
			alert("나이를 입력하세요.");
			return false;
		} else if (document.getElementById("fixedIncome").value == "") {
			alert("고정 수입을 입력하세요.");
			return false;
		} else if (document.getElementById("flucIncome").value == "") {
			alert("변동 수입을 입력하세요.");
			return false;
		}
		return true;

	}
</script>
</head>

<body id="page-top">
	<%@ include file="/resources/include/headerConsume.jsp"%>

	<div align="center">
		<form method="post" action="<%=request.getContextPath()%>/calc1.do"
			onsubmit="return empty_check()">

			<br>
			<fieldset
				style="border: 1px solid black; padding: 40px 20px 20px 20px;">
				<legend style="border : 0px;">
						나의 한 달 수입
				</legend>
				<br>
				<table width="800px">
					<tr align="center">
						<th>나이</th>
						<td><input type="text" id="age" name="age" size="10" value=<%=session.getAttribute("nowAge") %> /> 세</td>
						<th>고정수입</th>
						<td><input type="text" id="fixedIncome" name="fixedIncome"
							size="10"> 만원</td>
						<th>변동수입</th>
						<td><input type="text" id="flucIncome" name="flucIncome"
							size="10"> 만원</td>
					<tr>
						<td colspan="6" align="center"></td>
					</tr>
				</table>
				<br>
			</fieldset>
			<br>
			 <input type="submit" id="resultInput" value="입력" />
			  <input type="reset" id="resultInput" value="취소" onclick="history.back()" />
		</form>
	</div>

</body>

</html>
