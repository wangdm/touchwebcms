package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.dao.UserDao;
import com.lubocluod.touchwebcms.entity.User;

public class UserDaoImpl implements UserDao {

	private Connection conn;
	private PreparedStatement stat = null;

	public UserDaoImpl() {
		try {
			this.conn = DataConnection.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
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
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM user WHERE Id=?";
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);
			stat.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(User u) {
		// TODO Auto-generated method stub
		String sql = "UPDATE user SET role=?,fullname=?,email=?,phone=?,password=? WHERE Id=?";
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, u.getRoletype());
			stat.setString(2, u.getFullname());
			stat.setString(3, u.getEmail());
			stat.setString(4, u.getPhone());
            stat.setString(5, u.getPasswd());
			stat.setInt(6, u.getId());
			stat.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public User find(String username) {
		// TODO Auto-generated method stub
		String sql = "SELECT Id,role,password,fullname,email,phone FROM user WHERE username=?";
		try {
			stat = conn.prepareStatement(sql);
			stat.setString(1, username);
			ResultSet rs = stat.executeQuery();
			User u = null;
			if (rs.next()) {
				u = new User();
				u.setId(rs.getInt("Id"));
				u.setUsername(username);
				u.setRoletype(rs.getInt("role"));
				u.setPasswd(rs.getString("password"));
				u.setFullname(rs.getString("fullname"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getString("phone"));
			}
			return u;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User find(int id) {
		// TODO Auto-generated method stub
		String sql = "SELECT username,role,password,fullname,email,phone FROM user WHERE Id=?";
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);
			ResultSet rs = stat.executeQuery();
			User u = null;
			if (rs.next()) {
				u = new User();
				u.setId(id);
				u.setUsername(rs.getString("username"));
				u.setRoletype(rs.getInt("role"));
				u.setPasswd(rs.getString("password"));
				u.setFullname(rs.getString("fullname"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getString("phone"));
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
		String sql = "SELECT Id,username,role,fullname,email,phone FROM user";
		try {
			stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			List<User> list = new ArrayList<User>();
			User u = null;
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt("Id"));
				u.setUsername(rs.getString("username"));
				u.setRoletype(rs.getInt("role"));
				u.setFullname(rs.getString("fullname"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getString("phone"));
				list.add(u);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean check(String type, String value, int id) {
		// TODO Auto-generated method stub
		String sql = null;
		if ("username".equals(type)) {
			sql = "SELECT count(*) record,id FROM user where username=?";

		} else if ("email".equals(type)) {
			sql = "SELECT count(*) record,id FROM user where email=?";

		} else if ("phone".equals(type)) {
			sql = "SELECT count(*) record,id FROM user where phone=?";

		} else {
			return true;
		}
		try {
			stat = conn.prepareStatement(sql);
			stat.setString(1, value);
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
			    int count = rs.getInt("record");
			    if (count>0)
			    {
			        int _id = rs.getInt("id");
			        if( id == _id){
			            return true;
			        }else{
			            return false;
			        }
			    }
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

}
