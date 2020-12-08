package com.ray.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ray.db.DbException;
import com.ray.model.dao.EntregaRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.entities.Entrega;
import com.ray.model.exceptions.RequisicaoInvalidaException;

@WebServlet("/entregas")
public class EntregasServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private EntregaRepository entregaRepository;

    @Override
    public void init() throws ServletException {
	startRepositories();
	super.init();
    }

    public EntregasServlet() {
	super();
    }

    private void startRepositories() {
	entregaRepository = RepositoryFactory.createEntregaDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
	    String action = req.getParameter("action");
	    if (action != null) {
		if (action.equals("delete")) {
		    delete(req, resp);
		}
	    } else {
		req.getSession().setAttribute("entregas", entregaRepository.findAll());
		req.getRequestDispatcher("entregas.jsp").forward(req, resp);
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    resp.getWriter().write("Ocorreu um erro.");
	    resp.setStatus(500);
	}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	if (save(request, response))
	    response.setStatus(200);
	else
	    response.setStatus(500);
    }

    private boolean save(HttpServletRequest request, HttpServletResponse response)
	    throws IOException, ServletException, RequisicaoInvalidaException {
	try {
	    String id = request.getParameter("id");
	    Entrega tema = new Entrega(null, request.getParameter("nome"));
	    saveOrUpdate(id, tema);
	    return true;
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}
    }

    private void saveOrUpdate(String entregaId, Entrega tema) {
	try {
	    Long id = Long.valueOf(entregaId);
	    tema.setId(id);
	    entregaRepository.update(tema);
	} catch (NumberFormatException e) {
	    entregaRepository.save(tema);
	}
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
	    Long id = Long.valueOf(request.getParameter("id"));
	    entregaRepository.deleteById(id);
	    response.setStatus(204);
	} catch (DbException e) {
	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write("Existem uma ou mais canecas utilizando o tipo de entrega atual");
	    response.setStatus(400);
	} catch (Exception e) {
	    e.printStackTrace();
	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write("Ocorreu um erro");
	    response.setStatus(500);
	}
    }
}
