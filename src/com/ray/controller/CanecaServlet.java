package com.ray.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ray.model.dao.CanecaRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.dao.TemaRepository;
import com.ray.model.entities.Arquivo;
import com.ray.model.service.ImageService;

/**
 * Tela da caneca escolhida
 * 
 * @author Ray
 *
 */
@WebServlet("/caneca")
public class CanecaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CanecaRepository canecaRepository;
    private TemaRepository temaRepository;
    private ImageService arquivoService;

    @Override
    public void init() throws ServletException {
	this.canecaRepository = RepositoryFactory.createCanecaDao();
	this.temaRepository = RepositoryFactory.createTemaDao();
	this.arquivoService = new ImageService();
	super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String action = req.getParameter("action");
	if (action != null) {
	    if (action.equals("select")) {
		Long id = Long.valueOf(req.getParameter("id"));
		List <Arquivo> arquivos = arquivoService.findAll(id, false);
		req.getSession().setAttribute("caneca", canecaRepository.findById(id));
		req.getSession().setAttribute("arquivos", arquivos);
		req.getSession().setAttribute("size", arquivos.size());
		req.getSession().setAttribute("temas", temaRepository.findAll());
		req.getRequestDispatcher("caneca.jsp").forward(req, resp);
	    }
	}else {
	}

    }
}
