package com.ray.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ray.model.dao.CanecaRepository;
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
 * mudar o nome também
 */
@MultipartConfig
@WebServlet("/save")
public class SaveCanecaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private TemaRepository temaRepository;
    private CanecaService canecaService;
    private CanecaRepository canecaRepository;
    private ImageService imageService;

    @Override
    public void init() throws ServletException {
	startRepositories();
	super.init();
    }

    public SaveCanecaServlet() {
	super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	String action = request.getParameter("action");
	if (action != null) {
	    if (action.equals("edit")) {
		setCanecaToEdit(request, response);
	    }
	} else {
	    request.getSession().setAttribute("temas", temaRepository.findAll());
	    request.getRequestDispatcher("order.jsp").forward(request, response);
	}
    }

    private void startRepositories() {
	temaRepository = RepositoryFactory.createTemaDao();
	canecaRepository = RepositoryFactory.createCanecaDao();
	canecaService = new CanecaService();
	imageService = new ImageService();
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
	    String id = request.getParameter("id");
	    String etapaId = request.getParameter("etapa-id");
	    Etapa etapa = Etapa.valueOf(Integer.valueOf(etapaId));
	    Caneca caneca = new Caneca(Long.valueOf(id), Integer.valueOf(quantidade), tema, etapa, cliente, descricao);
	    canecaService.update(caneca);
	    return true;
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}
    }

    /**
     * 
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    private void setCanecaToEdit(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	try {
	    Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");
	    Long canecaId = Long.valueOf(request.getParameter("id"));
	    if (ClientValidation.clientIsValid(cliente, canecaId)) {
		Caneca caneca = canecaRepository.findByIdWihoutIS(canecaId);
		caneca.getFotos().addAll(imageService.findAll(canecaId, false));
		request.getSession().setAttribute("temas", temaRepository.findAll());
		request.getSession().setAttribute("caneca", caneca);
		response.setStatus(200);
		return;
	    } else {
		response.setStatus(400);
		return;
	    }
	} catch (NullPointerException e) {
	    response.setStatus(400);
	    return;
	}
    }
}
