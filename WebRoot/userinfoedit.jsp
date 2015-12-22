<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<SCRIPT LANGUAGE="javascript">
<!--
function CheckSubmit()
 {
  if( document.editform.username.value == "" )
     { alert("请输入真实姓名!"); document.editform.username.focus(); return false; }	 
  if( document.editform.address.value == "" )
     { alert("请输入住址!"); document.editform.address.focus(); return false; }	
  if( document.editform.postcode.value == "" )
     { alert("请输入邮编!"); document.editform.postcode.focus(); return false; }	
  if( document.editform.phone.value == "" )
     { alert("请输入联系电话!"); document.editform.phone.focus(); return false; }	 		 
  return true;                                                                                          
 } 
</SCRIPT>
<%

UserService userservice1 = new UserService();
User edituser=userservice1.getUser(session.getAttribute("userid").toString(),session.getAttribute("password").toString());
String s_userid = edituser.getUserid();
String s_password = edituser.getPassword();
String s_username=edituser.getUsername();
String s_gender=edituser.getGender();
String s_address=edituser.getAddress();
String s_phone=edituser.getPhone();
String s_postcode=edituser.getPostcode();
String s_email=edituser.getEmail();
%>
<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <td ><div align="center">
<table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">

<form name="editform" action="userinfoedit.action?password=<%=s_password %>&userid=<%=s_userid%>" method="post">
          <tr> 
            <td colspan="2">&nbsp;&nbsp;以下资料请如实填写，以保证正确发货。这些资料未经客户允许将只用于处理客户的订货信息，对外严格保密。（带 
              <font color="red">*</font>号的为必填项，其它的可以不填）</font></td>
          </tr>
          <tr> 
            <td width="15%"><div align="right">用户名</div></td>
            <td><div align="left"><%=s_userid%></div></td>
          </tr>
          <tr> 
            <td><div align="right">真实姓名</div></td>
            <td><div align="left"><input name="username" type="text" size="20" value="<%=s_username%>"><font color="red">*</font></div></td>
          </tr>
          <tr> 
            <td><div align="right">性别</div></td>
            <td><div align="left">
			<select name="gender">
			<option value="男" <%=(s_gender.equals("男")?" selected ":"")%>>男</option>
			<option value="女" <%=(s_gender.equals("女")?" selected ":"")%>>女</option>
			</select>
			</div></td>
          </tr>		  
          <tr> 
            <td><div align="right">住址</div></td>
            <td><div align="left"><input name="address" type="text" size="20" value="<%=s_address%>">
                    <font color="red">*</font>（请您提供尽可能详细的地址）</div></td>
          </tr>
          <tr> 
            <td><div align="right">邮编</div></td>
            <td><div align="left"><input name="postcode" type="text" size="20" value="<%=s_postcode%>"><font color="red">*</font></div></td>
          </tr>		  
          <tr> 
            <td><div align="right">联系电话</div></td>
            <td><div align="left"><input name="phone" type="text" size="20" value="<%=s_phone%>"><font color="red">*</font></div></td>
          </tr>
          <tr> 
            <td><div align="right">E-mail</div></td>
            <td><div align="left"><input name="email" type="text" size="20" value="<%=s_email%>"></div></td>
          </tr>
          <tr> 
            <td><div align="right">&nbsp;</div></td>
            <td><div align="left"> 
                <input name="submit" type="submit" value=" 修改个人信息 " onClick="return CheckSubmit();">&nbsp;&nbsp;
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