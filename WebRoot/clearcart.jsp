<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.presentation.*" %>
<%
  Collection c_cart=(Collection)session.getAttribute("cart");
  if(c_cart!=null)
    c_cart.clear();
  else{
    c_cart=new Vector();
    session.setAttribute("cart",c_cart);
  }
  response.sendRedirect("shoppingcart.jsp");
%>