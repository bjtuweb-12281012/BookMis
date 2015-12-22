<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>


<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="/admin/top.jsp" %></div></td>
  </tr>
  <tr> 
    <td ><div align="center">
   <table width="100%" border="0" cellpadding="1" cellspacing="1" class="td"> 
   <tr>
   <td colspan="9"><div align="right"><a href="admin/userinfoadd.jsp">新建</a>&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
   </tr>
   <tr>
   <td colspan="9"><hr size="1" noshade width="100%"></td>
   </tr>     
  <tr>
    <td>用户名</td>
    <td>姓名</td>
    <td>性别</td>	
    <td>联系地址</td>
    <td>E-mail </td>
    <td>电话</td>
    <td>邮编</td>
    <td>状态</td>	
	<td>操作</td>	
  </tr>
  <%
   //循环显示数据
   List<User> userlist=(List)request.getAttribute("userlist"); // 取request里面的对象队列
    if(userlist.size()!=0){
      for(int i=0;i<userlist.size();i++){ 
      User user =new User(); //新建对象
      user = userlist.get(i);   //每循环一次后将此时的值保存到对象里
     %>
  <tr>
              <td><%=user.getUserid()%></a></td>
              <td><%=user.getUsername()%></td>
              <td><%=user.getGender()%></td>
              <td><%=user.getAddress()%></td>
              <td><%=user.getEmail()%></td>
              <td><%=user.getPhone()%></td>
              <td><%=user.getPostcode()%></td>
			  <td><%=user.getState()%></td>
			  <td><a href="deleteUser.action?id=<%=user.getUserid()%>" onclick='return confirm("确定要删除吗?")'>删除</a></td>

  </tr>
  <%
  		}
    }else{
     %>
<tr><td colspan="6">数据库中没有数据！</td></tr>
    <%
    }
    %>
   <tr>
   <td colspan="9"><div align="center">
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