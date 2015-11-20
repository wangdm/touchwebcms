package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.CoursePropertyGroup;

public interface CoursePropertyGroupDao {

    public int add(CoursePropertyGroup propGroup);
    public boolean delete(int id);
    public boolean update(CoursePropertyGroup propGroup);
    public CoursePropertyGroup find(int id);
    public List<CoursePropertyGroup> findAll();
    public CoursePropertyGroup findCoursePropertyNavGroup(int catId);
    public List<CoursePropertyGroup> findCoursePropertyGroup(int catId);
    public boolean deleteCoursePropertyGroup(int catId);
}
