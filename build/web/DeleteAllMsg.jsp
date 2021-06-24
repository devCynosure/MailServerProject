<%-- 
    Document   : DeleteAllMsg
    Created on : Jun 23, 2021, 12:14:23 AM
    Author     : TEMP
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Message</title>
    </head>
    <body>
        <h1>This page is for deleting all message</h1>
        <%!
          Connection con;
          PreparedStatement stmt;
          ResultSet rs;
           
        %>
        <%
            request.getSession(false);
            if(!(session.getAttribute("loggedInUser")== null)){
            String msgTo = request.getParameter("toUser");
            try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mailserver", "root","");
            stmt = con.prepareStatement("delete from message_table where to_id=?");
            
            stmt.setString(1, msgTo);
            int result = stmt.executeUpdate();
            if(result == 1 ){
                RequestDispatcher rd = request.getRequestDispatcher("MailHome.jsp");
                rd.forward(request, response);
            }
            else{
                
                
                RequestDispatcher rd = request.getRequestDispatcher("MailHome.jsp");
                rd.forward(request, response);
                out.print("<script>alert(\"Something went wrong, Try again.\")</script>");
            }
            }catch(SQLException e){
                out.print(e);
            }
            catch(Exception e){
                out.print(e);
            }
            }
            else{
                response.sendRedirect("userLogin.jsp");
            }
            
            %>
    </body>
</html>
