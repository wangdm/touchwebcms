package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.dao.RoleDao;
import com.lubocluod.touchwebcms.entity.Role;

public class RoleDaoImpl implements RoleDao {

	private Connection conn;
	private PreparedStatement stat = null;

	public RoleDaoImpl() {
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
	public boolean add(Role r) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO role(title,type) VALUES(?,?)";
		try {
			stat = conn.prepareStatement(sql);
			stat.setString(1, r.getTitle());
			stat.setInt(2, r.getType());
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
		String sql = "DELETE FROM role where id=?";
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
	public boolean update(Role r) {
		// TODO Auto-generated method stub
		String sql = "UPDATE role SET title=?,type=? WHERE id=?";
		try {
			stat = conn.prepareStatement(sql);
			stat.setString(1, r.getTitle());
			stat.setInt(2, r.getType());
			stat.setInt(3, r.getId());
			stat.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Role find(String title) {
		// TODO Auto-generated method stub
		String sql = "SELECT id,title,type FROM role WHERE title=?";
		try {
			stat = conn.prepareStatement(sql);
			stat.setString(1, title);
			ResultSet rs = stat.executeQuery();
			Role r = null;
			if (rs.next()) {
				r = new Role();
				r.setId(rs.getInt(1));
				r.setTitle(rs.getString(2));
				r.setType(rs.getInt(3));
			}
			return r;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Role find(int id) {
		// TODO Auto-generated method stub
		String sql = "SELECT id,title,type FROM role WHERE id=?";
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);
			ResultSet rs = stat.executeQuery();
			Role r = null;
			if (rs.next()) {
				r = new Role();
				r.setId(rs.getInt(1));
				r.setTitle(rs.getString(2));
				r.setType(rs.getInt(3));
			}
			return r;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Role> findAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT id,title,type FROM role";
		try {
			stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			List<Role> list = new ArrayList<Role>();
			Role r = null;
			while (rs.next()) {
				r = new Role();
				r.setId(rs.getInt(1));
				r.setTitle(rs.getString(2));
				r.setType(rs.getInt(3));
				list.add(r);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
