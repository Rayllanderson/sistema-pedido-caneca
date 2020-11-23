package com.ray.util;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ray.model.dao.CanecaRepository;
import com.ray.model.dao.PedidoRepository;
import com.ray.model.entities.Caneca;
import com.ray.model.entities.Cliente;
import com.ray.model.entities.Pedido;
import com.ray.model.entities.Tema;
import com.ray.model.entities.enums.Prazo;

public class CanecaUtil {
    
    /**
     * Recupera, atravéz dos pedidos, as canecas que são pra entregar hoje 
     * @param pedidoRepository - para recuperar a data dos pedidos
     * @param canecaRepository - para recuperar as canecas dos clientes
     * @return lista contendo todas as canecas do dia atual usando LocalDate.now().getDayOfMonth();
     */
    public static List<Caneca> getAllPedidosForToday(PedidoRepository pedidoRepository, CanecaRepository canecaRepository) {
	List<Pedido> pedidos = pedidoRepository.findAll();
	List<Caneca> CanecasForToday = new ArrayList<>();
	List<Cliente> clientes = new ArrayList<>();
	pedidos.forEach(x -> clientes.add(x.getCliente())); //setando os clientes
	clientes.forEach(x -> x.getCanecas().addAll(canecaRepository.findAll(x.getId()))); //setando canecas nos clientes
	pedidos.forEach(x -> x.getCliente().getCanecas().addAll(canecaRepository.findAll(x.getId()))); //setando as canecas nos clientes em pedido
	Calendar calendar = Calendar.getInstance();
	for (Pedido pedido : pedidos) {
	   for (Caneca c : pedido.getCliente().getCanecas()) {
	       Date orderDate = pedido.getData();
	       calendar.setTime(orderDate);
	       int orderDay = calendar.get(Calendar.DAY_OF_MONTH);
	       int today = LocalDate.now().getDayOfMonth();
	       if (c.getTema().equals(new Tema(4L, ""))) {
		   if (today == (orderDay + Prazo.PERSONALIZADO.getValue())) {
		       CanecasForToday.add(c);
		   }else if (today == (orderDay + Prazo.NORMAL.getValue())) {
		       CanecasForToday.add(c);
		   }
	       }
	   }
	}
	return CanecasForToday;
    }

}
