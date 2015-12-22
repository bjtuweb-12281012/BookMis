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
   <td colspan="9"><div align="right"><a href="admin/bookadd.jsp">新建</a>&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
   </tr>
   <tr>
   <td colspan="9"><hr size="1" noshade width="100%"></td>
   </tr>    
  <tr>
    <td>书号</td>
    <td>书名</td>
    <td>作者</td>
    <td>出版社</td>	
    <td>价格</td>
    <td><div align="center">库存</div></td>
    <td>存储位置</td>
    <td>类别</td>
	<td>操作</td>
  </tr>
 <%
   //循环显示数据
   List<Book> booklist=(List)request.getAttribute("booklist"); // 取request里面的对象队列
    if(booklist.size()!=0){
      for(int i=0;i<booklist.size();i++){ 
      Book book =new Book(); //新建对象
      book = booklist.get(i);   //每循环一次后将此时的值保存到对象里
     %>
  <tr>
              <td><%=book.getBookid() %></td>
              <td><%=book.getBookname()%></td>
              <td><%=book.getAuthor()%></td>
              <td><%=book.getPublisherid()%></td>
              <td>￥<%=book.getPrice()%></td>
              <td> <div align="center"><%=book.getQuantity()%> </div></td>
              <td><%=book.getPlace()%></td>
              <td><%=book.getType()%></td>
			  <td><a href="deleteBook.action?id=<%=book.getBookid()%>" onclick='return confirm("确定要删除吗?")'>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="modifyBook.action?id=<%=book.getBookid()%>">编辑</a></td>

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

   </div></td>
   </tr>

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