<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
    session.removeAttribute("userid");
    session.removeAttribute("password");
    response.sendRedirect("index.jsp");
%>

