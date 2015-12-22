<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.*,java.sql.*"%>
<SCRIPT LANGUAGE="javascript">
<!--
function CheckSubmit()
 {
  if( document.loginform.employeeid.value == "" )
     { alert("请输入用户名!"); document.loginform.employeeid.focus(); return false; }   
  if( document.loginform.password.value == "" )
     { alert("请输入密码!"); document.loginform.password.focus(); return false; } 	 
  if(document.loginform.employeeid.value.indexOf("'") != -1||document.loginform.employeeid.value.indexOf(" ") != -1)
     { alert("用户名不能包含单引号,空格等字符!"); document.loginform.employeeid.focus(); return false; }   	 
  return true;                                                                                          
 } 
</SCRIPT>
<div align="center">
  <table width="20%" border="0" cellpadding="0" cellspacing="0" class="td">
	  <form name="loginform" action="login.action" method="post">
	    <tr> 
	      <td colspan="2"><img src="../images/adin_r1.jpg"></td>
	    </tr>
	    <tr> 
	      <td width="25%">用户名</td>
	      <td><input name="name" type="text"  size="15"></td>
	    </tr>
	    <tr> 
	      <td>密码</td>
	      <td><input name="password" type="password"  size="15" ></td>
	    </tr>
	    <tr> 
	      <td colspan="2"><div align="center">
	          <input name="submit" type="submit"  onClick="return CheckSubmit();" value=" 登录 ">
	        </div></td>
	    </tr>
		</form>
  </table>
</div>
</html>