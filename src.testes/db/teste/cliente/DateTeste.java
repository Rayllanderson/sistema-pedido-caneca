package db.teste.cliente;

import java.sql.Connection;
import java.util.Date;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import com.ray.db.DB;
import com.ray.db.DbException;
import com.ray.model.entities.Arquivo;

public class DateTeste {
    
    private static Connection conn = DB.getConnection();
    
    public static void save() {
   	PreparedStatement st = null;
   	ResultSet rs = null;
   	String sql = "insert into new_table (order_time) values (?)";
   	try {
   	 Calendar calendar = Calendar.getInstance();
   	 java.util.Date currentTime = calendar.getTime();
   	 long time = currentTime.getTime();
   	    st = conn.prepareStatement(sql);
   	    st.setTimestamp(1, new Timestamp(time));
   	    st.executeUpdate();
   	   
   	} catch (SQLException e) {
   	    throw new DbException(e.getMessage());
   	} finally {
   	    DB.closeStatement(st);
   	    DB.closeResultSet(rs);
   	}
       }

    public static List<String> findAll() {
	PreparedStatement st = null;
	ResultSet rs = null;
	List <String> datas = new ArrayList<>();
	SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
	
	String sql = "select * from new_table";
	try {
	    st = conn.prepareStatement(sql);
//	    st.setLong(1, canecaId);
	    rs = st.executeQuery();
	    while(rs.next()) {
		Timestamp data =  rs.getTimestamp("order_time");
		Date date = new Date(data.getTime());
		System.out.println(date);
		datas.add(sdf1.format(data));
	    }
	    return datas;
	} catch (SQLException e) {
	    throw new DbException(e.getMessage());
	} finally {
	    DB.closeStatement(st);
	}
    }
    
    public static void main(String[] args) {
	save();
	findAll().forEach(System.out::println);
    }
}
