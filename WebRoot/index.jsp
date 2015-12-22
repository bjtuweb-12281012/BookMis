<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script src="js/modernizr.custom.js"></script>
</head>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB2312" pageEncoding="UTF-8"%>
<%
java.util.Date today=new java.util.Date(); 
String s_today=(today.getYear()+1900)+"年"+(today.getMonth()+1)+"月"+today.getDate()+"日";
%>
<% 
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("UTF-8");  
%>

<%
String readerid=null;
  try{
  readerid=session.getAttribute("ID").toString();
	  if(readerid==null){
	   response.sendRedirect("checklogin.jsp");
	  }
  }
  catch (Exception e){
  readerid=null;
  }
%>
<script language=javascript>
<!-- Begin
  function setVariables() {
    imgwidth=50; 
    imgheight=50;  
    if (navigator.appName == "Netscape") {
      horz=".left";
      vert=".top";
      docStyle="document.";
      styleDoc="";
      innerW="window.innerWidth";
      innerH="window.innerHeight";
      offsetX="window.pageXOffset";
      offsetY="window.pageYOffset";
    }
    else {
      horz=".pixelLeft";
      vert=".pixelTop";
      docStyle="";
      styleDoc=".style";
      innerW="document.body.clientWidth";
      innerH="document.body.clientHeight";
      offsetX="document.body.scrollLeft";
      offsetY="document.body.scrollTop";
    }
  }
  function checkLocation() {
    objectXY="branding";
    var availableX=eval(innerW);
    var availableY=eval(innerH);
    var currentX=eval(offsetX);
    var currentY=eval(offsetY);
    x=availableX-(imgwidth+60)+currentX;
    y=availableY-(imgheight+40)+currentY-300;
    evalMove();
    setTimeout("checkLocation()",10);
  }
  function evalMove() {
    eval(docStyle + objectXY + styleDoc + horz + "=" + x);
    eval(docStyle + objectXY + styleDoc + vert + "=" + y);
  }
// End -->
</script>

<body onload="setVariables(); checkLocation();">
<div class="container">
	<div class="row">
		<header>
			<h1 style="font-size:45px;text-shadow:0px 0px 10px #fff;"><strong>BOOKmis.</strong></h1><h3>com</h3>	
	  		<div class="row">
		  		<div class="col-md-12">
				  	<nav class="cl-effect" >
						<a href="index.jsp"><span data-hover="首页">首页</span></a>
						<a href="booksearch.jsp"><span data-hover="查找图书">查找图书</span></a>
						<a href="myborrow.action?readerid=<%=readerid%>"><span data-hover="我的借阅">我的借阅</span></a>
						<a href="historyborrow.action?readerid=<%=readerid%>"><span data-hover="历史借阅">历史借阅</span></a>
						<a href="leaveword.action?readerid=<%=readerid%>"><span data-hover="我要留言">我要留言</span></a>
						<div class="right"><h4>&nbsp;&nbsp;&nbsp;<%=s_today%>,Welcome!&nbsp;&nbsp;&nbsp;</h4></div>
					</nav>
				</div>
			</div>
		</header>
    </div> 
    <br><br>
    <div class="row">
		<div class="col-md-9">			
            <div class="well well-lg">
                 <div class="row">
		            <%@include file="readerinfo.jsp" %>
				</div> 
			</div>
    	</div>
	    <div class="col-md-3" >
			<%@include file="search.jsp" %>
	    	<%@include file="login.jsp" %>
	    	<br><br>
        	<%@include file="declare.jsp" %> 
        </div>
    </div>
    <div align="center"><%@include file="bottom.jsp" %></div>
</div>
</body>