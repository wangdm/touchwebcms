package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.Course;

public interface CourseDao {

    public int add(Course c);
    public boolean delete(int id);
    public boolean update(Course c);
    public Course find(int id);
    public List<Course> findAll();
    public List<Course> findCoursebyCategory(int catId);
    public List<Course> findCoursebyUser(int uid);
}
