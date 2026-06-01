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
<script>
function validateForm()
{
    if(document.frm.cmbcity.value=="")
    {
      alert("Select City");
      document.frm.cmbcity.focus();
      return false;
    }
	
    if(document.frm.txtarea.value=="")
    {
      alert("Enter Area Name");
      document.frm.txtarea.focus();
      return false;
    }
	
		   
	 if(document.frm.txtprice.value=="")
    {
      alert("Enter Plot Price");
      document.frm.txtprice.focus();
      return false;
    }
	var mb1 = document.frm.txtprice.value;
	 if(isNaN(mb1)||mb1.indexOf(" ")!=-1)
           {
              alert("Enter Price in Numeric Only")
              return false;
           }  
		    if(mb1<1)
	 {
	alert("Enter Proper Price");
      document.frm.txtprice.focus();
      return false;
	 }
	 if(document.frm.txtdesc.value=="")
    {
      alert("Enter Plot Details");
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

<%
if(request.getMethod().equals("POST"))
{
String city="",des="",area="";
int ext=0,price=0;
city=request.getParameter("cmbcity");
area=request.getParameter("txtarea");
des=request.getParameter("txtdesc");
price=Integer.parseInt(request.getParameter("txtprice"));
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();

smt.executeUpdate("insert into plots(rid,city,area,price,pdesc)values("+session.getAttribute("builder")+",'"+city+"','"+area+"',"+price+",'"+des+"')");

out.println("<script language='javascript'> alert('Plot Details added Successfully.'); </script>");
con.close();

}
catch(Exception e)
{
out.println(e);
}
}
%>
        
		<table width="100%" border="1" bgcolor="#0000FF" height="200" align="center">
		
		<tr bgcolor="#ffcb0f">
		
		<td>
		<table width="80%" border="1" bgcolor="#0000FF" height="200" align="center">
		
		<tr bgcolor="#222533">
		
		<td>
		
 <form name="frm" method="post" action="" onSubmit="return validateForm()">
<table width="95%"  align="center" border="0" bgcolor="#fff">
<tr><td colspan="2" align="center" height="30"></td></tr>
<tr ><td colspan="4" align="center" class="font_head">Plot Details</td></tr>
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
                        </select></td><td></td><td></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">Area Name :</td>
<td><input type="text" name="txtarea" class="txt"></td>

<td class="font_normal">Plot Price :</td>
<td><input type="text" name="txtprice" class="txt"></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">Plot Details :</td>
<td colspan="3"><textarea class="txt2" name="txtdesc" rows="4" cols="94"></textarea></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>

<tr><td></td><td align="left">
<input type="submit" value="Save" class="bttn">
</td><td></td><td></td></tr>
<tr><td colspan="4" align="center" height="20"></td></tr>


<tr><td colspan="4" align="center">
<table width="90%" align="center" bgcolor="#FFFFFF">
	  <tr>
				 <td colspan="8" align="center"><B>View Plot Details</B></td>
	  </tr>
	  
	  <tr><td height="10"></td></tr>
	 
	<tr bgcolor="#808000">  
	<td width="120"><div align="center"> <font color="#fff">City Name</font></div></td>
	<td width="160"><div align="center"> <font color="#fff">Area Name</font></div></td>
  		<td width="110"><div align="center"> <font color="#fff">Price</font></div></td>
		<td width="500"><div align="center"> <font color="#fff">Plot Details</font></div></td>
		<td width="80"><div align="center"> <font color="#fff">Edit</font></div></td>
		 <td width="80"><div align="center"> <font color="#fff">Delete</font></div></td>
  
                 </tr> 
				 <tr><td colspan="2" height="5"></td></tr>
   <%
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
		java.sql.Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from plots where rid="+session.getAttribute("builder")+"");
		while(rs.next())
		{
		int id=rs.getInt("pid");
		String ct=rs.getString("city");
		String ar=rs.getString("area");
		int pr=rs.getInt("price");
		String det=rs.getString("pdesc");

		
%>             <tr>
                
              <td  align="left"><div align="center"><%=ct%></div></td>
			   <td  align="left"><div align="center"><%=ar%></div></td>
			   <td  align="left"><div align="center"><%=pr%></div></td>
			   <td  align="left"><div align="center"><%=det%></div></td>
			  <td  align="left"><div align="center"><a href="editplot.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Edit this Plot Details?');"><font color="#00FF00" size="3">Edit</font></a></div>
			     <td  align="left"><div align="center"><a href="deleteplot.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Delete this Plot Details?');"><font color="#ff0000" size="3">Delete</font></a></div>
                
                  
                  
                  
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
