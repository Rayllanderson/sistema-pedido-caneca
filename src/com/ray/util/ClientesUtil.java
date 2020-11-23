package com.ray.util;

import java.util.ArrayList;
import java.util.List;

import com.ray.model.dao.ClienteRepository;
import com.ray.model.dao.PedidoRepository;
import com.ray.model.entities.Cliente;
import com.ray.model.entities.Pedido;

public class ClientesUtil {

    /**
     * @param clienteRepository
     * @return lista de todos os clientes
     */
    public static List<Cliente> getAll(ClienteRepository clienteRepository) {
	return clienteRepository.findAll();
    }

    /**
     * 
     * @param pedidoRepository
     * @return lista de clientes que realizaram pedido
     */
    public static List<Cliente> getClientWithOrder(PedidoRepository pedidoRepository) {
	List<Pedido> pedidos = pedidoRepository.findAll();
	List<Cliente> clientes = new ArrayList<>();
	pedidos.forEach(x -> clientes.add(x.getCliente()));
	return clientes;
    }
    
    /**
     * 
     * @param pedidoRepository
     * @return lista contendo todos os pedidos
     */
    public static List<Pedido> getAllPedidos(PedidoRepository pedidoRepository) {
	return pedidoRepository.findAll();
    }

    /**
     * 
     * @param pedidoRepository
     * @param clienteRepository
     * @return lista de clientes que não concluíram os pedidos
     */
    public static List<Cliente> getClientWithoutOrder(PedidoRepository pedidoRepository,
	    ClienteRepository clienteRepository) {
	List<Cliente> clientesWihOrder = new ArrayList<>();
	pedidoRepository.findAll().forEach(x -> clientesWihOrder.add(x.getCliente()));
	List<Cliente> clientes = clienteRepository.findAll();
	clientes.removeAll(clientesWihOrder);
	return clientes;
    }
}
