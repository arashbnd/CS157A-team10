<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="css/styles.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <title>Daily</title>
</head>

<body>

<table border="1">
    <thead>
    <tr>
        <th>Product</th>
        <th>Discription</th>
        <th>Price</th>
        <th>Add items</th>
    </tr>
    </thead>

    <tbody>
    <%
        String db = "vu";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "password";

        if(request.getParameter("addToCart")!=null) {
            session.setAttribute(request.getParameter("addToCart"), true);
        }


        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenMart?autoReconnect=true&useSSL=false",user, password);

        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery("Select* from products");
        while(rs.next()){

    %>
    <tr>

        <td><%=rs.getString("Pname")%></td>

        <td><%=rs.getString("Description")%></td>

        <td><%=rs.getString("Price")%></td>

        <td><form action="Daily.jsp">

            <input type="hidden" name="addToCart" value="<%=rs.getString("ProductID")%>">
            <input type="submit" value="Add">
        </form></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
