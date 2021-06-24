package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;

public final class message_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Message</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <h1>hello</h1>\n");
      out.write(" ");
      out.write("\n");
      out.write("        \n");
      out.write("       ");
  String msgId = request.getParameter("msgId");
//       session = request.getSession(false);
//       if(session = null){
//           response.sendRedirect("UserLogin.html");
//       }
       
       
try {
                   
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mailserver", "root", "");
                    stmt = con.prepareStatement("select from_id, subject, message from message_table where messageid=?");
                    
                    stmt.setString(1, msgId);
                    rs = stmt.executeQuery();
                    
                   

                } catch (SQLException e) {
                    out.print(e);
                }

            
        
      out.write("\n");
      out.write("        ");
while(rs.next()){ 
      out.write("\n");
      out.write("        <h1>");
      out.print(rs.getString(1));
      out.write("</h1>\n");
      out.write("        <h3>");
      out.print(rs.getString(2));
      out.write("</h3>\n");
      out.write("        <p><h5>");
      out.print(rs.getString(3));
      out.write("</h5></p> \n");
      out.write("    <h3>");
      out.print(session.equals(null) );
      out.write("</h3>\n");
      out.write("    <h3>");
      out.print(session.getAttribute("loggedInUser") == null );
      out.write("</h3>\n");
      out.write("    \n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
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
