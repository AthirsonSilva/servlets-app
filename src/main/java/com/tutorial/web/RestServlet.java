package com.tutorial.web;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

import static com.tutorial.web.UserRegister.userList;

@WebServlet(name = "RestServlet", value = "/api/v1/users")
public class RestServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        Gson gson = new Gson();
        String json = gson.toJson(userList);

        response.getWriter().append(json);
    }
}
