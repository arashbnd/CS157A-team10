<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>

    <p></br></p>

    <form action="" method="post">


      <body>
      <form action="login.jsp" method="post">

      User name :<input type="username" name="usr" />
      password :<input type="password" name="pwd" />
      <input type="submit" />

      </form>
      </body>


        <button type="submit" class="btn btn-primary"> submit </button>

          </form>


    <%@ page import ="java.sql.*" %>
    <%@ page import ="javax.sql.*" %>
    <%
    String userid=request.getParameter("user");
    session.putValue("userid",userid);

    String pwd=request.getParameter("pwd");
    Class.forName("com.mysql.jdbc.Driver");

    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenMart","root","root");
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery("select * from users where user_id='"+userid+"'");
        if(rs.next())
         {
     if(rs.getString(2).equals(pwd))
        {
        out.println("welcome shopping in GreenMart"+userid);

     }
         else
        {
           out.println("Invalid password try again");
        }
     }
    else
    %>