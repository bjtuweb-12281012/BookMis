<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link href="maincss.css" rel="stylesheet" type="text/css">


<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <td ><div align="center">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="td">
  <tr>
              <td>出错了!</td>
  </tr>
  <tr>
              <td><hr size="1" noshade width="100%"></td>
  </tr>  
  <tr>
              <td>对不起,你还没有登录,不能查看当前页面!请回到<a href="index.jsp">首页登录</a>/<a href="register.jsp">注册</a>.</td>
  </tr>
</table>

	
	</div></td>
  </tr>  
  <tr> 
    <td ><div align="center">
          <%@include file="bottom.jsp" %>
        </div></td>
  </tr>
</table>
</div>   