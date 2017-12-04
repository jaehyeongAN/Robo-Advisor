<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spring.project.vo.RetireVO" %>    
<%@ page import="spring.project.vo.HouseVO" %>
<%@ page import="spring.project.vo.SFVO" %>
<%@ page import="spring.project.vo.MoneyVO" %>
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
	List<SFVO> svo = (List<SFVO>)request.getAttribute("svo");
%>

</head>
<body>

<%@ include file="/resources/include/headerResult.jsp"%>

	<table class="board_t" align="center">

		<tr>
			<th> 번호</th>
			<th>재무설계 코드</th>
			<th>재무설계 날짜</th>
		</tr>
		
		<%
        if((svo != null) && (svo.size()>0 )){
        	// 게시판의 목록이 1개 이상 존재하는 경우 조건은 참이 된다.
        	for(int i=0; i<svo.size(); i++){
        		SFVO vo = svo.get(i);
        		// 컬렉션 요소값을 BoardBean 타입으로 가져온다.
     	%>
		
		

		
		<tr>
		
			<td>
			<%=i+1 %>
			</td>
		
		
			<td>
			<a href="<%=request.getContextPath() %>/total_resultt.do?id=${vo.id}"
			onfocus="this.blur()"> <%=vo.getCode() %> </a>
			<%
			System.out.println("asdf");
			%>
        	</td>
			
			
			
			<%
        	if(vo.getR_date().equals("")) {
     		%>
			<td colspan="4">결과가 없습니다.</td>
			<%
        	}else{
          	%>
			<td> <%=vo.getR_date() %> </td>
		<% } %>
		<% } %>
		<% } %>

			
		</tr>

		
	</table>
	<br>
	<div align="center">
	<input type="button" id="resultInput" value="이전" onclick="history.back()" />
	<br><br>
	</div>	
</body>
</html>