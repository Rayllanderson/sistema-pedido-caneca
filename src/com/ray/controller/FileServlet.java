package com.ray.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ray.model.dao.ImageRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.entities.Arquivo;
import com.ray.model.entities.Caneca;
import com.ray.model.service.ImageService;
import com.ray.model.validacoes.ImageValidation;
import com.ray.util.ThreadMiniature;

@WebServlet("/file")
@MultipartConfig
public class FileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ImageService arquivoService;
    private ImageRepository arquivoRepository;
    private Caneca caneca;

    @Override
    public void init() throws ServletException {
	this.arquivoService = new ImageService();
	this.arquivoRepository = RepositoryFactory.createImageDao();
	super.init();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	String action = (request.getParameter("action"));
	if (action != null) {
	    if (action.equals("upload")) {
		List<Part> fileParts = request.getParts().stream()
			.filter(part -> "file".equals(part.getName()) && part.getSize() > 0)
			.collect(Collectors.toList());
		this.caneca = (Caneca) request.getSession().getAttribute("caneca");
		List<Arquivo> imagens = new ArrayList<>();
		for (Part filePart : fileParts) {
		    if (ImageValidation.fileTypeIsValid(request, filePart)) {
			InputStream fileContent = filePart.getInputStream();
			imagens.add(new Arquivo(null, fileContent, "", "", filePart.getContentType(), caneca));
		    }
		}
		boolean hasFile = !imagens.isEmpty();
		if (hasFile) {
		    imagens.replaceAll(x -> arquivoService.save(x));
		    imagens.forEach(x -> new ThreadMiniature(x));
		}
		response.setStatus(201);
	    }
	}
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	String action = request.getParameter("action");
	this.caneca = (Caneca) request.getSession().getAttribute("caneca");
	List<Arquivo> arquivos = arquivoService.findAll(caneca.getId(), false);
	if (action != null) {
	    if (action.equals("load-miniature") && thumbIsLoading(arquivos)) {
		loadThumb(arquivos, true);
		response.setStatus(200);
		return;
	    }else if(action.equals("delete")) {
		Long id = Long.valueOf(request.getParameter("id"));
		if (arquivoService.deleteById(id)) {
		    response.setStatus(HttpServletResponse.SC_NO_CONTENT);
		}else {
		    response.setStatus(HttpServletResponse.SC_BAD_GATEWAY);
		}
		
	    }
	}
	request.getSession().setAttribute("arquivos", arquivos);
	request.getRequestDispatcher("caneca.jsp").forward(request, response);
    }

    /**
     * Se alguma thumb estiver com valor vazio (ou seja, carregando), return true;
     * 
     * @param arquivos
     * @return
     */
    private boolean thumbIsLoading(List<Arquivo> arquivos) {
	for (Arquivo i : arquivos) {
	    if (i.getMiniatura().equals("")) {
		return true;
	    }
	}
	return false;
    }

    /**
     * Enquanto a thread que cria miniatura não termina, ela irá buscar ela mesma no
     * banco de dados pra verificar se a criação da miniatura já terminou.
     * 
     * @param loadAll - setar para true caso queira carregar todas as miniaturas.
     *                False para carregar apenas a primeira
     * @param imagens - lista de imagens de uma caneca
     */
    private void loadThumb(List<Arquivo> imagens, boolean loadAll) {
	if (loadAll) {
	    for (Arquivo i : imagens) {
		while (i.getMiniatura().equals("")) {
		    i = arquivoRepository.findById(i.getId());
		}
	    }
	} else {
	    Arquivo firstImage = imagens.get(0);
	    while (firstImage.getMiniatura().equals("")) {
		firstImage = arquivoRepository.findById(firstImage.getId());
	    }
	}
    }

}
