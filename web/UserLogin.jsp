<%-- 
    Document   : UserLogin
    Created on : Jun 14, 2021, 12:30:07 AM
    Author     : TEMP
--%>

<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login jsp</title>
    </head>
    <body>
        <%!
            PreparedStatement stmt = null;
            Connection con;
            ResultSet rs;

            %>
        <%
            String name = request.getParameter("username").toString();
            String password = request.getParameter("password").toString();
            try{
                
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mailserver","root","");
            stmt = con.prepareStatement("select * from loginmaster where name=? AND password=?");
            stmt.setString(1, name);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            if(rs.next()){
                 session.setAttribute("loggedInUser", name);
                 System.out.println(session.getAttribute("loggedInUser"));
                 
                
                response.sendRedirect("MailHome.jsp");
                
            }
            else{
                response.sendRedirect("UserLogin.html");
            }
            
            }
            catch(SQLException e){
                out.print(e);
            }
            %>
            
    </body>
</html>
