package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.dao.LessonDao;
import com.lubocluod.touchwebcms.entity.Lesson;

public class LessonDaoImpl implements LessonDao {

    private Connection conn;
    private PreparedStatement stat = null;

    public LessonDaoImpl() {
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
    public int add(Lesson l) {
        // TODO Auto-generated method stub
        String sql = "INSERT INTO lesson(course_id,title,description,free) VALUES(?,?,?)";
        try {
            int i = 1;
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setInt(i++, l.getCourseId());
            stat.setString(i++, l.getTitle());
            stat.setString(i++, l.getDesc());
            stat.setBoolean(i++, l.isFree());
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
        String sql = "DELETE FROM lesson where id=?";
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
    public boolean update(Lesson l) {
        // TODO Auto-generated method stub
        String sql = "UPDATE video SET video_id,title=?,description=?,status+?,free=? WHERE id=?";
        try {
            int i = 1;
            stat = conn.prepareStatement(sql);
            stat.setInt(i++, l.getVideoId());
            stat.setString(i++, l.getTitle());
            stat.setString(i++, l.getDesc());
            stat.setInt(i++, l.getStatus());
            stat.setBoolean(i++, l.isFree());
            stat.setInt(i++, l.getId());
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Lesson find(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT lesson.id,lesson.course_id,lesson.title,lesson.description,lesson.status,lesson.free,video.id,video.duration,video.video_uri,video.create_time,video.update_time,video.favorite_cnt,video.great_cnt,video.play_cnt FROM lesson LEFT JOIN video ON lesson.video_id=video.id AND lesson.id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            Lesson l = null;
            if (rs.next()) {
                l = new Lesson();
                l.setId(rs.getInt("lesson.id"));
                l.setCourseId(rs.getInt("lesson.course_id"));
                l.setVideoId(rs.getInt("video.id"));
                l.setTitle(rs.getString("lesson.title"));
                l.setDesc(rs.getString("lesson.description"));
                l.setDuration(rs.getTime("video.duration"));
                l.setVideoUri(rs.getString("video.video_uri"));
                l.setStatus(rs.getInt("lesson.status"));
                l.setFree(rs.getBoolean("lesson.free"));
                l.setCreateTime(rs.getTimestamp("video.create_time"));
                l.setUpdateTime(rs.getTimestamp("video.update_time"));
                l.setFavoriteCnt(rs.getInt("video.favorite_cnt"));
                l.setGreatCnt(rs.getInt("video.great_cnt"));
                l.setPlayCnt(rs.getInt("video.play_cnt"));
            }
            return l;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Lesson> findCourseLesson(int courseId) {
        // TODO Auto-generated method stub
        String sql = "SELECT lesson.id,lesson.course_id,lesson.title,lesson.description,lesson.status,lesson.free,video.id,video.duration,video.video_uri,video.create_time,video.update_time,video.favorite_cnt,video.great_cnt,video.play_cnt FROM lesson LEFT JOIN video ON lesson.video_id=video.id WHERE lesson.course_id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, courseId);
            ResultSet rs = stat.executeQuery();
            List<Lesson> list = new ArrayList<Lesson>();
            Lesson l = null;
            while (rs.next()) {
                l = new Lesson();
                l.setId(rs.getInt("lesson.id"));
                l.setCourseId(rs.getInt("lesson.course_id"));
                l.setVideoId(rs.getInt("video.id"));
                l.setTitle(rs.getString("lesson.title"));
                l.setDesc(rs.getString("lesson.description"));
                l.setDuration(rs.getTime("video.duration"));
                l.setVideoUri(rs.getString("video.video_uri"));
                l.setStatus(rs.getInt("lesson.status"));
                l.setFree(rs.getBoolean("lesson.free"));
                l.setCreateTime(rs.getTimestamp("video.create_time"));
                l.setUpdateTime(rs.getTimestamp("video.update_time"));
                l.setFavoriteCnt(rs.getInt("video.favorite_cnt"));
                l.setGreatCnt(rs.getInt("video.great_cnt"));
                l.setPlayCnt(rs.getInt("video.play_cnt"));
                list.add(l);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean deleteCourseLesson(int courseId) {
        // TODO Auto-generated method stub
        String sql = "DELETE FROM lesson where course_id=?";
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
    public List<Lesson> findAll() {
        // TODO Auto-generated method stub
        String sql = "SELECT lesson.id,lesson.course_id,lesson.title,lesson.description,lesson.status,lesson.free,video.id,video.duration,video.video_uri,video.create_time,video.update_time,video.favorite_cnt,video.great_cnt,video.play_cnt FROM lesson LEFT JOIN video ON lesson.video_id=video.id";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<Lesson> list = new ArrayList<Lesson>();
            Lesson l = null;
            while (rs.next()) {
                l = new Lesson();
                l.setId(rs.getInt("lesson.id"));
                l.setCourseId(rs.getInt("lesson.course_id"));
                l.setVideoId(rs.getInt("video.id"));
                l.setTitle(rs.getString("lesson.title"));
                l.setDesc(rs.getString("lesson.description"));
                l.setDuration(rs.getTime("video.duration"));
                l.setVideoUri(rs.getString("video.video_uri"));
                l.setStatus(rs.getInt("lesson.status"));
                l.setFree(rs.getBoolean("lesson.free"));
                l.setCreateTime(rs.getTimestamp("video.create_time"));
                l.setUpdateTime(rs.getTimestamp("video.update_time"));
                l.setFavoriteCnt(rs.getInt("video.favorite_cnt"));
                l.setGreatCnt(rs.getInt("video.great_cnt"));
                l.setPlayCnt(rs.getInt("video.play_cnt"));
                list.add(l);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}
