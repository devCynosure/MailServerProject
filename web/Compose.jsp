<%-- 
    Document   : Compose
    Created on : Jun 14, 2021, 10:26:54 PM
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
        <title>Compose</title>
    </head>
    <body>
        <%!
            PreparedStatement stmt;
            Connection con;
            ResultSet rs;

        %>
        <%
//            String msgId = request.getParameter("msgId");
            session = request.getSession(false);
            if (session.getAttribute("loggedInUser") == null) {
                response.sendRedirect("UserLogin.html");
            }
            else{
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mailserver", "root", "");
                stmt = con.prepareStatement("insert into message_table(from_id,to_id,subject,message) values(?,?,?,?)");

                stmt.setString(1, session.getAttribute("loggedInUser").toString());
                stmt.setString(2, request.getParameter("cmpTo"));
                stmt.setString(3, request.getParameter("cmpSubject"));
                stmt.setString(4, request.getParameter("cmpMsg"));

                int check = stmt.executeUpdate();
                if (check == 1) {
                    response.sendRedirect("MailHome.jsp");
                } else {
                    response.sendError(response.getStatus(), "error! try again");
                }
            } catch (SQLException e) {
                out.print(e);

            }
            }


        %>
    </body>
</html>
