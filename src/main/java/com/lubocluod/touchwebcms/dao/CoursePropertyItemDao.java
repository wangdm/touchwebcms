package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.CoursePropertyItem;

public interface CoursePropertyItemDao {
    public int add(CoursePropertyItem propItem);
    public boolean delete(int id);
    public boolean update(CoursePropertyItem propItem);
    public CoursePropertyItem find(int id);
    public List<CoursePropertyItem> findAll();
    public List<CoursePropertyItem> findCoursePropertyItem(int propGroupId);
    public boolean deleteCoursePropertyItem(int propGroupId);
}
