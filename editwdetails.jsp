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
if(session.getAttribute("worker") == null)
	{
	response.sendRedirect("index.jsp");
    }	 
%>
<script>
function validateForm()
{
    if(document.frm.txtdet.value=="")
    {
      alert("Enter Work Details");
      document.frm.txtdet.focus();
      return false;
    }
	if(document.frm.txtamt.value=="")
    {
      alert("Enter Charges");
      document.frm.txtamt.focus();
      return false;
    } 
	var mb1 = document.frm.txtamt.value;
	 if(isNaN(mb1)||mb1.indexOf(" ")!=-1)
           {
              alert("Enter Charges in Numeric Only")
              return false;
           }  
		    if(mb1<1)
	 {
	alert("Enter Proper Charges");
      document.frm.txtamt.focus();
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
                            <li><a href="whome.jsp">Home</a></li>                    
                            <li><a href="wdetails.jsp">Work Details</a></li>
                            <li><a href="wfeedback.jsp">Feedback</a></li>
                            <li><a href="wpassword.jsp">Change Password</a></li>
							<li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div>   
            </nav><!-- Navbar end -->
        </header><!-- Header end -->


       <%
	   int fs=0;
	   String tt="";
	   int wd=0;
	   wd=Integer.parseInt(request.getParameter("wid"));
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
		java.sql.Statement stmt=con.createStatement();
		ResultSet rs2=stmt.executeQuery("select * from workcharges where wid="+wd+"");
while(rs2.next())
{
 tt= rs2.getString("wtit");
 fs= rs2.getInt("wfees");
 }
con.close();
 }
catch(Exception e)
{
out.println(e);
}
%>  
		<table width="100%" border="1" bgcolor="#0000FF" height="200" align="center">
		
		<tr bgcolor="#ffcb0f">
		
		<td>
		<table width="80%" border="1" bgcolor="#0000FF" height="200" align="center">
		
		<tr bgcolor="#222533">
		
		<td>
		<%
if(request.getMethod().equals("POST"))
{
String det="",cat;
int ext=0,amt=0;
det=request.getParameter("txtdet");
amt=Integer.parseInt(request.getParameter("txtamt"));
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();
smt.executeUpdate("update workcharges set wtit='"+det+"',wfees="+amt+" where wid="+wd+"");
out.println("<script language='javascript'> alert('Work Details Updated Successfully.'); </script>");
response.sendRedirect("wdetails.jsp");
con.close();

}
catch(Exception e)
{
out.println(e);
}
}
%>

 <form name="frm" method="post" action="" onSubmit="return validateForm()">
<table width="60%"  align="center" border="0" bgcolor="#fff">
<tr><td colspan="2" align="center" height="100"></td></tr>
<tr ><td colspan="2" align="center" class="font_head">Edit Work Details</td></tr>
<tr><td colspan="2" align="center" height="10"></td></tr>


<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">Work Details :</td>
<td><font color="#000"><textarea name="txtdet" rows="3" cols="40"><%=tt%></textarea></font></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">Work Charges :</td>
<td><input type="text" name="txtamt" class="txt" value="<%=fs%>"></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>


<tr><td></td><td align="left">
<input type="submit" value="Update" class="bttn">
</td><td></td><td></td></tr>
<tr><td colspan="2" align="center" height="20"></td></tr>

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
