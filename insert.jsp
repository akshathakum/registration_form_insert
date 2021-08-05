<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
  String FirstName =request.getParameter("FirstName");
  String LastName =request.getParameter("LastName");
  String Age =request.getParameter("Age");
  String Email =request.getParameter("Email");
  String Phoneno =request.getParameter("Phoneno");

try{
String connectionURL = "jdbc:mysql://localhost:3306/database1"; 

 Class.forName("com.mysql.jdbc.Driver").newInstance(); 
 Connection conn = DriverManager.getConnection(connectionURL, "root", " ");
 PreparedStatement ps =conn.prepareStatement("insert into registration(FirstName,LastName,Age,Email,Phoneno) values(?,?,?,?,?)");
 ps.setString(1,FirstName);
 ps.setString(2,LastName);
 ps.setString(3,Age);
 ps.setString(4,Email);
 ps.setString(5,Phoneno);
int x =ps.executeUpdate();
if (x>0)
{
out.println(" Registeration successfull, Data inserted in Mysql Workbench");
}
else
{
out.println("failed to insert to Database");
}

}
catch(Exception e)
{
out.println("failed to connect to MySql");
}


%>
