<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
<script>
function validateForm()
{
    if(document.frm.txtmsg.value=="")
    {
      alert("Enter Feedback Message");
      document.frm.txtmsg.focus();
      return false;
    }
	
	}
	</script>
	<style type="text/css">
<%@ include file="bootstrap.min.css"%>
<%@ include file="custom-font/fonts.css"%>
<%@ include file="font-awesome.min.css"%>
<%@ include file="bootsnav.css"%>
<%@ include file="custom.css"%>
<%@ include file="jquery.fancybox.css"%>

</style>
</head>

<body>
<%
if(request.getMethod().equals("POST"))
{
String mg="";
mg=request.getParameter("txtmsg");

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();

smt.executeUpdate("insert into feedback(rrfd,rrtd,fmsg)values("+session.getAttribute("user")+","+request.getParameter("rid")+",'"+mg+"')");
out.println("<script language='javascript'> alert('Feedback Given Successfully.'); </script>");
con.close();

}
catch(Exception e)
{
out.println(e);
}
}
%>
<table width="80%" border="0"  align="center">
		
		<tr>
		
		<td>
		
 <form name="frm" method="post" action="" onSubmit="return validateForm()">
<table width="90%"  align="center" border="0" >

<tr ><td colspan="2" align="center" class="font_head"><font color="#000000">Give Feedback</font></td></tr>
<tr><td colspan="2" align="center" height="10"></td></tr>

<tr>
<td class="font_normal"><font color="#000000">Message :</font></td>
<td><textarea class="txt2" name="txtmsg" rows="4" cols="95"></textarea></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>

<tr><td></td><td align="left">
<input type="submit" value="Send" class="bttn">
</td><td></td><td></td></tr>
<tr><td colspan="2" align="center" height="40"></td></tr>
</table>
</form>
</td></tr>
		</table>
		

<table width="900" align="center" bgcolor="#FFFFFF">
	  <tr>
				 <td colspan="8" align="center"><B><font color="#000000">Worker Feedback</font></B></td>
	  </tr>
	  
	  <tr><td height="10"></td></tr>
	 
	<tr bgcolor="#808000">  
	<td width="250"><div align="center"> <font color="#fff">User Name</font></div></td>
	<td width="500"><div align="center"> <font color="#fff">Feedback</font></div></td>
  		         </tr> 
				 <tr><td colspan="2" height="5"></td></tr>
   <%
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
		java.sql.Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select *,registration.name from feedback inner join registration on registration.rid=feedback.rrfd where rrtd="+request.getParameter("rid")+"");
		while(rs.next())
		{
		String msg=rs.getString("fmsg");
		String nm=rs.getString("name");
	    %>     <tr>
                
              <td  align="left"><div align="center"><font color="#000000"><%=nm%></font></div></td>
			   <td  align="left"><div align="center"><font color="#000000"><%=msg%></font></div></td>
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
