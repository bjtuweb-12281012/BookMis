<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <td ><div align="center" class="main">
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="td">
	<tr>
          <td colspan="8"><div align="right">&nbsp;&nbsp;&nbsp;&nbsp;<a href="getOrderList.action">返回</a></div></td>
        </tr>
<%
   OrderDetail order=(OrderDetail)request.getAttribute("orderdetail"); // 取request里面的对象队列
   String totalamount=(String)request.getAttribute("totalamount");
     %>
              <tr> 
                <td colspan="6">订单<%=order.getOrderid()%>的明细</td>
              </tr>
              <tr> 
                <td>书号</td>
                <td>书名</td>
                <td>出版社</td>
                <td>单价</td>
                <td>数量(本)</td>
                <td>合价</td>
              </tr>

              <tr> 
                <td><%=order.getBookid()%></td>
                <td><%=order.getBookname()%></td>
                <td><%=order.getPublisher()%></td>
                <td>￥<%=order.getUnitprice()%></td>
                <td><%=order.getOrdernum()%></td>
                <td>￥<%=totalamount%></td>
              </tr>

              <tr> 
                <td colspan="4"><div align="right">合计</div></td>
                <td ><%=order.getOrdernum()%></td>
		<td >￥<%=totalamount%></td>
              </tr>
            </table>
          </td>
        </tr>
	
            </table>
    </div></td>
  </tr>  
  <tr> 
    <td ><div align="center"><%@include file="../bottom.jsp" %></div></td>
  </tr>
</table>
</div>   