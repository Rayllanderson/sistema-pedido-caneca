package com.ray.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ray.model.dao.CanecaRepository;
import com.ray.model.dao.ClienteRepository;
import com.ray.model.dao.RepositoryFactory;

@WebServlet("/clientes")
public class ClientesServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
    private ClienteRepository clienteRepository;
    private CanecaRepository canecaRepository;
    
    @Override
    public void init() throws ServletException {
	this.clienteRepository = RepositoryFactory.createClienteDao();
	this.canecaRepository = RepositoryFactory.createCanecaDao();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action != null) {
            if(action.equals("select")) {
        	Long id = Long.valueOf(req.getParameter("id"));
        	req.getSession().setAttribute("canecas", canecaRepository.findAll(id));
                req.getRequestDispatcher("canecas.jsp").forward(req, resp);
            }
        }else {
            req.getSession().setAttribute("clientes", clienteRepository.findAll());
            req.getRequestDispatcher("clientes.jsp").forward(req, resp);
        }
    }
}
