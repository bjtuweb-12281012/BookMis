<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.presentation.*" %>

<%@include file="top.jsp" %>
<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td><div align="center">
       <table width="100%" border="0" cellpadding="1" cellspacing="1" class="td">
          <tr> 
            <td colspan="8">我的订单</td>
          </tr>
          <tr> 
            <td colspan="8"><hr size="1" noshade width="100%"></td>
          </tr>

          <tr> 
            <td>序号</td>
            <td>订单号</td>
            <td>日期</td>
            <td>收货人</td>
            <td>地址</td>
	    <td>图书总数</td>
	    <td>总价</td>
            <td>订单状态</td>
          </tr>
<%
try{
   //循环显示数据
   UserService userservice1 = new UserService();
 User loginuser=userservice1.getUser(session.getAttribute("userid").toString(),session.getAttribute("password").toString());
    List<Order> orderlist=(List)request.getAttribute("myorderlist"); // 取request里面的对象队列
    if(orderlist.size()!=0){
      for(int i=0;i<orderlist.size();i++){ 
      Order order =new Order(); //新建对象
      order = orderlist.get(i);   //每循环一次后将此时的值保存到对象里
      String s_orderid=order.getOrderid();
      String s_orderdate=order.getOrderdate();
      String s_receiver=order.getReceiver();
      String s_address=order.getAddress();
      int s_totalnum=order.getTotalnum();
      float s_totalamount=order.getTotalamount();
      int s_state=order.getState();
     %>
          <tr> 
            <td><%=i%></td >
            <td><a href="userorderdetail.action?detailid=<%=s_orderid%>&totalamount=<%=s_totalamount%>"><%=s_orderid%></a></td>  
            <td><%=s_orderdate%></td >
            <td><%=s_receiver%></td >
            <td><%=s_address%></td>
	    <td><%=s_totalnum%></td>
	    <td>￥<%=s_totalamount%></td>
            <td><%=s_state%></td>
          </tr>
<%
      }
    }else{
     %>
<tr><td colspan="6">数据库中没有数据！</td></tr>
    <%
    }
    %>	
    <%}catch (Exception e){
       e.printStackTrace();
%>										
          <tr> 
            <td colspan="8">&nbsp;您还没有登陆，请先登陆！</td>
          </tr>
<%} %>
        </table>
	</div></td>
  </tr>  
  <tr> 
    <td ><div align="center"><%@include file="bottom.jsp" %></div></td>
  </tr>
</table>
</div>   