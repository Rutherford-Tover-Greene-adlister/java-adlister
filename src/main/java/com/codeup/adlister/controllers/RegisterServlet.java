package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    private User failedRegister;
    private boolean userFail = false;
    private boolean passwordFail = false;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lastURL = request.getHeader("referer");
        if (!lastURL.equalsIgnoreCase("http://localhost:8080/register")){
            failedRegister = null;
        }
//        request.setAttribute("lastPage", lastURL);
        request.setAttribute("reloadUser",failedRegister);
        if (failedRegister != null){
            request.setAttribute("username",failedRegister.getUsername());
            request.setAttribute("email",failedRegister.getEmail());
            request.setAttribute("password",failedRegister.getDisplayPassword());
            request.setAttribute("confirm_password",failedRegister.getDisplayConfirmPassword());
            request.setAttribute("userFail", userFail);
            request.setAttribute("passwordFail",passwordFail);

        }

        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        state or reset
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        userFail = false;
        passwordFail = false;

        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (!password.equals(passwordConfirmation))
                || DaoFactory.getUsersDao().checkUniqueUser(username);

        if (inputHasErrors) {
//            alert goes here
            failedRegister = new User(username,email,password,passwordConfirmation);
            if (DaoFactory.getUsersDao().checkUniqueUser(username)){
                userFail = true;
            }
            if (!password.equals(passwordConfirmation)){
                passwordFail = true;
            }
            request.setAttribute("messageError","input error");
            response.sendRedirect("/register");
            return;
        }

        // create and save a new user
            User user = new User(username, email, password);
            failedRegister = null;
            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/login");

    }
}
