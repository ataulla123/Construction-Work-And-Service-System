<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>
<table width="700" align="center" bgcolor="#FFFFFF">
	  <tr>
				 <td colspan="5" align="center"><B>Work Details</B></td>
	  </tr>
	  
	  <tr><td height="10"></td></tr>
	 
	<tr bgcolor="#808000">  
	<td width="500"><div align="center"> <font color="#fff">Work Details</font></div></td>
	<td width="200"><div align="center"> <font color="#fff">Charges</font></div></td>
  		        </tr> 
				 <tr><td colspan="2" height="5"></td></tr>
   <%
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
		java.sql.Statement stmt=con.createStatement();
		ResultSet rs2=stmt.executeQuery("select * from workcharges where wrid="+request.getParameter("rid")+" order by wid");
while(rs2.next())
{
int wid= rs2.getInt("wid");
String tit= rs2.getString("wtit");
int fes= rs2.getInt("wfees");
%>             <tr>
                
              <td  align="left"><div align="center"> <%=tit%></div></td>
			   <td  align="left"><div align="center"><%=fes%></div></td>
			     
                </tr>
				<tr><td colspan="8" height="10"><hr></td></tr>
                <%
  

}
}
catch(Exception e)
{
out.println(e);
}

%>


	 </td>
	 </tr>
	 </table>
</body>
</html>
