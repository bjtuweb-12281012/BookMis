<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB2312" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% 
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("UTF-8");  
%>
<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">搜索</h3>
		</div>
		<div class="panel-body">
		  <form name="searchform" action="search.action" method="post">
		      	<input name="bookname" type="text" class="form-control" size="15" placeholder="书名">
		      	<input name="author" type="text" class="form-control" size="15"placeholder="作者" style="margin-top:5px;">
		      	<input name="publisher" type="text" class="form-control" size="15" placeholder="出版社" style="margin-top:5px;">
		      
		      	<input name="submit" type="submit" value=" 查找 " class="btn btn-success" style="width:100%;margin-top:5px;"> 
		      	<a href="booksearch.jsp" class="btn btn-info" style="width:100%;margin-top:5px;">高级搜索</a>
		  </form>
	 	</div>
</div>
