package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.CourseProperty;

public interface CoursePropertyDao {
    public int add(CourseProperty prop);
    public boolean delete(int id);
    public boolean update(CourseProperty prop);
    public CourseProperty find(int id);
    public List<CourseProperty> findAll();

}
