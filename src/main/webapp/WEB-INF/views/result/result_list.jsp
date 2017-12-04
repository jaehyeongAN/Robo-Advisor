<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spring.project.vo.RetireVO" %>    
<%@ page import="spring.project.vo.HouseVO" %>
<%@ page import="spring.project.vo.SFVO" %>
<%@ page import="spring.project.vo.MoneyVO" %>
<%@ page import="spring.project.vo.MemberVO" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 결과창 </title>

<style type="text/css">
table.board_t {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    align : center;

}
table.board_t thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.board_t tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.board_t td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

</style>
<%
	RetireVO rvo = (RetireVO)request.getAttribute("rvo");
	HouseVO hvo = (HouseVO)request.getAttribute("hvo");
	MoneyVO mvo = (MoneyVO)request.getAttribute("mvo");
	SFVO svo = (SFVO)request.getAttribute("vo");
	
%>

</head>
<body>

<%@ include file="/resources/include/headerResult.jsp"%>

	<table class="board_t" align="center">

		<tr>
			<th></th>
			<th>종합재무</th>
			<th>주거</th>
			<th>은퇴</th>
		</tr>


		<br>
		<tr>
			<td align="center">등록 날짜</td>
			
			
			<%
        	if(mvo.getReg_date().equals("")) {
     		%>
			<td colspan="4">결과가 없습니다.</td>
			<%
        	}else{
          	%>
			<td><a href="<%=request.getContextPath() %>/dispResult.do?id=${mvo.id} "
				onfocus="this.blur()"> ${mvo.reg_date}</a></td>
			<% } %>
			
			
			<%-- <%
        	if(svo.getR_date().equals("")) {
     		%>
			<td colspan="4">결과가 없습니다.</td>
			<%
        	}else{
          	%>
			<td><a href="<%=request.getContextPath() %>/totalResult.do?id=${svo.id} "
				onfocus="this.blur()"> ${svo.r_date}</a></td>
			<% } %> --%>
			
			
			
			
			
			<%
        	if(hvo.getRegdate().equals("")) {
     		%>
			<td colspan="4">결과가 없습니다.</td>
			<%
        	}else{
          	%>
			<td><a href="<%=request.getContextPath() %>/houseResult.do?id=${hvo.id} "
				onfocus="this.blur()"> ${hvo.regdate}</a></td>
			<% } %>
			
			
			
			<%
        	if(rvo.getRegDate().equals("")) {
     		%>
			<td colspan="4">결과가 없습니다.</td>
			<%
        	}else{
          	%>
			<td><a href="<%=request.getContextPath() %>/retireResult.do?id=${rvo.id} "
				onfocus="this.blur()"> ${rvo.regDate}</a></td>
			<% } %>
			
		</tr> 
	</table>
	<br>
	<div align="center">
		<input type="button" id="resultInput" value="이전" onclick="history.back()" />
	</div>
	
		
</body>
</html>