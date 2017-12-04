<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/resources/include/headerConsume.jsp"%>
   <div id="main" class="container_24" align="center">

      <h2>나의 현재 재무상태는?</h2>
      <br>
      <form method="post" action="./anExpv.do">
            <input type="hidden" id="age" name="age" value="${mvo.age}"/>
            <input type="hidden" id="id" name="id" value="<%=session.getAttribute("id")%>"/>
            <input type="hidden" id="fixedIncome" name="fixedIncome" value="${mvo.fixedIncome}"/>
            <input type="hidden" id="flucIncome" name="flucIncome" value="${mvo.flucIncome}"/>
            
            <%-- <input type="text" id="sumIncome" name="sumIncome" value="${mvo.sumIncome}"/> --%>
            <input type="hidden" id="fixedHome" name="fixedHome" value="${mvo.fixedHome}"/>
            <input type="hidden" id="fixedFood" name="fixedFood" value="${mvo.fixedFood}"/>
            <input type="hidden" id="fixedCommunication" name="fixedCommunication" value="${mvo.fixedCommunication}"/>
            <input type="hidden" id="fixedTrans" name="fixedTrans" value="${mvo.fixedTrans}"/>
            <input type="hidden" id="fixedInsurance" name="fixedInsurance" value="${mvo.fixedInsurance}"/>
            <input type="hidden" id="fixedTax" name="fixedTax" value="${mvo.fixedTax}"/>
            
            <input type="hidden" id="fixedExpense" name="fixedExpense" value="${mvo.fixedExpense}"/>
            
            
            <input type="hidden" id="flucLife" name="flucLife" value="${mvo.flucLife}"/>
            <input type="hidden" id="flucBeauty" name="flucBeauty" value="${mvo.flucBeauty}"/>
            <input type="hidden" id="flucLeisure" name="flucLeisure" value="${mvo.flucLeisure}"/>
            <input type="hidden" id="flucMedical" name="flucMedical" value="${mvo.flucMedical}"/>
            <input type="hidden" id="flucEvent" name="flucEvent" value="${mvo.flucEvent}"/>
            <input type="hidden" id="flucEdu" name="flucEdu" value="${mvo.flucEdu}"/>
            <input type="hidden" id="flueEtc" name="flueEtc" value="${mvo.flueEtc}"/>
            
            <input type="hidden" id="flucExpense" name="flucExpense" value="${mvo.flucExpense}"/>
            
            <%-- <input type="hidden" id="sumExpense" name="sumExpense" value="${mvo.sumExpense}"/> --%>
            
         
         <table align="center">
            <tr>
               
               <td width="150"> 나이 : <input type="text" id="age" name="age" value="${mvo.age}" readonly="readonly" size="5px"/>
               <td width="200">총수입: <input type="text" id="sumIncome" name="sumIncome"
                  value="${mvo.fixedIncome+mvo.flucIncome}" readonly="readonly" size="5px" />만원
               </td>
               <td width="150">총지출: <input type="text" id="sumExpense" name="sumExpense"
                  value="${mvo.fixedExpense+mvo.flucExpense}" readonly="readonly" size="5px" />만원
               </td>
                <td width="150">수지차: <input type="text" id="diff" name="diff"
                  value="${mvo.fixedIncome+mvo.flucIncome-mvo.fixedExpense-mvo.flucExpense}"
                  readonly="readonly" size="5px" />만원
               </td>
         

            </tr>
         </table>
            
            <br>
            <br>
         
         <table>
            <tr>
               <td> 주거비용  : </td>
               <td width="120"> <input type="text" id="fixedHome" name="fixedHome"
                   value="${mvo.fixedHome}" readonly="readonly" size="5px"  />만원 </td>
               <td> 생활용품비  : </td>
               <td width="120"> <input type="text" id="flucLife" name="flucLife"
                   value="${mvo.flucLife}" readonly="readonly" size="5px"  />만원 </td>
            </tr>
            
            <tr>
               <td> 식비  : </td>
               <td>  <input type="text" id="fixedFood" name="fixedFood"
                   value="${mvo.fixedFood}" readonly="readonly" size="5px"  />만원 </td>
               <td> 의류미용비  : </td>
               <td>  <input type="text" id="flucBeauty" name="flucBeauty"
                   value="${mvo.flucBeauty}" readonly="readonly" size="5px"  />만원 </td>
            </tr>
            
            <tr>
               <td> 통신비  : </td>
               <td> <input type="text" id="fixedCommunication" name="fixedCommunication"
                   value="${mvo.fixedCommunication}" readonly="readonly" size="5px"  />만원 </td>
               <td> 문화레저비  : </td>
               <td>  <input type="text" id="flucLeisure" name="flucLeisure"
                   value="${mvo.flucBeauty}" readonly="readonly" size="5px"  />만원 </td>
            </tr>
            
            <tr>
               <td> 교통비  : </td>
               <td> <input type="text" id="fixedTrans" name="fixedTrans"
                   value="${mvo.fixedTrans}" readonly="readonly" size="5px"  />만원 </td>
               <td> 의료비  : </td>
               <td>  <input type="text" id="flucMedical" name="flucMedical"
                   value="${mvo.flucMedical}" readonly="readonly" size="5px"  />만원 </td>
            </tr>
            
            <tr>
               <td> 보험료  : </td>
               <td>  <input type="text" id="fixedInsurance" name="fixedInsurance"
                   value="${mvo.fixedInsurance}" readonly="readonly" size="5px"  />만원 </td>
               <td> 경조사비  : </td>
               <td>  <input type="text" id="flucEvent" name="flucEvent"
                   value="${mvo.flucEvent}" readonly="readonly" size="5px"  />만원 </td>
            </tr>   
               
            <tr>
               <td> 세금  : </td>
               <td>  <input type="text" id="fixedTax" name="fixedTax"
                   value="${mvo.fixedTax}" readonly="readonly" size="5px"  />만원 </td>
               <td> 교육비  : </td>
               <td> <input type="text" id="flucEdu" name="flucEdu"
                   value="${mvo.flucEdu}" readonly="readonly" size="5px"  />만원 </td>
            </tr>
            
            <tr>
               
               <td></td>
               <td></td>
               <td> 기타비용  : </td>
               <td> <input type="text" id="flueEtc" name="flueEtc"
                   value="${mvo.flueEtc}" readonly="readonly" size="5px"  />만원 </td>
            </tr>
            
            
            <tr>
               <td colspan="4" align="center" style="padding-top: 20px;">
                  <input type="submit" id="resultInput"  value="Excel 저장 및 전송" /></td>
               <td>
            </tr>
         </table>
      </form>
      <div id="piechart_3d" style="width: 920px; height: 500px;"></div>
      <div class="main" style="margin: 30px 0; text-align: center;">
         더 자세한 진단은 <a href="./index.jsp" onclick="alert('로그인 후 이용해주세요.');"
            style="color: #43aebf;">다음의 링크</a>를 클릭하세요.
      </div>
      <p>&nbsp;</p>
   </div>

</body>
</html>