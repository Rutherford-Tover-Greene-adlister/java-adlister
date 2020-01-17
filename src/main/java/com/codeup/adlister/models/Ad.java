package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private long category_id;
    private String categoryName;
    private String title;
    private String description;

    public Ad(long id, long userId, long category_id, String categoryName, String title, String description) {
        this.id = id;
        this.userId = userId;
        this.category_id =category_id;
        this.categoryName = categoryName;
        this.title = title;
        this.description = description;
    }

    public Ad(long userId, long category_id, String title, String description) {
        this.userId = userId;
        this.category_id = category_id;
        this.title = title;
        this.description = description;
    }

    public Ad(long userId, String categoryName, String title, String description) {
        this.userId = userId;
        this.categoryName = categoryName;
        this.title = title;
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getCategory_id() { return category_id; }

    public void setCategory_id(long category_id) { this.category_id = category_id; }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
