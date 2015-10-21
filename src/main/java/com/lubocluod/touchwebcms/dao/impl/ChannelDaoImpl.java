package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.ChannelDao;
import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.entity.Channel;

public class ChannelDaoImpl implements ChannelDao {

	private Connection conn;
	private PreparedStatement stat = null;

	public ChannelDaoImpl() {
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
	public boolean add(Channel c) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO channel(userid,name,pushuri,pulluri) VALUES(?,?,?)";
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, c.getUserid());
			stat.setString(2, c.getName());
			stat.setString(3, c.getPushuri());
			stat.setString(4, c.getPulluri());
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
		String sql = "DELETE FROM channel where id=?";
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
	public boolean update(Channel c) {
		// TODO Auto-generated method stub
		String sql = "UPDATE channel SET name=?,pushuri=?,pulluri=? WHERE id=?";
		try {
			stat = conn.prepareStatement(sql);
			stat.setString(1, c.getName());
			stat.setString(2, c.getPushuri());
			stat.setString(3, c.getPulluri());
			stat.setInt(4, c.getId());
			stat.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Channel find(int id) {
		// TODO Auto-generated method stub
		String sql = "SELECT id,userid,name,pushuri,pulluri FROM channel WHERE id=?";
		try {
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);
			ResultSet rs = stat.executeQuery();
			Channel c = null;
			if (rs.next()) {
				c = new Channel();
				c.setId(rs.getInt(1));
				c.setUserid(rs.getInt(2));
				c.setName(rs.getString(3));
				c.setPushuri(rs.getString(4));
				c.setPulluri(rs.getString(5));
			}
			return c;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

    @Override
    public List<Channel> findByUser(int uid) {
        // TODO Auto-generated method stub
        String sql = "SELECT id,name,pushuri,pulluri FROM channel where userid=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, uid);
            ResultSet rs = stat.executeQuery();
            List<Channel> list = new ArrayList<Channel>();
            Channel c = null;
            while (rs.next()) {
                c = new Channel();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setPushuri(rs.getString(3));
                c.setPulluri(rs.getString(4));
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

	@Override
	public List<Channel> findAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT id,userid,name,pushuri,pulluri FROM channel";
		try {
			stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			List<Channel> list = new ArrayList<Channel>();
			Channel c = null;
			while (rs.next()) {
				c = new Channel();
				c.setId(rs.getInt(1));
				c.setUserid(rs.getInt(2));
				c.setName(rs.getString(3));
				c.setPushuri(rs.getString(4));
				c.setPulluri(rs.getString(5));
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
