<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<SCRIPT LANGUAGE="javascript">
<!--
function CheckSubmit()
 {
  if( document.passwordform.password.value == "" )
     { alert("请输入新密码!"); document.passwordform.password.focus(); return false; } 	 
  if( document.passwordform.password2.value == "" )
     { alert("请验证新密码!"); document.passwordform.password2.focus(); return false; } 
  if( document.passwordform.password2.value != document.passwordform.password.value  )
     { alert("新密码验证出错!"); document.passwordform.password.focus(); return false; }		 
  return true;                                                                                          
 } 
</SCRIPT>
<%
UserService userservice1 = new UserService();
User edituser=userservice1.getUser(session.getAttribute("userid").toString(),session.getAttribute("password").toString());
String s_userid = edituser.getUserid();
String s_password = edituser.getPassword();
%>


<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <td ><div align="center">
<table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
<%
%>
<form name="passwordform" action="passwordedit.action?userid=<%=s_userid%>" method="post">

          <tr> 
            <td width="15%"><div align="right">用户名</div></td>
            <td><div align="left"><%=s_userid%></div></td>
          </tr>
          <tr> 
            <td><div align="right">新密码</div></td>
            <td><div align="left"><input name="password" type="password" size="20"><font color="red">*</font></div></td>
          </tr>
          <tr> 
            <td><div align="right">验证新密码</div></td>
            <td><div align="left"><input name="password2" type="password" size="20"><font color="red">*</font></div></td>
          </tr>

          <tr> 
            <td><div align="right">&nbsp;</div></td>
            <td><div align="left"> 
                <input name="submit" type="submit" value=" 修改密码 " onClick="return CheckSubmit();">&nbsp;&nbsp;
                <input name="reset" type="reset" value=" 重新填写 ">
              </div></td>
          </tr>		  
</form>  
        </table>

	</div> 
	</td>
  </tr> 
  <tr> 
    <td ><div align="center"><%@include file="bottom.jsp" %></div></td>
  </tr>
</table>
</div>  