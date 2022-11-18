<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>JDBC Connection example</title>
    </head>
  <body>
    <h1>JDBC Connection example</h1>
    <div class ="greenmart-reg">
        <form action = "">
            <div class="greenmart-reg-input-container">
                <label for ="">Name</label>
                <input placeholder="Name" NAME = "user-name-reg" type = string>
            </div>
            <div class="greenmart-reg-input-container">
                <label for ="">Password</label>
                <input placeholder="Password" NAME = "user-name-reg" type = string>
            </div>
            <div class="greenmart-reg-input-container">
                <label for ="">E-mail</label>
                <input placeholder="E-mail" NAME = "user-name-reg" type = string>
            </div>
        </form>
    </div>
    <% 
        String db = "GreenMart";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "rootpass";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenMart?autoReconnect=true&useSSL=false",user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("Initial entries in table \"emp\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM emp");
            while (rs.next()) {
                out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3) + "<br/><br/>");
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
