package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.dao.VideoDao;
import com.lubocluod.touchwebcms.entity.Video;

public class VideoDaoImpl implements VideoDao {

    private Connection conn;
    private PreparedStatement stat = null;

    public VideoDaoImpl() {
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
    public int add(Video v) {
        // TODO Auto-generated method stub
        String sql = "INSERT INTO video(course_id,title,duration,desc,create_time,update_time) VALUES(?,?,?,?,?,?)";
        try {
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setInt(1, v.getCourseId());
            stat.setString(2, v.getTitle());
            stat.setInt(3, v.getDuration());
            stat.setString(4, v.getDesc());
            stat.setTimestamp(5, v.getCreateTime());
            stat.setTimestamp(6, v.getUpdateTime());
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
        return -1;
    }

    @Override
    public boolean delete(int id) {
        // TODO Auto-generated method stub
        String sql = "DELETE FROM video where id=?";
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
    public boolean update(Video v) {
        // TODO Auto-generated method stub
        String sql = "UPDATE video SET title=?,desc=?,update_time=? WHERE id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setString(1, v.getTitle());
            stat.setString(2, v.getDesc());
            stat.setTimestamp(3, v.getUpdateTime());
            stat.setInt(4, v.getId());
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Video find(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT id,course_id,title,desc,create_time,update_time,favorite_cnt,great_cnt,play_cnt FROM video WHERE id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            Video v = null;
            if (rs.next()) {
                v = new Video();
                v.setId(rs.getInt("id"));
                v.setCourseId(rs.getInt("course_id"));
                v.setTitle(rs.getString("title"));
                v.setDesc(rs.getString("desc"));
                v.setCreateTime(rs.getTimestamp("create_time"));
                v.setUpdateTime(rs.getTimestamp("update_time"));
                v.setFavoriteCnt(rs.getInt("favorite_cnt"));
                v.setGreatCnt(rs.getInt("great_cnt"));
                v.setPlayCnt(rs.getInt("play_cnt"));
            }
            return v;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Video> findCourseVideo(int courseId) {
        // TODO Auto-generated method stub
        String sql = "SELECT id,course_id,title,desc,create_time,update_time,favorite_cnt,great_cnt,play_cnt FROM video WHERE course_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, courseId);
            ResultSet rs = stat.executeQuery();
            List<Video> list = new ArrayList<Video>();
            Video v = null;
            if (rs.next()) {
                v = new Video();
                v.setId(rs.getInt("id"));
                v.setCourseId(rs.getInt("course_id"));
                v.setTitle(rs.getString("title"));
                v.setDesc(rs.getString("desc"));
                v.setCreateTime(rs.getTimestamp("create_time"));
                v.setUpdateTime(rs.getTimestamp("update_time"));
                v.setFavoriteCnt(rs.getInt("favorite_cnt"));
                v.setGreatCnt(rs.getInt("great_cnt"));
                v.setPlayCnt(rs.getInt("play_cnt"));
                list.add(v);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean deleteCourseVideo(int courseId) {
        // TODO Auto-generated method stub
        String sql = "DELETE FROM video where course_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, courseId);
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Video> findAll() {
        // TODO Auto-generated method stub
        String sql = "SELECT id,course_id,title,desc,create_time,update_time,favorite_cnt,great_cnt,play_cnt FROM video";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<Video> list = new ArrayList<Video>();
            Video v = null;
            if (rs.next()) {
                v = new Video();
                v.setId(rs.getInt("id"));
                v.setCourseId(rs.getInt("course_id"));
                v.setTitle(rs.getString("title"));
                v.setDesc(rs.getString("desc"));
                v.setCreateTime(rs.getTimestamp("create_time"));
                v.setUpdateTime(rs.getTimestamp("update_time"));
                v.setFavoriteCnt(rs.getInt("favorite_cnt"));
                v.setGreatCnt(rs.getInt("great_cnt"));
                v.setPlayCnt(rs.getInt("play_cnt"));
                list.add(v);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}
