<%-- 
    Document   : logout
    Created on : Jun 15, 2021, 3:30:54 PM
    Author     : TEMP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirecting...</title>
    </head>
    <body>
        <h1>Logout</h1>
        <%
            if(session.getAttribute("loggedInUser") != null);
            session.invalidate();
            response.sendRedirect("UserLogin.html");
            
            %>
    </body>
</html>
