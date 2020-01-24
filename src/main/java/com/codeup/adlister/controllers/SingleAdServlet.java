package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(urlPatterns = "/ads/singleAd")
@WebServlet(urlPatterns = "/singleAd")
public class SingleAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long adId = Long.parseLong(request.getParameter("adId"));

        Ad singleAd = DaoFactory.getAdsDao().singleAd(adId);

        request.setAttribute("user", DaoFactory.getUsersDao().findByUserId(singleAd.getUserId()));
        request.setAttribute("ad", singleAd);
            // set path for category image
        request.setAttribute("image", DaoFactory.getAdsDao().getImageForCategory(singleAd.getCategory_id()));
        request.setAttribute("catData", DaoFactory.getAdsDao().allCategories());
        request.getRequestDispatcher("/WEB-INF/ads/singleAd.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String backBtn = request.getParameter("id");

        if (backBtn.equalsIgnoreCase("Back")){
            response.sendRedirect("/ads");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);

    }
}