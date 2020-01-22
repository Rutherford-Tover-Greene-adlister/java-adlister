package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

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

        request.setAttribute("ad", DaoFactory.getAdsDao().singleAd(adId));
        request.getRequestDispatcher("/WEB-INF/ads/singleAd.jsp").forward(request, response);
    }
}