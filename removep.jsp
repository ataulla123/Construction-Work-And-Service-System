<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,javazoom.upload.*,java.util.*, java.io.*" errorPage="" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@page import="java.util.*,java.io.InputStream,java.net.URL,java.io.DataInputStream,java.io.BufferedInputStream" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>
<%
try                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
{
int img=0;
String mg="";
img=Integer.parseInt(request.getParameter("id"));
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();
ResultSet rs = smt.executeQuery("Select * from photos where id = "+img+"");
 while(rs.next())
 {
 mg=rs.getString("photo");
 }
smt.executeUpdate("delete from photos where id="+img+"");
con.close();
 File f = new File("../webapps/examples/CWSS/Photos/"+mg);
                       f.delete();	
response.sendRedirect("uploadphoto.jsp");
}
catch(Exception e)
{
out.println(e);
}

%>
</body>
</html>
