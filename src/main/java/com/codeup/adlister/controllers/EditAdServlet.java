package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.String;


@WebServlet(urlPatterns = "/editAd")
public class EditAdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String edit = request.getParameter("adEdit");
        request.setAttribute("ad", DaoFactory.getAdsDao().findByID(edit));
        request.setAttribute("cats", DaoFactory.getAdsDao().allCategories());
        request.getRequestDispatcher("/WEB-INF/ads/editAd.jsp").forward(request, response);
    }


    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String cancelBtn = request.getParameter("id");
        if (cancelBtn.equalsIgnoreCase("cancel")){
            response.sendRedirect("/profile");
            return;
        }
        String ad_id = request.getParameter("id");
        Long id = Long.parseLong(ad_id);

        //set parameters for edit page
        String title = request.getParameter("title");
        Long category = Long.parseLong(request.getParameter("categories"));
        String description = request.getParameter("description");

        //redirect to the profile after updating
        DaoFactory.getAdsDao().editAd(id, title, category, description);
        response.sendRedirect("/profile");

    }

}