<%@ page contentType="text/html; charset=GB2312" errorPage="error.jsp" pageEncoding="UTF-8"%>
<SCRIPT LANGUAGE="javascript">
<!--
function CheckSubmit()
 {
  if( document.registerform.userid.value == "" )
     { alert("请输入用户名!"); document.registerform.userid.focus(); return false; } 
  if( document.registerform.password.value == "" )
     { alert("请输入密码!"); document.registerform.password.focus(); return false; } 	 
  if( document.registerform.password2.value == "" )
     { alert("请验证密码!"); document.registerform.password2.focus(); return false; } 
  if( document.registerform.password2.value != document.registerform.password.value  )
     { alert("密码验证出错!"); document.registerform.password.focus(); return false; }
  if( document.registerform.username.value == "" )
     { alert("请输入真实姓名!"); document.registerform.username.focus(); return false; }	 
  if( document.registerform.address.value == "" )
     { alert("请输入住址!"); document.registerform.address.focus(); return false; }	
  if( document.registerform.postcode.value == "" )
     { alert("请输入邮编!"); document.registerform.postcode.focus(); return false; }	
  if( document.registerform.phone.value == "" )
     { alert("请输入联系电话!"); document.registerform.phone.focus(); return false; }	 		 
  return true;                                                                                          
 } 
</SCRIPT>
<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <td ><div align="center">
  <table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
<form name="registerform" action="addUser" method="post">
    <tr> 
      <td colspan="2">&nbsp;&nbsp;以下资料请如实填写，以保证正确发货。这些资料未经客户允许将只用于处理客户的订货信息，对外严格保密。（带 
       <font color="red">*</font>号的为必填项，其它的可以不填）</font></td>
    </tr>
    <tr> 
      <td width="15%"><div align="right">用户名</div></td>
      <td><div align="left"><input name="userid" type="text" size="20"><font color="red">*</font>(为避免使用相同的用户名,请<a href="#">检测</a>你的用户名是否有效)</div></td>
    </tr>
    <tr> 
      <td><div align="right">密码</div></td>
      <td><div align="left"><input name="password" type="password" size="20"><font color="red">*</font></div></td>
    </tr>
    <tr> 
      <td><div align="right">验证密码</div></td>
      <td><div align="left"><input name="password2" type="password" size="20"><font color="red">*</font></div></td>
    </tr>
    <tr> 
      <td><div align="right">真实姓名</div></td>
      <td><div align="left"><input name="username" type="text" size="20"><font color="red">*</font></div></td>
    </tr>
    <tr> 
      <td><div align="right">性别</div></td>
      <td><div align="left">
         <select name="gender">
	   <option value="男">男</option>
	   <option value="女">女</option>
	 </select>
	  </div></td>
    </tr>		  
    <tr> 
      <td><div align="right">住址</div></td>
      <td><div align="left"><input name="address" type="text" size="20"><font color="red">*</font>(请您提供尽可能详细的地址)</div></td>
    </tr>
    <tr> 
      <td><div align="right">邮编</div></td>
      <td><div align="left"><input name="postcode" type="text" size="20"><font color="red">*</font></div></td>
    </tr>		  
    <tr> 
      <td><div align="right">联系电话</div></td>
      <td><div align="left"><input name="phone" type="text" size="20"><font color="red">*</font></div></td>
    </tr>
    <tr> 
      <td><div align="right">E-mail</div></td>
      <td><div align="left"><input name="email" type="text" size="20"></div></td>
    </tr>
    <tr> 
      <td><div align="right">&nbsp;</div></td>
      <td><div align="left"> 
        <input name="submit" type="submit" value=" 注册新用户 " onClick="return CheckSubmit();">&nbsp;&nbsp;
        <input name="reset" type="reset" value=" 重新填写 ">
         </div></td>
    </tr>		  
</form>	  		  
  </table>
   </div> 
    </td>
  </tr> 
  <tr> 
    <td ><div align="center"><%@include file="../bottom.jsp" %></div></td>
  </tr>
</table>
</div>  