package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {

    //find an ad by its id
    Ad findByID(String id);

    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    //Gets a single Add
    Ad singleAd(long id);

    //delete an Ad
    void deleteEntry(long id);

    //edit an Ad
    void editAd (long id, String title, String description);





}
