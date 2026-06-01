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
<table width="45%"  align="center" border="0" bgcolor="#fff">
<tr><td colspan="2" align="center" height="100"></td></tr>
<tr ><td colspan="3" align="center" class="font_head">Search Building</td></tr>
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
						<td> <input type="submit" value="Search" class="bttn"></form></td>
<tr><td colspan="2" align="center" height="20"></td></tr>
</table>
<br>


<%
if(request.getMethod().equals("POST"))
{
String ct="";
int ext=0;
ct=request.getParameter("cmbcity");

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();
ResultSet rs=smt.executeQuery("select * from buildings where city='"+ct+"'");
while(rs.next())
{
ext=1;
}
if(ext==1)
{
%>

<table width="80%" align="center" bgcolor="#FFFFFF">
	  <tr>
				 <td colspan="8" align="center"><B>Building Details</B></td>
	  </tr>
	  
	  <tr><td height="10"></td></tr>
	 
	<tr bgcolor="#808000">  
	<td width="120"><div align="center"> <font color="#fff">City Name</font></div></td>
	<td width="160"><div align="center"> <font color="#fff">Area Name</font></div></td>
  		<td width="110"><div align="center"> <font color="#fff">Price</font></div></td>
		<td width="500"><div align="center"> <font color="#fff">Building Details</font></div></td>
		<td width="90"><div align="center"> <font color="#fff">Photo's </font></div></td>
		<td width="120"><div align="center"> <font color="#fff">Builder </font></div></td>
                 </tr> 
				 <tr><td colspan="2" height="5"></td></tr>
   <%
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con1=DriverManager.getConnection("Jdbc:Odbc:cwss");
		java.sql.Statement stmt1=con1.createStatement();
		ResultSet rs1=stmt1.executeQuery("select * from buildings where city='"+ct+"'");
		while(rs1.next())
		{
		int bdid=rs1.getInt("bdid");
		int rid=rs1.getInt("rid");
		String ar=rs1.getString("area");
		int pr=rs1.getInt("price");
		String det=rs1.getString("bdesc");

		
%>             <tr>
                
              <td  align="left"><div align="center"><%=ct%></div></td>
			   <td  align="left"><div align="center"><%=ar%></div></td>
			   <td  align="left"><div align="center"><%=pr%></div></td>
			   <td  align="left"><div align="center"><%=det%></div></td>
			  <td  align="left"><div align="center"><a target="_blank" href="bbphoto.jsp?bdid=<%=bdid%>" onclick="return confirm('Are you sure you want to see this Building Photo?');"><font color="#00FF00" size="3">Photo ?</font></a></div>
			     <td  align="left"><div align="center"><a target="_blank" href="builderdetals.jsp?rid=<%=rid%>" onclick="return confirm('Are you sure you want to see this Builder Details?');"><font color="#00FF00" size="3">Builder ?</font></a></div>
			  
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
out.println("<script language='javascript'> alert('No Building Found.'); </script>");
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
