<%-- 
    Document   : UserSignup
    Created on : Jun 14, 2021, 3:17:00 PM
    Author     : TEMP
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Signup JSP Page</title>
    </head>
    <body>
        <%! 
           PreparedStatement stmt;
           ResultSet rs;
           Connection con;
        
        %>
        <%
            try{
                
               session = request.getSession(false);
               if(session.getAttribute("loggedInUser") == null){
                
                String regName = request.getParameter("regUsername");
                String regPass = request.getParameter("regPassword");
                
                if(regName != "" || regPass != ""){
                
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mailserver","root","");
                stmt = con.prepareStatement("insert into loginmaster(name,password) values(?,?)");
                stmt.setString(1,regName);
                stmt.setString(2,regPass);
                
                int i = stmt.executeUpdate();
                
            
               out.print(i + " inserted");
               
               response.sendRedirect("UserLogin.html");
               }
               }
               else{
                   response.sendRedirect("MailHome.jsp");
               }
               

            }
            catch(SQLException e){
               out.print(e);
            }
            
            
            %>
    </body>
</html>
