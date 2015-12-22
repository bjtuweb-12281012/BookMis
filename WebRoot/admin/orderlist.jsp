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
          <td colspan="8"><div align="right">&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        </tr>
        <tr> 
          <td colspan="8"><hr size="1" noshade width="100%"></td>
        </tr>

        <tr> 
          <td>订单号</td>
          <td>日期</td>
          <td>收货人</td>
          <td>地址</td>
	  <td><div align="center">图书总数</div></td>
	  <td>总价</td>
          <td>状态</td>
	  <td>更改状态</td>
        </tr>
  <%
   //循环显示数据
   List<Order> orderlist=(List)request.getAttribute("orderlist"); // 取request里面的对象队列
    if(orderlist.size()!=0){
      for(int i=0;i<orderlist.size();i++){ 
      Order order =new Order(); //新建对象
      order = orderlist.get(i);   //每循环一次后将此时的值保存到对象里
     %>       
        <tr> 
          <td><a href="orderdetail.action?detailid=<%=order.getOrderid()%>&totalamount=<%=order.getTotalamount()%>"><%=order.getOrderid()%></a>
          </td>  
          <td><%=order.getOrderdate()%></td >
          <td><%=order.getUserid()%></td >
          <td><%=order.getAddress()%></td>
	  <td><div align="center"><%=order.getTotalnum()%></div>
	  </td>
	  <td>￥<%=order.getTotalamount()%></td>
          <td><%=order.getState()%></td>
	  <td>
            <%if(order.getState()==0){%>
	       <a href="updateOrder.action?orderid=<%=order.getOrderid()%>&payment=<%=order.getPayment()%>&state=1&deliver=<%=order.getDeliver()%>&receiver=<%=order.getReceiver()%>&phone=<%=order.getPhone()%>&postcode=<%=order.getPostcode()%>&orderdate=<%=order.getOrderdate()%>&userid=<%=order.getUserid()%>&address=<%=order.getAddress()%>&totalnum=<%=order.getTotalnum()%>&totalamount=<%=order.getTotalamount()%>">发货</a>
	    <%}%>
	    <%if(order.getState()==1){%>
	      <a href="updateOrder.action?orderid=<%=order.getOrderid()%>&payment=<%=order.getPayment()%>&state=2&deliver=<%=order.getDeliver()%>&receiver=<%=order.getReceiver()%>&phone=<%=order.getPhone()%>&postcode=<%=order.getPostcode()%>&orderdate=<%=order.getOrderdate()%>&userid=<%=order.getUserid()%>&address=<%=order.getAddress()%>&totalnum=<%=order.getTotalnum()%>&totalamount=<%=order.getTotalamount()%>">完毕</a>
	    <%}%>

	  </td>
        </tr>
   <%
      }
    }else{
     %>
<tr><td colspan="6">数据库中没有数据！</td></tr>
    <%
    }
    %>											
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