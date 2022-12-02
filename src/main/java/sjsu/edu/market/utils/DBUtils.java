package sjsu.edu.market.utils;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sjsu.edu.market.model.UsersLogin;
import sjsu.edu.market.model.UsersRegister;

public class DBUtils {

    public static UsersLogin findUser(Connection conn,
                                      String userName, String password) throws SQLException {

        String sql = "Select username, password from LOGINUSERS " //
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

        String sql = "Select username, password from LOGINUSERS "
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