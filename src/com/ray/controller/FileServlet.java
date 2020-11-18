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

import com.ray.model.entities.Arquivo;
import com.ray.model.entities.Caneca;
import com.ray.model.validacoes.ImageValidation;

@WebServlet("/upload")
@MultipartConfig
public class FileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	System.out.println("hi..");
	List<Part> fileParts = request.getParts().stream()
		.filter(part -> "file".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList());
	Caneca caneca = (Caneca) request.getSession().getAttribute("caneca");
	List<Arquivo> imagens = new ArrayList<>();
	for (Part filePart : fileParts) {
	    if (ImageValidation.fileTypeIsValid(request, filePart)) {
		InputStream fileContent = filePart.getInputStream();
		imagens.add(new Arquivo(null, fileContent, "", "", filePart.getContentType(), caneca));
	    } else {
		
	    }
	}
    }

}
