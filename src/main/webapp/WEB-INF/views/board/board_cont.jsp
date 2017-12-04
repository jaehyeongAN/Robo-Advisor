<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="spring.project.dao.BoardDao" %>
<%@ page import="spring.project.vo.BoardVO" %>
<%@ page import="java.util.*" %>
<!-- 외부 패키지 임포트 -->
<head>

<!-- <link rel="stylesheet" type="text/css" href="/resources/css/main.css" /> -->

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

</head>

 <%
 	// getAttribute()메소드로 board 키 값을 받는다.
 	// 리턴 타입이 Object 형이기 때문에 BoardVO 타입으로 다운캐스팅한다.
 	BoardVO vo = (BoardVO)request.getAttribute("vo");
 %>

<body id="page-top">
	<%@ include file="/resources/include/headerBoard.jsp"%>

 
 <table class="board_t" align="center">
    <tr>
       <th> 작성자 </th>
       <td> <%=vo.getBoard_name() %></td>
    </tr>

    <tr>
       <th> 제목 </th>
       <td><%=vo.getBoard_title() %> </td>    
    </tr>
    <tr>
       <th> 글내용 </th>
       <td> <%=vo.getBoard_cont() %> 
    </tr>    
 </table>
 	<br><br>
	<div id="boardcont_menu">
		<input type="button" value="수정" id="resultInput" class="input_b" 
			onclick="location='board_edit.do?board_no=<%=vo.getBoard_no()%>'" />
		<input type="button" value="삭제" id="resultInput" class="input_b" 
			onclick="location='board_delete.do?board_no=<%=vo.getBoard_no()%>'" />
		<input type="button" value="목록" id="resultInput" class="input_b"
			onclick="location='board_list.do'"/>
	</div> 

<div class="clear"></div>

</body>



