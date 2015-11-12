package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.Video;

public interface VideoDao {

    public int add(Video v);
    public boolean delete(int id);
    public boolean update(Video v);
    public Video find(int id);
    public List<Video> findCourseVideo(int courseId);
    public boolean deleteCourseVideo(int courseId);
    public List<Video> findAll();
}
