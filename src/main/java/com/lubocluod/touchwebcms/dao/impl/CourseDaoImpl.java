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
        String sql = "INSERT INTO course(uid,cat_id,name,price,description=?,logo,adimage,property,create_time,update_time,modify_time) VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            int i = 1;
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setInt(i++, c.getUid());
            stat.setInt(i++, c.getCatId());
            stat.setString(i++, c.getName());
            stat.setInt(i++, c.getPrice());
            stat.setString(i++, c.getDesc());
            stat.setString(i++, c.getLogo());
            stat.setString(i++, c.getAdimage());
            stat.setString(i++, c.getProperty());
            stat.setTimestamp(i++, c.getCreateTime());
            stat.setTimestamp(i++, c.getUpdateTime());
            stat.setTimestamp(i++, c.getModifyTime());
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
        String sql = "UPDATE course SET cat_id=?,name=?,price=?,description=?,logo=?,adimage=?,property=?,update_time=?,favorite_cnt=?,great_cnt=?,study_cnt=? WHERE id=?";
        try {
            stat = conn.prepareStatement(sql);
            int i = 1;
            stat.setInt(i++, c.getCatId());
            stat.setString(i++, c.getName());
            stat.setInt(i++, c.getPrice());
            stat.setString(i++, c.getDesc());
            stat.setString(i++, c.getLogo());
            stat.setString(i++, c.getAdimage());
            stat.setString(i++, c.getProperty());
            stat.setTimestamp(i++, c.getUpdateTime());
            stat.setInt(i++, c.getFavoriteCnt());
            stat.setInt(i++, c.getGreatCnt());
            stat.setInt(i++, c.getStudyCnt());
            stat.setInt(i++, c.getId());
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
        String sql = "SELECT id,uid,cat_id,name,price,description,logo,adimage,property,create_time,update_time,modify_time,favorite_cnt,great_cnt,study_cnt FROM course WHERE id=?";
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
                c.setDesc(rs.getString("description"));
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
        String sql = "SELECT id,uid,cat_id,name,price,description,logo,adimage,property,create_time,update_time,modify_time,favorite_cnt,great_cnt,study_cnt FROM course WHERE id=?";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<Course> list = new ArrayList<Course>();
            Course c = null;
            while (rs.next()) {
                c = new Course();
                c.setId(rs.getInt("id"));
                c.setUid(rs.getInt("uid"));
                c.setCatId(rs.getInt("cat_id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setDesc(rs.getString("description"));
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
