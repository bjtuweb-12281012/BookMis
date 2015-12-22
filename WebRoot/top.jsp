<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.presentation.*" %>
<%@ page import="com.bookstore.persistence.iface.*" %>
<%
java.util.Date today=new java.util.Date(); 
String s_today=(today.getYear()+1900)+"年"+(today.getMonth()+1)+"月"+today.getDate()+"日";
%>
<%
  ReadersDao readerDao = new ReadersDao();
  String s_id="";
  try{
  ReadersBean loginuser=readerDao.getReaders(session.getAttribute("userid").toString());
  if(loginuser==null){
   response.sendRedirect("checklogin.jsp");
  }
  
  s_id=loginuser.getReaderid();
  }
  catch (Exception e){
  s_id=null;
  }
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script src="js/modernizr.custom.js"></script>
</head>
	<div class="container">
		<header>
			<h1 style="font-size:45px;text-shadow:0px 0px 5px #fff;"><strong>BOOKMIS.</strong></h1><h3>com</h3>	
	  		<div class="row">
		  		<div class="col-md-12">
				  	<nav class="cl-effect">
						<a href="index.jsp"><span data-hover="首页">首页</span></a>
						<a href="excellent.action?type=2"><span data-hover="精品推荐">精品推荐</span></a>
						<a href="newbook.action?type=1"><span data-hover="新书上架">新书上架</span></a>
						<a href="booksearch.jsp"><span data-hover="查找图书">查找图书</span></a>
						<a href="myorder.action?userid=<%=s_id%>"><span data-hover="我的订单">我的订单</span></a>
						<a href="shoppingcart.jsp"><span data-hover="购物车">购物车</span></a>
						<a href="leaveword.action?userid=<%=s_id%>"><span data-hover="我要留言">我要留言</span></a>
						<div class="right"><h4><%=s_today%>,Welcome!</h4></div>
					</nav>
				</div>
			</div>
			<br>
		</header>