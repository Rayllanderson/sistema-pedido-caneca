package com.ray.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ray.db.DbException;
import com.ray.model.dao.AdminRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.entities.Admin;
import com.ray.model.exceptions.RequisicaoInvalidaException;


@WebServlet("/account")
public class AccountServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminRepository adminRepository;

    @Override
    public void init() throws ServletException {
	startRepositories();
	super.init();
    }

    public AccountServlet() {
	super();
    }

    private void startRepositories() {
	adminRepository = RepositoryFactory.createAdminDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try{String action = req.getParameter("action");
	if (action != null) {
	    if (action.equals("delete")) {
		delete(req, resp);
	    }
	} else {
	    req.getSession().setAttribute("accounts", adminRepository.findAll());
	    req.getRequestDispatcher("account.jsp").forward(req, resp);
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
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    Admin admin = new Admin(null, username, password);
	    saveOrUpdate(id, admin);
	    return true;
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}
    }

    private void saveOrUpdate(String canecaId, Admin admin) {
	try {
	    Long id = Long.valueOf(canecaId);
	    admin.setId(id);
	    adminRepository.update(admin);
	} catch (NumberFormatException e) {
	    adminRepository.save(admin);
	}
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
	    Long id = Long.valueOf(request.getParameter("id"));
	    adminRepository.deleteById(id);
	    response.setStatus(204);
	} catch (DbException e) {
	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
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
