<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>Home Page</title>
    <meta charset="UTF-8">
    <jsp:include page="/shared/style_import.jsp" />
</head>

<body>
<!-----------------------------MENU BAR (START)------------------------------------------->
<header>
    <jsp:include page="../header.jsp" />
</header>

<body>
<table border="1">
        <%
                String user; // assumes database name is the same as username
                user = "root";
                String password = "root";
                try {

                    java.sql.Connection con;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenMart?autoReconnect=true&useSSL=false",user, password);
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM GreenMart.Category;");
                    while (rs.next()) {
                        int ID = rs.getInt("CategoryID");
                        String Name = rs.getString("CName");
                        String Photo = rs.getString("DescripPhoto");
                        String Add = rs.getString("CatAdd");
                        %>
    <div>
        <a href=<%=Add%> class="categories"> <img src = <%=Photo%>> <h3><%=Name%></h3></a>
    </div>
        <%
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } catch(SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
                }
            %>

</body>
</html>
