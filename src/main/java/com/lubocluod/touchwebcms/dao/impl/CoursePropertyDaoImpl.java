package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.CoursePropertyDao;
import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.entity.CourseProperty;

public class CoursePropertyDaoImpl implements CoursePropertyDao {

    private Connection conn;
    private PreparedStatement stat = null;

    public CoursePropertyDaoImpl() {
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
    public int add(CourseProperty prop) {
        // TODO Auto-generated method stub
        String sql = "INSERT INTO courseproperty(cat_id,prop_name,parent_id) VALUES(?,?,?)";
        try {
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setInt(1, prop.getCatId());
            stat.setString(2, prop.getPropName());
            stat.setInt(3, prop.getParentId());
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
        String sql = "DELETE FROM courseproperty where prop_id=?";
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
    public boolean update(CourseProperty prop) {
        // TODO Auto-generated method stub
        String sql = "UPDATE courseproperty SET cat_id=?,prop_name=?,parent_id=? WHERE prop_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, prop.getCatId());
            stat.setString(2, prop.getPropName());
            stat.setInt(3, prop.getParentId());
            stat.setInt(4, prop.getPropId());
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public CourseProperty find(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT prop_id,cat_id,prop_name,parent_id FROM courseproperty WHERE prop_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            CourseProperty prop = null;
            if (rs.next()) {
                prop = new CourseProperty();
                prop.setPropId(rs.getInt("prop_id"));
                prop.setCatId(rs.getInt("cat_id"));
                prop.setPropName(rs.getString("prop_name"));
                prop.setParentId(rs.getInt("parent_id"));
            }
            return prop;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CourseProperty> findAll() {
        // TODO Auto-generated method stub
        String sql = "SELECT prop_id,cat_id,prop_name,parent_id FROM courseproperty WHERE prop_id=?";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<CourseProperty> list = new ArrayList<CourseProperty>();
            CourseProperty prop = null;
            if (rs.next()) {
                prop = new CourseProperty();
                prop.setPropId(rs.getInt("prop_id"));
                prop.setCatId(rs.getInt("cat_id"));
                prop.setPropName(rs.getString("prop_name"));
                prop.setParentId(rs.getInt("parent_id"));
                list.add(prop);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}
