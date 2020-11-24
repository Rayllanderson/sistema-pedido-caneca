package com.ray.model.dao;

import java.util.List;

import com.ray.model.entities.Admin;

public interface AdminRepository {

    Admin save(Admin admin);

    Admin update(Admin admin);

    void deleteById(Long id);

    Admin findById(Long id);

    List<Admin> findAll();

}
