<%@ page contentType="text/html; charset=GB2312" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script src="js/modernizr.custom.js"></script>
</head>
<%
java.util.Date today=new java.util.Date(); 
String s_today=(today.getYear()+1900)+"��"+(today.getMonth()+1)+"��"+today.getDate()+"��";
%>
<div class="container">
		<header >
			<h1 style="float:left;font-size:45px;color:#000;text-shadow:0px 0px 5px #000;"><strong>��̨����</strong></h1>
	  		<div class="row">
		  		<div class="col-md-12">
				  	<nav class="cl-effect"">
				  		<a href="getBookList.action"><span data-hover="ͼ�����">ͼ�����</span></a>
						<a href="getUserList.action"><span data-hover="�û�����">�û�����</span></a>
						<a href="getOrderList.action"><span data-hover="��������">��������</span></a>
						<a href="getNotesList.action"><span data-hover="���Թ���">���Թ���</span></a>
						<a href="getEmployeeList.action"><span data-hover="ְ������">ְ������</span></a>
						<a href="getPublisherList.action"><span data-hover="���������">���������</span></a>
					
<div class="right"><h4><%=s_today%>,Welcome!</h4></div>
					</nav>
				</div>
			</div>
			<br>
		</header>
</div>