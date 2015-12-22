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
   <td colspan="7"><div align="right"><a href="admin/publisheradd.jsp">新建</a>&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
   </tr>
   <tr>
   <td colspan="7"><hr size="1" noshade width="100%"></td>
   </tr>  
  
  <tr>
    <td>出版社名</td>
    <td>联系人</td>	
    <td>联系地址</td>
    <td>E-mail </td>
    <td>电话</td>
    <td>网址</td>	
	<td>操作</td>	
  </tr>
 <%
   //循环显示数据
   List<Publisher> publisherlist=(List)request.getAttribute("publisherlist"); // 取request里面的对象队列
    if(publisherlist.size()!=0){
      for(int i=0;i<publisherlist.size();i++){ 
      Publisher publisher =new Publisher(); //新建对象
      publisher = publisherlist.get(i);   //每循环一次后将此时的值保存到对象里
     %>
  <tr>
              <td><%=publisher.getName()%></td>
              <td><%=publisher.getLinkname()%></td>
              <td><%=publisher.getAddress()%></td>
              <td><%=publisher.getEmail()%></td>
              <td><%=publisher.getPhone()%></td>
			  <td><%=publisher.getWebsite()%></td>
			  <td><a href="deletePublisher.action?id=<%=publisher.getPublisherid()%>" onclick='return confirm("确定要删除吗?")'>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="modifyPublisher.action?id=<%=publisher.getPublisherid()%>">编辑</a></td>

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
   <td colspan="7"><div align="center">

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