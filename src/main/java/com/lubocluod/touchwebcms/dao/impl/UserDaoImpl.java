package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.dao.UserDao;
import com.lubocluod.touchwebcms.domain.User;

public class UserDaoImpl implements UserDao {

	private Connection conn;
    private PreparedStatement stat = null;
	
	public UserDaoImpl(){
		try {
			this.conn = DataConnection.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	@Override
	public boolean add(User u) {
		// TODO Auto-generated method stub
        String sql = "INSERT INTO user(username,password,fullname,email,phone) VALUES(?,?,?,?,?)";  
        try {
			stat = conn.prepareStatement(sql);
			stat.setString(1, u.getUsername());
			stat.setString(2, u.getPasswd());
			stat.setString(3, u.getFullname());
			stat.setString(4, u.getEmail());
			stat.setString(5, u.getPhone());
			stat.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return false;
	}

	@Override
	public boolean delete(User u) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(User u) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User find(String username) {
		// TODO Auto-generated method stub 
        String sql = "SELECT password,fullname,email,phone FROM user WHERE username=?";  
        try {
			stat = conn.prepareStatement(sql);
	        stat.setString(1,username);  
	        ResultSet rs = stat.executeQuery();  
	        User u = null;  
	        if(rs.next()){  
	            u = new User(); 
	            u.setUsername(username);
	            u.setPasswd(rs.getString(1));
	            u.setFullname(rs.getString(2));
	            u.setEmail(rs.getString(3));
	            u.setPhone(rs.getString(4));
	        }  
	        return u;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
        return null;
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
