package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.CoursePropertyGroupDao;
import com.lubocluod.touchwebcms.dao.CoursePropertyItemDao;
import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.entity.CoursePropertyGroup;
import com.lubocluod.touchwebcms.entity.CoursePropertyItem;

public class CoursePropertyGroupDaoImpl implements CoursePropertyGroupDao {

    private Connection conn;
    private PreparedStatement stat = null;
    CoursePropertyItemDao propItemDao = null;

    public CoursePropertyGroupDaoImpl() {
        propItemDao = new CoursePropertyItemDaoImpl();
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
    public int add(CoursePropertyGroup propGroup) {
        // TODO Auto-generated method stub
        String sql = "INSERT INTO coursepropertygroup(cat_id,prop_group_name) VALUES(?,?)";
        try {
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setInt(1, propGroup.getCatId());
            stat.setString(2, propGroup.getPropGroupName());
            stat.executeUpdate();
            ResultSet rs = stat.getGeneratedKeys();
            if (rs.next()) {
                int groupId = rs.getInt(1);
                if(propGroup.getItemList()!=null)
                {
                    for(int i=0;i<propGroup.getItemList().size();i++)
                    {
                        CoursePropertyItem propItem = propGroup.getItemList().get(i);
                        propItem.setPropGroupId(groupId);
                        propItem.setPropItemId(propItemDao.add(propItem));
                    }
                }
                return groupId;
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
        if(!propItemDao.deleteCoursePropertyItem(id))
        {
            return false;
        }
        String sql = "DELETE FROM coursepropertygroup where prop_group_id=?";
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
    public boolean update(CoursePropertyGroup propGroup) {
        // TODO Auto-generated method stub
        String sql = "UPDATE coursepropertygroup SET cat_id=?,prop_group_name=? WHERE prop_group_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, propGroup.getCatId());
            stat.setString(2, propGroup.getPropGroupName());
            stat.setInt(3, propGroup.getPropGroupId());
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public CoursePropertyGroup find(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT prop_group_id,prop_group_name,cat_id FROM coursepropertygroup WHERE prop_group_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            CoursePropertyGroup propGroup = null;
            if (rs.next()) {
                propGroup = new CoursePropertyGroup();
                propGroup.setPropGroupId(rs.getInt("prop_group_id"));
                propGroup.setCatId(rs.getInt("cat_id"));
                propGroup.setPropGroupName(rs.getString("prop_group_name"));
                propGroup.setItemList((ArrayList<CoursePropertyItem>)propItemDao.findCoursePropertyItem(id));
            }
            return propGroup;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CoursePropertyGroup> findAll() {
        // TODO Auto-generated method stub
        String sql = "SELECT prop_group_id,prop_group_name,cat_id FROM coursepropertygroup";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<CoursePropertyGroup> list = new ArrayList<CoursePropertyGroup>();
            CoursePropertyGroup propGroup = null;
            while (rs.next()) {
                propGroup = new CoursePropertyGroup();
                propGroup.setPropGroupId(rs.getInt("prop_group_id"));
                propGroup.setCatId(rs.getInt("cat_id"));
                propGroup.setPropGroupName(rs.getString("prop_group_name"));
                propGroup.setItemList((ArrayList<CoursePropertyItem>)propItemDao.findCoursePropertyItem(rs.getInt("prop_group_id")));
                list.add(propGroup);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CoursePropertyGroup> findCoursePropertyGroup(int catId) {
        // TODO Auto-generated method stub
        String sql = "SELECT prop_group_id,prop_group_name,cat_id FROM coursepropertygroup WHERE cat_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, catId);
            ResultSet rs = stat.executeQuery();
            List<CoursePropertyGroup> list = new ArrayList<CoursePropertyGroup>();
            CoursePropertyGroup propGroup = null;
            while (rs.next()) {
                propGroup = new CoursePropertyGroup();
                propGroup.setPropGroupId(rs.getInt("prop_group_id"));
                propGroup.setCatId(rs.getInt("cat_id"));
                propGroup.setPropGroupName(rs.getString("prop_group_name"));
                propGroup.setItemList((ArrayList<CoursePropertyItem>)propItemDao.findCoursePropertyItem(rs.getInt("prop_group_id")));
                list.add(propGroup);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    public List<Integer> findCoursePropertyGroupId(int catId) {
        // TODO Auto-generated method stub
        String sql = "SELECT prop_group_id FROM coursepropertygroup WHERE cat_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, catId);
            ResultSet rs = stat.executeQuery();
            List<Integer> list = new ArrayList<Integer>();
            while (rs.next()) {
                list.add(rs.getInt("prop_group_id"));
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public boolean deleteCoursePropertyGroup(int catId) {
        // TODO Auto-generated method stub
        List<Integer> idlist = this.findCoursePropertyGroupId(catId);
        for(int i=0; i< idlist.size(); i++)
        {
            propItemDao.deleteCoursePropertyItem(idlist.get(i));
        }
        String sql = "DELETE FROM coursepropertygroup where cat_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, catId);
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

}
