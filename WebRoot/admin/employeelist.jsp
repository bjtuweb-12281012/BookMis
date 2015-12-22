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
   <td colspan="8"><div align="right"><a href="admin/employeeadd.jsp">新建</a>&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
   </tr>
   <tr>
   <td colspan="8"><hr size="1" noshade width="100%"></td>
   </tr>    
  <tr>
    <td>职工帐号</td>
    <td>姓名</td>
    <td>性别</td>	
    <td>联系地址</td>
    <td>E-mail </td>
    <td>电话</td>
    <td>工作任务</td>	
	<td>操作</td>	
  </tr>
  <%
   //循环显示数据
   List<Employee> employeelist=(List)request.getAttribute("employeelist"); // 取request里面的对象队列
    if(employeelist.size()!=0){
      for(int i=0;i<employeelist.size();i++){ 
      Employee employee =new Employee(); //新建对象
      employee = employeelist.get(i);   //每循环一次后将此时的值保存到对象里
     %>
  <tr>
              <td><%=employee.getEmployeeid()%></a></td>
              <td><%=employee.getName()%></td>
              <td><%=employee.getGender()%></td>
              <td><%=employee.getAddress()%></td>
              <td><%=employee.getEmail()%></td>
              <td><%=employee.getPhone()%></td>
              <td><%=employee.getTask()%></td>
			  <td><a href="deleteEmployee.action?id=<%=employee.getEmployeeid()%>" onclick='return confirm("确定要删除吗?")'>删除</a></td>

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