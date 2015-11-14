package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.CoursePropertyItemDao;
import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.entity.CoursePropertyItem;

public class CoursePropertyItemDaoImpl implements CoursePropertyItemDao {

    private Connection conn;
    private PreparedStatement stat = null;

    public CoursePropertyItemDaoImpl() {
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
    public int add(CoursePropertyItem propItem) {
        // TODO Auto-generated method stub
        String sql = "INSERT INTO coursepropertyitem(prop_group_id,prop_item_name) VALUES(?,?)";
        try {
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setInt(1, propItem.getPropGroupId());
            stat.setString(2, propItem.getPropItemName());
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
        String sql = "DELETE FROM coursepropertyitem where prop_item_id=?";
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
    public boolean update(CoursePropertyItem propItem) {
        // TODO Auto-generated method stub
        String sql = "UPDATE coursepropertyitem SET prop_group_id=?,prop_item_name=? WHERE prop_item_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, propItem.getPropGroupId());
            stat.setString(2, propItem.getPropItemName());
            stat.setInt(3, propItem.getPropItemId());
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public CoursePropertyItem find(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT prop_item_id,prop_group_id,prop_item_name FROM coursepropertyitem WHERE prop_item_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            CoursePropertyItem propItem = null;
            if (rs.next()) {
                propItem = new CoursePropertyItem();
                propItem.setPropItemId(rs.getInt("prop_item_id"));
                propItem.setPropGroupId(rs.getInt("prop_group_id"));
                propItem.setPropItemName(rs.getString("prop_item_name"));
            }
            return propItem;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CoursePropertyItem> findAll() {
        // TODO Auto-generated method stub
        String sql = "SELECT prop_item_id,prop_group_id,prop_item_name FROM coursepropertyitem";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<CoursePropertyItem> list = new ArrayList<CoursePropertyItem>();
            CoursePropertyItem propItem = null;
            while (rs.next()) {
                propItem = new CoursePropertyItem();
                propItem.setPropItemId(rs.getInt("prop_item_id"));
                propItem.setPropGroupId(rs.getInt("prop_group_id"));
                propItem.setPropItemName(rs.getString("prop_item_name"));
                list.add(propItem);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CoursePropertyItem> findCoursePropertyItem(int propGroupId) {
        // TODO Auto-generated method stub
        String sql = "SELECT prop_item_id,prop_group_id,prop_item_name FROM coursepropertyitem WHERE prop_group_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, propGroupId);
            ResultSet rs = stat.executeQuery();
            List<CoursePropertyItem> list = new ArrayList<CoursePropertyItem>();
            CoursePropertyItem propItem = null;
            while (rs.next()) {
                propItem = new CoursePropertyItem();
                propItem.setPropItemId(rs.getInt("prop_item_id"));
                propItem.setPropGroupId(rs.getInt("prop_group_id"));
                propItem.setPropItemName(rs.getString("prop_item_name"));
                list.add(propItem);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean deleteCoursePropertyItem(int propGroupId) {
        // TODO Auto-generated method stub
        String sql = "DELETE FROM coursepropertyitem where prop_group_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, propGroupId);
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

}
