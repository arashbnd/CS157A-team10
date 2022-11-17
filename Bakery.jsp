<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<html>
    <head>
        <meta charset="UTF-8">
    
        <link rel="stylesheet" href="ROOT/main.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <title>Bakery</title>
    </head>

<body>

<table border="1">
    <thead>
        <tr>
            <th>Product</th>
            <th>Discription</th>
            <th>Price</th>
        </tr>
    </thead>
   
    <tbody>
    <%
    String db = "BAHRAMIANDEHKORDI";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "root";
    

    java.sql.Connection con; 
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/BAHRAMIANDEHKORDI?autoReconnect=true&useSSL=false","root", "root");
    
    Statement stmt = con.createStatement();
   
    ResultSet rs = stmt.executeQuery("Select* from products");
    while(rs.next()){
 
    %>
    <tr>
        <td><%=rs.getString("Pname")%></td>
        <td><%=rs.getString("Description")%></td>
        <td><%=rs.getString("Price")%></td>
    </tr>
    <%
    }
    %>
    </tbody>
</body>
</html>