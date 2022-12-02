package sjsu.edu.market.dao;

import java.sql.*;

import sjsu.edu.market.connection.DBConnection;
import sjsu.edu.market.model.UsersLogin;
import sjsu.edu.market.model.UsersRegister;

public class RegisterDao {

    public static void registerUsers(UsersRegister users) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO USERS"
                + " (username, password, email, firstname, lastname, phone, address) VALUES "
                + " (?, ?, ?, ?, ?, ?, ?);";
        try (

                Connection connection = DBConnection.getConnection();

                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setString(1, users.getUsername());
            preparedStatement.setString(2, users.getPassword());
            preparedStatement.setString(3, users.getEmail());
            preparedStatement.setString(4, users.getFirstName());
            preparedStatement.setString(5, users.getLastName());
            preparedStatement.setString(6, users.getPhone());
            preparedStatement.setString(7, users.getAddress());
            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    users.setId(generatedKeys.getInt(1));
                }
                else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
            connection.commit();

        } catch (SQLException e) {
            System.out.println("Can't insert new user info into the database");
            printSQLException(e);
        }
    }

    public static void registerLogin() throws ClassNotFoundException, SQLException {
        String INSERT_LOGIN_SQL = "insert into LOGINUSERS select distinct(username), password from USERS"
                + " where NOT EXISTS(Select username from loginusers where loginusers.username = users.username)";

        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_LOGIN_SQL);

        preparedStatement1.execute();
        connection.commit();

    }

    public boolean findByUsername(String username) {

        String statementQuery = ("select count(*) from loginusers where user_name = ?");
        try (
                Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(statementQuery)) {
            preparedStatement.setString(1, username);
            ResultSet result = preparedStatement.executeQuery();

            if (result != null) {
                while (result.next()) {
                    if (result.getInt(1) == 1) {
                        return true;
                    }
                }
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    public boolean findByLogin(String username, String password) {
        String statementQuery = ("select password from loginusers where user_name = ?");
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(statementQuery)) {
            preparedStatement.setString(1, username);
            ResultSet result = preparedStatement.executeQuery();

            if (result != null) {
                while (result.next()) {
                    if (result.getString(1).equals(password)) {
                        return true;
                    }
                }
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    private static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}