<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%
Book book=(Book)request.getAttribute("book");
String s_bookid=book.getBookid();
String s_bookname=book.getBookname();
String s_author=book.getAuthor();
String s_pubdate=book.getPubdate().substring(0,10);
float s_price=book.getPrice();
String s_content=book.getContent();
String s_picture=book.getPicture();
String s_publisherid=book.getPublishername();
%>

<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td colspan="2"><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <td width="75%" valign="top">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="td">
        <tr> 
          <td width="30%" rowspan="8"><img src="images/<%=s_picture%>" height="212" width="150" ></td>
          <td colspan="2"><%=s_bookname%></td>
        </tr>
        <tr> 
          <td colspan="2"><%=s_author%>&nbsp;著</td>
        </tr>

        <tr> 
          <td colspan="2"><%=s_publisherid%></td>
        </tr>		
		 <tr> 
          <td colspan="2"><%=s_pubdate%></td>
        </tr>		
		 <tr> 
          <td colspan="2"><%=s_bookid%></td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
		 <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
		 <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>		
        <tr> 
          <td>定 价:￥<%=s_price%> </td>
          <td><div align="center"><a href="addToCart.action?bookid=<%=s_bookid%>">放入购书车</a></div></td>
          <td><a href="javascript:history.go(-1);" >返回</a></td>
        </tr>
        <tr> 
          <td colspan="3">内容简介</td>
        </tr>
        <tr> 
          <td colspan="3"><%=s_content%>		  </td>
        </tr>		
      </table>
	</td>
  </tr>
  <tr> 
    <td colspan="2"><div align="center"><%@include file="bottom.jsp" %></div></td>
  </tr>
</table>
</div>