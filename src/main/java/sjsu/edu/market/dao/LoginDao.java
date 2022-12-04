package sjsu.edu.market.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sjsu.edu.market.model.UsersLogin;
import sjsu.edu.market.connection.DBConnection;

public class LoginDao {
    public boolean checkUsers(UsersLogin loginUsers) throws ClassNotFoundException {
        boolean status = false;

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from loginusers where username = ? and password = ?");
            preparedStatement.setString(1, loginUsers.getUsername());
            preparedStatement.setString(2, loginUsers.getPassword());

            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            System.out.println("Wrong username or Wrong password");
            DBConnection.printSQLException(e);
        }
        return status;

    }
    public static UsersLogin findUser(Connection conn,
                                      String userName, String password) throws SQLException {

        String sql = "Select username, password from loginusers "
                + " where username = ? and password= ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            UsersLogin user = new UsersLogin();
            user.setUsername(userName);
            user.setPassword(password);

            return user;
        }
        return null;
    }

    public static UsersLogin findUser(Connection conn, String userName) throws SQLException {

        String sql = "Select username, password from loginusers "
                + " where username = ?";


        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);

        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            String password = rs.getString("Password");
            UsersLogin user = new UsersLogin();
            user.setUsername(userName);
            user.setPassword(password);

            return user;
        }
        return null;
    }


}