package com.ray.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ray.model.dao.ClienteRepository;
import com.ray.model.dao.PedidoRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.entities.Cliente;
import com.ray.model.service.ClienteService;
import com.ray.util.ClientesUtil;

@WebServlet("/clientes")
public class ClientesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ClienteRepository clienteRepository;
//    private CanecaRepository canecaRepository;
    private ClienteService clienteService;
    private PedidoRepository pedidoRepository;

    @Override
    public void init() throws ServletException {
	this.clienteRepository = RepositoryFactory.createClienteDao();
//	this.canecaRepository = RepositoryFactory.createCanecaDao();
	this.clienteService = new ClienteService();
	this.pedidoRepository = RepositoryFactory.createPedidoDao();
	super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	String action = request.getParameter("action");
	if (action != null) {
	    if (action.equals("delete")) {
		delete(request, response);
	    } else if (action.equals("delete-all")) {
		deleteAll(request, response);
	    } else if (action.equals("all")) {
		listAll(request);
	    } else if (action.equals("without-order")) {
		listClientWithoutOrder(request);
	    }
	    request.getRequestDispatcher("all-clientes.jsp").forward(request, response);
	} else {
	    listClientWithOrder(request);
	    request.getRequestDispatcher("clientes.jsp").forward(request, response);
	}
    }

    private void deleteAll(HttpServletRequest request, HttpServletResponse response) {
	try{
	    ClientesUtil.getClientWithoutOrder(pedidoRepository, clienteRepository).forEach(x -> clienteService.deleteById(x.getId()));
	    response.setStatus(204);
	    return;
	}catch (Exception e) {
	    e.printStackTrace();
	    response.setStatus(500);
	    return;
	}
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
	Long id = Long.valueOf(request.getParameter("id"));
	if (clienteService.deleteById(id))
	    response.setStatus(204);
	else
	    response.setStatus(500);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	String action = request.getParameter("action");
	if (action != null) {
	    if (action.equals("save")) {
		save(request, response);
	    }
	}
    }

    /**
     * método salva ou edita
     * 
     * @param request
     * @param response
     */
    private void save(HttpServletRequest request, HttpServletResponse response) {
	String nome = request.getParameter("nome");
	String telefone = request.getParameter("telefone");
	Cliente cliente = null;
	try {
	    Long id = Long.valueOf(request.getParameter("id"));
	    cliente = this.clienteService.update(new Cliente(id, nome, telefone));
	} catch (NumberFormatException e) {
	    cliente = this.clienteService.save(new Cliente(null, nome, telefone));
	} finally {
	    if (cliente != null) {
		response.setStatus(200);
		return;
	    } else {
		response.setStatus(400);
	    }
	}
    }

    private void listAll(HttpServletRequest request) {
	request.getSession().setAttribute("clientes", ClientesUtil.getAll(clienteRepository));
    }

    private void listClientWithOrder(HttpServletRequest request) {
	request.getSession().setAttribute("pedidos", ClientesUtil.getAllPedidos(pedidoRepository));
    }

    private void listClientWithoutOrder(HttpServletRequest request) {
	request.getSession().setAttribute("clientes",
		ClientesUtil.getClientWithoutOrder(pedidoRepository, clienteRepository));
    }

}
