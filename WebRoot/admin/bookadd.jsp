<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.service.*" %>

<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <td ><div align="center">
	      <table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
		  <form name="form" action="addBook" method="post" >
            <tr> 
                <td width="20%">书号</td>
              <td><input name="bookid" type="text"  size="25" ></td>
            </tr>
            <tr> 
                <td>书名</td>
              <td><input name="bookname" type="text" size="25" ></td>
            </tr>
            <tr> 
                <td>作者</td>
              <td><input name="author" type="text" size="25" ></td>
            </tr>
            <tr> 
                <td>出版社</td>
              <td>              
			  <select name="publisherid" >
			  <option value=0>--请选择--</option>
			  <%
			  PublisherService publisherservice=new PublisherService();
			  List<Publisher> publisherlist=publisherservice.getPublisherList();
	     					for(int i=0;i<publisherlist.size();i++){ 
						      Publisher publisher =new Publisher(); //新建对象
						      publisher = publisherlist.get(i);   //每循环一次后将此时的值保存到对象里
			  %>
			 <option value=<%=publisher.getPublisherid()%>><%=publisher.getName()%></option>
							<% }%>
			  </select></td>
            </tr>
            <tr> 
                <td>出版日期</td>
              <td><input name="pubdate" type="text" size="25" value="2004-07-27"></td>
            </tr>
            <tr> 
                <td>价格</td>
              <td><input name="price" type="text" size="25" value="0.00"></td>
            </tr>
            <tr> 
                <td>库存数量</td>
              <td><input name="quantity" type="text" size="25" value="0"></td>
            </tr>
            <tr> 
                <td>存储位置</td>
              <td><input name="place" type="text" size="25" ></td>
            </tr>
            <tr> 
                <td>类别</td>
              <td>
			  <select name="type" >
			  <option value="0">普通</option>
			  <option value="1">新书</option>
			  <option value="2">精品</option>
			  </select>
			  </td>
            </tr>
            <tr> 
                <td>内容简介</td>
              <td><textarea name="content" cols="70" rows="10"></textarea></td>
            </tr>			
            <tr> 
              <td colspan="2"><div align="center">
                  <input type="submit" value=" 新建 ">&nbsp;&nbsp;&nbsp;&nbsp;
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div></td>
            </tr>
			</form>
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