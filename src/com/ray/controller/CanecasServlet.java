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
import com.ray.model.dao.TemaRepository;
import com.ray.model.entities.Cliente;
import com.ray.model.service.CanecaService;

/**
 * Tela da tabela de canecas
 * 
 * @author Ray
 *
 */
@WebServlet("/canecas")
public class CanecasServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CanecaRepository canecaRepository;
    private ClienteRepository clienteRepository;
    private TemaRepository temaRepository;
    private CanecaService canecaService;

    @Override
    public void init() throws ServletException {
	this.canecaRepository = RepositoryFactory.createCanecaDao();
	this.clienteRepository = RepositoryFactory.createClienteDao();
	this.temaRepository = RepositoryFactory.createTemaDao();
	this.canecaService = new CanecaService();
	super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String action = request.getParameter("action");
	if (action != null) {
	    if (action.equals("select")) {
		Long clientId = getClientId(request);
		request.getSession().setAttribute("canecas", canecaRepository.findAll(clientId));
		request.getRequestDispatcher("canecas.jsp").forward(request, response);
		request.getSession().setAttribute("temas", temaRepository.findAll());
		request.getSession().setAttribute("cliente", clienteRepository.findById(clientId));
	    } else if(action.equals("delete")) {
		if (canecaService.deleteById(Long.valueOf(request.getParameter("canecaId"))))
		    response.setStatus(204);
		else
		    response.setStatus(500);
	    }
	}else {
	    //criar canecas.jsp setar atributo canecas com seu respectivo user
	}

    }

    private Long getClientId(HttpServletRequest request) {
	try{
	    return Long.valueOf(request.getParameter("clientId"));
	}catch (NumberFormatException e) {
	    Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");
	    return cliente.getId();
	}
    }
}
