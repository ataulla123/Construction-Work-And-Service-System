<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page buffer="224" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Construction Work & Service </title>
<style type="text/css">
<%@ include file="bootstrap.min.css"%>
<%@ include file="custom-font/fonts.css"%>
<%@ include file="font-awesome.min.css"%>
<%@ include file="bootsnav.css"%>
<%@ include file="custom.css"%>
<%@ include file="jquery.fancybox.css"%>

</style>
<%
if(session.getAttribute("user") == null)
	{
	response.sendRedirect("index.jsp");
    }	 
%>
</head>

<body>

        <header>
            <!-- Top Navbar -->
            <div class="top_nav">
                <div class="container">
                    <ul class="list-inline info">
                       
                    </ul>
                    <ul class="list-inline social_icon">
                        
                    </ul>			
                </div>
            </div><!-- Top Navbar end -->

            <!-- Navbar -->
            <nav class="navbar bootsnav">
                <!-- Top Search -->
                <div class="top-search">
                    <div class="container">
                        <div class="input-group">
                            </div>
                    </div>
                </div>

                <div class="container">
                    <!-- Atribute Navigation -->
                    <div class="attr-nav">
                        
                    </div>
                    <!-- Header Navigation -->
                    <div class="navbar-header">
                        
                        <a class="navbar-brand" href=""><img class="logo" src="images/logo1.png" alt=""></a>
                    </div>
                    <!-- Navigation -->
                   <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav menu">
                            <li><a href="uhome.jsp">Home</a></li>                    
                            <li><a href="usearchbuiding.jsp">Search Building</a></li>
							<li><a href="usearchplot.jsp">Search Plot</a></li>
							<li><a href="usearchworker.jsp">Search Worker</a></li>
                          <li><a href="ubuildingplan.jsp">My Building Plan</a></li>
                            <li><a href="upassword.jsp">Change Password</a></li>
							<li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div>   
            </nav><!-- Navbar end -->
        </header><!-- Header end -->


        
		<table width="100%" border="1" bgcolor="#0000FF" height="200" align="center">
		
		<tr bgcolor="#ffcb0f">
		
		<td>
		<table width="80%" border="1" bgcolor="#0000FF" height="200" align="center">
		
		<tr bgcolor="#222533">
		
		<td>
		
 <form name="frm" method="post" action="" onSubmit="return validateForm()">
<table width="80%"  align="center" border="0" bgcolor="#fff">
<tr><td colspan="2" align="center" height="100"></td></tr>
<tr ><td colspan="5" align="center" class="font_head">Search Worker</td></tr>
<tr><td colspan="2" align="center" height="10"></td></tr>

<tr>
<td class="font_normal">City Name :</td>
<td> <select name="cmbcity" class="txt1">
                              <%
			     
			     try {
				       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					   Connection con = DriverManager.getConnection("Jdbc:Odbc:cwss");
					   java.sql.Statement stmt = con.createStatement();
					
					   ResultSet rs = stmt.executeQuery("select * from citymaster order by city");
					   while(rs.next())
					   {
						 			 
					     %>
                              <option><%=rs.getString("city")%></option>
                              <%
				      }
					  con.close();
					  }
					    catch(Exception e)
						 {
						    out.println(e);
							}
				   
               %>
                        </select></td>
						<td class="font_normal">Select Category :</td>
<td><font color="#000">
<select name="cmbcat" class="txt1">
<option>Electrician</option>
<option>Interior designer</option>
<option>Plumber </option>
<option>Other</option>
</select>
</font></td>
						<td> <input type="submit" value="Search" class="bttn"></form></td>
<tr><td colspan="2" align="center" height="20"></td></tr>
</table>
<br>


<%
if(request.getMethod().equals("POST"))
{
String ct="",cat="";
int ext=0;
ct=request.getParameter("cmbcity");
cat=request.getParameter("cmbcat");
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();
ResultSet rs=smt.executeQuery("select * from registration where rtyp='"+cat+"' and city='"+ct+"'");
while(rs.next())
{
ext=1;
}
if(ext==1)
{
%>

<table width="90%" align="center" bgcolor="#FFFFFF">
	  <tr>
				 <td colspan="8" align="center"><B>Worker Details</B></td>
	  </tr>
	  
	  <tr><td height="10"></td></tr>
	 
	<tr bgcolor="#808000">  
	<td width="120"><div align="center"> <font color="#fff">City Name</font></div></td>
	<td width="130"><div align="center"> <font color="#fff">Category</font></div></td>
  		<td width="300"><div align="center"> <font color="#fff">Worker Name</font></div></td>
		<td width="120"><div align="center"> <font color="#fff">Contact No</font></div></td>
		<td width="500"><div align="center"> <font color="#fff">Address</font></div></td>
		<td width="170"><div align="center"> <font color="#fff">Work Details </font></div></td>
		<td width="120"><div align="center"> <font color="#fff">Feedback </font></div></td>
		
                 </tr> 
				 <tr><td colspan="2" height="5"></td></tr>
   <%
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con1=DriverManager.getConnection("Jdbc:Odbc:cwss");
		java.sql.Statement stmt1=con1.createStatement();
		ResultSet rs1=stmt1.executeQuery("select * from registration where rtyp='"+cat+"' and city='"+ct+"'");
while(rs1.next())
		{
		int rid=rs1.getInt("rid");
		String nam=rs1.getString("name");
		String cnt=rs1.getString("cont");
		String adr=rs1.getString("adr");

		
%>             <tr>
                
              <td  align="left"><div align="center"><%=ct%></div></td>
			   <td  align="left"><div align="center"><%=cat%></div></td>
			   <td  align="left"><div align="center"><%=nam%></div></td>
			   <td  align="left"><div align="center"><%=cnt%></div></td>
			    <td  align="left"><div align="center"><%=adr%></div></td>
			  <td  align="left"><div align="center"><a target="_blank" href="uworkdetails.jsp?rid=<%=rid%>" onclick="return confirm('Are you sure you want to see this Worker Work Details?');"><font color="#00FF00" size="3">Work Details ?</font></a></div>
			   <td  align="left"><div align="center"><a target="_blank" href="ufeedback.jsp?rid=<%=rid%>" onclick="return confirm('Are you sure you want to see this Worker Feedback?');"><font color="#00FF00" size="3">Feedback ?</font></a></div>
			   
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

<%
}
else
{
out.println("<script language='javascript'> alert('No Worker Found.'); </script>");
}
con.close();

}
catch(Exception e)
{
out.println(e);
}
}
%>
                      	      
<tr><td></td><td align="left">

</td><td></td><td></td></tr>

</table>

</td></tr>
		</table>
		
		</td></tr>
		</table>
        <!-- Contact form -->
        
        <!-- JavaScript -->
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <!-- Bootsnav js -->
        <script src="js/bootsnav.js"></script>

        <!-- JS Implementing Plugins -->
        <script src="js/isotope.js"></script>
        <script src="js/isotope-active.js"></script>
        <script src="js/jquery.fancybox.js?v=2.1.5"></script>

        <script src="js/jquery.scrollUp.min.js"></script>

        <script src="js/main.js"></script>
    </body>	
</html>	
