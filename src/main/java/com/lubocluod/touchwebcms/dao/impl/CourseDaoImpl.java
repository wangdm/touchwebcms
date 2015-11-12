package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.CourseDao;
import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.entity.Course;

public class CourseDaoImpl implements CourseDao {

    private Connection conn;
    private PreparedStatement stat = null;

    public CourseDaoImpl() {
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
    public int add(Course c) {
        // TODO Auto-generated method stub
        String sql = "INSERT INTO course(uid,cat_id,name,price,logo,adimage,property,create_time,update_time,modify_time) VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setInt(1, c.getUid());
            stat.setInt(2, c.getCatId());
            stat.setString(3, c.getName());
            stat.setInt(4, c.getPrice());
            stat.setString(5, c.getLogo());
            stat.setString(6, c.getAdimage());
            stat.setString(7, c.getProperty());
            stat.setTimestamp(8, c.getCreateTime());
            stat.setTimestamp(9, c.getUpdateTime());
            stat.setTimestamp(10, c.getModifyTime());
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
        String sql = "DELETE FROM course where id=?";
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
    public boolean update(Course c) {
        // TODO Auto-generated method stub
        // TODO Auto-generated method stub
        String sql = "UPDATE course SET cat_id=?,name=?,price=?,logo=?,adimage=?,property=?,update_time=?,favorite_cnt=?,great_cnt=?,study_cnt=? WHERE id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, c.getCatId());
            stat.setString(2, c.getName());
            stat.setInt(3, c.getPrice());
            stat.setString(4, c.getLogo());
            stat.setString(5, c.getAdimage());
            stat.setString(6, c.getProperty());
            stat.setTimestamp(7, c.getUpdateTime());
            stat.setInt(8, c.getFavoriteCnt());
            stat.setInt(9, c.getGreatCnt());
            stat.setInt(10, c.getStudyCnt());
            stat.setInt(11, c.getId());
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Course find(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT id,uid,cat_id,name,price,desc,logo,adimage,property,create_time,update_time,modify_time,favorite_cnt,great_cnt,study_cnt FROM channel WHERE id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            Course c = null;
            if (rs.next()) {
                c = new Course();
                c.setId(rs.getInt("id"));
                c.setUid(rs.getInt("uid"));
                c.setCatId(rs.getInt("cat_id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setDesc(rs.getString("desc"));
                c.setLogo(rs.getString("logo"));
                c.setAdimage(rs.getString("adimage"));
                c.setProperty(rs.getString("property"));
                c.setCreateTime(rs.getTimestamp("create_time"));
                c.setUpdateTime(rs.getTimestamp("update_time"));
                c.setModifyTime(rs.getTimestamp("modify_time"));
                c.setFavoriteCnt(rs.getInt("favorite_cnt"));
                c.setGreatCnt(rs.getInt("great_cnt"));
                c.setStudyCnt(rs.getInt("study_cnt"));
            }
            return c;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Course> findAll() {
        // TODO Auto-generated method stub
        String sql = "SELECT id,uid,cat_id,name,price,desc,logo,adimage,property,create_time,update_time,modify_time,favorite_cnt,great_cnt,study_cnt FROM channel WHERE id=?";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<Course> list = new ArrayList<Course>();
            Course c = null;
            if (rs.next()) {
                c = new Course();
                c.setId(rs.getInt("id"));
                c.setUid(rs.getInt("uid"));
                c.setCatId(rs.getInt("cat_id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setDesc(rs.getString("desc"));
                c.setLogo(rs.getString("logo"));
                c.setAdimage(rs.getString("adimage"));
                c.setProperty(rs.getString("property"));
                c.setCreateTime(rs.getTimestamp("create_time"));
                c.setUpdateTime(rs.getTimestamp("update_time"));
                c.setModifyTime(rs.getTimestamp("modify_time"));
                c.setFavoriteCnt(rs.getInt("favorite_cnt"));
                c.setGreatCnt(rs.getInt("great_cnt"));
                c.setStudyCnt(rs.getInt("study_cnt"));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}
