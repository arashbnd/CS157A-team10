<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>

    <p></br></p>

    <form action="" method="post">

        
        <div class="form-group">
            <label> Name </label>
            <input type="text" class="form-control" name="first_name" placeholder="your first name..."/>
        </div>

        // for adding last name into the employee db 

        <div class="form-group">
            <label> Last Name </label>
            <input type="text" class="form-control" name="last_name" placeholder="your last name..."/>
        </div>
      
        <div class="form-group">
            <label> email; </label>
            <input type="text" class="form-control" name="email" placeholder="your email addres..."/>
        </div>
       
        <button type="submit" class="btn btn-primary"> submit </button>
      
        
    </form>

</html>

<%
// prepare to store the same type of data
String a = request.getParameter("first_name");
String b = request.getParameter("last_name");

// add connection to db
String db = "Kuan";
String user; // assumes database name is the same as username
user = "root";
String password = "root";
PreparedStatement stmt = null;
try {
           
    java.sql.Connection con; 
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/BAHRAMIANDEHKORDI?autoReconnect=true&useSSL=false","root", "root");
    out.println(db + " database successfully opened.<br/><br/>");
    
    // insert command for db
    String data = "insert into employee(first_name, last_name) values(?,?)"; 
    
    stmt = con.prepareStatement(data);
    stmt.setString(1,a);
    stmt.setString(2,b);
    stmt.executeUpdate();
     // response.sendRedirect("JDBCdemo.jsp");
    }
 catch(SQLException e) 
{ 
    out.println("SQLException caught: " + e.getMessage()); 
}
   
%>