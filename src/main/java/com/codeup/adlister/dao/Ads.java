package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    List<Ad> SearchByCategory(String category);
    List<Category> allCategories();

    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
}
