package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;

public final class MailHome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


            PreparedStatement stmt;
            Connection con;
            ResultSet rs;
        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Home</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

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

        
      out.write("\n");
      out.write("\n");
      out.write("        <h1 align=\"center\">Mail Home</h1>\n");
      out.write("        <div>\n");
      out.write("            <a href=\"Compose.html\">Compose</a> \n");
      out.write("\n");
      out.write("            <a href=\"logout.jsp\">Logout</a>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    <center>\n");
      out.write("        <div>\n");
      out.write("            <h1>Welcome ");
      out.print(tempLoggedUserVariable);
      out.write("</h1>\n");
      out.write("        </div>\n");
      out.write("    </center>\n");
      out.write("\n");
      out.write("    <div>\n");
      out.write("        <table border =\"1\" width=70%\" align=\"center\">\n");
      out.write("            <tr bgcolor=\"00FF7F\">\n");
      out.write("                <th>No</th>\n");
      out.write("                <th>From</th>\n");
      out.write("                <th>Subject</th>\n");
      out.write("                <th>Message</th>\n");
      out.write("            </tr>\n");
      out.write("            ");

                int i = 1;
                while (rs.next()) {
                    String messageExcerpt = rs.getString(4);
                    System.out.println(messageExcerpt);
            
      out.write("\n");
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString(1));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString(3));
      out.write("</td>\n");
      out.write("                <td><a href=\"message.jsp?msgId=");
      out.print(rs.getInt(5));
      out.write('"');
      out.write('>');
      out.print(messageExcerpt);
      out.write("</a></td>\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");

                    i++;
                }
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </div> \n");
      out.write("        <div>\n");
      out.write("            <form action=\"DeleteAllMsg.jsp\" method=\"post\">\n");
      out.write("                <input type=\"hidden\" name=\"toUser\" value=\"");
      out.print( session.getAttribute("loggedInUser"));
      out.write("\"</input>\n");
      out.write("                <input type=\"button\" name=\"btnDeleteAll\" value=\"Delete All\"></input>\n");
      out.write("                \n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
