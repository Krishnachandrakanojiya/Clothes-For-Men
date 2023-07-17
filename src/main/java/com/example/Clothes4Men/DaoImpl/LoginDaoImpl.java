package com.example.Clothes4Men.DaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.example.Clothes4Men.Dao.LoginDao;
import com.example.Clothes4Men.Entity.LoginEntity;
import com.example.Clothes4Men.Entity.SignUpEntity;

import jakarta.annotation.PostConstruct;


@Repository
public class LoginDaoImpl extends JdbcDaoSupport implements LoginDao {
	 @Autowired
	    DataSource dataSource;
	    @Autowired
	    private JdbcTemplate jdbcTemplate;

	    @PostConstruct
	    private void intilize() {
	        setDataSource(dataSource);
	    }

	    @Override
	    public LoginEntity getByEmail(String Email) {
	        String sql = "select Password from User where Email=?";
	        return getJdbcTemplate().queryForObject(sql, new Object[]{Email}, new RowMapper<LoginEntity>() {


	            @Override
	            public LoginEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
	            	LoginEntity user = new LoginEntity();
	                user.setEmail(Email);
	                user.setPassword(rs.getString(1));
	                return user;
	            }
	        });
	    }

	    @Override
	    public int createNewUser(SignUpEntity register) {
	        String sql = "insert into User(Email,Password,Name,Phone_Number) values (?,?,?,?)";
	        return getJdbcTemplate().update(new PreparedStatementCreator() {

	            @Override
	            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
	                PreparedStatement ps = con.prepareStatement(sql);
	                ps.setString(1, register.getEmail());
	                ps.setString(2, register.getPassword());
	                ps.setString(3, register.getName());
	                ps.setString(4, register.getNumber());

	                return ps;
	            }
	        });
	    }

	    @Override
	    public boolean checkEmail(String Email) {
	        String sql = "select Email from User where Email=?";
	        List<LoginEntity> list = getJdbcTemplate().query(sql, new Object[]{Email}, new BeanPropertyRowMapper(LoginEntity.class));
	        return list.size() > 0;
	    }

	    @Override
	    public void addOrder(String userName, String email, String credit, String cvv, String expiry, float totalPrice) {
	    	String sql = "insert into order(userName,email,credit,cvv,expiry,totalAmount) values (?,?,?,?,?,?)";
	        getJdbcTemplate().update(new PreparedStatementCreator() {

	            @Override
	            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
	                PreparedStatement ps = con.prepareStatement(sql);
	                ps.setString(1, userName);
	                ps.setString(2, email);
	                ps.setString(3, credit);
	                ps.setString(4, cvv);
	                ps.setString(5, expiry);
	                ps.setFloat(6, totalPrice);
	                return ps;
	            }
	        });
	    }

}
