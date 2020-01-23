package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/ads/singleAd")
public class SingleAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long adId = Long.parseLong(request.getParameter("adId"));

        Ad singleAd = DaoFactory.getAdsDao().singleAd(adId);
        request.setAttribute("user", DaoFactory.getUsersDao().findByUserId(singleAd.getUserId()));
        request.setAttribute("ad", singleAd);
        request.setAttribute("catData", DaoFactory.getAdsDao().allCategories());
        request.getRequestDispatcher("/WEB-INF/ads/singleAd.jsp").forward(request, response);
    }
}