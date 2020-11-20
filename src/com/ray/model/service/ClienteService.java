package com.ray.model.service;

import com.ray.model.dao.ClienteRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.entities.Cliente;

public class ClienteService {

    private ClienteRepository repository;

    public ClienteService() {
	this.repository = RepositoryFactory.createClienteDao();
    }

    public Cliente save(Cliente cliente) {
	return repository.save(cliente);
    }

    public Cliente update(Cliente cliente) {
	return repository.update(cliente);
    }

    public boolean deleteById(Long id) {
	try {
	    repository.deleteById(id);
	    return true;
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}

    }

}
