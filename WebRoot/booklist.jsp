<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>


<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td colspan="2"><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
      <td width="75%" valign="top"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>   
          <td colspan="6">书目搜索结果</td>
        </tr>
          <tr bgcolor="#999999"></tr>
          <tr> 
            <td width="1" nowrap bgcolor="#999999"></td>
            <td><table width="100%" border="0" cellpadding="3" cellspacing="3" class="td">
                <tr> 
                </tr>
<%
   //循环显示数据
   List<Book> booklist=(List)request.getAttribute("booklist"); // 取request里面的对象队列
    if(booklist.size()!=0){
      for(int i=0;i<(booklist.size()-1);i++){ 
      Book book =new Book(); //新建对象
      book = booklist.get(i);   //每循环一次后将此时的值保存到对象里
     %>
                <tr class="td"> 
                  <%
					String s_bookid=book.getBookid();
					String s_bookname=book.getBookname();
					String s_author=book.getAuthor();
					String s_pubdate=book.getPubdate().substring(0,10);
					float s_price=book.getPrice();
					String s_content=book.getContent();
					String s_picture=book.getPicture();
					String s_publisherid=book.getPublishername();
					%>
                  <td width="50%"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="td">
                      <tr> 
                        <td width="30%" rowspan="5"><a href="bookdetail.jsp?bookid=<%=s_bookid%>"><img src="images/<%=s_picture%>" width="65" height="90" border="0" ></a></td>
                        <td width="25%"><div align="left">书名</div></td>
                        <td><%=s_bookname%></td>
                      </tr>
                      <tr> 
                        <td width="25%"><div align="left">作者</div></td>
                        <td><%=s_author%></td>
                      </tr>
                      <tr> 
                        <td width="25%"><div align="left">出版社</div></td>
                        <td><%=s_publisherid%></td>
                      </tr>
                      <tr> 
                        <td width="25%"><div align="left">出版日期</div></td>
                        <td><%=s_pubdate%></td>
                      </tr>
                      <tr> 
                        <td width="25%"><div align="left">定价</div></td>
                        <td>￥<%=s_price%></td>
                      </tr>
                      <tr> 
                        <td colspan="2"><div align="center"><a href="addToCart.action?bookid=<%=s_bookid%>">放入购书车</a>&nbsp;&nbsp; 
                            <a href="getBookById.action?bookid=<%=s_bookid%>">查看详情</a> 
                          </div></td>
                      </tr>
                    </table></td>
                  <%}
Book book =new Book();
book = booklist.get(booklist.size()-1);
String s_bookid=book.getBookid();
					String s_bookname=book.getBookname();
					String s_author=book.getAuthor();
					String s_pubdate=book.getPubdate().substring(0,10);
					float s_price=book.getPrice();
					String s_content=book.getContent();
					String s_picture=book.getPicture();
					String s_publisherid=book.getPublishername();
%>
                  <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="td">
                      <tr> 
                        <td width="30%" rowspan="5"><a href="bookdetail.jsp?bookid=<%=s_bookid%>"><img src="images/<%=s_picture%>" width="65" height="90" border="0" ></a></td>
                        <td width="25%">书名</td>
                        <td><%=s_bookname%></td>
                      </tr>
                      <tr> 
                        <td width="25%">作者</td>
                        <td><%=s_author%></td>
                      </tr>
                      <tr> 
                        <td width="25%">出版社</td>
                        <td><%=s_publisherid%></td>
                      </tr>
                      <tr> 
                        <td width="25%">出版社</td>
                        <td><%=s_pubdate%></td>
                      </tr>
                      <tr> 
                        <td width="25%">定价</td>
                        <td>￥<%=s_price%></td>
                      </tr>
                      <tr> 
                        <td colspan="2"><div align="center"><a href="addToCart.action?bookid=<%=s_bookid%>">放入购书车</a>&nbsp;&nbsp; 
                            <a href="getBookById.action?bookid=<%=s_bookid%>">查看详情</a> 
                          </div></td>
                      </tr>
                    </table></td>
                  <%}else{%>
        <tr> 
          <td colspan="6">没有找到您要的书,请<a href="booksearch.jsp">重新搜索</a>!</td>
        </tr>			
<%}%>			
                </tr>
              </table></td>
            <td width="1" bgcolor="#999999"></td>
          </tr>
          <tr bgcolor="#999999">
            <td height="1" colspan="3" nowrap></td>
          </tr>
        </table></td>
  </tr>
  <tr> 
    <td colspan="2"><div align="center"><%@include file="bottom.jsp" %></div></td>
  </tr>
</table>
</div>


