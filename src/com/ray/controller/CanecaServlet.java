package com.ray.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ray.model.dao.ClienteRepository;
import com.ray.model.dao.RepositoryFactory;

@WebServlet("/canecas")
public class CanecaServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
    private ClienteRepository repository;
    
    @Override
    public void init() throws ServletException {
	this.repository = RepositoryFactory.createClienteDao();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("clientes", repository.findAll());
        req.getRequestDispatcher("clientes.jsp").forward(req, resp);
    }
}
