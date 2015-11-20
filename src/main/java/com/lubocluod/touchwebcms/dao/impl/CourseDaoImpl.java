package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.CourseCategoryDao;
import com.lubocluod.touchwebcms.dao.CourseDao;
import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.entity.Course;
import com.lubocluod.touchwebcms.entity.Course.CourseStatus;
import com.lubocluod.touchwebcms.entity.CourseCategory;

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
        String sql = "INSERT INTO course(uid,aid,cat_id,name,price,description,detail,logo,adimage,property,create_time,update_time,modify_time) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            int i = 1;
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setInt(i++, c.getUid());
            stat.setInt(i++, c.getAid());
            stat.setInt(i++, c.getCatId());
            stat.setString(i++, c.getName());
            stat.setInt(i++, c.getPrice());
            stat.setString(i++, c.getDesc());
            stat.setString(i++, c.getDetail());
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
        String sql = "UPDATE course SET cat_id=?,name=?,price=?,description=?,detail=?,logo=?,adimage=?,property=?,update_time=?,grade=?,grade_cnt=?,favorite_cnt=?,great_cnt=?,study_cnt=?,status=? WHERE id=?";
        try {
            stat = conn.prepareStatement(sql);
            int i = 1;
            stat.setInt(i++, c.getCatId());
            stat.setString(i++, c.getName());
            stat.setInt(i++, c.getPrice());
            stat.setString(i++, c.getDesc());
            stat.setString(i++, c.getDetail());
            stat.setString(i++, c.getLogo());
            stat.setString(i++, c.getAdimage());
            stat.setString(i++, c.getProperty());
            stat.setTimestamp(i++, c.getUpdateTime());
            stat.setInt(i++, c.getGrade());
            stat.setInt(i++, c.getGradeCnt());
            stat.setInt(i++, c.getFavoriteCnt());
            stat.setInt(i++, c.getGreatCnt());
            stat.setInt(i++, c.getStudyCnt());
            stat.setInt(i++, c.getStatus().getValue());
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
        String sql = "SELECT id,uid,aid,cat_id,name,price,description,detail,logo,adimage,property,create_time,update_time,modify_time,grade,grade_cnt,favorite_cnt,great_cnt,study_cnt,status FROM course WHERE id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            Course c = null;
            if (rs.next()) {
                c = new Course();
                c.setId(rs.getInt("id"));
                c.setUid(rs.getInt("uid"));
                c.setAid(rs.getInt("aid"));
                c.setCatId(rs.getInt("cat_id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setDesc(rs.getString("description"));
                c.setDetail(rs.getString("detail"));
                c.setLogo(rs.getString("logo"));
                c.setAdimage(rs.getString("adimage"));
                c.setProperty(rs.getString("property"));
                c.setCreateTime(rs.getTimestamp("create_time"));
                c.setUpdateTime(rs.getTimestamp("update_time"));
                c.setModifyTime(rs.getTimestamp("modify_time"));
                c.setGrade(rs.getInt("grade"));
                c.setGradeCnt(rs.getInt("grade_cnt"));
                c.setFavoriteCnt(rs.getInt("favorite_cnt"));
                c.setGreatCnt(rs.getInt("great_cnt"));
                c.setStudyCnt(rs.getInt("study_cnt"));
                c.setStatus(CourseStatus.valueOf(rs.getInt("status")));
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
        String sql = "SELECT id,uid,aid,cat_id,name,price,logo,adimage,property,create_time,update_time,modify_time,grade,grade_cnt,favorite_cnt,great_cnt,study_cnt,status FROM course";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<Course> list = new ArrayList<Course>();
            Course c = null;
            while (rs.next()) {
                c = new Course();
                c.setId(rs.getInt("id"));
                c.setUid(rs.getInt("uid"));
                c.setAid(rs.getInt("aid"));
                c.setCatId(rs.getInt("cat_id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setLogo(rs.getString("logo"));
                c.setAdimage(rs.getString("adimage"));
                c.setProperty(rs.getString("property"));
                c.setCreateTime(rs.getTimestamp("create_time"));
                c.setUpdateTime(rs.getTimestamp("update_time"));
                c.setModifyTime(rs.getTimestamp("modify_time"));
                c.setGrade(rs.getInt("grade"));
                c.setGradeCnt(rs.getInt("grade_cnt"));
                c.setFavoriteCnt(rs.getInt("favorite_cnt"));
                c.setGreatCnt(rs.getInt("great_cnt"));
                c.setStudyCnt(rs.getInt("study_cnt"));
                c.setStatus(CourseStatus.valueOf(rs.getInt("status")));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Course> findCoursebyCategory(int catId) {
        // TODO Auto-generated method stub
        CourseCategoryDao courseCategoryDao = new CourseCategoryDaoImpl();
        ArrayList<CourseCategory> catList = (ArrayList<CourseCategory>) courseCategoryDao.findAllChildCategory(catId);
        String sql = "SELECT id,uid,aid,cat_id,name,price,logo,adimage,property,create_time,update_time,modify_time,grade,grade_cnt,favorite_cnt,great_cnt,study_cnt,status FROM course WHERE cat_id="+catId;
        for(int i=0; i<catList.size(); i++)
        {
            sql += " OR cat_id="+catList.get(i).getCatId();
        }
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<Course> list = new ArrayList<Course>();
            Course c = null;
            while (rs.next()) {
                c = new Course();
                c.setId(rs.getInt("id"));
                c.setUid(rs.getInt("uid"));
                c.setAid(rs.getInt("aid"));
                c.setCatId(rs.getInt("cat_id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setLogo(rs.getString("logo"));
                c.setAdimage(rs.getString("adimage"));
                c.setProperty(rs.getString("property"));
                c.setCreateTime(rs.getTimestamp("create_time"));
                c.setUpdateTime(rs.getTimestamp("update_time"));
                c.setModifyTime(rs.getTimestamp("modify_time"));
                c.setGrade(rs.getInt("grade"));
                c.setGradeCnt(rs.getInt("grade_cnt"));
                c.setFavoriteCnt(rs.getInt("favorite_cnt"));
                c.setGreatCnt(rs.getInt("great_cnt"));
                c.setStudyCnt(rs.getInt("study_cnt"));
                c.setStatus(CourseStatus.valueOf(rs.getInt("status")));
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
