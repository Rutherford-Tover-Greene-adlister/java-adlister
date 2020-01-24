package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/create")
public class CreateAdServlet extends HttpServlet {
    private String titleReload = null;
    private String descriptionReload = null;
    private String categoryReload = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lastURL = request.getHeader("referer");
        if (!lastURL.equalsIgnoreCase("http://localhost:8080/ads/create")){
            titleReload = null;
            descriptionReload = null;
            categoryReload = null;
        }

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        request.setAttribute("title",titleReload);
        request.setAttribute("description",descriptionReload);
        request.setAttribute("categories",categoryReload);


        request.setAttribute("cats", DaoFactory.getAdsDao().allCategories());
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        titleReload = null;
        descriptionReload = null;
        categoryReload = null;

        User user = (User) request.getSession().getAttribute("user");
        String titleInput = request.getParameter("title");
        String descriptionInput = request.getParameter("description");
        String categoryInput = request.getParameter("categories");

        boolean inputHasErrors = titleInput.isEmpty()||
                descriptionInput.isEmpty()||
                categoryInput.isEmpty();

        if (inputHasErrors){
            if (!titleInput.isEmpty()){
                titleReload = titleInput;
            }
            if (!descriptionInput.isEmpty()){
                descriptionReload = descriptionInput;
            }
            if (!categoryInput.isEmpty()){
                categoryReload = categoryInput;
            }
            request.setAttribute("messageError","input error");
            response.sendRedirect("/ads/create");
            return;
        }

        Ad ad = new Ad(
                user.getId(),
                categoryInput,
                titleInput,
                descriptionInput
        );
        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads");
    }
}
