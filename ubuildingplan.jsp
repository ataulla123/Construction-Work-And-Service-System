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
<script>
function validateForm()
{
	
    if(document.frm.txtbud.value=="")
    {
      alert("Enter Your Budget");
      document.frm.txtbud.focus();
      return false;
    }
	
		   
	 if(document.frm.txtdesc.value=="")
    {
      alert("Enter your Building Plan");
      document.frm.txtdesc.focus();
      return false;
    }
	}
	</script>

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
<table width="85%"  align="center" border="0" bgcolor="#fff">
<tr><td colspan="2" align="center" height="100"></td></tr>
<tr ><td colspan="2" align="center" class="font_head">My Building Plan</td></tr>
<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">Select City :</td>
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
						</tr>
						<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">Enter Budget :</td>
<td><input type="text" name="txtbud" class="txt"></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal"><font color="#fff">Building Plan :</font></td>
<td><textarea class="txt2" name="txtdesc" rows="4" cols="95"></textarea></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>

<tr><td></td><td align="left">
<input type="submit" value="Save" class="bttn">
</td><td></td><td></td></tr>


<%
if(request.getMethod().equals("POST"))
{
String des="",bud="",ct="";
int ext=0;
des=request.getParameter("txtdesc");
bud=request.getParameter("txtbud");
ct=request.getParameter("cmbcity");
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();

smt.executeUpdate("insert into  userbuilding(mrid,city,budget,bdesc)values("+session.getAttribute("user")+",'"+ct+"','"+bud+"','"+des+"')");
out.println("<script language='javascript'> alert('My Building Plan Added Successfully.'); </script>");
con.close();

}
catch(Exception e)
{
out.println(e);
}
}
%>
                      	      
<tr><td colspan="4" align="center" height="20"></td></tr>


<tr><td colspan="4" align="center">
<table width="90%" align="center" bgcolor="#FFFFFF">
	  <tr>
				 <td colspan="8" align="center"><B>My Building Plan</B></td>
	  </tr>
	  
	  <tr><td height="10"></td></tr>
	 
	<tr bgcolor="#808000">  
	<td width="120"><div align="center"> <font color="#fff">City Name</font></div></td>
	<td width="160"><div align="center"> <font color="#fff">Budget</font></div></td>
  		<td width="500"><div align="center"> <font color="#fff">My Building Plan</font></div></td>
		 <td width="100"><div align="center"> <font color="#fff">Delete</font></div></td>
  
                 </tr> 
				 <tr><td colspan="2" height="5"></td></tr>
   <%
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
		java.sql.Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from userbuilding where mrid="+session.getAttribute("user")+"");
		while(rs.next())
		{
		int mid=rs.getInt("mid");
		String ct1=rs.getString("city");
		String bd1=rs.getString("budget");
		String det1=rs.getString("bdesc");

		
%>             <tr>
                
              <td  align="left"><div align="center"><%=ct1%></div></td>
			   <td  align="left"><div align="center"><%=bd1%></div></td>
			   <td  align="left"><div align="center"><%=det1%></div></td>
			     <td  align="left"><div align="center"><a href="deleteuserplan.jsp?mid=<%=mid%>" onclick="return confirm('Are you sure you want to Delete this Building Plan?');"><font color="#ff0000" size="3">Delete</font></a></div>
                
                  
                  
                  
                  </td>
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
