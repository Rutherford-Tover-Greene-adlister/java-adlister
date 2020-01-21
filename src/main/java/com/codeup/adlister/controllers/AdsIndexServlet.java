package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    private String searchCat = "all";
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!searchCat.equalsIgnoreCase("all")){
            request.setAttribute("ads",DaoFactory.getAdsDao().SearchByCategory(searchCat));
        }else {
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
        }
        request.setAttribute("catSelects", DaoFactory.getAdsDao().allCategories());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        searchCat = request.getParameter("catSort");
        response.sendRedirect("/ads");

    }
}
