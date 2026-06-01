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
if(session.getAttribute("builder") == null)
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
                            <li><a href="bhome.jsp">Home</a></li>                    
                            <li><a href="buildingdetails.jsp">Building Details</a></li>
                            <li><a href="plotdetails.jsp">Plot Details</a></li>
                            <li><a href="userdetails.jsp">User Details</a></li>
							<li><a href="uploadphoto.jsp">Upload Photo's</a></li>
                            <li><a href="bpassword.jsp">Change Password</a></li>
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
<table width="95%"  align="center" border="0" bgcolor="#fff">
<tr><td colspan="2" align="center" height="100"></td></tr>


<tr><td colspan="4" align="center">
<table width="90%" align="center" bgcolor="#FFFFFF">
	<tr>
				 <td colspan="8" align="center"><B>User Details(New Building Plan)</B></td>
	  </tr>
	  
	  <tr><td height="10"></td></tr>
	 
	<tr bgcolor="#808000">  
	<td width="120"><div align="center"> <font color="#fff">City Name</font></div></td>
	<td width="200"><div align="center"> <font color="#fff">Budget</font></div></td>
  		<td width="300"><div align="center"> <font color="#fff">User Building Plan</font></div></td>
		<td width="200"><div align="center"> <font color="#fff">User Name</font></div></td>
		<td width="110"><div align="center"> <font color="#fff">Contact No</font></div></td>
		
		       </tr> 
				 <tr><td colspan="2" height="5"></td></tr>
   <%
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
		java.sql.Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select userbuilding.city,userbuilding.budget,userbuilding.bdesc,registration.name,registration.cont from userbuilding inner join registration on registration.rid=userbuilding.mrid where registration.typ='User'");
		while(rs.next())
		{

		String ct=rs.getString("city");
		String bd=rs.getString("budget");
		String det=rs.getString("bdesc");
		String nam=rs.getString("name");
		String cont=rs.getString("cont");

		
%>             <tr>
                
              <td  align="left"><div align="center"><%=ct%></div></td>
			   <td  align="left"><div align="center"><%=bd%></div></td>
			   <td  align="left"><div align="center"><%=det%></div></td>
			   <td  align="left"><div align="center"><%=nam%></div></td>
			   <td  align="left"><div align="center"><%=cont%></div></td>
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
	 <tr><td colspan="2" align="center" height="130"></td></tr>
	 </table>

</td></tr>
</table>
</form>
</td></tr>
		</table>
<br><br>
		
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
