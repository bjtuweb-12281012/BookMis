<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.service.*" %>

<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
  <%Notes notes=(Notes)request.getAttribute("notes"); %>
    <td ><div align="center">
	      <table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
		  <form name="form" action="updateNotes.action" method="post" >
            <tr> 
              <td width="20%">留言日期</td>
              <td><%=notes.getDate1()%><input name="id" type="hidden"  value="<%=notes.getId()%>">
              <input name="date1" type="hidden"  value="<%=notes.getDate1()%>">
              <input name="date2" type="hidden"  value="<%=notes.getDate2()%>">
              <input name="employeeid" type="hidden"  value="<%=notes.getEmployeeid()%>"></td>
            </tr>
            <tr> 
              <td width="20%">用户名</td>
              <td><%=notes.getUserid()%><input name="userid" type="hidden"  value="<%=notes.getUserid()%>"></td>
            </tr>
            <tr> 
              <td>主题</td>
              <td><%=notes.getSubject()%><input name="subject" type="hidden"  value="<%=notes.getSubject()%>"></td>
            </tr>
            <tr> 
              <td>内容</td>
              <td><%=notes.getContext()%><input name="context" type="hidden"  value="<%=notes.getContext()%>"></td>
            </tr>			
            <tr> 
              <td>处理意见</td>
              <td><textarea name="advice" cols="70" rows="10"><%=notes.getAdvice()%></textarea></td>
            </tr>

            <tr> 
              <td colspan="2"><div align="center">
                  <input type="submit" value=" 修改 ">&nbsp;&nbsp;&nbsp;&nbsp;
				  <input type="reset" value=" 重置 ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div></td>
            </tr>
			</form>
          </table>

	</div></td>
  </tr>  
  <tr> 
    <td ><div align="center">
          <%@include file="../bottom.jsp" %>
        </div></td>
  </tr>
</table>
</div> 