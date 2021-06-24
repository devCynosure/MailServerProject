<%-- 
    Document   : message
    Created on : Jun 16, 2021, 1:17:48 AM
    Author     : TEMP
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message</title>
    </head>
    <body>
        
        <h1>hello</h1>
 <%!
            PreparedStatement stmt;
            Connection con;
            ResultSet rs;
            

        %>
        
       <%  String msgId = request.getParameter("msgId");
       session = request.getSession(false);
       if(session.getAttribute("loggedInUser") == null){
           response.sendRedirect("UserLogin.html");
       }
       
       
try {
                   
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mailserver", "root", "");
                    stmt = con.prepareStatement("select from_id, subject, message from message_table where messageid=?");
                    
                    stmt.setString(1, msgId);
                    rs = stmt.executeQuery();
                    
                   

                } catch (SQLException e) {
                    out.print(e);
                }

            
        %>
        <%while(rs.next()){ %>
        <h1><%=rs.getString(1)%></h1>
        <h3><%=rs.getString(2)%></h3>
        <p><h5><%=rs.getString(3)%></h5></p> 
    <h3><%=session.equals(null) %></h3>
    <h3><%=session.getAttribute("loggedInUser") == null %></h3>
    
        <% } %>
        
        
        
</html>
