package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.CourseCategory;

public interface CourseCategoryDao {
    public int add(CourseCategory cat);
    public boolean delete(int id);
    public boolean update(CourseCategory cat);
    public CourseCategory find(int id);
    public List<CourseCategory> findChildCategory(int id);
    public List<CourseCategory> findParentCategory(int id);
    public List<CourseCategory> findAll();
}