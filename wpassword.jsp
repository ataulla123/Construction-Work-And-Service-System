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
    if(document.frm.txtoldpass.value=="")
    {
      alert("Enter Old Password");
      document.frm.txtoldpass.focus();
      return false;
    }
	
    if(document.frm.txtnewpass.value=="")
    {
      alert("Enter New Password");
      document.frm.txtnewpass.focus();
      return false;
    }
	
		   
	 if(document.frm.txtrepass.value=="")
    {
      alert("Enter Confirm Password");
      document.frm.txtrepass.focus();
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


       
		<table width="100%" border="1" bgcolor="#0000FF" height="200" align="center">
		
		<tr bgcolor="#ffcb0f">
		
		<td>
		<table width="80%" border="1" bgcolor="#0000FF" height="200" align="center">
		
		<tr bgcolor="#222533">
		
		<td>
		
 <form name="frm" method="post" action="" onSubmit="return validateForm()">
<table width="40%"  align="center" border="0" bgcolor="#fff">
<tr><td colspan="2" align="center" height="100"></td></tr>
<tr ><td colspan="2" align="center" class="font_head">Change Password</td></tr>
<tr><td colspan="2" align="center" height="10"></td></tr>

<tr>
<td class="font_normal">Old Password :</td>
<td><input type="password" name="txtoldpass"  class="txt" ></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">New password :</td>
<td><input type="password" name="txtnewpass" class="txt"></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">Confirm password :</td>
<td><input type="password" name="txtrepass" class="txt"></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>

<tr><td></td><td align="left">
<input type="submit" value="Change" class="bttn">
</td><td></td><td></td></tr>
<tr><td colspan="2" align="center" height="160"></td></tr>
</table>
</form>
</td></tr>
		</table>
		
		</td></tr>
		</table>

<%
if(request.getMethod().equals("POST"))
{
String oldpass="",newpass="",repass="";
int ext=0;
oldpass=request.getParameter("txtoldpass");
newpass=request.getParameter("txtnewpass");
repass=request.getParameter("txtrepass");
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();
ResultSet rs=smt.executeQuery("select * from registration where pass='"+oldpass+"' and rid="+session.getAttribute("worker")+"");
while(rs.next())
{
ext=1;
}
if((ext==1) && (newpass.equals(repass)))
{
smt.executeUpdate("Update registration set pass='"+newpass+"' where rid="+session.getAttribute("worker")+"");
out.println("<script language='javascript'> alert('Password Updated Successfully.'); </script>");
}
else
{
out.println("<script language='javascript'> alert('Password Cannot be Changed.'); </script>");
}
con.close();

}
catch(Exception e)
{
out.println(e);
}
}
%>
                      	      

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
