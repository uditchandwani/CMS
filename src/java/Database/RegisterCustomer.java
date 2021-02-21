/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SHREE
 */
public class RegisterCustomer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String city=request.getParameter("city");
        String pwd=request.getParameter("pwd");
        try
        {
            Connection con = new DBConnection().getConnection();
            String query = "select name from customer where email=? or phone=?;";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, phone);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                out.println("<script>window.location.href='register.jsp?msg=Exist';</script>");
            }
            else
            { 
                query = "select max(customerID) from customer;";
                ps=con.prepareStatement(query);
                rs = ps.executeQuery();
                rs.next();
                int id = rs.getInt(1);
                query = "insert into customer(name,email,phone,city,pwd,customerID,status) values(?,?,?,?,?,?,?);";
                ps=con.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, city);
                ps.setString(5, pwd);
                ps.setInt(6, id+1);
                ps.setString(7, "Pending");
                int rs1 = ps.executeUpdate();
                if(rs1>0)
                {
                   out.print("<script>window.location.href='register.jsp?msg=Success';</script>"); 
                }
                else
                {
                   out.print("<script>window.location.href='register.jsp?msg=Failed';</script>");
                }
            }
        }
        catch(Exception e)
        {
            out.print("<h1>"+e+"</h1>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
