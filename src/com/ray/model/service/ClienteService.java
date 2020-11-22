package com.ray.model.service;

import com.ray.model.dao.CanecaRepository;
import com.ray.model.dao.ClienteRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.entities.Cliente;

public class ClienteService {

    private ClienteRepository repository;
    private CanecaService cService;
    private CanecaRepository cRepository;

    public ClienteService() {
	this.repository = RepositoryFactory.createClienteDao();
	this.cService = new CanecaService();
	cRepository = RepositoryFactory.createCanecaDao();
    }

    public Cliente save(Cliente cliente) {
	return repository.save(cliente);
    }

    public Cliente update(Cliente cliente) {
	return repository.update(cliente);
    }

    /**
     * Apaga tudo relacionado ao cliente. caneca, fotos, e ele mesmo.
     * 
     * @param id
     * @return
     */
    public boolean deleteById(Long id) {
	try {
	    cRepository.findAll(id).forEach(x -> cService.deleteById(x.getId()));
	    repository.deleteById(id);
	    return true;
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}

    }

}
