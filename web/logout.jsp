<%-- 
    Document   : logout
    Created on : Feb 21, 2021, 1:44:43 PM
    Author     : SHREE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("id");
    try
    {
        session.invalidate();
        out.println("<script>window.location.href='login.jsp?msg=LoggedOut';</script>");
    }
    catch(Exception e)
    {
        out.println("<h1>"+e+"</h1>");
    }
%>