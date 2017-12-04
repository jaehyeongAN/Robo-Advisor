<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="spring.project.vo.BoardVO" %>
<%@ page import="spring.project.vo.MemberVO" %>
<%@ page import="java.util.*" %>
<!--  컬렉션 클래스를 사용하기 위해서 임포트 시킴 -->

<head>
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
 function board_check(){
		if($.trim($("#board_name").val())==""){
			alert("글쓴이를 입력하세요.");
			$("#board_name").val("").focus();
			return false;
		}
		if($.trim($("#board_title").val())==""){
			alert("글 제목을 입력하세요.");
			$("#board_title").val("").focus();
			return false;
		}
		if($.trim($("#board_cont").val())==""){
			alert("글 내용을 입력하세요.");
			$("#board_cont").val("").focus();
			return false;
		}
		if($.trim($("#board_pwd").val())==""){
			alert("비밀번호를 입력하세요.");
			$("#board_pwd").val("").focus();
			return false;
		}
		
	}
 
 </script>

</head>
  
<body>
<%@ include file="/resources/include/headerBoard.jsp"%> 
       
<div id="boardwrite_wrap">
<h2 class="boardwrite_title">게시물 글쓰기</h2>
<form method="post" action="board_write_ok.do"
      onsubmit="return board_check()">
 <table class="board_t" align="center">
    <tr>
      <th> 글쓴이 </th>
      <td>
        <input name="board_name" id="board_name" 
        class="input_box" size="14"/></td>
    </tr>   
    <tr>
      <th> 제목 </th>
      <td>
        <input name="board_title" id="board_title"
        class="input_box" size="30"/></td>
    </tr>
    <tr>
      <th> 글내용 </th>
      <td> <textarea name="board_cont" id="board_cont"
           rows="8" cols="40"></textarea> </td>
       <!-- textarea 태그는 2줄 이상의 문단을 입력할 수 있는 텍스트 필드 양식 -->
    </tr>
    <tr>
      <th> 비밀번호</th>
      <td> <input type="password" name="board_pwd" 
           id="board_pwd" class="input_box" size="14"/> 
      </td>
    </tr>
 </table>
 	<br>
   <input type="submit" value="입력" id="resultInput" class="boardwrite_b"/>
   <input type="reset" value="취소" id="resultInput" onclick="history.back()"/>
   <!--  입력 내용을 초기화 하면서 글쓴이 입력창으로 포커스를 이동시킨다. -->
</form>
</div>

<div class="clear"></div>

</body>


