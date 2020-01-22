package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/ads/deleteAd")
    public class DeleteAdServlet extends HttpServlet {

    //Get for the intital page load. Returns a single ad
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Get the ad id
        request.getParameter("adId");

        //Get the ad for that specific id and set it "ads"

        request.setAttribute("ads", DaoFactory.getAdsDao().all());

        //Send data back to page
        request.getRequestDispatcher("/WEB-INF/ads/singleAd.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)  throws IOException {
        //get the id
//        String x = req.getParameter("adid");
        Long req1 = Long.parseLong(req.getParameter("adId"));

        //call the delete method from adsDao and pass it the id
        DaoFactory.getAdsDao().deleteEntry(req1);

        //after deleting take user back to the ads page
        resp.sendRedirect("/ads");

        }
    }
