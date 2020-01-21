package com.codeup.adlister.models;

public class Category {
    private long id;
    private String category;

    public Category(long id, String cat){
        this.id = id;
        this.category = cat;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String cat) {
        this.category = cat;
    }
}
