<%-- 
    Document   : MailHome
    Created on : Jun 14, 2021, 9:44:17 PM
    Author     : TEMP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
    </head>
    <body>
        <%!
            PreparedStatement stmt;
            Connection con;
            ResultSet rs;
        %>
        <%
            //logged In checking and redirecting
            String msgId = request.getParameter("msgId");
            session = request.getSession(false);
            if (session.getAttribute("loggedInUser") == null) {
                response.sendRedirect("UserLogin.html");
            }
            
            //Checking session.getAttribute("loggedInUser") is null or not " for not geting null exception"
            String tempLoggedUserVariable;
            if (session.getAttribute("loggedInUser") == null) {
                tempLoggedUserVariable = "";
            } else {
                tempLoggedUserVariable = session.getAttribute("loggedInUser").toString();
            }
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mailserver", "root", "");
            stmt = con.prepareStatement("select * from message_table where to_id=?");
            stmt.setString(1, tempLoggedUserVariable);

            rs = stmt.executeQuery();

        %>

        <h1 align="center">Mail Home</h1>
        <div>
            <a href="Compose.html">Compose</a> 

            <a href="logout.jsp">Logout</a>
        </div>

    <center>
        <div>
            <h1>Welcome <%=tempLoggedUserVariable%></h1>
        </div>
    </center>

    <div>
        <table border="1" width=70%" align="center">
            <tr bgcolor="00FF7F">
                <th>No</th>
                <th>From</th>
                <th>Subject</th>
                <th>Message</th>
            </tr>
            <%
                int i = 1;
                while (rs.next()) {
                    String messageExcerpt = rs.getString(4);
                    System.out.println(messageExcerpt);
            %>

            <tr>
                <td><%=i%></td>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(3)%></td>
                <td><a href="message.jsp?msgId=<%=rs.getInt(5)%>"><%=messageExcerpt%></a></td>

            </tr>


            <%
                    i++;
                }
            %>
        </table>
    </div> 
        <div align="right">
            <form action="DeleteAllMsg.jsp" method="POST">
                <input type="hidden" name="toUser" value="<%= session.getAttribute("loggedInUser")%>"/>
                <button type="submit" name="btnDeleteAll">Delete All</button>
                
            </form>
        </div>



</body>
</html>
