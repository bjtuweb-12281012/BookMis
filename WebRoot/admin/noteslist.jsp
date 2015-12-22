<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>

<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <td ><div align="center">
   <table width="100%" border="0" cellpadding="1" cellspacing="1" class="td"> 
   <tr>
   <td colspan="9"><div align="right">&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
   </tr>
   <tr>
   <td colspan="9"><hr size="1" noshade width="100%"></td>
   </tr>     
  <tr>
    <td width="10%">留言日期</td>
    <td width="10%">留言人</td>
    <td width="10%">主题</td>	
    <td width="20%">内容</td>
    <td width="10%">处理日期</td>
    <td width="10%">处理人</td>
    <td width="20%">处理意见</td>	
	<td colspan="2"><div align="center">操作</div></td>	
  </tr>
 <%
   //循环显示数据
   List<Notes> noteslist=(List)request.getAttribute("noteslist"); // 取request里面的对象队列
    if(noteslist.size()!=0){
      for(int i=0;i<noteslist.size();i++){ 
      Notes notes =new Notes(); //新建对象
      notes = noteslist.get(i);   //每循环一次后将此时的值保存到对象里
     %>
  <tr>
              <td><%=notes.getDate1()%></td>
              <td><%=notes.getUserid()%></td>
              <td><%=notes.getSubject()%></td>
              <td><%=notes.getContext()%></td>
              <td><%=notes.getDate2()%></td>
              <td><%=notes.getEmployeeid()%></td>
              <td><%=notes.getAdvice()%></td>
			 <td><a href="deleteNotes.action?id=<%=notes.getId()%>" onclick='return confirm("确定要删除吗?")'>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="modifyNotes.action?id=<%=notes.getId()%>">处理</a></td>

  </tr>
 
   <tr>
   <td colspan="9"><div align="center">  

   </div></td>
   </tr>
<%
  		}
    }else{
     %>
   <tr>
   <td colspan="9">没有留言信息.</td>
   </tr>  
   <%
    }
    %>
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