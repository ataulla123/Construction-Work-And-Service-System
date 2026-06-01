<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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

<script>
function validateForm()
{
 if(document.frm.cmbcity.value=="")
    {
      alert("Select City");
      document.frm.cmbcity.focus();
      return false;
    }
	
	 if(document.frm.txtname.value=="")
    {
      alert("Enter User Name");
      document.frm.txtname.focus();
      return false;
    }
	
	if(document.frm.txtcont.value=="")
    {
      alert("Enter Mobile Number");
      document.frm.txtcont.focus();
      return false;
    }
	
	var mb1 = document.frm.txtcont.value;
	 if(isNaN(mb1)||mb1.indexOf(" ")!=-1)
           {
              alert("Enter Mobile In Digits")
              return false;
           }
		   if (mb1.length<10)
           {
                alert("Enter 10 Digits For Mobile Number");;
                return false;
           }
		   
		 if(document.frm.txtuid.value=="")
    {
      alert("Enter Userid");
      document.frm.txtuid.focus();
      return false;
    }  
		  
	 if(document.frm.txtpass.value=="")
    {
      alert("Enter Password");
      document.frm.txtpass.focus();
      return false;
    }
	
	 if(document.frm.txtadr.value=="")
    {
      alert("Enter Address");
      document.frm.txtadr.focus();
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
                            <li><a href="index.jsp">Home</a></li>                    
                            <li><a href="bregister.jsp">Builders Register</a></li>
                            <li><a href="wregister.jsp">Worker Register</a></li>
                            <li><a href="uregister.jsp">User Register</a></li>
							<li><a href="blogin.jsp">Builders Login</a></li>
                            <li><a href="wlogin.jsp">Worker Login</a></li>
							<li><a href="ulogin.jsp">User Login</a></li>
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
<tr ><td colspan="4" align="center" class="font_head">User Registration</td></tr>
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
<td class="font_normal">User Name :</td>
<td><input type="text" name="txtname" class="txt" ></td>

<td class="font_normal">Mobile Number :</td>
<td><input type="text" name="txtcont" maxlength="10"  class="txt" ></td>

</tr>

<tr><td colspan="2" align="center" height="10"></td></tr>

<tr>
<td class="font_normal">Create Userid :</td>
<td><input type="text" name="txtuid"  class="txt" ></td>
<td class="font_normal">Create password :</td>
<td><input type="password" name="txtpass" class="txt"></td>
</tr>

<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">Enter Address :</td>
<td colspan="3"><textarea class="txt2" name="txtadr" rows="4" cols="95"></textarea></td>
</tr> 
<tr><td colspan="2" align="center" height="10"></td></tr>

<tr><td></td><td align="left">
<input type="submit" value="Register" class="bttn">
</td><td></td><td></td></tr>
<tr><td colspan="2" align="center" height="80"></td></tr>
</table>
</form>
</td></tr>
		</table>
		
		</td></tr>
		</table>

<%
if(request.getMethod().equals("POST"))
{

String cont="",pass="",nam="",city="",adr="",uid="";
int ext=0,id=0;
city=request.getParameter("cmbcity");
nam=request.getParameter("txtname");
cont=request.getParameter("txtcont");
uid=request.getParameter("txtuid");
pass=request.getParameter("txtpass");
adr=request.getParameter("txtadr");

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();

ResultSet rs=smt.executeQuery("select * from registration where name='"+nam+"' and city='"+city+"'");
while(rs.next())
{
ext=1;
}

if(ext==1)
{
 out.println("<script language='javascript'> alert('Users's Name already there'); </script>");
}
else
{
smt.executeUpdate("insert into registration(typ,city,name,cont,uid,pass,adr)values('User','"+city+"','"+nam+"','"+cont+"','"+uid+"','"+pass+"','"+adr+"')");
out.println("<script language='javascript'> alert('User registerd successfully.'); </script>");
}
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
