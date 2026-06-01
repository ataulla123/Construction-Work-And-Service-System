<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>






<table width="900" align="center" bgcolor="#FFFFFF">
	  <tr>
				 <td colspan="8" align="center"><B>Builder Details</B></td>
	  </tr>
	  
	  <tr><td height="10"></td></tr>
	 
	<tr bgcolor="#808000">  
	<td width="120"><div align="center"> <font color="#fff">City Name</font></div></td>
	<td width="300"><div align="center"> <font color="#fff">Builder Name</font></div></td>
  		<td width="130"><div align="center"> <font color="#fff">Contact No</font></div></td>
		<td width="500"><div align="center"> <font color="#fff">Address</font></div></td>
		         </tr> 
				 <tr><td colspan="2" height="5"></td></tr>
   <%
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
		java.sql.Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from registration where rid="+request.getParameter("rid")+"");
		while(rs.next())
		{
		String ct=rs.getString("city");
		String nm=rs.getString("name");
	    String cont=rs.getString("cont");
		String adr=rs.getString("adr");

		
%>             <tr>
                
              <td  align="left"><div align="center"><%=ct%></div></td>
			   <td  align="left"><div align="center"><%=nm%></div></td>
			   <td  align="left"><div align="center"><%=cont%></div></td>
			   <td  align="left"><div align="center"><%=adr%></div></td>
			 
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
