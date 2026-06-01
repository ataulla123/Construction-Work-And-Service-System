<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,javazoom.upload.*,java.util.*, java.io.*" errorPage="" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@page import="java.util.*,java.io.InputStream,java.net.URL,java.io.DataInputStream,java.io.BufferedInputStream" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@ page buffer="110kb" %>
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

<script type="text/javascript">
 function fill(){                 
var cmbbd = document.frm.cmbbd.value;
       window.location = 'http://localhost:8080/examples/CWSS/uploadphoto.jsp?cmbbd='+cmbbd;
        return false ;
  }

  </script>
  <script>
function validateForm()
{
    if(document.frm.cmbbd.value=="")
    {
      alert("Select Building Details");
      document.frm.cmbbd.focus();
      return false;
    }
	if(document.frm.cmbbd.value==0)
    {
      alert("Select Building Details");
      document.frm.cmbbd.focus();
      return false;
    }
	
    if(document.frm.uploadfile1.value=="")
    {
      alert("Select Photo");
      document.frm.uploadfile1.focus();
      return false;
    }
	}
	</script>

</head>

<body>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="c:/uploads" />
</jsp:useBean>
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
 if (MultipartFormDataRequest.isMultipartFormData(request))
{

   String photoname="";
  
   String file_name="";
   // Uses MultipartFormDataRequest to parse the HTTP request.
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
		 
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                Hashtable files = mrequest.getFiles();
                   UploadFile file1 = (UploadFile) files.get("uploadfile1");
					 
                    
					photoname = file1.getFileName();
					
				   
                    // Uses the bean now to store specified by jsp:setProperty at the to
                    upBean.store(mrequest, "uploadfile1");
					
               
	     }
         else out.println("<BR> todo="+todo);

//=======================================================================================
String desc;

		int id=0;
	
		
				
				try
				{
					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
					java.sql.Statement stm=con.createStatement();
                    ResultSet rs=stm.executeQuery("select max(id)as iid from photos");
					while(rs.next())
					{
					id=rs.getInt("iid"); 
					}
					id=id+1;
					
				File f1_photo = new File("c:/uploads/"+ photoname);
					String fphoto = f1_photo.getAbsolutePath();
					FileInputStream inStream_photo = new FileInputStream(fphoto);
                    int inBytes_photo = inStream_photo.available();
                    byte inBuf_photo[] = new byte[inBytes_photo];
                    int bytesread_photo = inStream_photo.read(inBuf_photo,0,inBytes_photo);
                    inStream_photo.close();
				    String fphoto1 = f1_photo.getAbsolutePath();


			    File fphotof = new File("../webapps/examples/CWSS/Photos/"+ id +"_" + photoname);
				fphoto1 =  id+ "_"+ photoname;
				FileOutputStream outStream_photo = new FileOutputStream(fphotof.getAbsolutePath());
                outStream_photo.write(inBuf_photo);
                outStream_photo.close();
			
					stm.executeUpdate("insert into photos(bdid,rid,photo)values("+Integer.parseInt(mrequest.getParameter("cmbbd"))+","+session.getAttribute("builder")+",'"+ fphoto1 +"')");
					
                 out.println("<script language='javascript'> alert('Photo Uploaded Successfully.') </script>");					
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
		
  <form name="frm" method="post" action="" onSubmit="return validateForm()" enctype="multipart/form-data">
	 <table width="95%"  align="center" border="0" bgcolor="#fff">
<tr><td colspan="2" align="center" height="30"></td></tr>
<tr ><td colspan="4" align="center" class="font_head">Upload Photo's</td></tr>
<tr><td colspan="2" align="center" height="10"></td></tr>

<tr>
<td class="font_normal">Select Building :</td>
<td colspan="3"> <select name="cmbbd" class="txt11" onChange="return fill()">
 <option value="0">Select Building</option>
                              <%
			      int cmbbd=0;
				 try
				 {
				 cmbbd=Integer.parseInt(request.getParameter("cmbbd"));
				 }
				 catch(Exception d)
				 {
				 }
			     try {
				       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					   Connection con = DriverManager.getConnection("Jdbc:Odbc:cwss");
					   java.sql.Statement stmt = con.createStatement();
					int pkey=0;
					   ResultSet rs = stmt.executeQuery("select * from buildings where rid="+session.getAttribute("builder")+" order by city");
					   while(rs.next())
					   {
						String ct="";
pkey=rs.getInt("bdid");
if(pkey==cmbbd)
{
ct="Selected";
}
else
{
ct="";
} 
					     %>
                              <option <%=ct%> value="<%=pkey%>">City : <%=rs.getString("city")%> &nbsp;&nbsp;&nbsp; Area :<%=rs.getString("area")%> &nbsp;&nbsp;&nbsp; Price :<%=rs.getString("price")%></option>
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
<tr><td colspan="2" align="center" height="20"></td></tr>
<tr>
<td class="font_normal">Upload Photo :</td>
<td ><input type="file" name="uploadfile1" size="34">
            <input type="hidden" name="todo" value="upload"></td>

<td class="font_normal"></td>
<td></td>
</tr>
<tr><td colspan="2" align="center" height="20"></td></tr>
<tr><td></td><td align="left">
<input type="submit" value="Save" class="bttn">
</td><td></td><td></td></tr>
<tr><td colspan="4" align="center" height="20"></td></tr>


<tr><td colspan="4" align="center">
<table width="90%" align="center" bgcolor="#FFFFFF">
	  <tr>
				 <td colspan="8" align="center"><B>View Photo's</B></td>
	  </tr>
	  
	  <%
String uimg="";
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cwss");
java.sql.Statement smt = con.createStatement();
%>
<table border="0" cellpadding="0" cellspacing="0">
<%
int k=0;
int impkey=0;
ResultSet rs = smt.executeQuery("Select * from photos where bdid = "+cmbbd);
 while(rs.next())
 {
   impkey = rs.getInt("id");
   uimg = rs.getString("photo");
   if(k==0 || k%3 == 0)  { out.println("<tr>"); }
   k++;
%>
        <td><div style="padding:10px 10px 10px 10px;font-size:9pt;font-family:Arial">
          <a href="Photos/<%=uimg%>"><img border="0" src="Photos/<%=uimg%>" alt="" width="200" height="200" /></a>
		  <br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="removep.jsp?id=<%=impkey%>" onclick="return confirm('Are you sure you want to Delete this Photo?');" class="style4"><font color="#FF0000" size="3">Remove ?</font></a>
           </div></td>

<%
   if(k%4 == 0)  { out.println("</tr>"); }
 }
%>
</table>
<% 
   con.close();
}
catch(Exception ex)
{ 
 out.println(ex);
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
