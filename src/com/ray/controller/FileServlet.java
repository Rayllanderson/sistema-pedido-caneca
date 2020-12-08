package com.ray.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
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
import com.ray.util.ArquivosUtil;

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
	try {
	    String action = (request.getParameter("action"));
	    if (action != null) {
		if (action.equals("upload")) {
		    List<Part> fileParts = request.getParts().stream()
			    .filter(part -> "file".equals(part.getName()) && part.getSize() > 0)
			    .collect(Collectors.toList());
		    this.caneca = (Caneca) request.getSession().getAttribute("caneca");
		    List<Arquivo> imagens = new ArrayList<>();
		    for (Part filePart : fileParts) {
			InputStream fileContent = filePart.getInputStream();
			String name = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			imagens.add(new Arquivo(null, fileContent, "", "", filePart.getContentType(), caneca, name));
		    }
		    boolean hasFile = !imagens.isEmpty();
		    if (hasFile) {
			imagens.forEach(x -> arquivoService.save(x));
		    }
		    response.setStatus(201);
		}
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    response.getWriter().write("Ocorreu um erro.");
	    response.setStatus(500);
	}
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	try {
	    String action = request.getParameter("action");
	    this.caneca = (Caneca) request.getSession().getAttribute("caneca");
	    List<Arquivo> arquivos = arquivoService.findAll(caneca.getId(), false);
	    if (action != null) {
		if (action.equals("load-miniature")) {
		    if (ArquivosUtil.thumbIsLoading(arquivos)) {
		    ArquivosUtil.loadThumb(arquivos, true, arquivoRepository);
		    response.setStatus(200);
		    return;
		    }
		} else if (action.equals("delete")) {
		    Long id = Long.valueOf(request.getParameter("id"));
		    if (arquivoService.deleteById(id)) {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
		    } else {
			response.setStatus(HttpServletResponse.SC_BAD_GATEWAY);
		    }
		} else if (action.equals("download")) {
		    Arquivo arquivo = arquivoRepository.findByIdHalfElements(Long.valueOf(request.getParameter("id")));
		    System.out.println(request.getParameter("id"));
		    ArquivosUtil.downloadFile(response, arquivo);
		    return;
		}
	    }
	    request.getSession().setAttribute("arquivos", arquivos);
	    request.getSession().setAttribute("size", arquivos.size());
	    request.getRequestDispatcher("caneca.jsp").forward(request, response);
	} catch (Exception e) {
	    e.printStackTrace();
	    response.getWriter().write("Ocorreu um erro.");
	    response.setStatus(500);
	}
    }

}
