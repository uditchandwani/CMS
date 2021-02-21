<%-- 
    Document   : DeleteUser
    Created on : Feb 21, 2021, 1:38:00 PM
    Author     : SHREE
--%>

<%@page import="Database.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        response.setContentType("text/html;charset=UTF-8");
        String id=request.getParameter("id");
        try
        {
            Connection con = new DBConnection().getConnection();
            String query = "delete from customer where customerID=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, id);
            int rs = ps.executeUpdate();
            if(rs>0)
            {
                out.print("<script>window.location.href='adminIndex.jsp';</script>");
            }
            else
            {
               out.print("<script>window.location.href='adminIndex.jsp?err=3';</script>");
            }
        }
        catch(Exception e)
        {
            out.print("<h1>"+e+"</h1>");
        }
%>