package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.dao.NavMenuDao;
import com.lubocluod.touchwebcms.entity.NavMenu;

public class NavMenuDaoImpl implements NavMenuDao {

    private Connection conn;
    private PreparedStatement stat = null;

    public NavMenuDaoImpl() {
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
    public int add(NavMenu menu) {
        // TODO Auto-generated method stub
        String sql = "INSERT INTO navmenu(nav_name,nav_url) VALUES(?,?)";
        try {
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setString(1, menu.getNavName());
            stat.setString(2, menu.getNavUrl());
            stat.executeUpdate();
            ResultSet rs = stat.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return -1;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean delete(int id) {
        // TODO Auto-generated method stub
        String sql = "DELETE FROM navmenu where nav_id=?";
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
    public boolean update(NavMenu menu) {
        // TODO Auto-generated method stub
        String sql = "UPDATE navmenu SET nav_name=?,nav_url=? WHERE nav_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setString(1, menu.getNavName());
            stat.setString(2, menu.getNavUrl());
            stat.setInt(3, menu.getNavId());
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public NavMenu find(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT nav_id,nav_name,nav_url FROM navmenu WHERE nav_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            NavMenu menu = null;
            if (rs.next()) {
                menu = new NavMenu();
                menu.setNavId(rs.getInt("nav_id"));
                menu.setNavName(rs.getString("nav_name"));
                menu.setNavUrl(rs.getString("nav_url"));
            }
            return menu;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<NavMenu> findAll() {
        // TODO Auto-generated method stub
        String sql = "SELECT nav_id,nav_name,nav_url FROM navmenu ORDER BY nav_index";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<NavMenu> list = new ArrayList<NavMenu>();
            NavMenu menu = null;
            while (rs.next()) {
                menu = new NavMenu();
                menu.setNavId(rs.getInt("nav_id"));
                menu.setNavName(rs.getString("nav_name"));
                menu.setNavUrl(rs.getString("nav_url"));
                list.add(menu);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}
