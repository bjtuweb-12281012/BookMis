<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.*,java.sql.*"%>
<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection conn = DriverManager.getConnection("jdbc:odbc:bookshoplk","sa","");
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
ResultSet rs=null;
%>
<%
String s_admin=(String)session.getAttribute("admin");
if(s_admin==null){
response.sendRedirect("checklogin.jsp");
}
%>
<%
String s_currentpage=request.getParameter("currentpage");
String s_bookid = request.getParameter("bookid");
stmt.executeUpdate("delete from book where bookid='"+s_bookid+"'");
response.sendRedirect("booklist.jsp?op=show&currentpage="+s_currentpage);
%>