<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.presentation.*" %>
<%@ page import="java.sql.*"%>
<%
  Book book=(Book)request.getAttribute("book");
String s_bookid=book.getBookid();
String s_bookname=book.getBookname();
String s_author=book.getAuthor();
String s_pubdate=book.getPubdate().substring(0,10);
float d_unitprice=book.getPrice();
String s_content=book.getContent();
String s_picture=book.getPicture();
String s_publisherid=book.getPublishername();
  int i_ordernum=1;
  double d_subtotal=i_ordernum*d_unitprice;
  d_subtotal=Math.round(d_subtotal*100)/100.00;
  cartBean cbean=new cartBean();
  cbean.bookid=s_bookid;
  cbean.bookname=s_bookname;
  cbean.publish=s_publisherid;
  cbean.ordernum=i_ordernum;
  cbean.unitprice=d_unitprice;
  cbean.subtotal=d_subtotal;
  Collection c_cart=(Collection)session.getAttribute("cart");
  Iterator it=null;
%>
<%
  if(c_cart==null){
    c_cart= new Vector();
    c_cart.add(cbean);
    session.setAttribute("cart",c_cart);
  }else{
    String s_flag="false";
    it=c_cart.iterator();
    while(it.hasNext()){
      cartBean cb=(cartBean)(it.next());
      if(cb.bookid.equals(s_bookid)){
	cb.ordernum++;
        cb.subtotal+=cb.unitprice;
	s_flag="true";
      }//if end	
    }//while end
    if(s_flag.equals("false")){
      c_cart.add(cbean);
    }
  }//else end
  response.sendRedirect("shoppingcart.jsp");
%>
