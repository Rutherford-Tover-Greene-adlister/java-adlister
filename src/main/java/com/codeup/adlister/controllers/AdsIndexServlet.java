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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("searchCat");
        if(category != null || !category.equalsIgnoreCase("all")){

            request.setAttribute("ads",DaoFactory.getAdsDao().SearchByCategory(category));
        }else {
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
        }
//        String cat = request.getSession().getAttribute("searchCat");
        request.setAttribute("catSelects", DaoFactory.getAdsDao().allCategories());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String category = request.getParameter("catSort");
//        request.getSession().setAttribute("searchCat", category);

        String redirectVal = "/ads?searchCat=" + category;
        response.sendRedirect(redirectVal);

    }
}
