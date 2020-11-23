package com.ray.model.entities;

import java.io.Serializable;
import java.util.Date;

import com.ray.util.DateUtil;

public class Pedido  implements Serializable{

    private static final long serialVersionUID = 1L;
    
    private Long id;
    private Cliente cliente;
    private Date data;

    public Pedido(Cliente cliente, Date data) {
	this.cliente = cliente;
	this.data = data;
    }
    
    public Pedido(Long id, Cliente cliente, Date data) {
	this.id = id;
	this.cliente = cliente;
	this.data = data;
    }
    
    public Pedido() {}

    public Cliente getCliente() {
	return cliente;
    }

    public void setCliente(Cliente cliente) {
	this.cliente = cliente;
    }

    public Date getData() {
	return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
    
    public String getDataString() {
	return DateUtil.formatData(data);
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    @Override
    public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((id == null) ? 0 : id.hashCode());
	return result;
    }

    @Override
    public boolean equals(Object obj) {
	if (this == obj)
	    return true;
	if (obj == null)
	    return false;
	if (getClass() != obj.getClass())
	    return false;
	Pedido other = (Pedido) obj;
	if (id == null) {
	    if (other.id != null)
		return false;
	} else if (!id.equals(other.id))
	    return false;
	return true;
    }

    @Override
    public String toString() {
	return "Pedido [id=" + id + ", cliente=" + cliente + ", data=" + data + "]";
    }
}
