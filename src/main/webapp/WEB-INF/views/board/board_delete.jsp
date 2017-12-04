<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="spring.project.vo.BoardVO"%>

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

<script>
	function del_check() {
		// del_pwd 값이 공백인 경우
 		if (document.getElementById("del_pwd").value == "") {
			alert('삭제 비번을 입력하세요');
			
			return false;
		} 
	}
</script>

</head>

<body id="page-top">
	<%@ include file="/resources/include/headerBoard.jsp"%>


<div class="board_t">

		<%
			// 컨트롤러에서 넘긴 키값을 받는다.
			BoardVO vo = (BoardVO) request.getAttribute("vo");
		%>

		<h2 class="boardDel_title"></h2>
		<form method="post" action="board_delete_ok.do" onsubmit="return del_check()">
			<!-- 게시물 번호와 DB 비번을 히든으로 넘김 -->
			<input type="hidden" name="board_no" value="${vo.board_no}" />
			 <input type="hidden" name="board_pwd" value="${vo.board_pwd}" />


			<table class="board_t" align="center">
				<tr>
					<th> 비밀번호 : </th>
					<td><input type="password" name="del_pwd" id="del_pwd"
						size="14" class="input_box" /></td>
				</tr>
			</table>
			<br>
			<div id="boardDel_menu">
				<input type="submit" value="삭제" id="resultInput" />
				<input type="button" value="취소" id="resultInput" onclick="history.back()" />
			</div>
		</form>
</div>


</body>




