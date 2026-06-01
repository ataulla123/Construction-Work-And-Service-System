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
   
	
    if(document.frm.txtarea.value=="")
    {
      alert("Enter Area Name");
      document.frm.txtarea.focus();
      return false;
    }
	
		   
	 if(document.frm.txtprice.value=="")
    {
      alert("Enter Bilding Price");
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
      alert("Enter Bilding Details");
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
String des1="",area1="";
int price1=0;

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();
ResultSet rs=smt.executeQuery("select * from buildings where bdid="+request.getParameter("id")+"");
		while(rs.next())
		{
		 area1=rs.getString("area");
		 price1=rs.getInt("price");
		 des1=rs.getString("bdesc");
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
		
 <form name="frm" method="post" action="" onSubmit="return validateForm()">
<table width="95%"  align="center" border="0" bgcolor="#fff">
<tr><td colspan="2" align="center" height="100"></td></tr>
<tr ><td colspan="4" align="center" class="font_head">Edit Building Details</td></tr>
<tr><td colspan="2" align="center" height="10"></td></tr>


<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">Area Name :</td>
<td><input type="text" name="txtarea" value="<%=area1%>" class="txt"></td>

<td class="font_normal">Building Price :</td>
<td><input type="text" name="txtprice" class="txt" value="<%=price1%>"></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>
<tr>
<td class="font_normal">Building Details :</td>
<td colspan="3"><textarea class="txt2" name="txtdesc" rows="4" cols="94"><%=des1%></textarea></td>
</tr>
<tr><td colspan="2" align="center" height="10"></td></tr>

<tr><td></td><td align="left">
<input type="submit" value="Update" class="bttn">
</td><td></td><td></td></tr>
<tr><td colspan="4" align="center" height="120"></td></tr>

</table>
</form>
</td></tr>
		</table>
<br><br>
		
		</td></tr>
		</table>

<%
if(request.getMethod().equals("POST"))
{
String des="",area="";
int ext=0,price=0;

area=request.getParameter("txtarea");
des=request.getParameter("txtdesc");
price=Integer.parseInt(request.getParameter("txtprice"));
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();

smt.executeUpdate("update buildings set area='"+area+"',price="+price+",bdesc='"+des+"' where bdid="+request.getParameter("id")+"");

out.println("<script language='javascript'> alert('Building Details Updated Successfully.'); </script>");
con.close();
response.sendRedirect("buildingdetails.jsp");
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
