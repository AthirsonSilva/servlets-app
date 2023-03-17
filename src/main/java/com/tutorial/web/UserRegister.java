package com.tutorial.web;

import com.github.javafaker.Faker;
import com.tutorial.entity.UserEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.stream.Stream;

@WebServlet(name = "UserRegister", value = "/users")
public class UserRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Faker faker = new Faker();
    public static final ArrayList<UserEntity> userList = new ArrayList<>();

    static {
        Stream.generate(() -> new UserEntity(
                UUID.randomUUID(),
                faker.name().fullName(),
                faker.internet().emailAddress()
        )).limit(40).forEach(userList::add);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("username");
        String email = req.getParameter("email");

        userList.add(new UserEntity(
                UUID.randomUUID(),
                name,
                email
        ));

        req.setAttribute("users", userList);

        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");

        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("users", userList);

        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");

        dispatcher.forward(req, resp);
    }
}
