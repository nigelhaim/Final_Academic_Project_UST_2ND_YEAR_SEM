/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package views;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author nigel
 */
public class Get_Orders extends HttpServlet {

    /**
     * Gets all the orders from the database for the librarian 
     */
    Connection conn;
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);

        ServletContext cont = config.getServletContext();
        try{
            Class.forName(cont.getInitParameter("jdbcClassName"));
            String username = cont.getInitParameter("dbUserName");
            String password = cont.getInitParameter("dbPassword");
            
            StringBuffer url = new StringBuffer(cont.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(cont.getInitParameter("dbHostName"))
                    .append(":")
                    .append(cont.getInitParameter("dbPort"))
                    .append("/")
                    .append(cont.getInitParameter("databaseName"));
                    //.append(cont.getInitParameter(""));
                           
            
            conn = DriverManager.getConnection(url.toString(), username, password);
            
        }catch(SQLException sqle){
            System.out.print("An SQL Exception occur" + sqle.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Get_Orders.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            if(conn != null){
                String query = "SELECT * FROM BORROWED_BOOKS";
                PreparedStatement stmt = conn.prepareStatement(query);
                ResultSet borrows = stmt.executeQuery();
                request.setAttribute("borrows", borrows);
                request.getRequestDispatcher("Librarian_Home.jsp").forward(request,response);
            }
        }catch(Exception e){
            System.out.print(e.getMessage());
        }


    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
