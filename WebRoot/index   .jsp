<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script src="js/modernizr.custom.js"></script>
</head>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.domain.*" %>
<%@ page import="com.bookstore.presentation.*" %>
<%@ page import="com.bookstore.service.*" %>
<%
java.util.Date today=new java.util.Date(); 
String s_today=(today.getYear()+1900)+"年"+(today.getMonth()+1)+"月"+today.getDate()+"日";
%>
<%
  UserService userservice = new UserService();
  String s_id="";
  try{
  User loginuser=userservice.getUser(session.getAttribute("userid").toString(),session.getAttribute("password").toString());
  if(loginuser==null){
   response.sendRedirect("checklogin.jsp");
  }
  
  s_id=loginuser.getUserid();
  }
  catch (Exception e){
  s_id=null;
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
						<a href="excellent.action?type=2"><span data-hover="精品推荐">精品推荐</span></a>
						<a href="newbook.action?type=1"><span data-hover="新书上架">新书上架</span></a>
						<a href="booksearch.jsp"><span data-hover="查找图书">查找图书</span></a>
						<a href="myorder.action?userid=<%=s_id%>"><span data-hover="我的订单">我的订单</span></a>
						<a href="shoppingcart.jsp"><span data-hover="购物车">购物车</span></a>
						<a href="leaveword.action?userid=<%=s_id%>"><span data-hover="我要留言">我要留言</span></a>
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
                <%
                   int i_num=2;
                   BookService bookservice=new BookService();
                   List<Book> booklistbytype=bookservice.getBookListByType(2);
                   if(booklistbytype.size()!=0){
				      for(int i=0;i<2&&i<booklistbytype.size();i++){ 
				      Book book =new Book(); //新建对象
				      book = booklistbytype.get(i);
                %>
                  <%
                  if(i==0){
                    String s_bookid=book.getBookid();
					String s_bookname=book.getBookname();
					String s_author=book.getAuthor();
					String s_pubdate=book.getPubdate().substring(0,10);
					float s_price=book.getPrice();
					String s_content=book.getContent();
					String s_picture=book.getPicture();
					int s_publisherid=book.getPublisherid();
                  %>
	            <div class"row">
		            <div class="col-md-3">
						<a href="getBookById.action?bookid=<%=s_bookid%>">
			          		<img src="images/<%=s_picture%>" width="100" height="150" border="0" >
			          	</a>
			        </div>
			        <div class="col-md-5">
			          	<h4><%=s_bookname%></h4><hr> 
			          	<h5>定价 :￥ <%=s_price%></h5><br>
			          	<h5>作者 :<%=s_author%></h5><br>
			        </div>
			        <div class="col-md-3">
			       		<a href="addToCart.action?bookid=<%=s_bookid%>" class="btn btn-info btn-sm" role="button">放入购书车</a> 
			            <a href="getBookById.action?bookid=<%=s_bookid%>" class="btn btn-success btn-sm" role="button">查看详情</a>
		            </div> 
				</div>
				<div class="row">
                  <%}
                    else{
                    String s_bookid=book.getBookid();
					String s_bookname=book.getBookname();
					String s_author=book.getAuthor();
					String s_pubdate=book.getPubdate().substring(0,10);
					float s_price=book.getPrice();
					String s_content=book.getContent();
					String s_picture=book.getPicture();
					int s_publisherid=book.getPublisherid();
                  %>
                  <div class="col-md-3">
                        <a href="getBookById.action?bookid=<%=s_bookid%>">
                        	<img src="images/<%=s_picture%>" width="100" height="150" border="0" >
                        </a>
                  </div>
                  <div class="col-md-5">
          			<h4><%=s_bookname%></h4><hr>
	                  	<h5>作者: <%=s_author%></h5>
						<h5>定价￥<%=s_price%></h5>
				  </div>
				  <div class="col-md-3">
                        <a href="addToCart.action?bookid=<%=s_bookid%>">放入购书车</a>&nbsp;&nbsp; 
                        <a href="getBookById.action?bookid=<%=s_bookid%>">查看详情</a>
                  </div> 
                  <%}
                  }
                  }%>
                  
                	
            	</div>
            	<div class="right"><a href="excellent.action?type=2">更多精品</a></div>
            </div>
            <div class="well well-lg">
                <%
                  i_num=2;
                  
                  booklistbytype=bookservice.getBookListByType(1);
                  
                   if(booklistbytype.size()!=0){
				      for(int i=0;i<2&&i<booklistbytype.size();i++){ 
				      Book book =new Book(); //新建对象
				      book = booklistbytype.get(i);
                %>
                  <%
                    if(i==0){
                    String s_bookid=book.getBookid();
					String s_bookname=book.getBookname();
					String s_author=book.getAuthor();
					String s_pubdate=book.getPubdate().substring(0,10);
					float s_price=book.getPrice();
					String s_content=book.getContent();
					String s_picture=book.getPicture();
					int s_publisherid=book.getPublisherid();
                  %>
                 <div class="row">
		            <div class="col-md-3">
						<a href="getBookById.action?bookid=<%=s_bookid%>">
	                  		<img src="images/<%=s_picture%>" width="100" height="150" border="0" >
	                  	</a>
			        </div>
			        <div class="col-md-5">
			          	<h4><%=s_bookname%></h4><hr> 
			          	<h5>定价 :￥ <%=s_price%></h5><br>
			          	<h5>作者 :<%=s_author%></h5><br>
			        </div>
			        <div class="col-md-3">
			       		<a href="addToCart.action?bookid=<%=s_bookid%>" class="btn btn-info btn-sm" role="button">放入购书车</a> 
			            <a href="getBookById.action?bookid=<%=s_bookid%>" class="btn btn-success btn-sm" role="button">查看详情</a>
		            </div> 
				</div>
                  <%
                    }
                    else{
                    String s_bookid=book.getBookid();
					String s_bookname=book.getBookname();
					String s_author=book.getAuthor();
					String s_pubdate=book.getPubdate().substring(0,10);
					float s_price=book.getPrice();
					String s_content=book.getContent();
					String s_picture=book.getPicture();
					int s_publisherid=book.getPublisherid();
                  %>
                <div class="row">
		            <div class="col-md-3">
						<a href="getBookById.action?bookid=<%=s_bookid%>">
	                  		<img src="images/<%=s_picture%>" width="100" height="150" border="0" >
	                  	</a>
			        </div>
			        <div class="col-md-5">
			          	<h4><%=s_bookname%></h4><hr> 
			          	<h5>定价 :￥ <%=s_price%></h5><br>
			          	<h5>作者 :<%=s_author%></h5><br>
			        </div>
			        <div class="col-md-3">
			       		<a href="addToCart.action?bookid=<%=s_bookid%>" class="btn btn-info btn-sm" role="button">放入购书车</a> 
			            <a href="getBookById.action?bookid=<%=s_bookid%>" class="btn btn-success btn-sm " role="button">查看详情</a>
		            </div> 
				</div>
                  <%}
                  }
                  }%>
            	 <div class="right"><a href="newbook.action?type=1">更多新书</a></div>   
			</div>
    	</div>
	    <div class="col-md-3" >
	    	<div class="main">
	    	<%@include file="login.jsp" %>
	    	</div> <br>
        	<%@include file="declare.jsp" %> 
        </div>
    </div>
    <%@include file="bottom.jsp" %>
</div>
</body>