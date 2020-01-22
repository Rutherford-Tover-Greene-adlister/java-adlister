package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.Servlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.String;
import java.util.Arrays;
import static com.codeup.adlister.dao.DaoFactory.*;



@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/ads/editAd")
public class EditAdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String edit = request.getParameter("selectedAdEdit");
        System.out.println(edit);
        request.setAttribute("ad", DaoFactory.getAdsDao().findByID(edit));
        request.getRequestDispatcher("/WEB-INF/Ad/singleAd.jsp").forward(request, response);
    }  // doGet


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String ad_id = request.getParameter("adId");
        Long id = Long.parseLong(ad_id);
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        DaoFactory.getAdsDao().editAd(id, title, description);
        response.sendRedirect("/ads");
    }
}