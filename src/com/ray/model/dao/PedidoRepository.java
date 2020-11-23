package com.ray.model.dao;

import java.util.List;

import com.ray.model.entities.Pedido;

public interface PedidoRepository {

    boolean save(Pedido pedido);

    void deleteById(Long id);

    Pedido findByClienteId(Long id);

    List<Pedido> findAll();

}
