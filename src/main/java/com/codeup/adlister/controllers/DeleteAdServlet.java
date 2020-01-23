package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/deleteAd")
    public class DeleteAdServlet extends HttpServlet {

    //Get for the intital page load. Returns a single ad
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Get the ad id
        request.getParameter("adId");

        //Get the ad for that specific id and set it "ads"

        request.setAttribute("ads", DaoFactory.getAdsDao().all());

        //Send data back to page
        request.getRequestDispatcher("/WEB-INF/ads/profile.jsp")
                .forward(request, response);
    }



        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String hiddenParam = req.getParameter("adDelete");

            long id = Long.parseLong(hiddenParam);
            DaoFactory.getAdsDao().deleteEntry(id);
            resp.sendRedirect("/profile");

        }
    }


