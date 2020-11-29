package com.ray.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ray.db.DbException;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.dao.TemaRepository;
import com.ray.model.entities.Tema;
import com.ray.model.exceptions.RequisicaoInvalidaException;


@WebServlet("/temas")
public class ThemeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private TemaRepository temaRepository;

    @Override
    public void init() throws ServletException {
	startRepositories();
	super.init();
    }

    public ThemeServlet() {
	super();
    }

    private void startRepositories() {
	temaRepository = RepositoryFactory.createTemaDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try{String action = req.getParameter("action");
	if (action != null) {
	    if (action.equals("delete")) {
		delete(req, resp);
	    }
	} else {
	    req.getSession().setAttribute("temas", temaRepository.findAll());
	    req.getRequestDispatcher("temas.jsp").forward(req, resp);
	}
	}catch (Exception e) {
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
	    Tema tema = new Tema(null, request.getParameter("nome"));
	    saveOrUpdate(id, tema);
	    return true;
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}
    }

    private void saveOrUpdate(String canecaId, Tema tema) {
	try {
	    Long id = Long.valueOf(canecaId);
	    tema.setId(id);
	    temaRepository.update(tema);
	} catch (NumberFormatException e) {
	    temaRepository.save(tema);
	}
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
	    Long id = Long.valueOf(request.getParameter("id"));
	    temaRepository.deleteById(id);
	    response.setStatus(204);
	} catch (DbException e) {
	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write("Existem uma ou mais canecas utilizando o tema atual");
	    response.setStatus(400);
	}catch (Exception e) {
	    e.printStackTrace();
	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write("Ocorreu um erro");
	    response.setStatus(500);
	}
    }
}
