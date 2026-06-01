<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>
<table width="800" align="center" bgcolor="#FFFFFF">
	  <tr>
				 <td colspan="8" align="center"><B>View Photo's</B></td>
	  </tr>
	  
	  <%
String uimg="";
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();
%>
<table border="0" cellpadding="0" cellspacing="0">
<%
int k=0;
int impkey=0;
ResultSet rs = smt.executeQuery("Select * from photos where bdid = "+request.getParameter("bdid"));
 while(rs.next())
 {
   impkey = rs.getInt("id");
   uimg = rs.getString("photo");
   if(k==0 || k%3 == 0)  { out.println("<tr>"); }
   k++;
%>
        <td><div style="padding:10px 10px 10px 10px;font-size:9pt;font-family:Arial">
          <a href="Photos/<%=uimg%>"><img border="0" src="Photos/<%=uimg%>" alt="" width="300" height="300" /></a>
		    </div></td>

<%
   if(k%4 == 0)  { out.println("</tr>"); }
 }
%>
</table>
<% 
   con.close();
}
catch(Exception ex)
{ 
 out.println(ex);
 }

%>

</body>
</html>
