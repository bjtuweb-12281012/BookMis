<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.presentation.*" %>
<%
  String s_bookid=request.getParameter("bookid");
  Collection c_cart=(Collection)session.getAttribute("cart");
  Iterator it=null;
  if(c_cart==null){
    c_cart= new Vector();
    session.setAttribute("cart",c_cart);
  }else{
    it=c_cart.iterator();
    while(it.hasNext()){
      cartBean cb=(cartBean)(it.next());
      if(cb.bookid.equals(s_bookid)){
        cb.ordernum++; 
	cb.subtotal+=cb.unitprice;
	cb.subtotal=Math.round(cb.subtotal*100)/100.00;
	break;
      }//if end	
    }//while end
  }//else end
  response.sendRedirect("shoppingcart.jsp");
%>