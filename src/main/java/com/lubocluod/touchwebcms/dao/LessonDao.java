package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.Lesson;

public interface LessonDao {

    public int add(Lesson l);
    public boolean delete(int id);
    public boolean update(Lesson l);
    public Lesson find(int id);
    public List<Lesson> findCourseLesson(int courseId);
    public boolean deleteCourseLesson(int courseId);
    public List<Lesson> findAll();
}
