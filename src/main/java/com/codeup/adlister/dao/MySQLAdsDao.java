package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Category> allCategories(){
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM categories");
            ResultSet rs = stmt.executeQuery();
            return createCategoriesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id,category_id, title, description) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            setCategoryId(ad);
            stmt.setLong(2, ad.getCategory_id());
            stmt.setString(3, ad.getTitle());
            stmt.setString(4, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getLong("category_id"),
                getCategoryName(rs.getLong("category_id")),
                rs.getString("title"),
                rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    private List<Category> createCategoriesFromResults(ResultSet rs) throws SQLException {
        List<Category> cats = new ArrayList<>();
        while (rs.next()) {
            cats.add(extractCategory(rs));
        }
        return cats;
    }

    private String getCategoryName(long category_id){
        String query = "SELECT * FROM categories WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, category_id);
             Category cat = extractCategory(stmt.executeQuery());
             return cat.getCategory();
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a category by its ID", e);
        }
    }

    private Category extractCategory(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new Category(
                rs.getLong("id"),
                rs.getString("category")
        );
    }

    private void setCategoryId(Ad ad){
        String category = ad.getCategoryName();
        String query = "SELECT * FROM categories WHERE category = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, category);
            Category cat = extractCategory(stmt.executeQuery());
            ad.setCategory_id(cat.getId());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding the id for the category", e);
        }
    }

    public static void main(String[] args) {
        System.out.println(DaoFactory.getAdsDao().allCategories());
    }


}
