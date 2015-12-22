<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<SCRIPT LANGUAGE="javascript">
<!--
function CheckSubmit()
 {
  if( document.orderform.receiver.value == "" )
     { alert("请输入收货人姓名!"); document.orderform.receiver.focus(); return false; } 
  if( document.orderform.address.value == "" )
     { alert("请输入收货人地址!"); document.orderform.address.focus(); return false; } 
  if( document.orderform.phone.value == "" )
     { alert("请输入联系电话!"); document.orderform.phone.focus(); return false; } 
  if( document.orderform.postcode.value == "" )
     { alert("请输入邮编!"); document.orderform.postcode.focus(); return false; } 		 
  return true;                                                                                          
 } 
</SCRIPT>
<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
<%
  String s_userid=(String)session.getAttribute("userid");
  if(s_userid==null){
%>
  <tr> 
    <td ><div align="center">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="td">
        <tr>
          <td>身份验证:</td>
        </tr>
        <tr>
          <td><hr size="1" noshade width="100%"></td>
        </tr>  
        <tr>
          <td>您还没有登录,您的购书车信息我们会为您保留:<br>
	    1.如果您是我们的会员请您回到<a href="index.jsp">首页登陆</a>;<br>
	    2.如果您是新用户,请您先<a href="register.jsp">注册</a>;<br>
	  </td>
        </tr>
      </table></div></td>
  </tr>
<%
  }else{
   UserService userservice1 = new UserService();
   User loginuser=userservice1.getUser(session.getAttribute("userid").toString(),session.getAttribute("password").toString());
%>
  <tr> 
    <td ><div align="center" class="main">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="td">
      <form name="orderform" action="addorder" method="post">
        <tr>
          <td colspan="2">为方便我们及时将书送到您手上，请您确保以下信息真实可靠:（带<font color="red">*</font>号的为必填项，其它的可以不填）</font></td>
        </tr>
        <tr>
          <td colspan="2"><hr size="1" noshade width="100%"></td>
        </tr>    
        <tr>
          <td>下单人:</td>
	  <td><input name="userid" type="text" size="20" value="<%=loginuser.getUserid()%>"></td>
        </tr> 
        <tr>
          <td>收货人:</td>
	  <td><input name="receiver" type="text" size="20" value="<%=loginuser.getUsername()%>"></td>
        </tr>
        <tr>
          <td>收货人地址:</td>
	  <td><input name="address" type="text" size="40" value="<%=loginuser.getAddress()%>"><font color="red">*</font></td>
        </tr>
        <tr>
          <td>联系电话:</td>
	  <td><input name="phone" type="text" size="20" value="<%=loginuser.getPhone()%>"><font color="red">*</font></td>
        </tr>
        <tr>
          <td>邮编:</td>
	  <td><input name="postcode" type="text" size="20" value="<%=loginuser.getPostcode()%>"><font color="red">*</font></td>
        </tr>
        <tr>
          <td>付费方式:</td>
	  <td>
	    <select name="payment">
	      <option value="邮局汇款">邮局汇款</option>
	      <option value="银行转账">银行转账</option>
	      <option value="货到付款">货到付款</option>
	    </select>
        </tr>
        <tr>
          <td>送货方式:</td>
		  <td>
		    <select name="deliver">
		      <option value="24小时全国特快专递">24小时全国特快专递</option>
		      <option value="邮局托运">邮局托运</option>
		    </select>
		  </td>
        </tr>
        
<%
  int i_totalnum=0;
  double d_totalamount=0.0;
  Iterator it=null;
  Collection c_cart=(Collection)session.getAttribute("cart");
  
  OrderService orderservice = new OrderService();
  List<Order> orderlist=orderservice.getOrderListByUserid(session.getAttribute("userid").toString());
  String s_orderid=orderlist.size()+1+"";
  
  c_cart=(Collection)session.getAttribute("cart");
  List<OrderDetail> orderdetaillist= new ArrayList<OrderDetail>();
  OrderDetail orderdetail=new OrderDetail();
  int i=0;
  if(c_cart!=null&&c_cart.size()>0){
  it=c_cart.iterator();
    while(it.hasNext()){
      cartBean cbean=(cartBean)(it.next());
      i_totalnum+=cbean.ordernum;
      d_totalamount+=cbean.subtotal;
      orderdetail.setBookid(cbean.bookid);
      orderdetail.setBookname(cbean.bookname);
      orderdetail.setOrderid(s_orderid);
      orderdetail.setOrdernum(cbean.ordernum);
      orderdetail.setPublisher(cbean.publish);
      orderdetail.setUnitprice((float)cbean.unitprice);
      orderdetaillist.add(orderdetail);
      i++;
      }
      }
	session.setAttribute("detaillist", orderdetaillist);
	System.out.println("nnnnnnnnnn");
	session.removeAttribute("cart");
 %>
 		<tr>
          <td>总数:</td>
	  <td><input name="totalnum" type="text" size="20" value="<%=i_totalnum%>"></td>
        </tr>
        <tr>
          <td>总价:</td>
	  <td><input name="totalamount" type="text" size="20" value="<%=d_totalamount%>"></td>
        </tr>
        <tr>
          <td>订单号:</td>
	  <td><input name="orderid" type="text" size="20" value="<%=s_orderid%>"></td>
        </tr>
        <tr>
          <td colspan="2"> <div align="center">
            <input type="submit" value=" 我要下订单 " onClick="return CheckSubmit();">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value=" 重新填写 ">&nbsp;&nbsp;&nbsp;&nbsp;
                </div></td>
        </tr>  
  </form>
</table>	
	</div></td>
  </tr> 
<%}%>
  <tr> 
    <td ><div align="center"><%@include file="bottom.jsp" %></div></td>
  </tr>
</table>
</div>