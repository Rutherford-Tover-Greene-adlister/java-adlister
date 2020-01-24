package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    Boolean checkUniqueUser(String username);
    User findByUserId (long id);

    void editProfile(long id, String username, String email);
}
