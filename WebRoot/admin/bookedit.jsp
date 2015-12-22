<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.service.*" %>
<%@ page import="java.util.*,java.sql.*,org.apache.commons.fileupload.*,java.io.*,javax.servlet.http.*"%>

<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <%Book book=(Book)request.getAttribute("book"); %>
    <td ><div align="center">
	      <table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
		  <form name="form1" action="updateBook.action" method="post" >
            <tr> 
                <td width="20%">书号</td>
              <td><%=book.getBookid()%><input name="bookid" type="hidden"  value="<%=book.getBookid()%>" ></td>
            </tr>
            <tr> 
                <td>书名</td>
              <td><input name="bookname" type="text" size="25" value="<%=book.getBookname()%>"></td>
            </tr>
            <tr> 
                <td>作者</td>
              <td><input name="author" type="text" size="25" value="<%=book.getAuthor()%>"></td>
            </tr>
            <tr> 
                <td>出版社</td>
              <td>              
			  <select name="publisherid" >
			  <option value="<%=book.getPublisherid()%>"><%=book.getPublisherid()%></option>
			 <%
			  PublisherService publisherservice=new PublisherService();
			  List<Publisher> publisherlist=publisherservice.getPublisherList();
	     					for(int i=0;i<publisherlist.size();i++){ 
						      Publisher publisher =new Publisher(); //新建对象
						      publisher = publisherlist.get(i);   //每循环一次后将此时的值保存到对象里
			  %>
			 <option value=<%=publisher.getPublisherid()%>><%=publisher.getName()%></option>
							<% }%>			  </select></td>
            </tr>
            <tr> 
                <td>出版日期</td>
              <td><input name="pubdate" type="text" size="25" value="<%=book.getPubdate()%>"></td>
            </tr>
            <tr> 
                <td>价格</td>
              <td><input name="price" type="text" size="25" value="<%=book.getPrice()%>"></td>
            </tr>
            <tr> 
                <td>库存数量</td>
              <td><input name="quantity" type="text" size="25" value="<%=book.getQuantity()%>"></td>
            </tr>
            <tr> 
                <td>存储位置</td>
              <td><input name="place" type="text" size="25" value="<%=book.getPlace()%>"></td>
            </tr>
            <tr> 
                <td>类别</td>
              <td>
			  <select name="type" >
			  <option value="0" <%=(book.getType()== 0?" selected ":"")%>>普通</option>
			  <option value="1" <%=(book.getType()== 1?" selected ":"")%>>新书</option>
			  <option value="2" <%=(book.getType()== 2?" selected ":"")%>>精品</option>
			  </select>
			  </td>
            </tr>
            <tr> 
                <td>内容简介</td>
              <td><textarea name="content" cols="70" rows="10"><%=book.getContent()%></textarea></td>
            </tr>	
            <tr> 
                      <td width="20%" ><img src="images/<%=book.getPicture()%>" height="120" width="85" ></td>
                      <td width="80%">封面图片<br>
                          <input type="text" name="picture" size="25" value="<%=book.getPicture()%>">
                          &nbsp;&nbsp;&nbsp;&nbsp; 
                    </tr>		
            <tr> 
              <td colspan="2"><div align="center">
                  <input type="submit" value=" 修改 ">&nbsp;&nbsp;&nbsp;&nbsp;
				  <input type="reset" value=" 重置 ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div></td>
            </tr>
			</form>
            <tr> 
              <td colspan="2"><hr size="1" noshade width="100%"></td>
            </tr>			
<%--             <tr> 
              <td colspan="2"><div align="center">
			      <table width="100%" border="0" cellpadding="1" cellspacing="1" class="td">
				  <form name="form2" action="bookedit.jsp?bookid=<%=book.getBookid()%>" method="post" enctype="multipart/form-data">
                    <tr> 
                      <td width="20%" ><img src="BookShop/images/<%=book.getPicture()%>" height="120" width="85" ></td>
                      <td width="80%">封面图片<br>
                          <input type="file" name="picture" size="25">
                          &nbsp;&nbsp;&nbsp;&nbsp; 
                          <input type="submit" value=" 上传图片 "></td>
                    </tr>
					</form>
                  </table>

                </div></td>
            </tr> --%>
			
			
			
			
						
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