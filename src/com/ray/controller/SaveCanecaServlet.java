package com.ray.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ray.model.dao.CanecaRepository;
import com.ray.model.dao.ClienteRepository;
import com.ray.model.dao.ImageRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.dao.TemaRepository;
import com.ray.model.entities.Caneca;
import com.ray.model.entities.Cliente;
import com.ray.model.entities.Tema;
import com.ray.model.entities.enums.Etapa;
import com.ray.model.exceptions.RequisicaoInvalidaException;
import com.ray.model.service.CanecaService;
import com.ray.model.service.ImageService;
import com.ray.model.validacoes.ClientValidation;
import com.ray.model.validacoes.ThemeValidation;

/**
 * mudar o nome tamb�m
 */
@MultipartConfig
@WebServlet("/caneca-save")
public class SaveCanecaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private TemaRepository temaRepository;
    private CanecaService canecaService;
    private CanecaRepository canecaRepository;
    private ClienteRepository clienteRepository;

    @Override
    public void init() throws ServletException {
	startRepositories();
	super.init();
    }

    public SaveCanecaServlet() {
	super();
    }

    private void startRepositories() {
	temaRepository = RepositoryFactory.createTemaDao();
	canecaRepository = RepositoryFactory.createCanecaDao();
	canecaService = new CanecaService();
	this.clienteRepository = RepositoryFactory.createClienteDao();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	if (update(request, response))
	    response.setStatus(200);
	else
	    response.setStatus(500);
    }

    private boolean update(HttpServletRequest request, HttpServletResponse response)
	    throws IOException, ServletException, RequisicaoInvalidaException {
	try {
	    String descricao = request.getParameter("descricao");
	    String quantidade = request.getParameter("quantidade");
	    Tema tema = temaRepository.findById(Long.valueOf(request.getParameter("tema-id")));
	    ThemeValidation.validateTheme(tema);
	    Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");
	    String idCaneca = request.getParameter("idCaneca");
	    cliente = getClient(idCaneca, request);
	    String etapaId = request.getParameter("etapa-id");
	    Etapa etapa = Etapa.valueOf(Integer.valueOf(etapaId));
	    Caneca caneca = new Caneca(null, Integer.valueOf(quantidade), tema, etapa, cliente, descricao);
	    saveOrUpdate(idCaneca, caneca);
	    return true;
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}
    }

    private Cliente getClient(String idCaneca, HttpServletRequest request) {
	try{
	    Caneca old = canecaRepository.findById(Long.valueOf(idCaneca));
	    return old.getCliente();
	}catch (NumberFormatException e) {
	    return (Cliente) request.getSession().getAttribute("cliente");
	}
    }

    private void saveOrUpdate(String canecaId, Caneca caneca) {
	try {
	    Long id = Long.valueOf(canecaId);
	    caneca.setId(id);
	    canecaService.update(caneca);
	} catch (NumberFormatException e) {
	    canecaService.save(caneca);
	}
    }
}
