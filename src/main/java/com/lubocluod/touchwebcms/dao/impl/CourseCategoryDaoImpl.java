package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.CourseCategoryDao;
import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.entity.CourseCategory;

public class CourseCategoryDaoImpl implements CourseCategoryDao {

    private Connection conn;
    private PreparedStatement stat = null;

    public CourseCategoryDaoImpl() {
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
    public int add(CourseCategory cat) {
        // TODO Auto-generated method stub
        String sql = "INSERT INTO coursecategory(cat_name,parent_id) VALUES(?,?)";
        try {
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setString(1, cat.getCatName());
            stat.setInt(2, cat.getParentId());
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
        String sql = "DELETE FROM coursecategory where cat_id=?";
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
    public boolean update(CourseCategory cat) {
        // TODO Auto-generated method stub
        String sql = "UPDATE coursecategory SET cat_name=?,parent_id=? WHERE cat_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setString(1, cat.getCatName());
            stat.setInt(2, cat.getParentId());
            stat.setInt(3, cat.getCatId());
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public CourseCategory find(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT cat_id,cat_name,parent_id FROM coursecategory WHERE cat_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            CourseCategory cat = null;
            if (rs.next()) {
                cat = new CourseCategory();
                cat.setCatId(rs.getInt("cat_id"));
                cat.setCatName(rs.getString("cat_name"));
                cat.setParentId(rs.getInt("parent_id"));
            }
            return cat;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CourseCategory> findAll() {
        // TODO Auto-generated method stub
        String sql = "SELECT cat_id,cat_name,parent_id FROM coursecategory";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<CourseCategory> list = new ArrayList<CourseCategory>();
            CourseCategory cat = null;
            while (rs.next()) {
                cat = new CourseCategory();
                cat.setCatId(rs.getInt("cat_id"));
                cat.setCatName(rs.getString("cat_name"));
                cat.setParentId(rs.getInt("parent_id"));
                list.add(cat);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CourseCategory> findChildCategory(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT cat_id,cat_name,parent_id FROM coursecategory WHERE parent_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            List<CourseCategory> list = new ArrayList<CourseCategory>();
            CourseCategory cat = null;
            while (rs.next()) {
                cat = new CourseCategory();
                cat.setCatId(rs.getInt("cat_id"));
                cat.setCatName(rs.getString("cat_name"));
                cat.setParentId(rs.getInt("parent_id"));
                list.add(cat);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public List<CourseCategory> findAllChildCategory(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT cat_id,cat_name,parent_id FROM coursecategory WHERE parent_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            List<CourseCategory> list = new ArrayList<CourseCategory>();
            CourseCategory cat = null;
            while (rs.next()) {
                cat = new CourseCategory();
                cat.setCatId(rs.getInt("cat_id"));
                cat.setCatName(rs.getString("cat_name"));
                cat.setParentId(rs.getInt("parent_id"));
                list.add(cat);
                list.addAll(findAllChildCategory(cat.getCatId()));
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CourseCategory> findParentCategory(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT cat_id,cat_name,parent_id FROM coursecategory WHERE cat_id=?";
        List<CourseCategory> list = new ArrayList<CourseCategory>();
        CourseCategory cat = null;
        int tmpId = id;
        try {
            while(true){
                stat = conn.prepareStatement(sql);
                stat.setInt(1, tmpId);
                ResultSet rs = stat.executeQuery();
                if (rs.next()) {
                    cat = new CourseCategory();
                    cat.setCatId(rs.getInt("cat_id"));
                    cat.setCatName(rs.getString("cat_name"));
                    cat.setParentId(rs.getInt("parent_id"));
                    list.add(cat);
                }else{
                    break;
                }
                if(cat.getParentId()==0)
                {
                    break;
                }
                tmpId = cat.getParentId();
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}
