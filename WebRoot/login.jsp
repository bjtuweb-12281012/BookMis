<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.presentation.*" %>
<%@ page import="com.bookstore.service.*" %>
<SCRIPT LANGUAGE="javascript">
<!--
function CheckSubmit() 
 { //focus()方法，将光标定位于输出栏目
  if( document.loginform.name.value == "" )
     { alert("请输入用户名!"); document.loginform.name.focus(); return false; }   
  if( document.loginform.password.value == "" )
     { alert("请输入密码!"); document.loginform.password.focus(); return false; } 	 
  if(document.loginform.userid.value.indexOf("'") != -1)
     { alert("用户名不能包含单引号,空格等字符!"); document.loginform.name.focus(); return false; }   	 
  return true;                                                                                          
 } 
</SCRIPT>
<%@ page import="java.util.*,java.sql.*"%>

<%try{
 UserService userservice1 = new UserService();
 User loginuser=userservice1.getUser(session.getAttribute("userid").toString(),session.getAttribute("password").toString());
 String s_userid = loginuser.getUserid();
 %>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f6f6f6" class="td">
  <tr> 
    <td width="8" > <div align="left"></div></td>
    <td width="737" ><%=s_userid%>,您好!<br>
      欢迎来到网上书城...</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>您可以:</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td><a href="passwordedit.jsp">修改登录密码</a></td>
  </tr>
  <tr> 
    <td >&nbsp;</td>
    <td ><a href="userinfoedit.jsp">维护个人信息</a></td>
  </tr>
  <tr> 
    <td >&nbsp;</td>
    <td ><a href="myorder.action?userid=<%=s_userid%>">查看历史订单</a></td>
  </tr>
  <tr> 
    <td >&nbsp;</td>
    <td ><a href="shoppingcart.jsp">查看购书车</a></td>
  </tr>
  <tr> 
    <td >&nbsp;</td>
    <td ><a href="leaveword.action?userid=<%=s_userid%>">给管理员留言</a></td>
  </tr>
  <tr> 
    <td >&nbsp;</td>
    <td ><a href="exit.jsp">注销退出</a></td>
  </tr>
</table>
<%}catch (Exception e){ %>
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">登录</h3>
			</div>
			<div class="panel-body">
				<form name="loginform" action="userlogin.action" method="post" >
					<input name="name" type="text" class="formtext form-control" placeholder="用户名" size="1">
					<input name="password" type="password" class="formtext form-control"placeholder="密码" size="10">
			      	<input name="loginbutton" style="width:100%;"class="btn btn-success btn-sm" type="submit" value=" 登录 " onClick="return CheckSubmit();">
			  		
			      	<a href="register.jsp" class="btn btn-warning btn-sm" role="button">
			        	注册
			        </a>
			  </form>
		  </div>
		</div>
<%}%>

