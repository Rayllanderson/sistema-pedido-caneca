package com.ray.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ray.model.dao.AdminRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.entities.Admin;

@WebServlet("/login")
public class LoginServlet2 extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AdminRepository repository = RepositoryFactory.createAdminDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/plain");
	response.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	System.out.println(username + " " + password);
	Admin admin = new Admin(null, username, password);
	admin = repository.Login(admin);
	if (admin != null) {
	    HttpSession oldSession = request.getSession(false);
	    if (oldSession != null) {
		oldSession.invalidate();
	    }
	    HttpSession newSession = request.getSession(true);
	    newSession.setMaxInactiveInterval(120 * 60);
	    newSession.setAttribute("admin", admin);
	    response.setStatus(HttpServletResponse.SC_OK);
	    response.sendRedirect("home.jsp");
	}else {
	    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	}
    }
}
