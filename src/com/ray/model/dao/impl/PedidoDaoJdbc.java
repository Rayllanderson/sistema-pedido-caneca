package com.ray.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ray.db.DB;
import com.ray.db.DbException;
import com.ray.model.dao.ClienteRepository;
import com.ray.model.dao.EntregaRepository;
import com.ray.model.dao.PedidoRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.entities.Pedido;

public class PedidoDaoJdbc implements PedidoRepository {

    private Connection conn;
    private ClienteRepository cliRepository = RepositoryFactory.createClienteDao();
    private EntregaRepository entregaRepository = RepositoryFactory.createEntregaDao();

    public PedidoDaoJdbc(Connection conn) {
	this.conn = conn;
    }

    @Override
    public boolean save(Pedido pedido) {
	PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "insert into pedidos (cliente_id, order_time, entrega_id) values (?, ?, ?)";
	try {
	    Calendar calendar = Calendar.getInstance();
	    java.util.Date currentTime = calendar.getTime();
	    long time = currentTime.getTime();
	    st = conn.prepareStatement(sql);
	    st.setLong(1, pedido.getCliente().getId());
	    st.setTimestamp(2, new Timestamp(time));
	    st.setLong(3, pedido.getEntrega().getId());
	    if (st.executeUpdate() > 0) {
		return true;
	    };
	} catch (SQLException e) {
	    throw new DbException(e.getMessage());
	} finally {
	    DB.closeStatement(st);
	    DB.closeResultSet(rs);
	}
	return false;
    }
    
    @Override
    public Pedido findByClienteId(Long clienteId) {
	PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "select * from pedidos where cliente_id = ?";
	try {
	    st = conn.prepareStatement(sql);
	    st.setLong(1, clienteId);
	    rs = st.executeQuery();
	    if(rs.next()) {
		return insertCliente(rs);
	    }else {
		return null;
	    }
	} catch (SQLException e) {
	    throw new DbException(e.getMessage());
	} finally {
	    DB.closeStatement(st);
	}
    }
  

    @Override
    public void deleteByClientId(Long clienteId) {
	PreparedStatement st = null;
	String sql = "delete from pedidos where cliente_id = ?";
	try {
	    st = conn.prepareStatement(sql);
	    st.setLong(1, clienteId);
	    if (st.executeUpdate() == 0) {
		throw new DbException("id não existe");
	    };
	} catch (SQLException e) {
	    throw new DbException(e.getMessage());
	} finally {
	    DB.closeStatement(st);
	}
    }
    

//    @Override
//    public void deleteById(Long id) {
//	PreparedStatement st = null;
//	String sql = "delete from pedidos where id = ?";
//	try {
//	    st = conn.prepareStatement(sql);
//	    st.setLong(1, id);
//	    if (st.executeUpdate() == 0) {
//		throw new DbException("id não existe");
//	    };
//	} catch (SQLException e) {
//	    throw new DbException(e.getMessage());
//	} finally {
//	    DB.closeStatement(st);
//	}
//    }
    
//    @Override
//    public Pedido findById(Long id) {
//	PreparedStatement st = null;
//	ResultSet rs = null;
//	String sql = "select * from pedidos where id = ?";
//	try {
//	    st = conn.prepareStatement(sql);
//	    st.setLong(1, id);
//	    rs = st.executeQuery();
//	    if(rs.next()) {
//		return insertCliente(rs);
//	    }else {
//		return null;
//	    }
//	} catch (SQLException e) {
//	    throw new DbException(e.getMessage());
//	} finally {
//	    DB.closeStatement(st);
//	}
//    }

    @Override
    public List<Pedido> findAll() {
	PreparedStatement st = null;
	ResultSet rs = null;
	List <Pedido> pedidos = new ArrayList<>();
	String sql = "select * from pedidos";
	try {
	    st = conn.prepareStatement(sql);
	    rs = st.executeQuery();
	    while(rs.next()) {
		pedidos.add(insertCliente(rs));
	    }
	    return pedidos;
	} catch (SQLException e) {
	    throw new DbException(e.getMessage());
	} finally {
	    DB.closeStatement(st);
	}
    }

    private Pedido insertCliente(ResultSet rs) throws SQLException {
	Timestamp data =  rs.getTimestamp("order_time");
	Date date = new Date(data.getTime());
	Pedido p = new Pedido(Long.valueOf(rs.getString("id")), cliRepository.findById(rs.getLong("cliente_id")), date, entregaRepository.findById(rs.getLong("entrega_id")));
	return p;
    }

}
