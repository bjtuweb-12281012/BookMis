<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>

<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <%Publisher publisher=(Publisher)request.getAttribute("publisher"); %>
  <tr> 
    <td ><div align="center">
	      <table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
		  <form name="form" action="updatePublisher?id=<%=publisher.getPublisherid()%>" method="post" >
		  <tr> 
              <td>出版id</td>
              <td><input name="publisherid" type="text" size="25" value="<%=publisher.getPublisherid()%>"></td>
            </tr>
            <tr> 
              <td>出版社名</td>
              <td><input name="name" type="text" size="25" value="<%=publisher.getName()%>"></td>
            </tr>
            <tr> 
              <td>联系人</td>
              <td><input name="linkname" type="text" size="25" value="<%=publisher.getLinkname()%>"></td>
            </tr>
            <tr> 
              <td>联系地址</td>
              <td><input name="address" type="text" size="25" value="<%=publisher.getAddress()%>"></td>
            </tr>
            <tr> 
              <td>E-mail</td>
              <td><input name="email" type="text" size="25" value="<%=publisher.getEmail()%>"></td>
            </tr>
            <tr> 
              <td>电话</td>
              <td><input name="phone" type="text" size="25" value="<%=publisher.getPhone()%>"></td>
            </tr>
            <tr> 
              <td>网址</td>
              <td><input name="website" type="text" size="25" value="<%=publisher.getWebsite()%>"></td>
            </tr>
            <tr> 
              <td colspan="2"><div align="center">
                  <input type="submit" value=" 修改 ">&nbsp;&nbsp;&nbsp;&nbsp;
				  <input type="reset" value=" 重置 ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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