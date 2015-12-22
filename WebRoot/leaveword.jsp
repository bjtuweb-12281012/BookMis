<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.presentation.*" %>
<SCRIPT LANGUAGE="javascript">
<!--
function CheckSubmit()
 {
  if( document.form.subject.value == "" )
     { alert("请输入主题!"); document.form.subject.focus(); return false; } 
  if( document.form.context.value == "" )
     { alert("请输入内容!"); document.form.context.focus(); return false; } 	 	 
  if( document.form.context.value.length >=100 )
     { alert("留言内容不能大于100字!"); document.form.context.focus(); return false; } 		 
  return true;                                                                                          
 } 
</SCRIPT>
<%@include file="top.jsp" %>
<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center">
      <table width="100%" border="0" cellpadding="1" cellspacing="1" class="td">
        <tr> 
          <td colspan="6">读者留言</td>
        </tr>
        <tr> 
          <td colspan="6"><hr size="1" noshade width="100%"></td>
        </tr>
			 </div></td>
        </tr>
        <tr> 
          <td colspan="6">&nbsp;</td>
        </tr>						
	<tr>
	  <td width="10%">留言日期</td>
	  <td width="10%">留言人</td>
	  <td width="15%">主题</td>			
	  <td width="25%">内容</td>
	  <td width="10%">处理日期</td>
	  <td width="30%">处理意见</td>
	</tr>
<%
   //循环显示数据
try{   
String s_userid=session.getAttribute("userid").toString();
   List<Notes> noteslist=(List)request.getAttribute("noteslist"); // 取request里面的对象队列
   String s_createid="";
  String s_subject="";
  String s_date1="";
  String s_context="";
  String s_employeeid="";
  String s_date2="";
  String s_advice="";
    if(noteslist.size()!=0){
      for(int i=0;i<noteslist.size();i++){ 
      Notes notes =new Notes(); //新建对象
      notes = noteslist.get(i);   //每循环一次后将此时的值保存到对象里

      s_createid=(notes.getUserid()!=null?notes.getUserid():"");
      s_subject=(notes.getSubject()!=null?notes.getSubject():"");
      s_date1=(notes.getDate1()!=null?notes.getDate1().substring(0,10):"");
      s_context=(notes.getContext()!=null?notes.getContext():""); 
      s_employeeid=(notes.getEmployeeid()!=null?notes.getEmployeeid():""); 
      s_date2=(notes.getDate2()!=null?notes.getDate2().substring(0,10):"");
      s_advice=(notes.getAdvice()!=null?notes.getAdvice():"[请等待工作人员处理]");
%>				
        <tr>
	  <td ><%=s_date1%></td>
	  <td ><%=s_createid%></td>
	  <td ><%=s_subject%></td>			
	  <td ><%=s_context%></td>
	  <td ><%=s_date2%></td>
	  <td ><%=s_advice%></td>
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
	
<form name="form" action="addNotes.action?userid=<%=s_userid%>" method="post">
        <tr> 
          <td width="9%" >主题</td>
          <td colspan="5"><input name="subject" type="text" size="25"></td>
        </tr>								
        <tr> 
          <td width="9%" >留言</td>
          <td colspan="5"><textarea name="context" cols="70" rows="10"></textarea></td>
        </tr>
        <tr> 
          <td colspan="6"><div align="center"><input name="userid" type="hidden" value="<%=s_userid%>">
            <input name="submit" type="submit" value=" 留言 " onClick="return CheckSubmit();">
              </div></td>
        </tr>
</form>
<%}catch (Exception e){%>
        <tr> 
          <td colspan="6">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="6">您还没有登录,登录用户可以发表留言!</td>
        </tr>
<%}%>						
      </table></div></td>
  </tr>  
  <tr> 
    <td ><div align="center"><%@include file="bottom.jsp" %></div></td>
  </tr>
</table>
</div>   