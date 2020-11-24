package com.ray.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ray.db.DB;
import com.ray.db.DbException;
import com.ray.model.dao.AdminRepository;
import com.ray.model.entities.Admin;

public class AdminDaoJdbc implements AdminRepository {

    private Connection conn;
    private String tableName = "admins";

    public AdminDaoJdbc(Connection conn) {
	this.conn = conn;
    }

    @Override
    public Admin save(Admin admin) {
	PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "insert into " + tableName
		+ " (username, password) values (?, ?)";
	try {
	    st = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	    st.setString(1, admin.getUsername());
	    st.setString(2, admin.getPassword());
	    if (st.executeUpdate() > 0) {
		rs = st.getGeneratedKeys();
		if (rs.next()) {
		    return findById(rs.getLong(1));
		}
	    }
	} catch (SQLException e) {
	    throw new DbException(e.getMessage());
	} finally {
	    DB.closeStatement(st);
	    DB.closeResultSet(rs);
	}
	return null;
    }

    @Override
    public Admin update(Admin admin) {
	PreparedStatement st = null;
	String sql = "update " + tableName
		+ " set username = ?, password = ? where id = ?";
	try {
	    st = conn.prepareStatement(sql);
	    st.setString(1, admin.getUsername());
	    st.setString(2, admin.getPassword());
	    st.setLong(3, admin.getId());
	    st.executeUpdate();
	    return this.findById(admin.getId());
	} catch (SQLException e) {
	    throw new DbException(e.getMessage());
	} finally {
	    DB.closeStatement(st);
	}
    }

    @Override
    public void deleteById(Long id) {
	PreparedStatement st = null;
	String sql = "delete from " + tableName + " where id = ?";
	try {
	    st = conn.prepareStatement(sql);
	    st.setLong(1, id);
	    if (st.executeUpdate() == 0) {
		throw new DbException("id não existe");
	    }
	    ;
	} catch (SQLException e) {
	    throw new DbException(e.getMessage());
	} finally {
	    DB.closeStatement(st);
	}

    }

    @Override
    public Admin findById(Long id) {
	PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "select * from admins where id = " + id;
	try {
	    st = conn.prepareStatement(sql);
	    rs = st.executeQuery();
	    if (rs.next()) {
		return setNewAdmin(rs);
	    } else {
		return null;
	    }
	} catch (SQLException e) {
	    throw new DbException(e.getMessage());
	} finally {
	    DB.closeStatement(st);
	}
    }
    
    private Admin setNewAdmin(ResultSet rs) throws SQLException {
	return new Admin(rs.getLong("id"), rs.getString("username"), rs.getString("password"));
    }

    @Override
    public List<Admin> findAll() {
	PreparedStatement st = null;
	ResultSet rs = null;
	List<Admin> canecas = new ArrayList<>();
	String sql = "select * from admins";
	try {
	    st = conn.prepareStatement(sql);
	    rs = st.executeQuery();
	    while (rs.next()) {
		canecas.add(setNewAdmin(rs));
	    }
	    return canecas;
	} catch (SQLException e) {
	    throw new DbException(e.getMessage());
	} finally {
	    DB.closeStatement(st);
	}
    }
    
}
