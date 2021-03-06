package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;
//import sun.security.krb5.Config;

//import javax.servlet.jsp.jstl.core.Config;
import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(

//                config.getUrl(),
//                config.getUsername(),
//                config.getPassword()

                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()

            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }


    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password")
        );
    }

    @Override
    public Boolean checkUniqueUser(String username){
//        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
//        try {
//            PreparedStatement stmt = connection.prepareStatement(query);
//            stmt.setString(1, username);
//            User errorCheck = extractUser(stmt.executeQuery());
//            return false;
//        } catch (SQLException e) {
//            return true;
//        }
        String query = "SELECT count(*) FROM users WHERE username = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()){
                int count = rs.getInt(1);
                if (count >= 1){
                    return true;
                }
            }
            return false;
        } catch (SQLException e) {
            throw new RuntimeException("Error checking if username is unique", e);
        }
//        final String queryCheck = "SELECT count(*) from messages WHERE msgid = ?";
//        final PreparedStatement ps = conn.prepareStatement(queryCheck);
//        ps.setString(1, msgid);
//        final ResultSet resultSet = ps.executeQuery();
//        if(resultSet.next()) {
//            final int count = resultSet.getInt(1);
//        }
    }

    @Override
    public User findByUserId(long id) {
        String query = "SELECT * FROM users WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            return extractUser(stmt.executeQuery());


        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by userId", e);
        }
    }

    @Override
    public void editProfile(long id, String username, String email) {
//        String query = "SELECT * FROM users UPDATE username=?, email = ?, id = ?";
        String query = "UPDATE users SET username=?, email=? where id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setLong(3, id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error editing the user profile", e);
        }


    }

    public static void main(String[] args) {
//        User user = new User("admin","randomemail","password");
        String username = "admin";
        System.out.println(DaoFactory.getUsersDao().checkUniqueUser(username));
    }


}
